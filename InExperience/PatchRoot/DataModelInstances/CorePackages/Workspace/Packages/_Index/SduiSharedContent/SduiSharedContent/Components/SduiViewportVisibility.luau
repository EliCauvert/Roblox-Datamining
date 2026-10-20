local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ViewportVisibilityImpressionsDetector = require(Parent.Impressions).ViewportVisibilityImpressionsDetector
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), ViewportVisibilityImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local HasOnView = p1.onView ~= nil
	local ClampedValue = math.clamp(p1.visibilityThreshold or 0.5, 0.01, 1)
	local Element = ReactModule.createElement(View, {
		tag = p1.tag or "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ref = if HasOnView then UseRefResult else nil
	}, { Content = p1.contentComponent })
	
	return if HasOnView then ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = Element,
		Detector = ReactModule.createElement(ViewportVisibilityImpressionsDetector, {
			targetRef = UseRefResult,
			onImpression = p1.onView,
			threshold = ClampedValue
		})
	}) else Element
end)