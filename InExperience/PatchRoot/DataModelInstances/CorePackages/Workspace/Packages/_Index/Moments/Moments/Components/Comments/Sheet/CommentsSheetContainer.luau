local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local commentsSheetViewModule = require(script.Parent.CommentsSheetView)
local useCommentsSheetViewModelModule = require(script.Parent.useCommentsSheetViewModel)
local useHideTabBarWhileOpenModule = require(moments.ExperienceDetailsSheet.Sheet.useHideTabBarWhileOpen)
local fFlagMomentsTabsBehindModalScrimModule = require(moments.Flags.FFlagMomentsTabsBehindModalScrim)

local function TabBarVisibilityController()
	-- upvalues: useHideTabBarWhileOpenModule (ref)
	useHideTabBarWhileOpenModule(true)
	
	return nil
end

return reactModule.memo(function()
	-- upvalues: useCommentsSheetViewModelModule (ref), reactModule (ref), commentsSheetViewModule (ref), fFlagMomentsTabsBehindModalScrimModule (ref), TabBarVisibilityController (ref)
	local var1 = useCommentsSheetViewModelModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(commentsSheetViewModule, var1),
		TabBarVisibilityController = if fFlagMomentsTabsBehindModalScrimModule or not var1.isOpen then nil else reactModule.createElement(TabBarVisibilityController)
	})
end)