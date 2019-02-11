 local GUI = require("GUI");local system = require("System"); local fs = require("Filesystem"); local image = require("Image"); local paths = require("Paths")
--------------------------------------------------------------------------------
 
   local SD = fs.path(system.getCurrentScript())
   local l = system.getLocalization(SD .. "Localization/")
 
   local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 118, 31, 0xC3C3C3))
   
  local list = window:addChild(GUI.list(1, 4, 22, window.height - 3, 3, 0, 0xF0F0F0, 0x4B4B4B, 0xF0F0F0, 0x4B4B4B, 0xE1E1E1, 0xA5A5A5))
   local listCover = window:addChild(GUI.panel(1, 1, list.width, 3, 0xF0F0F0))
   local layout = window:addChild(GUI.layout(list.width + 1, 1, window.width - list.width, window.height, 1, 1))
 
window.backgroundPanel.colors.transparency = 0.2
 
local function addTab(text, func)
   list:addItem(text).onTouch = function()
    layout:removeChildren()
    func()
    workspace:draw()
  end
end
 
local function addText(text)
  layout:addChild(GUI.text(workspace.width, workspace.height, 0x4B4B4B, text))
end
 
local function addButton(text)
  return layout:addChild(GUI.roundedButton(1, 1, 20, 1, 0x4B4B4B, 0xE1E1E1, 0xD2D2D2, 0xE1E1E1, text))
end
 
 
local function drawIcon(pic)
  return layout:addChild(GUI.image(2, 2, image.load(SD .. pic)))
end
 
 local function resetConfig(config)
  fs.remove(paths.user.applicationData .. config)
end


local actionButtons = window:addChild(GUI.actionButtons(3, 2, true))
 
actionButtons.minimize.onTouch = function()
  window:minimize()
end
 
actionButtons.close.onTouch = function()
  window:remove()
end
 
  local p = "Icons/"; 
-- main
 addTab(l.main, function()
   drawIcon("Icon.pic")
   addText(l.greeting .. system.getUser())
 end)
-- Trash
addTab(l.trash, function()
  drawIcon(paths.system.icons .. "Trash.pic")
  addText(l.trasht)
  addButton(l.trash).onTouch = function()
    fs.remove(paths.user.trash)
    fs.makeDirectory(paths.user.trash)
    end
  end)

 -- App Market
 addTab(l.appmarket, function()
      drawIcon(p .. "Iconappmarket.pic")
      addText(l.deltapp)
      addButton(l.delcapp).onTouch = function()
     resetConfig("App Market/Cache")
     GUI.alert(l.delc)
     end
     addText(l.LAuthorizationAppMarketT)
      addButton(l.LAuthorizationAppMarketB).onTouch = function()
        resetConfig("App Market/User.cfg")
        GUI.alert(l.LAuthorizationAppMarketA)
     end
 end)
 
 -- IRC
 addTab(l.IRC, function()
   drawIcon(p .. "IconIRC.pic")
   addText(l.IRCT)
   addText(l.IRCT2)
   addButton(l.delbpic).onTouch = function()
    resetConfig("/IRC/Config.cfg")
    GUI.alert(l.IRCA1)
   end
  addText(l.IRCHT)
   addButton(l.delbpic).onTouch = function()
     resetConfig("/IRC/History.cfg")
     GUI.alert(l.IRCA2)
   end
 end)
 
 -- VK
 addTab(l.VK, function()
 drawIcon(p .. "IconVK.pic")
   addText(l.vkt)
   addButton(l.delcvk).onTouch = function()
     resetConfig("/VK/Config5.cfg")
     GUI.alert(l.delc)
  end
   end)
 
 -- MineIDE
 addTab(l.MineIDE, function()
 drawIcon(p .. "IconMineIDE.pic")
   addText(l.deltmine)
   addButton(l.delbmine).onTouch = function()
     resetConfig("/MineCode IDE")
     GUI.alert(l.delc)
   end
 end)
 
 -- pic
 addTab(l.Pictures, function()
 drawIcon(p .. "Image.pic")
      addText(l.deltpic)
     addButton(l.delbpic).onTouch = function()
     fs.remove(paths.system.pictures)
     GUI.alert(l.pica)
     fs.makeDirectory(paths.system.pictures)
   end
 end)
 -- Weather
 addTab(l.Weather, function()
   drawIcon(p .. "WeatherIcon.pic")
   addText(l.WeatherT)
   addButton(l.delbmine).onTouch = function()
     resetConfig("/Weather/")
     GUI.alert(l.IRCA1)
     end
 end)
 
list.eventHandler = function(workspace, list, e1, e2, e3, e4, e5)
  if e1 == "scroll" then
    local horizontalMargin, verticalMargin = list:getMargin()
    list:setMargin(horizontalMargin, math.max(-list.itemSize * (#list.children - 1), math.min(0, verticalMargin + e5)))
   
    workspace:draw()
  end
end
 
list:getItem(1).onTouch()