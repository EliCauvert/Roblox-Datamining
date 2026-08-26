local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local actions = script.Parent.Parent.Actions
local addPlayerModule = require(actions.AddPlayer)
local removePlayerModule = require(actions.RemovePlayer)
local setPlayerLeaderstatModule = require(actions.SetPlayerLeaderstat)

local function createKey(p1, p2, p3)
	local var1 = if not (p2 == nil or p3 == nil or p3[p1.UserId] == nil) then p3[p1.UserId][p2] else nil
	
	return {
		name = p1.DisplayName:upper(),
		stat = var1 and tonumber(var1) or var1
	}
end

return function(p1, p2, p3)
	-- upvalues: createKey (ref), addPlayerModule (ref), setPlayerLeaderstatModule (ref), cryoModule (ref), removePlayerModule (ref)
	local var1 = if p3.gameStats[1] then p3.gameStats[1].name else nil
	
	if p1 and var1 == p1.primaryStat then
		return if p2.type == addPlayerModule.name or p2.type == setPlayerLeaderstatModule.name then {
			primaryStat = var1,
			keys = cryoModule.Dictionary.join(p1.keys, { [p2.player] = createKey(p2.player, var1, p3.playerStats) })
		} elseif p2.type == removePlayerModule.name then {
			primaryStat = var1,
			keys = cryoModule.Dictionary.join(p1.keys, { [p2.player] = cryoModule.None })
		} else p1
	end
	local t = {}
	
	for i, v in pairs(p3.players) do
		t[v] = createKey(v, var1, p3.playerStats)
	end
	return { primaryStat = var1, keys = t }
end