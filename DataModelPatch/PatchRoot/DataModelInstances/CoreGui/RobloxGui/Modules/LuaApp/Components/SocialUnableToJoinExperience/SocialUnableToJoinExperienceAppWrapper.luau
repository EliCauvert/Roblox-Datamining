local CorePackages = game:GetService("CorePackages")
local UnableToJoinExperienceModal = require(CorePackages.Workspace.Packages.SocialExperienceJoin).UnableToJoinExperienceModal
local ReactModule = require(CorePackages.Packages.React)
local OpenGameDetailsModule = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.OpenGameDetails)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), OpenGameDetailsModule (copy), UnableToJoinExperienceModal (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(UnableToJoinExperienceModal, {
		openGameDetailsPeekView = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseDispatchResult (copy), OpenGameDetailsModule (upval)
			UseDispatchResult(OpenGameDetailsModule(p1, p2))
		end, {})
	})
end