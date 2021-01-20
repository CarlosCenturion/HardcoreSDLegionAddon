local guids = {}
local f = CreateFrame("Frame")
local enemies = 0;
local allies = 0;

function f:NAME_PLATE_UNIT_ADDED(unit)
    guids[UnitGUID(unit)] = unit
    local UnitPower = 0
    if(UnitHealth(unit) > 10000000) then UnitPower = 10
    elseif (UnitHealth(unit) > 9000000) then UnitPower = 9
    elseif (UnitHealth(unit) > 8000000) then UnitPower = 8
    elseif (UnitHealth(unit) > 7000000) then UnitPower = 7
    elseif (UnitHealth(unit) > 6000000) then UnitPower = 6
    elseif (UnitHealth(unit) > 5000000) then UnitPower = 5
    elseif (UnitHealth(unit) > 4000000) then UnitPower = 4
    elseif (UnitHealth(unit) > 3000000) then UnitPower = 3
    elseif (UnitHealth(unit) > 2000000) then UnitPower = 2
    elseif (UnitHealth(unit) > 1000000) then UnitPower = 1
    elseif (UnitHealth(unit) < 1000000) then UnitPower = 0
    end
    print("Nombre: " .. UnitName(unit) .. " UnitPower: " .. UnitPower )
    --print(UnitHealth(player))
    --if(UnitIsEnemy(unit)==true) then print("HOSTIL") else print("ALIADO") end
    
    enemies = enemies + 1
    --print("Enemigos cerca : " .. enemies)
end

function f:NAME_PLATE_UNIT_REMOVED(unit)
    guids[UnitGUID(unit)] = nil
   -- print("removed", unit, UnitName(unit))
    enemies = enemies - 1
    --print("Enemigos cerca : " .. enemies)
end

f:SetScript("OnEvent", function(self, event, ...)
	f[event](self, ...)
end)

f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")


print("Enemy Count Module Loaded")