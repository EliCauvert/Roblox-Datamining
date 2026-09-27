local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local viewportVisibilityImpressionsDetector = require(parent.Impressions).ViewportVisibilityImpressionsDetector
local view = require(parent.Foundation).View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), viewportVisibilityImpressionsDetector (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = p1.onView ~= nil
	local var3 = reactModule.createElement(view, {
		tag = p1.tag or "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ref = if var2 then var1 else nil
	}, { Content = p1.contentComponent })
	
	return if var2 then reactModule.createElement(reactModule.Fragment, nil, {
		Content = var3,
		Detector = reactModule.createElement(viewportVisibilityImpressionsDetector, {
			targetRef = var1,
			onImpression = p1.onView,
			threshold = math.clamp(p1.visibilityThreshold or 0.5, 0.01, 1)
		})
	}) else var3
end)