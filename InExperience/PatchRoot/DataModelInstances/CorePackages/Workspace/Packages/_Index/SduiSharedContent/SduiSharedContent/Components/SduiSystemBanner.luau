local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local viewportVisibilityImpressionsDetector = require(parent.Impressions).ViewportVisibilityImpressionsDetector
local systemBanner = require(parent.Foundation).SystemBanner
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner

return reactModule.memo(function(p1)
	-- upvalues: fFlagAppChatConversationTrustedFriendUpsellBanner (ref), reactModule (ref), systemBanner (ref), viewportVisibilityImpressionsDetector (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagAppChatConversationTrustedFriendUpsellBanner then
		var1 = reactModule.useRef(nil)
		var2 = p1.onView ~= nil
	end
	local var3 = reactModule.createElement(systemBanner, {
		severity = p1.severity,
		variant = p1.variant,
		title = p1.title,
		description = p1.description,
		actions = p1.actions,
		onClose = p1.onClose,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId,
		ref = if var2 then var1 else nil
	})
	
	return if var2 then reactModule.createElement(reactModule.Fragment, nil, {
		Banner = var3,
		OnViewDetector = reactModule.createElement(viewportVisibilityImpressionsDetector, { targetRef = var1, onImpression = p1.onView })
	}) else var3
end)