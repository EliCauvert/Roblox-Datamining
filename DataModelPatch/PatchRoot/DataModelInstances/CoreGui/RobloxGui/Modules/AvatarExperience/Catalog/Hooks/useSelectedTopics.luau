local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SetSelectedTopicsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.SetSelectedTopics)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local t = {}

local function selectSelectedTopics(p1)
	-- upvalues: t (copy)
	return p1.AvatarExperience.Catalog.SortAndFilters.SelectedTopics or t
end

return function()
	-- upvalues: UseSelectorFunction (copy), selectSelectedTopics (copy), GetUseSelectorDeepEqualsFunction (copy), UseDispatchFunction (copy), ReactModule (copy), SetSelectedTopicsModule (copy)
	local UseSelectorResult = UseSelectorFunction(selectSelectedTopics, GetUseSelectorDeepEqualsFunction())
	local UseDispatchResult = UseDispatchFunction()
	
	return UseSelectorResult, (ReactModule.useCallback(function(p1)
		-- upvalues: UseDispatchResult (copy), SetSelectedTopicsModule (upval)
		UseDispatchResult(SetSelectedTopicsModule(p1))
	end))
end