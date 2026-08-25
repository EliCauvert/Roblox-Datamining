local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local view = require(parent.Foundation).View

return reactModule.memo(function(p0)
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		onAbsoluteSizeChanged = p0.onFrameResized
	}, {
		SocialSduiComponentWrapper = reactModule.createElement(getSduiComponentWrapper(p0.sduiComponentConfig), {
			debugName = p0.debugName,
			componentConfig = p0.sduiComponentConfig,
			sduiContext = p0.sduiContext,
			extraLocalProps = {
				index = p0.layoutOrder,
				pageSideMargin = p0.pageSideMargin,
				verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
				scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
				testId = p0.testId
			},
			localAnalyticsData = p0.analyticsContext
		})
	})
end)