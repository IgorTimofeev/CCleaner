local GUI = require("GUI");local system = require("System"); local fs = require("Filesystem"); local image = require("Image"); local paths = require("Paths")
--------------------------------------------------------------------------------
 
   local SD = fs.path(system.getCurrentScript())
   local l = system.getLocalization(SD .. "Localization/")
   local applicationDataPath = paths.user.applicationData .. "VK/"
   local configPath = applicationDataPath .. "Config.cfg"
   local stylesPath = scriptDirectory .. "Styles/"

   local config = {
	style = "Default.lua",
	}

   local function saveConfig()
	filesystem.writeTable(configPath, config)
end

  local function loadStyle()
	style = filesystem.readTable(stylesPath .. config.style)
end

	if
		filesystem.exists(configPath) then
		config = filesystem.readTable(configPath)
		end
 
	loadStyle()

   local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 118, 31, style.window))
 
   local list = window:addChild(GUI.list(1, 4, 22, window.height - 3, 3, 0, style.list0, style.list1, style.list3, style.list4, style.list5, style.list6))
   local listCover = window:addChild(GUI.panel(1, 1, list.width, 3, style.listCover))
   local layout = window:addChild(GUI.layout(list.width + 1, 1, window.width - list.width, window.height, 1, 1))
 
 
local function addTab(text, func)
   list:addItem(text).onTouch = function()
    layout:removeChildren()
    func()
    workspace:draw()
  end
end
 
local function addText(text)
  layout:addChild(GUI.text(workspace.width, workspace.height, style.text, text))
end
 
local function addButton(text)
  return layout:addChild(GUI.framedButton(1, 1, 30, 3, style.button0, style.button1, style.button2, style.button3, text))
end
 
 
local function drawIcon(pic)
  return layout:addChild(GUI.image(2, 2, image.load(SD .. pic)))
end
 
 
local actionButtons = window:addChild(GUI.actionButtons(3, 2, true))
 
actionButtons.minimize.onTouch = function()
  window:minimize()
end
 
actionButtons.close.onTouch = function()
  window:remove()
end
 
actionButtons.maximize.onTouch = function()
   window:maximize()
end
 
 local pathsUAppData = "paths.user.applicationData"; local p = "Icons/" 
-- main
 addTab(l.main, function()
   drawIcon("Icon.pic")
   addText(l.greeting .. system.getUser())
 end)
 
 
 -- App Market
 addTab(l.appmarket, function()
      drawIcon(p .. "Iconappmarket.pic")
      addText(l.deltapp)
      addButton(l.delcapp).onTouch = function()
     filesystem.remove(pathsUAppData .. "App Market/Cache")
     GUI.alert(l.delc)
     end
     addText(l.LAuthorizationAppMarketT)
      addButton(l.LAuthorizationAppMarketB).onTouch = function()
        filesystem.remove(pathsUAppData .. "App Market/User.cfg")
        GUI.alert(l.LAuthorizationAppMarketA)
     end
 end)
 
 -- IRC
 addTab(l.IRC, function()
   drawIcon(p .. "IconIRC.pic")
   addText(l.IRCT)
   addText(l.IRCT2)
   addButton(l.delbpic).onTouch = function()
    filesystem.remove(pathsUAppData .. "/IRC/Config.cfg")
    GUI.alert(l.IRCA1)
   end
  addText(l.IRCHT)
   addButton(l.delbpic).onTouch = function()
     filesystem.remove(pathsUAppData .. "/IRC/History.cfg")
     GUI.alert(l.IRCA2)
   end
 end)
 
 -- VK
 addTab(l.VK, function()
 drawIcon(p .. "IconVK.pic")
   addText(l.vkt)
   addButton(l.delcvk).onTouch = function()
     filesystem.remove(pathsUAppData .. "/VK/Config5.cfg")
     GUI.alert(l.delc)
  end
   end)
 
 -- MineIDE
 addTab(l.MineIDE, function()
 drawIcon(p .. "IconMineIDE.pic")
   addText(l.deltmine)
   addButton(l.delbmine).onTouch = function()
     filesystem.remove(pathsUAppData .. "/MineCode IDE")
     GUI.alert(l.delc)
   end
 end)
 
 -- pic
 addTab(l.Pictures, function()
 drawIcon(p .. "Image.pic")
      addText(l.deltpic)
     addButton(l.delbpic).onTouch = function()
     filesystem.remove(paths.system.pictures)
     GUI.alert(l.pica)
     filesystem.makeDirectory(paths.system.pictures)
   end
 end)
 -- Weather
 addTab(l.Weather, function()
   drawIcon(p .. "WeatherIcon.pic")
   addText(l.WeatherT)
   addButton(l.delbmine).onTouch = function()
     filesystem.remove(pathsUAppData .. "/Weather/")
     GUI.alert(l.IRCA1)
     filesystem.makeDirectory(pathsUAppData .. "/Weather")
     end
 end)
 -- Info
 addTab(l.Author, function()
 addText(l.Authort)
 end)
 
list.eventHandler = function(workspace, list, e1, e2, e3, e4, e5)
  if e1 == "scroll" then
    local horizontalMargin, verticalMargin = list:getMargin()
    list:setMargin(horizontalMargin, math.max(-list.itemSize * (#list.children - 1), math.min(0, verticalMargin + e5)))
   
    workspace:draw()
  end
end
 
window.onResize = function(width, height)
 window.backgroundPanel.width = width
 window.backgroundPanel.height = height
 layout.width = window.backgroundPanel.width
 layout.height = window.backgroundPanel.height
 list.height = layout.height
 end

    list:getItem(1).onTouch()
