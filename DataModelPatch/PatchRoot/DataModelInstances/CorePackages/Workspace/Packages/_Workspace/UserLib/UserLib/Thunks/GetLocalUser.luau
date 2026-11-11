local Players = game:GetService("Players")
local UserLib = script:FindFirstAncestor("UserLib")
local Parent = UserLib.Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local IsPlayerVerifiedModule = require(UserLib.Utils.isPlayerVerified)
local ActionsModule = require(UserLib.Actions)
local AddUserFunction = ActionsModule.AddUser
local SetLocalUserIdFunction = ActionsModule.SetLocalUserId
local SetUserMembershipTypeFunction = ActionsModule.SetUserMembershipType
local SetUserHasRobloxSubscriptionFunction = ActionsModule.SetUserHasRobloxSubscription
local SetLocalUserUnder13Function = ActionsModule.SetLocalUserUnder13
local UserModel = require(UserLib.Models).UserModel
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck

local function getHasRobloxSubscription(LocalPlayer): boolean
	-- upvalues: FFlagEnableBlackbirdCheck (copy), MutedErrorFunction (copy)
	if not FFlagEnableBlackbirdCheck then
		return false
	end
	if not game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
		return false
	end
	local Success, Result = pcall(function()
		-- upvalues: LocalPlayer (copy)
		return LocalPlayer.HasRobloxSubscription
	end)
	
	if not Success then
		MutedErrorFunction("[GetLocalUser] Failed to read HasRobloxSubscription: " .. tostring(Result))
	end
	return Success and Result == true
end

return function()
	-- upvalues: Players (copy), UserModel (copy), IsPlayerVerifiedModule (copy), AddUserFunction (copy), SetLocalUserIdFunction (copy), SetUserMembershipTypeFunction (copy), FFlagEnableBlackbirdCheck (copy), SetUserHasRobloxSubscriptionFunction (copy), getHasRobloxSubscription (copy), SetLocalUserUnder13Function (copy)
	return function(p1)
		-- upvalues: Players (upval), UserModel (upval), IsPlayerVerifiedModule (upval), AddUserFunction (upval), SetLocalUserIdFunction (upval), SetUserMembershipTypeFunction (upval), FFlagEnableBlackbirdCheck (upval), SetUserHasRobloxSubscriptionFunction (upval), getHasRobloxSubscription (upval), SetLocalUserUnder13Function (upval)
		local LocalPlayer = Players.LocalPlayer
		local Text = tostring(LocalPlayer.UserId)
		p1:dispatch(AddUserFunction((UserModel.fromDataTable({
			isFriend = false,
			id = Text,
			name = LocalPlayer.Name,
			displayName = LocalPlayer.displayName,
			hasVerifiedBadge = IsPlayerVerifiedModule(LocalPlayer)
		}))))
		p1:dispatch(SetLocalUserIdFunction(Text))
		p1:dispatch(SetUserMembershipTypeFunction(Text, LocalPlayer.MembershipType))
		
		if FFlagEnableBlackbirdCheck then
			p1:dispatch(SetUserHasRobloxSubscriptionFunction(Text, (getHasRobloxSubscription(LocalPlayer))))
		end
		p1:dispatch(SetLocalUserUnder13Function(LocalPlayer:GetUnder13()))
	end
end