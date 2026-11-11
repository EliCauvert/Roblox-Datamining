local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1)
	-- upvalues: GetSduiComponentWrapperFunction (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onFrameResized
	}, {
		SocialSduiComponentWrapper = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.sduiComponentConfig), {
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