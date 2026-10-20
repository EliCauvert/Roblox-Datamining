local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.PaginationDirection)
local _ = require(Foundation.Enums.PaginationSize)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local NavControlsModule = require(script.Parent.NavControls)
local _ = require(script.Parent.Parent.usePaginationSelectionChain)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), NavControlsModule (copy)
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, { tag = "row align-y-center gap-small auto-xy", ref = Ref }), {
		LeftNav = ReactModule.createElement(NavControlsModule, {
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
		RightNav = ReactModule.createElement(NavControlsModule, {
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