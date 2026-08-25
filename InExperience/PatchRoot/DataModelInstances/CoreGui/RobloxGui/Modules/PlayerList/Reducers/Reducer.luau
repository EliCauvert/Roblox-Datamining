local playerKeysModule = require(script.Parent.PlayerKeys)
local var1 = require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	displayOptions = require(script.Parent.DisplayOptions),
	screenSize = require(script.Parent.ScreenSize),
	settings = require(script.Parent.Settings),
	gameStats = require(script.Parent.GameStats),
	teams = require(script.Parent.Teams),
	teamNames = require(script.Parent.TeamNames),
	teamColors = require(script.Parent.TeamColors),
	players = require(script.Parent.Players),
	playerStats = require(script.Parent.PlayerStats),
	playerTeam = require(script.Parent.PlayerTeam),
	playerIconInfo = require(script.Parent.PlayerIconInfo),
	playerRelationship = require(script.Parent.PlayerRelationship),
	playerDropDown = require(script.Parent.PlayerDropDown)
})

return function(p0, p1)
	-- upvalues: var1 (ref), playerKeysModule (ref)
	local var2 = var1(p0, p1)
	var2.playerKeys = playerKeysModule(if p0 then p0.playerKeys else nil, p1, var2)
	
	return var2
end