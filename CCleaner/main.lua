local GUI = require("GUI")
local system = require("System")
local filesystem = require("Filesystem")
local image = require("Image")
local paths = require("Paths")
 
--------------------------------------------------------------------------------
 
   local scriptDirectory = filesystem.path(system.getCurrentScript())
   local localization = system.getLocalization(scriptDirectory .. "Localization/")
 
   local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 112, 29, 0xF0F0F0))
 
   local list = window:addChild(GUI.list(1, 4, 22, window.height - 3, 3, 0, 0x2D2D2D, 0x696969, 0x2D2D2D, 0x696969, 0xF0F0F0, 0x2D2D2D))
   local listCover = window:addChild(GUI.panel(1, 1, list.width, 3, 0x2D2D2D))
   local layout = window:addChild(GUI.layout(list.width + 1, 1, window.width - list.width, window.height, 1, 1))
 
 
local function addTab(text, func)
   list:addItem(text).onTouch = function()
    layout:removeChildren()
    func()
    workspace:draw()
  end
end
 
local function addText(text)
  layout:addChild(GUI.text(workspace.width, workspace.height, 0x696969, text))
end
 
local function addButton(text)
  return layout:addChild(GUI.framedButton(1, 1, 30, 3, 0xD2D2D2, 0x696969, 0x878787, 0xB4B4B4, text))
end
 
 
local function DrawImage(pic)
  return layout:addChild(GUI.image(2, 2, image.load(scriptDirectory .. pic)))
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
 
local p = "Icons/"
 
-- main
 addTab(localization.main, function()
   DrawImage("Icon.pic")
   addText(localization.greeting)
 end)
 
 
 -- App Market
 addTab(localization.appmarket, function()
      DrawImage(p .. "Iconappmarket.pic")
      addText(localization.deltapp)
      addButton(localization.delcapp).onTouch = function()
     filesystem.remove(paths.user.applicationData .. "App Market/Cache")
     GUI.alert(localization.delc)
   end
 end)
 
 -- IRC
 addTab(localization.IRC, function()
   DrawImage(p .. "IconIRC.pic")
   addText(localization.IRCT)
   addText(localization.IRCT2)
   addButton(localization.delbpic).onTouch = function()
    filesystem.remove(paths.user.applicationData .. "/IRC/Config.cfg")
    GUI.alert(localization.IRCA1)
   end
  addText(localization.IRCHT)
   addButton(localization.delbpic).onTouch = function()
     filesystem.remove(paths.user.applicationData .. "/IRC/History.cfg")
     GUI.alert(localization.IRCA2)
   end
 end)
 
 -- VK
 addTab(localization.VK, function()
 DrawImage(p .. "IconVK.pic")
   addText(localization.vkt)
   addButton(localization.delcvk).onTouch = function()
     filesystem.remove(paths.user.applicationData .. "/VK/Config5.cfg")
     GUI.alert(localization.delc)
  end
   end)
 
 -- MineIDE
 addTab(localization.MineIDE, function()
 DrawImage(p .. "IconMineIDE.pic")
   addText(localization.deltmine)
   addButton(localization.delbmine).onTouch = function()
     filesystem.remove(paths.user.applicationData .. "/MineCode IDE")
     GUI.alert(localization.delc)
   end
 end)
 
 -- pic
 addTab(localization.Pictures, function()
 DrawImage(p .. "Image.pic")
      addText(localization.deltpic)
     addButton(localization.delbpic).onTouch = function()
     filesystem.remove(paths.system.pictures)
     GUI.alert(localization.pica)
     filesystem.makeDirectory(paths.system.pictures)
   end
 end)
 -- Weather
 addTab(localization.Weather, function()
   DrawImage(p .. "WeatherIcon.pic")
   addText(localization.WeatherT)
   addButton(localization.delbmine).onTouch = function()
     filesystem.remove(paths.user.applicationData .. "/Weather/")
     GUI.alert(localization.IRCA1)
     filesystem.makeDirectory(paths.user.applicationData .. "/Weather")
     end
 end)
 -- Info
 addTab(localization.Author, function()
 addText(localization.Authort)
 end)
 
list.eventHandler = function(workspace, list, e1, e2, e3, e4, e5)
  if e1 == "scroll" then
    local horizontalMargin, verticalMargin = list:getMargin()
    list:setMargin(horizontalMargin, math.max(-list.itemSize * (#list.children - 1), math.min(0, verticalMargin + e5)))
   
    workspace:draw()
  end
end
 
    list:getItem(1).onTouch()
