local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local MomentsImmersivePresentation = require(CorePackages.Workspace.Packages.Moments).MomentsImmersivePresentation
local OpenProfilePeekViewModule = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.OpenProfilePeekView)
local MomentsFeed = require(CorePackages.Workspace.Packages.ProfilePlatform).Sources.MomentsFeed

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), OpenProfilePeekViewModule (copy), MomentsFeed (copy), MomentsImmersivePresentation (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local Navigation = p1.navigation
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), OpenProfilePeekViewModule (upval), MomentsFeed (upval)
		UseDispatchResult(OpenProfilePeekViewModule(tostring(p2), { source = MomentsFeed }))
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), OpenProfilePeekViewModule (upval), MomentsFeed (upval)
		if UseSelectorResult ~= nil then
			UseDispatchResult(OpenProfilePeekViewModule(tostring(UseSelectorResult), { source = MomentsFeed }))
			
			return
		end
	end, { UseDispatchResult, UseSelectorResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Navigation (copy)
		if Navigation ~= nil and Navigation.goBack ~= nil then
			Navigation.goBack()
		end
	end, { Navigation })
	local SessionSource = "flyout_menu"
	
	if Navigation ~= nil and Navigation.getParam ~= nil then
		local SourceParam = Navigation.getParam("source")
		
		if type(SourceParam) == "string" then
			SessionSource = SourceParam
		end
	end
	return ReactModule.createElement(MomentsImmersivePresentation, {
		feedKind = "trending",
		onBack = UseResult2,
		sessionSource = SessionSource,
		openProfile = UseResult,
		openOwnMoments = UseResult1
	})
end