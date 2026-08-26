local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.PaginationDirection)
local _ = require(foundation.Enums.PaginationSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local navControlsModule = require(script.Parent.NavControls)
local _ = require(script.Parent.Parent.usePaginationSelectionChain)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), viewModule (ref), withCommonPropsModule (ref), navControlsModule (ref)
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { tag = "row align-y-center gap-small auto-xy", ref = p2 }), {
		LeftNav = reactModule.createElement(navControlsModule, {
			side = "start",
			LayoutOrder = 1,
			size = p1.size,
			isFirstDisabled = p1.isFirstDisabled,
			isBackDisabled = p1.isBackDisabled,
			isForwardDisabled = p1.isForwardDisabled,
			isLastDisabled = p1.isLastDisabled,
			onDirectionActivated = p1.onDirectionActivated,
			hasFirstLastButtons = p1.hasFirstLastButtons,
			testId = p1.testId,
			selection = p1.selection
		}),
		PageContent = p1.pageContent,
		RightNav = reactModule.createElement(navControlsModule, {
			side = "end",
			size = p1.size,
			LayoutOrder = if p1.pageContent then 3 else 2,
			isFirstDisabled = p1.isFirstDisabled,
			isBackDisabled = p1.isBackDisabled,
			isForwardDisabled = p1.isForwardDisabled,
			isLastDisabled = p1.isLastDisabled,
			onDirectionActivated = p1.onDirectionActivated,
			hasFirstLastButtons = p1.hasFirstLastButtons,
			testId = p1.testId,
			selection = p1.selection
		})
	})
end))