local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local view = require(parent.Foundation).View

return reactModule.memo(function(p1)
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onFrameResized
	}, {
		SocialSduiComponentWrapper = reactModule.createElement(getSduiComponentWrapper(p1.sduiComponentConfig), {
			debugName = p1.debugName,
			componentConfig = p1.sduiComponentConfig,
			sduiContext = p1.sduiContext,
			extraLocalProps = {
				index = p1.layoutOrder,
				pageSideMargin = p1.pageSideMargin,
				verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				testId = p1.testId
			},
			localAnalyticsData = p1.analyticsContext
		})
	})
end)