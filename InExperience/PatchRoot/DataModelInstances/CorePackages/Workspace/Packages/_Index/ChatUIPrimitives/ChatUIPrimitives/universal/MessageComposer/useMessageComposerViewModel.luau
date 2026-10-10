local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local messageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local _ = require(chatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local moderationTimeoutModule = require(script.Parent.ModerationTimeout)

local function _(p1)
	return if p1.altText == nil then if p1.kind == "preset" or p1.kind == "plain-text" then p1.text or "" else "" else p1.altText
end

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), messageDraftModelModule (ref), moderationTimeoutModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local moderationTimeout = p1.moderationTimeout
	local transparency = p1.transparency
	local var2 = moderationTimeout ~= nil and moderationTimeout.status ~= "none"
	local var3 = moderationTimeout ~= nil and moderationTimeout.status == "active"
	local var4 = p1.chatAvailability.canSend and not var2
	local sendMessageDraft = p1.messageDelivery.sendMessageDraft
	local onMessageDeliveryReceipt = p1.messageDelivery.onMessageDeliveryReceipt
	local onFocusChanged = p1.onFocusChanged
	local expressionTray = p1.expressionTray
	local destinationSubtitle = p1.destinationSubtitle
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: sendMessageDraft (ref), messageDraftModelModule (copy), onMessageDeliveryReceipt (ref)
		local var6 = sendMessageDraft(messageDraftModelModule.fromPlainText(p2))
		onMessageDeliveryReceipt(var6)
		
		return var6
	end, { sendMessageDraft, onMessageDeliveryReceipt })
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5(p2)
	end, { var5 })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		return var5(if p2.altText ~= nil then if p2.kind == "preset" or p2.kind == "plain-text" then p2.text or "" else "" else p2.altText).accepted
	end, { var5 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: onFocusChanged (ref)
		if onFocusChanged then
			onFocusChanged(true)
		end
	end, { onFocusChanged })
	local var9 = reactModule.useCallback(function()
		-- upvalues: onFocusChanged (ref)
		if onFocusChanged then
			onFocusChanged(false)
		end
	end, { onFocusChanged })
	local var10 = if expressionTray then expressionTray.fetchExpressionItems else nil
	local var11 = if expressionTray then expressionTray.onKeyboardActivated else nil
	local var12 = if expressionTray then expressionTray.cooldownDurationSeconds else nil
	local var13 = expressionTray ~= nil
	local var14 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy), moderationTimeoutModule (copy), moderationTimeout (ref), transparency (ref)
		return if var2 then reactModule.createElement(moderationTimeoutModule, { state = moderationTimeout, transparency = transparency }) else nil
	end, { var2, moderationTimeout, transparency })
	
	return {
		composerLayout = true,
		themedColors = true,
		onSend = var6,
		canLocalUserChat = var4,
		disabledOverlay = var14 or (if var4 then nil else p1.chatAvailability.upsell),
		pillStrokeStyle = if var3 then var1.Color.System.Alert else nil,
		expressionTray = reactModule.useMemo(function()
			-- upvalues: var13 (ref), var7 (ref), var4 (ref), var10 (ref), var11 (ref), var12 (ref)
			return if var13 then {
				sendExpression = var7,
				canLocalUserChat = var4,
				canSend = var4,
				fetchExpressionItems = var10,
				onKeyboardActivated = var11,
				cooldownDurationSeconds = var12
			} else nil
		end, {
			var13, var7, var4, var10, var11, var12
		}),
		sideChipText = if destinationSubtitle then destinationSubtitle.text else nil,
		showSideChip = destinationSubtitle ~= nil,
		onSideChipActivated = if destinationSubtitle then destinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		textBoxRef = p1.textBoxRef,
		fontFace = p1.fontFace,
		transparencyValue = transparency,
		onFocusGained = if onFocusChanged then var8 else nil,
		onFocusLost = if onFocusChanged then var9 else nil
	}
end