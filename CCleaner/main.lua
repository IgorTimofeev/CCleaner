-- спасибо MineCR, обьяснил как работает hidden.
local GUI = require("GUI")
 local MineOSInterface = require("MineOSInterface")
  local MineOSCore = require("MineOSCore")
    local filesystem = require("filesystem")


local currentScriptDirectory = MineOSCore.getCurrentScriptDirectory() 
local localization = MineOSCore.getLocalization(currentScriptDirectory .. "Localization/") 

local mainContainer, window = MineOSInterface.addWindow(GUI.tabbedWindow(1, 1, 110, 29))

pizdes = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

pizdes2 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

pizdes3 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

pizdes4 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

pizdes5 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

pizdes6 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

-- IRC
pizdes6:addChild(GUI.text(1, 1, 0x787878, localization.IRCT))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = false
 
 local IRCBC = pizdes6:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, localization.delbpic))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = false
 
 IRCBC.onTouch = function()
 filesystem.remove("/MineOS/System/Application data/IRC/Config.cfg")
 os.sleep(0.225)
 GUI.alert(localization.IRCA1)
 end
 
 
 pizdes6:addChild(GUI.text(2, 1, 0x787878, localization.IRCHT))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = false


local IRCHB = pizdes6:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, localization.IRCHB))
pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = false
 
 IRCHB.onTouch = function()
 filesystem.remove("/MineOS/System/Application data/IRC/History.cfg")
 os.sleep(0.225)
 GUI.alert(localization.IRCA2)
 end

-- Author
pizdes5:addChild(GUI.text(1, 1, 0x787878, localization.Authort))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = false
 pizdes6.hidden = true
-- vk
pizdes2:addChild(GUI.text(1, 1, 0x787878, localization.vkt))

 pizdes.hidden = true
 pizdes2.hidden = false
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true

local vkbutton = pizdes2:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, localization.delcvk))
 pizdes.hidden = true
 pizdes2.hidden = false
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 vkbutton.onTouch = function()
 filesystem.remove("/MineOS/System/Application data/VK/Config5.cfg")
 os.sleep(0.225)
 GUI.alert(localization.delc)
 end
 -- MineCode IDE
 pizdes3:addChild(GUI.text(1, 1, 0x787878, localization.deltmine))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = false
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 local minebutton = pizdes3:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, localization.delbmine))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = false
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 minebutton.onTouch = function()
 filesystem.remove("/MineOS/System/Application data/MineCode IDE")
 end
 -- pic
 pizdes4:addChild(GUI.text(1, 1, 0x787878, localization.deltpic))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = false
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 local delpic = pizdes4:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1,0xB4B4B4, 0xFFFFFF, localization.delbpic))
 pizdes.hidden = true
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = false
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 delpic.onTouch = function()
 filesystem.remove("/MineOS/Pictures/")
 GUI.alert(localization.pica)
 filesystem.makeDirectory("/MineOS/Pictures/")
 end
 
 
 -- app
 pizdes:addChild(GUI.text(1, 1, 0x787878, localization.deltapp))
 pizdes.hidden = false
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true
 
 local appbutton = pizdes:addChild(GUI.roundedButton(2, 2, 30, 3, 0x787878, 0xE1E1E1, 0xB4B4B4, 0xFFFFFF, localization.delcapp))
 pizdes.hidden = false
 pizdes2.hidden = true
 pizdes3.hidden = true
 pizdes4.hidden = true
 pizdes5.hidden = true
 pizdes6.hidden = true
 
appbutton.onTouch = function()
filesystem.remove("/MineOS/System/Application data/App Market/Cache")
os.sleep(0.225)
GUI.alert(localization.delc)
end

-- вкладки



window.tabBar:addItem(localization.appmarket).onTouch = function()
pizdes.hidden = false
pizdes2.hidden = true
pizdes3.hidden = true
pizdes4.hidden = true
pizdes5.hidden = true
pizdes6.hidden = true

end
window.tabBar:addItem(localization.VK).onTouch = function()
pizdes.hidden = true
pizdes2.hidden = false
pizdes3.hidden = true
pizdes4.hidden = true
pizdes5.hidden = true
pizdes6.hidden = true

end
window.tabBar:addItem(localization.MineIDE).onTouch = function()
pizdes.hidden = true
pizdes2.hidden = true
pizdes3.hidden = false
pizdes4.hidden = true
pizdes5.hidden = true
pizdes6.hidden = true
end
window.tabBar:addItem(localization.Pictures).onTouch = function()
pizdes.hidden = true
pizdes2.hidden = true
pizdes3.hidden = true
pizdes4.hidden = false
pizdes5.hidden = true
pizdes6.hidden = true
end
window.tabBar:addItem(localization.IRC).onTouch = function()
pizdes.hidden = true
pizdes2.hidden = true
pizdes3.hidden = true
pizdes4.hidden = true
pizdes5.hidden = true
pizdes6.hidden = false
end
window.tabBar:addItem(localization.Author).onTouch = function()
pizdes.hidden = true
pizdes2.hidden = true
pizdes3.hidden = true
pizdes4.hidden = true
pizdes5.hidden = false
pizdes6.hidden = true
end

window.onResize = function(width, height)
 window.backgroundPanel.width = width 
  window.backgroundPanel.height = height
  window.tabBar.width = width
  pizdes.width = window.width -- ебать!!! Надо потом в wallpapers запилить это, когда желание будет.
  pizdes.height = pizdes.height
  pizdes2.width = window.width
  pizdes2.height = pizdes2.height
  pizdes3.width = window.width
  pizdes3.height = pizdes3.height
  pizdes4.width = window.width
  pizdes4.height = pizdes4.height
  pizdes5.width = window.width
  pizdes5.height = pizdes5.height
  pizdes6.width = window.width
  pizdes6.hieght = pizdes6.height
  end
