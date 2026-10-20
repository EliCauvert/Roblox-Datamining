local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(Parent.AppCommonLib)
local AvatarExperienceScreenSizeImpressionsDetector = require(Parent.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), AvatarExperienceScreenSizeImpressionsDetector (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.panelRef,
		[ReactModule.Change.AbsoluteSize] = Frame.onAbsoluteSizeChanged
	}, {
		Panel = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, Frame.children),
		WidgetImpressionsDetector = ReactModule.createElement(AvatarExperienceScreenSizeImpressionsDetector, {
			parentRef = Frame.panelRef,
			onRequestImpressionsSignal = Frame.onRequestImpressionsSignal,
			pageFilter = Frame.pageFilter,
			onImpressionsDetected = Frame.onImpressionsDetected,
			collectObjectsFunc = Frame.collectObjectsFunc
		})
	})
end