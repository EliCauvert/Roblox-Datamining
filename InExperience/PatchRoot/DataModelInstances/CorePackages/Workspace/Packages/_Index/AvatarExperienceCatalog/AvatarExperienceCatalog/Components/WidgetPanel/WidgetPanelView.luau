local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(parent.AppCommonLib)
local avatarExperienceScreenSizeImpressionsDetector = require(parent.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector

return function(p0) --[[ line: 36 | named "WidgetPanelView" ]]
	-- upvalues: reactModule (ref), view (ref), avatarExperienceScreenSizeImpressionsDetector (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder,
		ref = p0.panelRef,
		[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged
	}, {
		Panel = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, p0.children),
		WidgetImpressionsDetector = reactModule.createElement(avatarExperienceScreenSizeImpressionsDetector, {
			parentRef = p0.panelRef,
			onRequestImpressionsSignal = p0.onRequestImpressionsSignal,
			pageFilter = p0.pageFilter,
			onImpressionsDetected = p0.onImpressionsDetected,
			collectObjectsFunc = p0.collectObjectsFunc
		})
	})
end