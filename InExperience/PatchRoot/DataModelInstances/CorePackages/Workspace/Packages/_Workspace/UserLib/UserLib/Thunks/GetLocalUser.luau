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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagUseSignalsForIsLocalUserUnder13 = sharedFlagsModule.FFlagUseSignalsForIsLocalUserUnder13
local var5 = if fFlagUseSignalsForIsLocalUserUnder13 then require(userLib.Stores.GetIsLocalUserUnder13Store) else nil

local function getHasRobloxSubscription(p0) --[[ line: 24 ]]
	-- upvalues: fFlagEnableBlackbirdCheck (ref), mutedError (ref)
	if not fFlagEnableBlackbirdCheck then
		return false
	elseif not game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
		return false
	end
	local ok, status = pcall(function() --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		return p0.HasRobloxSubscription
	end)
	
	if not ok then
		mutedError("[GetLocalUser] Failed to read HasRobloxSubscription: " .. tostring(status))
	end
	return ok and status == true
end

return function() --[[ line: 40 ]]
	-- upvalues: playersService (ref), userModel (ref), isPlayerVerifiedModule (ref), addUser (ref), setLocalUserId (ref), setUserMembershipType (ref), fFlagEnableBlackbirdCheck (ref), setUserHasRobloxSubscription (ref), getHasRobloxSubscription (ref), fFlagUseSignalsForIsLocalUserUnder13 (ref), var5 (ref), setLocalUserUnder13 (ref)
	return function(p1) --[[ line: 41 ]]
		-- upvalues: playersService (copy), userModel (copy), isPlayerVerifiedModule (copy), addUser (copy), setLocalUserId (copy), setUserMembershipType (copy), fFlagEnableBlackbirdCheck (copy), setUserHasRobloxSubscription (copy), getHasRobloxSubscription (copy), fFlagUseSignalsForIsLocalUserUnder13 (copy), var5 (copy), setLocalUserUnder13 (copy)
		local localPlayer = playersService.LocalPlayer
		local var7 = tostring(localPlayer.UserId)
		p1:dispatch(addUser(userModel.fromDataTable({
			isFriend = false,
			id = var7,
			name = localPlayer.Name,
			displayName = localPlayer.displayName,
			hasVerifiedBadge = isPlayerVerifiedModule(localPlayer)
		})))
		p1:dispatch(setLocalUserId(var7))
		p1:dispatch(setUserMembershipType(var7, localPlayer.MembershipType))
		
		if fFlagEnableBlackbirdCheck then
			p1:dispatch(setUserHasRobloxSubscription(var7, getHasRobloxSubscription(localPlayer)))
		end
		if fFlagUseSignalsForIsLocalUserUnder13 then
			var5(false).setIsLocalUserUnder13(localPlayer:GetUnder13())
			
			return
		end
		p1:dispatch(setLocalUserUnder13(localPlayer:GetUnder13()))
	end
end