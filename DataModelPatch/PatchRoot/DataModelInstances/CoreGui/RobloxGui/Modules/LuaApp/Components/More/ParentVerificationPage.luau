local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GenericWebPageWrapperModule = require(Modules.LuaApp.Components.GenericWebPageWrapper)
local CorePackages = game:GetService("CorePackages")
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local ResetModerationModule = require(Modules.LuaApp.Thunks.Moderation.ResetModeration)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ResetModerationModule (copy), GenericWebPageWrapperModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ResetModerationModule (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), ResetModerationModule (upval)
			UseDispatchResult(ResetModerationModule())
		end
	end, {})
	
	return ReactModule.createElement(GenericWebPageWrapperModule, { isVisible = true, url = p1.url })
end