local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TutilsModule = require(Parent.tutils)
local Players = game:GetService("Players")
local UserLibModule = require(Parent.UserLib)

local function selectPlayer(p1) --[[ Line: 13 ]]
	return { playerName = p1.playerName, playerId = p1.playerId }
end

return function() --[[ Line: 26 ]]
	-- upvalues: UseSelectorFunction (copy), selectPlayer (copy), TutilsModule (copy), Players (copy), UserLibModule (copy)
	local UseSelectorResult = UseSelectorFunction(selectPlayer, TutilsModule.deepEqual)
	local Number = if UseSelectorResult then tonumber(UseSelectorResult.playerId) else nil
	local Player = Number and Players:GetPlayerByUserId(Number)
	
	return {
		playerName = if UseSelectorResult then UseSelectorResult.playerName else nil,
		playerId = Number,
		hasVerifiedBadge = if Player then UserLibModule.Utils.isPlayerVerified(Player) else false
	}
end