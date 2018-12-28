local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local MineOSCore = require("MineOSCore")
local filesystem = require("filesystem")
local image = require("image")

--------------------------------------------------------------------------------
local scriptDirectory = MineOSCore.getCurrentScriptDirectory()
local localization = MineOSCore.getLocalization(filesystem.path(getCurrentScript()) .. "Localization/")

local application, window = MineOSInterface.addWindow(GUI.filledWindow(1, 1, 112, 29, 0xF0F0F0))

local list = window:addChild(GUI.list(1, 4, 22, window.height - 3, 3, 0, 0x2D2D2D, 0x696969, 0x2D2D2D, 0x696969, 0xF0F0F0, 0x2D2D2D))
local listCover = window:addChild(GUI.panel(1, 1, list.width, 3, 0x3C3C3C))
local panelTitled = window:addChild(GUI.panel(1, 1, window.width, 3, 0x3C3C3C))
local layout = window:addChild(GUI.layout(list.width + 1, 1, window.width - list.width, window.height, 1, 1))

window:addChild(GUI.text(52, 2, 0xD2D2D2, "CCleaner"))


local function addTab(text, func)
   list:addItem(text).onTouch = function()
    layout:removeChildren()
    func()
    application:draw()
  end
end

local function addText(text)
  layout:addChild(GUI.text(application.width, application.height, 0x696969, text))
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
  window:close()
end


actionButtons.maximize:remove()
-- main
 addTab(localization.main, function()
  DrawImage("Icon.pic")
   addText(localization.main1)
 end)
 
 
 -- App Market
 addTab(localization.appmarket, function()
   DrawImage("Icons/Iconappmarket.pic")
   addText(localization.deltapp)
   addButton(localization.delcapp).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/App Market/Cache")
     GUI.alert(localization.delc)
   end
 end)
 
 -- IRC
 addTab(localization.IRC, function()
   DrawImage("Icons/IconIRC.pic")
   addText(localization.IRCT)
   addText(localization.IRCT2)
   addButton(localization.delbpic).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/IRC/Config.cfg")
    GUI.alert(localization.IRCA1)
   end 
  addText(localization.IRCHT)
   addButton(localization.delbpic).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/IRC/History.cfg")
     GUI.alert(localization.IRCA2)
   end
 end)
 
 -- VK
 addTab(localization.VK, function()
 DrawImage("Icons/IconVK.pic")
   addText(localization.vkt)
   addButton(localization.delcvk).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/VK/Config5.cfg")
     GUI.alert(localization.delc)
  end
   end)

 -- MineIDE
 addTab(localization.MineIDE, function()
 DrawImage("Icons/IconMineIDE.pic")
   addText(localization.deltmine)
   addButton(localization.delbmine).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/MineCode IDE")
     GUI.alert(localization.delc)
   end
 end)
 
 -- pic
 addTab(localization.Pictures, function()
 DrawImage("Icons/Image.pic")
   addText(localization.deltpic)
   addButton(localization.delbpic).onTouch = function()
     filesystem.remove("/MineOS/Pictures/")
     GUI.alert(localization.pica)
     filesystem.makeDirectory("/MineOS/Pictures/")
   end
 end)
 -- Weather
 addTab(localization.Weather, function()
   DrawImage("Icons/WeatherIcon.pic")
   addText(localization.WeatherT)
   addButton(localization.delbmine).onTouch = function()
     filesystem.remove("/MineOS/System/Application data/Weather/")
     GUI.alert(localization.IRCA1)
     filesystem.makeDirectory("/MineOS/System/Application data/Weather")
     end
 end)
 -- Info
 addTab(localization.Author, function()
 addText(localization.Authort)
 end)
 
 list:getItem(1).onTouch()
