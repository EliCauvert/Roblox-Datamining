local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local commentsSheetViewModule = require(script.Parent.CommentsSheetView)
local useCommentsSheetViewModelModule = require(script.Parent.useCommentsSheetViewModel)
local useHideTabBarWhileOpenModule = require(moments.ExperienceDetailsSheet.Sheet.useHideTabBarWhileOpen)

local function TabBarVisibilityController()
	-- upvalues: useHideTabBarWhileOpenModule (ref)
	useHideTabBarWhileOpenModule(true)
	
	return nil
end

return reactModule.memo(function()
	-- upvalues: useCommentsSheetViewModelModule (ref), reactModule (ref), commentsSheetViewModule (ref), TabBarVisibilityController (ref)
	local var1 = useCommentsSheetViewModelModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(commentsSheetViewModule, var1),
		TabBarVisibilityController = if var1.isOpen then reactModule.createElement(TabBarVisibilityController) else nil
	})
end)