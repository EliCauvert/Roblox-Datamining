local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local actions = script.Parent.Parent.Actions
local addPlayerModule = require(actions.AddPlayer)
local removePlayerModule = require(actions.RemovePlayer)
local setPlayerLeaderstatModule = require(actions.SetPlayerLeaderstat)

local function createKey(p0, p1, p2) --[[ line: 10 ]]
	local var5 = if not (p1 == nil or p2 == nil or p2[p0.UserId] == nil) then p2[p0.UserId][p1] else nil
	
	return {
		name = p0.DisplayName:upper(),
		stat = var5 and tonumber(var5) or var5
	}
end

return function(p3, p4, p5) --[[ line: 22 | named "PlayerKeys" ]]
	-- upvalues: createKey (ref), addPlayerModule (ref), setPlayerLeaderstatModule (ref), cryoModule (ref), removePlayerModule (ref)
	local var6 = if p5.gameStats[1] then p5.gameStats[1].name else nil
	
	if p3 and var6 == p3.primaryStat then
		return if p4.type == addPlayerModule.name or p4.type == setPlayerLeaderstatModule.name then {
			primaryStat = var6,
			keys = cryoModule.Dictionary.join(p3.keys, { [p4.player] = createKey(p4.player, var6, p5.playerStats) })
		} elseif p4.type == removePlayerModule.name then {
			primaryStat = var6,
			keys = cryoModule.Dictionary.join(p3.keys, { [p4.player] = cryoModule.None })
		} else p3
	end
	local t = {}
	
	for i, v in pairs(p5.players) do
		t[v] = createKey(v, var6, p5.playerStats)
	end
	return { primaryStat = var6, keys = t }
end