local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(parent.AppCommonLib)
local avatarExperienceScreenSizeImpressionsDetector = require(parent.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector

return function(p1)
	-- upvalues: reactModule (ref), view (ref), avatarExperienceScreenSizeImpressionsDetector (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder,
		ref = p1.panelRef,
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
	}, {
		Panel = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, p1.children),
		WidgetImpressionsDetector = reactModule.createElement(avatarExperienceScreenSizeImpressionsDetector, {
			parentRef = p1.panelRef,
			onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
			pageFilter = p1.pageFilter,
			onImpressionsDetected = p1.onImpressionsDetected,
			collectObjectsFunc = p1.collectObjectsFunc
		})
	})
end