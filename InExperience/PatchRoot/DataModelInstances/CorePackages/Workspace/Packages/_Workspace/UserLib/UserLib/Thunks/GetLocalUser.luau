local playersService = game:GetService("Players")
local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local mutedError = require(parent.Loggers).mutedError
local isPlayerVerifiedModule = require(userLib.Utils.isPlayerVerified)
local actionsModule = require(userLib.Actions)
local addUser = actionsModule.AddUser
local setLocalUserId = actionsModule.SetLocalUserId
local setUserMembershipType = actionsModule.SetUserMembershipType
local setUserHasRobloxSubscription = actionsModule.SetUserHasRobloxSubscription
local setLocalUserUnder13 = actionsModule.SetLocalUserUnder13
local userModel = require(userLib.Models).UserModel
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck

local function getHasRobloxSubscription(p0) --[[ line: 19 ]]
	-- upvalues: fFlagEnableBlackbirdCheck (ref), mutedError (ref)
	if not fFlagEnableBlackbirdCheck then
		return false
	elseif not game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
		return false
	end
	local ok, status = pcall(function() --[[ line: 26 ]]
		-- upvalues: p0 (ref)
		return p0.HasRobloxSubscription
	end)
	
	if not ok then
		mutedError("[GetLocalUser] Failed to read HasRobloxSubscription: " .. tostring(status))
	end
	return ok and status == true
end

return function() --[[ line: 35 ]]
	-- upvalues: playersService (ref), userModel (ref), isPlayerVerifiedModule (ref), addUser (ref), setLocalUserId (ref), setUserMembershipType (ref), fFlagEnableBlackbirdCheck (ref), setUserHasRobloxSubscription (ref), getHasRobloxSubscription (ref), setLocalUserUnder13 (ref)
	return function(p1) --[[ line: 36 ]]
		-- upvalues: playersService (copy), userModel (copy), isPlayerVerifiedModule (copy), addUser (copy), setLocalUserId (copy), setUserMembershipType (copy), fFlagEnableBlackbirdCheck (copy), setUserHasRobloxSubscription (copy), getHasRobloxSubscription (copy), setLocalUserUnder13 (copy)
		local localPlayer = playersService.LocalPlayer
		local var5 = tostring(localPlayer.UserId)
		p1:dispatch(addUser(userModel.fromDataTable({
			isFriend = false,
			id = var5,
			name = localPlayer.Name,
			displayName = localPlayer.displayName,
			hasVerifiedBadge = isPlayerVerifiedModule(localPlayer)
		})))
		p1:dispatch(setLocalUserId(var5))
		p1:dispatch(setUserMembershipType(var5, localPlayer.MembershipType))
		
		if fFlagEnableBlackbirdCheck then
			p1:dispatch(setUserHasRobloxSubscription(var5, getHasRobloxSubscription(localPlayer)))
		end
		p1:dispatch(setLocalUserUnder13(localPlayer:GetUnder13()))
	end
end