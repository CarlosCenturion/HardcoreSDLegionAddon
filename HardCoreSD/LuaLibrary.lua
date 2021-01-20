--The most commonly used Lua commands in WoW Scripting (Not EVERY command is included)

--NOTE: If you see a * in a command then please remove it when scripting. If i would remove it in then post then the command could look like this:

--espawn
--When it should look like this:
--Code:

--:*Despawn



.:GOSSIP STUFF:.

:GossipCreateMenu
:GossipMenuAddItem
:GossipSendMenu
:GossipComplete
:GossipSendPOI

.:GET STUFF:.

:GetMainTank() --Returns main tank.
:GetAddTank() --Returns offtank.
:GetX() --Gets unit's X cordinate.
:GetY() --Gets unit's Y cordinate.
:GetZ() --Gets unit's Z cordinate.
:GetO() --Gets unit's O cordinate.
:GetTauntedBy() --Gets the target the unit was taunted by.
:GetSoulLinkedWith() --Gets the unit that it is soullinked with.
:GetItemCount(xxxx) -- Get the amount of "xxxx" items in the player's inventory. Replace the XXXX with the itemid.
:GetName() --Gets the name of the unit.
:GetHealthPct() --Gets the health percent of the unit.
:GetManaPct() --Gets the mana percent of the unit.
:GetInstanceID() --Gets the instance id of the unit(if in an instance)
:GetClosestPlayer() --Gets the closest player.
:GetSpellId(spellid) -- This returns the spell as unit(planned for spell editing).
:GetRandomPlayer(flag)
Flags:
RANDOM_ANY = 0,
RANDOM_IN_SHORTRANGE = 1,
RANDOM_IN_MIDRANGE = 2,
RANDOM_IN_LONGRANGE = 3,
RANDOM_WITH_MANA = 4,
RANDOM_WITH_RAGE = 5,
RANDOM_WITH_ENERGY = 6,
RANDOM_NOT_MAINTANK= 7

:GetRandomFriend() --Gets a random friend(friendly to the unit)
:GetRandomEnemy() --Gets a random enemy(unfriendly to the unit)
:GetUnitBySqlId(sqlid) -- use this to return a unit BY SQL ID. .go info or .npc info can provide u w/ sql id
:GetUnitByGUID(guid) -- This returns a unit that has that guid.
:GetPlayerClass() --Gets the player's class, will return in number form.
:GetHealth() --Gets the unit's health, returns the exact health
:GetMaxHealth() --Gets the unit's max health.
:GetCreatureNearestCoords() -- similar to getgameobjectnearestcoords but for creatures.
:GetCreatureGuid() -- absolete
:GetGameObjectGuid() -- absolete
:GetPlayerCountInRadius() -- this will lagg the client when called, don't use it, use GetInRangePlayerCount() instead.
:GetGameObjectNearestCoords(x,y,z,gameobjectid) -- This returns the GO as a unit if it is found.

Usage: local door = Unit:GetGameObjectNearestCoords(x,y,z,doorid) §§ if door ~= nil then §§ door:SetUInt32Value(GAMEOBJECT_STATE,1)
-- close the door §§ end Each §§ is a newline!

:GetDistance(target) -- use this to check the distance from this unit to the target specified, it does not scale to yards.
:GetGUID() -- returns a uint64 guid number that is unique to every player/creature/go/(item?).
:GetZoneId() -- returns the zone id that the unit is currently in.
:GetMaxMana() -- This returns the maximum mana the unit CAN have.
:GetMana() -- This returns the exact mana the unit has. Use this w/ getpowertype to check if the unit as mana to begin with.
:GetCurrentSpellId() -- if a unit is casting a spell, this will return the spellid of the spell that is unit is casting.
:GetInstanceID() -- returns the instance id number if the unit/player/go is in an instance.
:GetSpawnX() -- returns the x spawn point coord.
:GetSpawnY() -- " " y " ".
:GetSpawnZ() -- " " z " ".
:GetSpawnO() -- " " o " ".
:GetInRangePlayersCount() -- if the unit has inrangeplayers, this will return how many of those players are there.
:GetAIState() -- returns the ai state that the unit is in, in number form.
:GetAITargets() -- this will return a table containing a list of targets that the unit has(threat table);
:GetInRangeObjects() -- returns a table containing a list of inrange gameobjects.
:GetInRangeObjectCount() -- returns the number of gameobjects near the unit/go/player.
:GetAITargetsCount() -- self explainatory.
:GetPowerType() -- this returns the power type IN STRING FORM,"Health", "Mana", "Rage", etc.
:GetInRangeFriends() -- Use this to return units that are friendly to the unit. It returns in a table.
:GetPlayerLevel() -- Don't have to explain this one.
:GetStealthLevel() -- This returns the stealth points the unit has if any.
:GetFaction() -- returns the faction number.
:GetNextTarget() -- returns current target?
:GetUInt32Value(field) -- check core to see how they are used.
:GetUInt64Value(field) -- check core to see how they are used.
:GetMapId() -- returns mapid.
:GetTarget() -- returns the target-Unit (Only available on players).
:GetSelection() -- returns the selection of the player (Only available on players).

.:BOOLS:.

:IsPlayer() -- same as IsCreature but for players instead, use to check if the current unit is a player.
:IsCreature() -- if the current unit it is called on is a creature, it returns true/false if its not.
:IsInCombat() returns true/false if the unit is in combat/not in combat.
:IsCasting() -- if unit is casting a spell it returns true/false if the unit is not.(Maybe be not functional)
:IsAlive() -- reverse of isdead(), returns true if the unit is alive/false if the unit is dead.
:IsDead() -- is dead check. If the unit is dead, it will return true/false if its not.
:IsInWorld() -- kind of a safe check to see if the current unit exists in the world, returns true/false
:IsPlayerMoving() -- this is for players, returns true/false if the player is moving/not moving
:IsCreatureMoving() -- same but for creatures, returns true/false if creature is moving/notmoving
:IsInFront(target) -- it returns true/false if the current unit is in front of the target specified.
:IsInBack(target) -- explainatory.
:IsPacified() -- if unit is pacified true/false if not.
:IsInWater() -- for players only, checks if the player is in water.
:NoRespawn() -- set to 1 to disable respawn, 0 to allow respawning, for creatures only.
:IsStealthed() -- If unit is stealthed, true/false if not.
:IsPlayerAttacking() -- true/false if player is attacking, player only command.

.:OTHERS:.

:SendChatMessage(type,language,message) -- Type is the chat type e.g. Say,Yell,RaidWarning, chat.h has a list of them; language is pretty obvious.

Usage:
function SayThis(Unit,event)
local plr = Unit:GetMainTank()
if plr ~= nil then
Unit:SendChatMessage(14(yell),0(Universal lang),plr:GetName()..", you cannot resist me!")
end
end

:MoveTo(x,y,z,o) -- pretty self explainatory. Use .gps while ingame to retrieve coords, O is just orientation.

Usage:
function MoveTo(Unit,event)
Unit:MoveTo(Unit:GetSpawnX(),Unit:GetSpawnY(),Unit :GetSpawnZ(),Unit:GetSpawnO()) -- makes the unit move to its spawn points.
end

:CastSpell(spellid) -- Just fill in the spell id which you want to the current unit to cast. This will cast the spell on caller of this function and ignore cast time.
Usage:
function CastSpell(Unit,event)
Unit:CastSpell(5) -- death touch xd
end

:CastSpellOnTarget(spellid,target) -- first argument is spellid just like above, 2nd is target, there is a bug w/ this function that it causes it not to cast on the target.

Use FullCastSpellOnTarget(spellid,target) if you want to cast on a target.

:FullCastSpell(spellid) -- This does the same as castspell except with casttime.
:FullCastSpellOnTarget -- Fully casts the spell with cast time but on a target(if target is the unit, just use castspell or fullcastspell)
:SpawnGameObject(entry_id,x,y,z,duration)-- spawns a gameobject from the entry id given at the location vector given
Usage:
Unit:SpawnGameObject(166434(random no.),Unit:GetX(),Unit:GetY(),Unit:GetZ(),0(0 duration to make the go not despawn. Add duration in milisecs to make it despawn after x seconds))

:SpawnCreature(entryid,x,y,z,faction,duration) -- Unlike spawngameobject, creatures use factions. This decides whether they are friendly/hated towards the player and other stuff like if you kill it what rep u get.

Usage:
Unit:SpawnCreature(randomnumberhere,Unit:GetX(),Un it:GetY(),Unit:GetZ(),14,5000(despawn after 5 secs))

:RegisterEvent(string,delay,repeats) -- registers a function to call on the unit, note that only creatures can use this, not gameobjects.

Usage:
Unit:RegisterEvent("KillYou",5000, 1)
whereas
function KillYou(Unit,event)
Unit:FullCastSpellOnTarget(5,Unit:GetRandomPlayer( 0))
end

:RemoveEvents() -- this has no arguments and removes all registered functions.

Usage:
function OnCreatureDied(Unit,event)
Unit:RemoveEvents()-- when the creature is dead, remove all functions so it doesn't do anything.
end

:SendBroadcastMessage(string) -- this is a player only command. The player who called it, displays a message that you typed in there

Usage:
function Error(Unit,event)
local tank = Unit:GetMainTank()
tank:SendBroadCastMessage("You are now tanking "..Unit:GetName())
end

:SendAreaTriggerMessage(stringfunc) - This sends a message across the top center of your screen. Similar like a raid warning message.
:KnockBack() -- neither this.
:MarkQuestObjectiveAsComplete(questid,objective) -- Never used this.
:LearnSpell(spellid) -- This is a player only command, it teaches the player unit that it is called on the spellid

Usage:
local plr = Unit:GetClosestPlayer()
plr:LearnSpell(5) -- learn death touch xd

:UnlearnSpell(spellid) -- This just removes a spell already known from the player.

Usage:
local plr = Unit:GetClosestPlayer()
plr:UnlearnSpell(5) -- noooes gief death touch!!

:HasFinishedQuest(questid)-- this is a boolean like others to come. It checks whether the player has finished the quest provided w/ the id, if not, it pushes false.

Usage:
local plr = Unit:GetClosestPlayer()
if plr:HasFinishedQuest(questid) == true then
do this if the player has completed the quest
end

:ClearThreatList() -- this maybe confused to wipethreatlist. What it does is set all threat levels to 1, This means the creature will still aggro, but aggro can be easily taken away.
:ChangeTarget(target) -- This causes the Unit to change the target, it is basically SetNextTarget(target).
:Emote(emoteid) -- Use this to get the unit to do a certain emote. // In Untested Branch you can give a secind argument for delay in milliseconds: Unit:Emote(18,5000) --Kneel down in 5 Seconds
:*Despawn(delay,respawn)-- Note this is a creature only one, if you filled the first blank, it will delay the alloted time filled before despawning, if you filled second, it will respawn the unit after the alloted time.
:PlaySoundToSet(soundid) -- Look in soundentries.dbc for various sounds to play. .playall(soundid) can come in handy to differenciate.
:RemoveAura(spellid) -- If a spell has an aura, this will remove that aura.
:StopMovement(delaytime) -- This will make the unit stop moving for the time specified. A creature only command.
:AddItem(itemid) -- This is a player only command, use it to add an item to a players inventory.
:RemoveItem(itemid) -- Use to take a way and item from a players invent.
:CreateCustomWaypointMap() -- This creates a custom waypoint map, whether u call this or not, createwaypoint will create one automatically.
:CreateWaypoint(x,y,z,waittime,moveflags,displayid ) -- x,y,z are the coords, waittime is the delay for it to not move,moveflags are either 0 for walk, 256 for run, or 768 for fly, displayid is how you want the waypoints to look like(Like mini models).
:*DestroyCustomWaypointMap() -- use it to destroy all waypoints that the unit has. Only works for creatures.
:MoveToWaypoint(waypointid) -- When you create ur first waypoint, they are numberd in order start from 1. 0 and 1 do the same thing. Use it to make a unit move to various waypoints.
:TeleportUnit(mapid,x,y,z) -- This teleport's a PLAYER only unit to the location specified.
:ClearHateList() -- this is a duplicate of ClearThreatList(). They do the same thing.
:WipeHateList() -- This removes ALL Threat off the mob, this will cause the mob to leavecombat and return to spawn.
:WipeTargetList() -- This just does the same as WipeHateList(), causes the mob to reset.
:WipeCurrentTarget() -- This will cause the unit to disengaged the current player and target a new.
:CastSpellAoF(x,y,z,spellid) -- This is for aoe spell types. Currently bugged since the spell does no dmg.
:RemoveAllAuras() -- removes ALL auras, positive or negative on the current unit.
:StopChannel() -- If the unit is channeling a spell, it stops it.
:ChannelSpell(guid,spellid) -- Use this to make a unit channel, guid is the target's guid u wish and spellid is the spell u want to channel.

Usage:
local plr = Unit:GetRandomPlayer()
if plr ~= nil then
Unit:ChannelSpell(plr:GetGUID(),spellid) -- channel a certain spell on the player.
end

:ReturnToSpawnPoint() -- makes a unit go back to its spawn point.
:HasAura(auraid) -- this is a boolean, returns true if the unit has the auraid given, or false if not.
:Land() -- Use this to land units that are already flying.
:CancelSpell() -- This cancels the units current spell?
:AdvanceSkill(skillid,amounttoincrement) -- use it the same way u use gm command.
:AddSkill(skillid) -- use to add a skill to player if the player doesn't already have it.
:RemoveSkill(skillid) -- explainatory.
:PlaySpellVisual(guid,spellid) -- doesn't seem to work.
:RemoveThreatByPtr(target) -- Removes all threat if any, on the current target specified
:EventCastSpell(target,sp,delay,repeats) -- this casts a spell over and over on the target specified, delay is amount to wait before recasting, repeats is how many times.
:AttackReaction(target,dmg,spell) -- This creates fake threat towards the unit specified

Usage:
local plr = Unit:GetRandomPlayer(0)
Unit:AttackReaction(plr, 1, 0) -- If the unit doesn't have any aggro, it will now aggro this player.

:Root() -- this unlike stopmovement(), disables all movement.
:Unroot() -- allows movement again.
:Heal(target,spellid,amount) -- The current unit heals the target specified for the amount and spell id.
:Energize(target,spellid,amount,type) -- Restore mana/rage/focus/hp?
:Strike(target,dmg,sp,adddmg,exclusivedmg,pct_dmg_ mod) -- I dono xD
:Kill(target) -- this pretty much calls a dealdamage that deals damage equivalent to the Units hp.
:*DealDamage(target,damage,spellid) -- Use this to deal modified dmg to the target specified.
:RessurectPlayer() -- player only command, rez the player!
:RemoveFromWorld() -- use this for both creatures/gos to remove that unit from the world.
:ModThreat(target, amount) -- modifies threat of the target, if any, to the amount specified.
:AddAssitTarget(target) -- Use this in conjunction w/ onassisttarget died event to call stuff.
:RemoveAurasByMechanic(mechanicid,hostileonly) -- This removes all auras depending on what mechanic,(sleep,fear,etc), hostileonly is a bool, put 1 to remove only hostile auras, 0 for all pos and nega auras
:RemoveStealth() -- if the unit is in stealth, it removes it from stealth.
:RegisterAIUpdateEvent(miliseconds) -- This creates an ai update event to use w/ ONAIUPDATEVENT.
:ModifyAIUpdateEvent(newtime) -- changes the prev time to the one provided.
:RemoveAIUpdateEvent() -- similar to RemoveEvents() but only removes aiupdate event.
:*DeleteWaypoint(wpid) -- if the unit has that wpid, it deletes it.
:*DealGoldCost(amount) -- Returns true if the amount of copper was successfully taken from the player (If the player has not enough silver it will return false, else it will take the money from him and return true)
:*DealGoldMerit(amount) -- Adds an amount of copper to the players backpack and returns nil
:PerformCharDBQuery(querystring) ---->\
:PerformWorldDBQuery(querystring) -- These two Functions can query the database. They return 1 if MySQL returned some data (positive select for example), 2 if MySQL did NOT return data (Insert or negative select for example), and 0 if this was not allowed (disabled in optional config -- FOR SECURITY REASONS IT IS DISABLED BY DEFAULT!)

.:SET STUFF:.

:SetMana(newmana) -- Sets the units current mana to this.
:SetMaxMana(maxmana) -- sets the maximum mana the unit can have, to this.
:SetHealth(newhp) -- explainatory.
:SetMaxHealth(newmaxhp) -- explainator.
:SetFieldFlags() -- absolete, use SetUInt32/64Value(field,value)
:SetFlying() -- if the unit can hover, it sets to hover.
:SetCombatCapable(1/0) -- 1 disables combat, 0 re-enables combat.
:SetCombatMeleeCapable(1/0) - 1 disables melee ability, 0 enables it.
:SetCombatRangedCapable(1/0) -- and so on.
:SetCombatSpellCapable(1/0) -- and so on.
:SetCombatTargetingCapable(1/0) -- Disables targeting, only disables new targeting, if the unit already has targgeted u, it will continue to do so.
:SetNPCFlags() -- absolete
:SetModel(newid) -- changes the display of the unit.
:SetScale(newscale) -- changes the size of the unit, doesn't scale compared to scalespells.
:SetFaction(newfaction) -- changes the faction of the unit, doesn't take effect until u rezone.
:SetStandState(newstandstate) -- Need more info.
:SetTauntedBy(target) -- set to be taunted by the target provided
:SetSoulLinkedWith(target) -- set soul linked, I think this means that only that target can attack this unit.
:SetInFront(target) -- I guess it sets the current unit to be infront of the target provided.
:SetOutOfCombatRange(combatrange) -- this sets outofcombatrange.
:SetMovementType(0 - walk, 256 - run, 768 - fly) - yep.
:SetHealthPct() -- sets the PERCENT of the hp.
:ModifyRunSpeed(float) -- changes
:ModifyWalkSpeed(float) -- the units
:ModifyFlySpeed(float) -- speed.
:SetOrientation(newo) -- new direction to face.
:SetFacing(newo) -- new direction to face, only if unit is idle.
:SetNextTarget(target) -- make the unit target the one provided.
:SetStealth(stealthpoints) -- makes the unit go into stealth mode, is detected depending on how many stealth points
:SetPowerType(string) -- this uses strings to set the power type ("health,mana,rage,focus,energy")
:SetDeathState(newdeathstate) -- sets death state
:SetPlayerStanding(faction,value) -- sets the rep of the player related to the faction.
:SetPlayerLevel(level) -- explainatory.
Good Luck!