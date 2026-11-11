local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateToUserInfoModule = require(Modules.LuaApp.Thunks.NavigateToUserInfo)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return (require(Modules.LuaApp.Common.wrapComponent)(function(p1, p2)
	-- upvalues: RoactModule (copy)
	return if p2.isSearching then nil else RoactModule.createElement(p1, p2)
end)((require(CorePackages.Packages.RoactRodux).connect(function(p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), FFlagEnableBlackbirdCheck (copy)
	local User = p1.Users[p1.LocalUserId]
	
	return if User then {
		displayName = User.displayName or User.name,
		thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.LocalUserId, Constants.RbxthumbTypes.AvatarHeadShot, 150),
		isPremium = User.membership == Enum.MembershipType.Premium,
		isVerified = User.hasVerifiedBadge,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then User.hasRobloxSubscription == true else false,
		localUserId = p1.LocalUserId
	} else {}
end, function(Callback)
	-- upvalues: AppPageModule (copy), UrlBuilder (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), NavigateToUserInfoModule (copy)
	return {
		openProfile = function()
			-- upvalues: AppPageModule (upval), UrlBuilder (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.ViewProfile,
				detail = UrlBuilder.static.profile()
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		openLuaProfile = function(p1, p2)
			-- upvalues: Callback (copy), NavigateToUserInfoModule (upval)
			Callback(NavigateToUserInfoModule(p1, p2))
		end
	}
end)((require(script.NameBadge))))))