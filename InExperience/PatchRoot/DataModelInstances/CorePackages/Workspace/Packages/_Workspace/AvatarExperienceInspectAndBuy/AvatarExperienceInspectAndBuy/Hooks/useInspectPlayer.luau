local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)
local playersService = game:GetService("Players")
local userLibModule = require(parent.UserLib)

local function selectPlayer(p1)
	return { playerName = p1.playerName, playerId = p1.playerId }
end

return function()
	-- upvalues: useSelector (ref), selectPlayer (ref), tutilsModule (ref), playersService (ref), userLibModule (ref)
	local var1 = useSelector(selectPlayer, tutilsModule.deepEqual)
	local var2 = if var1 then var1.playerName else nil
	local var3 = if var1 then tonumber(var1.playerId) else nil
	local var4 = var3 and playersService:GetPlayerByUserId(var3)
	
	return {
		playerName = var2,
		playerId = var3,
		hasVerifiedBadge = if var4 then userLibModule.Utils.isPlayerVerified(var4) else false
	}
end