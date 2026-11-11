local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Actions = script.Parent.Parent.Actions
local AddPlayerModule = require(Actions.AddPlayer)
local RemovePlayerModule = require(Actions.RemovePlayer)
local SetPlayerLeaderstatModule = require(Actions.SetPlayerLeaderstat)

local function createKey(Player: Player, Name, PlayerStats)
	local PlayerStatEntry = if Name == nil or PlayerStats == nil or PlayerStats[Player.UserId] == nil then nil else PlayerStats[Player.UserId][Name]
	
	return {
		name = Player.DisplayName:upper(),
		stat = PlayerStatEntry and tonumber(PlayerStatEntry) or PlayerStatEntry
	}
end

return function(p1, p2, p3)
	-- upvalues: createKey (copy), AddPlayerModule (copy), SetPlayerLeaderstatModule (copy), CryoModule (copy), RemovePlayerModule (copy)
	local Name = p3.gameStats[1] and p3.gameStats[1].name or nil
	
	if p1 and Name == p1.primaryStat then
		return if p2.type == AddPlayerModule.name or p2.type == SetPlayerLeaderstatModule.name then {
			primaryStat = Name,
			keys = CryoModule.Dictionary.join(p1.keys, { [p2.player] = createKey(p2.player, Name, p3.playerStats) })
		} elseif p2.type == RemovePlayerModule.name then {
			primaryStat = Name,
			keys = CryoModule.Dictionary.join(p1.keys, { [p2.player] = CryoModule.None })
		} else p1
	end
	local Keys = {}
	
	for _, player in pairs(p3.players) do
		Keys[player] = createKey(player, Name, p3.playerStats)
	end
	return { primaryStat = Name, keys = Keys }
end