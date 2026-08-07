local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)
local playersService = game:GetService("Players")
local userLibModule = require(parent.UserLib)

local function selectPlayer(p0) --[[ line: 13 ]]
	return { playerName = p0.playerName, playerId = p0.playerId }
end

return function() --[[ line: 26 ]]
	-- upvalues: useSelector (ref), selectPlayer (ref), tutilsModule (ref), playersService (ref), userLibModule (ref)
	local var4 = useSelector(selectPlayer, tutilsModule.deepEqual)
	local var5 = if var4 then var4.playerName else nil
	local var6 = if var4 then tonumber(var4.playerId) else nil
	local var7 = var6 and playersService:GetPlayerByUserId(var6)
	
	return {
		playerName = var5,
		playerId = var6,
		hasVerifiedBadge = if var7 then userLibModule.Utils.isPlayerVerified(var7) else false
	}
end