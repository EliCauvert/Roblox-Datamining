local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.PaginationDirection)
local _ = require(foundation.Enums.PaginationSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local navControlsModule = require(script.Parent.NavControls)
local _ = require(script.Parent.Parent.usePaginationSelectionChain)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 36 | named "NavPaginationLayout" ]]
	-- upvalues: reactModule (ref), viewModule (ref), withCommonPropsModule (ref), navControlsModule (ref)
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, { tag = "row align-y-center gap-small auto-xy", ref = p1 }), {
		LeftNav = reactModule.createElement(navControlsModule, {
			side = "start",
			layoutOrder = 1,
			size = p0.size,
			isFirstDisabled = p0.isFirstDisabled,
			isBackDisabled = p0.isBackDisabled,
			isForwardDisabled = p0.isForwardDisabled,
			isLastDisabled = p0.isLastDisabled,
			onDirectionActivated = p0.onDirectionActivated,
			hasFirstLastButtons = p0.hasFirstLastButtons,
			testId = p0.testId,
			selection = p0.selection
		}),
		PageContent = p0.pageContent,
		RightNav = reactModule.createElement(navControlsModule, {
			side = "end",
			size = p0.size,
			layoutOrder = if p0.pageContent then 3 else 2,
			isFirstDisabled = p0.isFirstDisabled,
			isBackDisabled = p0.isBackDisabled,
			isForwardDisabled = p0.isForwardDisabled,
			isLastDisabled = p0.isLastDisabled,
			onDirectionActivated = p0.onDirectionActivated,
			hasFirstLastButtons = p0.hasFirstLastButtons,
			testId = p0.testId,
			selection = p0.selection
		})
	})
end))