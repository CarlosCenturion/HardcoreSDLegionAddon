-- Press Key Event
local f = PvPInterface or CreateFrame("Frame", "PvPInterface", UIParent)
local toggler = false

-- HideAll
local ActionBars = CreateFrame("Frame")

local HiderPanel = CreateFrame("Frame", "AHiderPanel", UIParent)

local _G = _G
local MainMenuBar, MainMenuBarArtFrame = _G["MainMenuBar"],
                                         _G["MainMenuBarArtFrame"]
local OverrideActionBar = _G["OverrideActionBar"]
local PossessBarFrame = _G["PossessBarFrame"]
local PetActionBarFrame = _G["PetActionBarFrame"]
local ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight =
    _G["ShapeshiftBarLeft"], _G["ShapeshiftBarMiddle"], _G["ShapeshiftBarRight"]
local PlayerFrame = _G["PlayerFrame"]
local TargetFrame = _G["TargetFrame"]
local MinimapCluster = _G["MinimapCluster"]
local ObjectiveTrackerFrame = _G["ObjectiveTrackerFrame"]
local CompactRaidFrameManager = _G["CompactRaidFrameManager"]

local Frames = {
    MainMenuBar, MainMenuBarArtFrame, OverrideActionBar, PossessBarFrame,
    PetActionBarFrame, IconIntroTracker, ShapeshiftBarLeft, ShapeshiftBarMiddle,
    ShapeshiftBarRight, TalentMicroButtonAlert, CollectionsMicroButtonAlert,
    EJMicroButtonAlert, PlayerFrame,TargetFrame,MinimapCluster,ObjectiveTrackerFrame,
    CompactRaidFrameManager

}

function ActionBars:DisableBlizzard()
    for _, BlizzActionBarsArt in pairs(Frames) do
        BlizzActionBarsArt:UnregisterAllEvents()
        BlizzActionBarsArt.ignoreFramePositionManager = true
        BlizzActionBarsArt:SetParent(AHiderPanel)
    end
end

ActionBars:RegisterEvent('ADDON_LOADED')
ActionBars:SetScript('OnEvent',
                     function(self, event) ActionBars:DisableBlizzard() end)

local HideAllFrames = function()
     HiderPanel:Hide() 
       -- Chat
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

    end

local ShowAllFrames = function()

    HiderPanel:Show()
    -- Chat
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

end

local function TrapKey(self, key)

    if (key == "F5") then
        if (toggler == false) then
            toggler = true
            print("Toggler ON")
            HideAllFrames()

        else
            toggler = false
            print("Toggler OFF")
            ShowAllFrames()
        end
    end

end

f:SetScript("OnKeyDown", TrapKey)
f:SetPropagateKeyboardInput(true)



print("PVP Interface Module Loaded")
print("Press F5 to Toggle")
