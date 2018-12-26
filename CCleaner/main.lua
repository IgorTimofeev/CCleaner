local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local MineOSCore = require("MineOSCore")
local filesystem = require("filesystem")
local image = require("image")

--------------------------------------------------------------------------------
local scriptDirectory = MineOSCore.getCurrentScriptDirectory()
local localization = MineOSCore.getLocalization(filesystem.path(getCurrentScript()) .. "Localization/")

local application, window = MineOSInterface.addWindow(GUI.tabbedWindow(1, 1, 110, 29))
local layout = window:addChild(GUI.layout(1, 4, 1, 1, 1, 1))

local function addText(text)
  layout:addChild(GUI.label(1, 1, 0x787878, text))
end

local function addButton(text)
  return layout:addChild(GUI.roundedButton(1, 1, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, text))
end

local function addTab(text, func)
  window.tabBar:addItem(text).onTouch = function()
    layout:removeChildren()
    func()
    application:draw()
  end
end

 local function DrawImage(pic)
return layout:addChild(GUI.image(2, 2, image.load(pic)))
 end

-- main
addTab(localization.main, function()
  DrawImage(scriptDirectory .. "Icon.pic")
  addText(localization.main1)
end)



-- App Market
addTab(localization.appmarket, function()
  DrawImage(scriptDirectory .. "Icons/Iconappmarket.pic")
  addText(localization.deltapp)
  addButton(localization.delcapp).onTouch = function()
    filesystem.remove("/MineOS/System/Application data/App Market/Cache")
    GUI.alert(localization.delc)
  end
end)

-- IRC
addTab(localization.IRC, function()
  DrawImage(scriptDirectory .. "Icons/IconIRC.pic")
  addText(localization.IRCT)
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
DrawImage(scriptDirectory .. "Icons/IconVK.pic")
  addText(localization.vkt)
  addButton(localization.delcvk).onTouch = function()
    filesystem.remove("/MineOS/System/Application data/VK/Config5.cfg")
    GUI.alert(localization.delc)
  end
end)

-- MineIDE
addTab(localization.MineIDE, function()
DrawImage(scriptDirectory .. "Icons/IconMineIDE.pic")
  addText(localization.deltmine)
  addButton(localization.delbmine).onTouch = function()
    filesystem.remove("/MineOS/System/Application data/MineCode IDE")
    GUI.alert(localization.delc)
  end
end)

-- pic
addTab(localization.Pictures, function()
DrawImage(scriptDirectory .. "Icons/Image.pic")
  addText(localization.deltpic)
  addButton(localization.delbpic).onTouch = function()
    filesystem.remove("/MineOS/Pictures/")
    GUI.alert(localization.pica)
    filesystem.makeDirectory("/MineOS/Pictures/")
  end
end)


-- Window resizing
window.onResize = function(width, height)
  window.tabBar.width = width
  window.backgroundPanel.width = width
  window.backgroundPanel.height = height - window.tabBar.height
  layout.width = width
  layout.height = window.backgroundPanel.height

  window.tabBar:getItem(window.tabBar.selectedItem).onTouch()
end

--------------------------------------------------------------------------------

-- Resize at start
window:resize(window.width, window.height)
