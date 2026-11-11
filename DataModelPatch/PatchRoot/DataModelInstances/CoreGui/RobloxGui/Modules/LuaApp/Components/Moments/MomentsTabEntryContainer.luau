local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local MomentsTabEntry = require(CorePackages.Workspace.Packages.Moments).MomentsTabEntry
local OpenProfilePeekViewModule = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.OpenProfilePeekView)
local SetTabBarVisibleFromMomentsFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromMoments
local MomentsFeed = require(CorePackages.Workspace.Packages.ProfilePlatform).Sources.MomentsFeed
local FFlagMomentsWatchSessionalization = require(CorePackages.Workspace.Packages.SharedFlags).FFlagMomentsWatchSessionalization

local function MomentsTabEntryContainer(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), OpenProfilePeekViewModule (copy), MomentsFeed (copy), SetTabBarVisibleFromMomentsFunction (copy), MomentsTabEntry (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), OpenProfilePeekViewModule (upval), MomentsFeed (upval)
		if UseSelectorResult ~= nil then
			UseDispatchResult(OpenProfilePeekViewModule(tostring(UseSelectorResult), { source = MomentsFeed }))
			
			return
		end
	end, { UseDispatchResult, UseSelectorResult })
	
	return ReactModule.createElement(MomentsTabEntry, {
		navigation = p1.navigation,
		openProfile = ReactModule.useCallback(function(p2)
			-- upvalues: UseDispatchResult (copy), OpenProfilePeekViewModule (upval), MomentsFeed (upval)
			UseDispatchResult(OpenProfilePeekViewModule(tostring(p2), { source = MomentsFeed }))
		end, { UseDispatchResult }),
		openOwnMoments = if UseSelectorResult == nil then nil else UseResult,
		onTabFocused = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFromMomentsFunction (upval)
			UseDispatchResult(SetTabBarVisibleFromMomentsFunction(true))
		end, { UseDispatchResult })
	})
end

local MomentsTabEntryContainerScreen = ReactModule.Component:extend("MomentsTabEntryContainerScreen")

function MomentsTabEntryContainerScreen.render(p1)
	-- upvalues: ReactModule (copy), MomentsTabEntryContainer (copy)
	return ReactModule.createElement(MomentsTabEntryContainer, p1.props)
end

if FFlagMomentsWatchSessionalization then
	MomentsTabEntryContainerScreen.router = MomentsTabEntry.router
end
return if FFlagMomentsWatchSessionalization then MomentsTabEntryContainerScreen else MomentsTabEntryContainer