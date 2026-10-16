local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local messageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local _ = require(chatUIPrimitives.Components.ChatInputBar.ChatInputBarView)

local function _(p1)
	return if p1.altText == nil then if p1.kind == "preset" or p1.kind == "plain-text" then p1.text or "" else "" else p1.altText
end

return function(p1)
	-- upvalues: reactModule (ref), messageDraftModelModule (ref)
	local canSend = p1.chatAvailability.canSend
	local sendMessageDraft = p1.messageDelivery.sendMessageDraft
	local onMessageDeliveryReceipt = p1.messageDelivery.onMessageDeliveryReceipt
	local onFocusChanged = p1.onFocusChanged
	local expressionTray = p1.expressionTray
	local destinationSubtitle = p1.destinationSubtitle
	local var1 = reactModule.useCallback(function(p2)
		-- upvalues: sendMessageDraft (ref), messageDraftModelModule (copy), onMessageDeliveryReceipt (ref)
		local var2 = sendMessageDraft(messageDraftModelModule.fromPlainText(p2))
		onMessageDeliveryReceipt(var2)
		
		return var2
	end, { sendMessageDraft, onMessageDeliveryReceipt })
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1(p2)
	end, { var1 })
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		return var1(if p2.altText ~= nil then if p2.kind == "preset" or p2.kind == "plain-text" then p2.text or "" else "" else p2.altText).accepted
	end, { var1 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: onFocusChanged (ref)
		if onFocusChanged then
			onFocusChanged(true)
		end
	end, { onFocusChanged })
	local var5 = reactModule.useCallback(function()
		-- upvalues: onFocusChanged (ref)
		if onFocusChanged then
			onFocusChanged(false)
		end
	end, { onFocusChanged })
	local var6 = if expressionTray then expressionTray.fetchExpressionItems else nil
	local var7 = if expressionTray then expressionTray.onKeyboardActivated else nil
	local var8 = if expressionTray then expressionTray.cooldownDurationSeconds else nil
	local var9 = expressionTray ~= nil
	
	return {
		composerLayout = true,
		themedColors = true,
		onSend = var2,
		canLocalUserChat = canSend,
		disabledOverlay = if canSend then nil else p1.chatAvailability.upsell,
		expressionTray = reactModule.useMemo(function()
			-- upvalues: var9 (ref), var3 (ref), canSend (ref), var6 (ref), var7 (ref), var8 (ref)
			return if var9 then {
				sendExpression = var3,
				canLocalUserChat = canSend,
				canSend = canSend,
				fetchExpressionItems = var6,
				onKeyboardActivated = var7,
				cooldownDurationSeconds = var8
			} else nil
		end, {
			var9, var3, canSend, var6, var7, var8
		}),
		sideChipText = if destinationSubtitle then destinationSubtitle.text else nil,
		showSideChip = destinationSubtitle ~= nil,
		onSideChipActivated = if destinationSubtitle then destinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		textBoxRef = p1.textBoxRef,
		fontFace = p1.fontFace,
		transparencyValue = p1.transparency,
		onFocusGained = if onFocusChanged then var4 else nil,
		onFocusLost = if onFocusChanged then var5 else nil
	}
end