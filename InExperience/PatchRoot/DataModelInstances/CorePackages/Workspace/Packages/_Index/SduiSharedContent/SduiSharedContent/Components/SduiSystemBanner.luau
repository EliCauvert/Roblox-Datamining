local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ViewportVisibilityImpressionsDetector = require(Parent.Impressions).ViewportVisibilityImpressionsDetector
local SystemBanner = require(Parent.Foundation).SystemBanner
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner

return ReactModule.memo(function(p1) --[[ Line: 40 | Named "SduiSystemBanner" ]]
	-- upvalues: FFlagAppChatConversationTrustedFriendUpsellBanner (copy), ReactModule (copy), SystemBanner (copy), ViewportVisibilityImpressionsDetector (copy)
	local UseRefResult = nil
	local HasOnView: boolean? = nil
	
	if FFlagAppChatConversationTrustedFriendUpsellBanner then
		UseRefResult = ReactModule.useRef(nil)
		HasOnView = p1.onView ~= nil
	end
	local Element = ReactModule.createElement(SystemBanner, {
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
		ref = if HasOnView then UseRefResult else nil
	})
	
	return if HasOnView then ReactModule.createElement(ReactModule.Fragment, nil, {
		Banner = Element,
		OnViewDetector = ReactModule.createElement(ViewportVisibilityImpressionsDetector, { targetRef = UseRefResult, onImpression = p1.onView })
	}) else Element
end)