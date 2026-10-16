local PlayerKeysModule = require(script.Parent.PlayerKeys)
local CombineReducersResult = require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
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

return function(p1, p2) --[[ Line: 42 ]]
	-- upvalues: CombineReducersResult (copy), PlayerKeysModule (copy)
	local CombineReducersResultResult = CombineReducersResult(p1, p2)
	CombineReducersResultResult.playerKeys = PlayerKeysModule(p1 and p1.playerKeys or nil, p2, CombineReducersResultResult)
	
	return CombineReducersResultResult
end