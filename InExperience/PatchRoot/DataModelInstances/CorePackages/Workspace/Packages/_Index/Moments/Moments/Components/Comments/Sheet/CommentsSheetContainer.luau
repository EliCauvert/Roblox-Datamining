local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local CommentsSheetViewModule = require(script.Parent.CommentsSheetView)
local UseCommentsSheetViewModelModule = require(script.Parent.useCommentsSheetViewModel)
local UseHideTabBarWhileOpenModule = require(Moments.ExperienceDetailsSheet.Sheet.useHideTabBarWhileOpen)
local FFlagMomentsTabsBehindModalScrimModule = require(Moments.Flags.FFlagMomentsTabsBehindModalScrim)

local function TabBarVisibilityController()
	-- upvalues: UseHideTabBarWhileOpenModule (copy)
	UseHideTabBarWhileOpenModule(true)
	
	return nil
end

return ReactModule.memo(function()
	-- upvalues: UseCommentsSheetViewModelModule (copy), ReactModule (copy), CommentsSheetViewModule (copy), FFlagMomentsTabsBehindModalScrimModule (copy), TabBarVisibilityController (copy)
	local UseCommentsSheetViewModelModuleResult = UseCommentsSheetViewModelModule()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Sheet = ReactModule.createElement(CommentsSheetViewModule, UseCommentsSheetViewModelModuleResult),
		TabBarVisibilityController = if FFlagMomentsTabsBehindModalScrimModule or not UseCommentsSheetViewModelModuleResult.isOpen then nil else ReactModule.createElement(TabBarVisibilityController)
	})
end)