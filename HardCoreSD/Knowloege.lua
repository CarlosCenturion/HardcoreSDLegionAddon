-- Events :
-- 1- Create the Frame
-- 2- Make The Frame listen to Events
-- 3- Set a Script for the event
-- 1- 
local Welcome_EventFram = CreateFrame('Frame')
-- 2-
Welcome_EventFram:RegisterEvent('PLAYER_LEVEL_UP')
-- 3-
Congrats_EventFrame:SetScript("OnEvent", function(self, event, ...)
    -- Args
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = ...
    -- Select 1 element from list
    -- local argumento3 = (select(2,...))
    -- Prints lengh of list
    -- local tbl = {...}
    -- print (#tbl) 
    -- Event handling code goes here
    print('Congratulations on reaching level ' .. arg1 .. ', ' ..
              UnitName("Player") .. '! You gained ' .. arg2 .. ' HP and ' ..
              arg3 .. ' MP!')

end)

-- Print a list of Nearby Units

-- /run for i = 1, 40 do local name = UnitName("nameplate"..i) if name then print(i, name) end end

local guids = {}
local f = CreateFrame("Frame")

function f:NAME_PLATE_UNIT_ADDED(unit)
    guids[UnitGUID(unit)] = unit
    print("added", unit, UnitName(unit))
end

function f:NAME_PLATE_UNIT_REMOVED(unit)
    guids[UnitGUID(unit)] = nil
    print("removed", unit, UnitName(unit))
end

f:SetScript("OnEvent", function(self, event, ...)
	f[event](self, ...)
end)

f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")