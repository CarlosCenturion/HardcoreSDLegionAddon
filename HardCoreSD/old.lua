local Toggler = false;

-- HideAll
local ActionBars = CreateFrame("Frame")

local HiderPanel = CreateFrame("Frame", "AHiderPanel", UIParent)
HiderPanel:Hide()

local _G = _G
local MainMenuBar1, MainMenuBarArtFrame = _G["MainMenuBar"],
                                          _G["MainMenuBarArtFrame"]
local OverrideActionBar = _G["OverrideActionBar"]
local PossessBarFrame = _G["PossessBarFrame"]
local PetActionBarFrame = _G["PetActionBarFrame"]
local ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight =
    _G["ShapeshiftBarLeft"], _G["ShapeshiftBarMiddle"], _G["ShapeshiftBarRight"]

local Frames = {
    MainMenuBar1, MainMenuBarArtFrame, OverrideActionBar, PossessBarFrame,
    PetActionBarFrame, IconIntroTracker, ShapeshiftBarLeft, ShapeshiftBarMiddle,
    ShapeshiftBarRight, TalentMicroButtonAlert, CollectionsMicroButtonAlert,
    EJMicroButtonAlert
}

function ActionBars:DisableBlizzard()
    for _, BlizzActionBarsArt in pairs(Frames) do
        BlizzActionBarsArt:UnregisterAllEvents()
        BlizzActionBarsArt.ignoreFramePositionManager = true
        BlizzActionBarsArt:SetParent(AHiderPanel)
    end
end

function ActionBars:EnableBlizzard()
    for _, BlizzActionBarsArt in pairs(Frames) do
        BlizzActionBarsArt:UnregisterAllEvents()
        BlizzActionBarsArt.ignoreFramePositionManager = true
        BlizzActionBarsArt:SetParent(UIParent)
    end
end

-- Hide and Show Frames
local HideAllFrames = function()

    print()
    print("Ocultando Todo")
    PlayerFrame:Hide()
    TargetFrame:Hide()
    MinimapCluster:Hide()
    ObjectiveTrackerFrame:Hide()

    _CHATHIDE = not _CHATHIDE
    for i = 1, NUM_CHAT_WINDOWS do
        for _, v in pairs {"", "Tab"} do
            local f = _G["ChatFrame" .. i .. v]
            if _CHATHIDE then f.v = f:IsVisible() end
            f.ORShow = f.ORShow or f.Show
            f.Show = _CHATHIDE and f.Hide or f.ORShow
            if f.v then f:Show() end
        end
    end

    QuickJoinToastButton:Hide()
    ChatFrameMenuButton:Hide()
    ChatFrame1EditBox:Hide()
    ChatFram1EditBoxMid:Hide()

    MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()
    MainMenuBar:UnregisterAllEvents()
    MainMenuBar.ignoreFramePositionmanager = true
    MainMenuBar:SetParent(AHiderPanel)
    MainMenuBar:Hide()

end

local ShowAllFrames = function()
    print("Mostrando Todo")
    PlayerFrame:Show()
    TargetFrame:Show()
    MinimapCluster:Show()
    ObjectiveTrackerFrame:Show()

    _CHATHIDE = not _CHATHIDE
    for i = 1, NUM_CHAT_WINDOWS do
        for _, v in pairs {"", "Tab"} do
            local f = _G["ChatFrame" .. i .. v]
            if _CHATHIDE then f.v = f:IsVisible() end
            f.ORShow = f.ORShow or f.Show
            f.Show = _CHATHIDE and f.Hide or f.ORShow
            if f.v then f:Show() end
        end
    end

    QuickJoinToastButton:Show()
    ChatFrameMenuButton:Show()
    ChatFrame1EditBox:Show()
    ChatFram1EditBoxMid:Show()

    MainMenuBar:Show()
    MainMenuBarLeftEndCap:Show()
    MainMenuBarRightEndCap:Show()

end

-- Enter Combat or Leave Events

local EnterCombat_EventFrame = CreateFrame('Frame')
EnterCombat_EventFrame:RegisterEvent('PLAYER_REGEN_DISABLED')
EnterCombat_EventFrame:SetScript('OnEvent',
                                 function(self, event) print("Combat On!") end)

local ExitCombat_EventFrame = CreateFrame('Frame')
ExitCombat_EventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
ExitCombat_EventFrame:SetScript('OnEvent',
                                function(self, event) print("Combat Off!") end)

-- Addon Ready Event
local AddonReady_EventFrame = CreateFrame('Frame')
AddonReady_EventFrame:RegisterEvent('ADDON_LOADED')
AddonReady_EventFrame:SetScript('OnEvent', function(self, event)
    print('Hola! Bienvenido a Word of Warcraft')
    print('Taokaiser & Molly les desean una')
    print('agradable estadia!')
end)

-- Press Key Event
local f = Test or CreateFrame("Frame", "Test", UIParent)

local function TestPrint(self, key)
    if (key == "F5") then
        if (Toggler == true) then
            Toggler = false
            ShowAllFrames()
        else
            Toggler = true
            HideAllFrames()
        end
    end


    if (key == "F6") then 
        MultiBarBottomLeft:Hide()
        MultiBarBottomRight:Hide()
        StatusTrackingBarManager:Hide()
        MainMenuBar:Hide()
    end

    if (key == "F7") then 
        MultiBarBottomLeft:Show()
        MultiBarBottomRight:Show()
        StatusTrackingBarManager:Show()
        MainMenuBar:Show()
    end
end

f:SetScript("OnKeyDown", TestPrint)
f:SetPropagateKeyboardInput(true)
