local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local messageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local messageDraftFromExpressionContentModule = require(script.Parent.messageDraftFromExpressionContent)
local _ = require(chatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local moderationTimeoutModule = require(script.Parent.ModerationTimeout)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), messageDraftModelModule (ref), messageDraftFromExpressionContentModule (ref), moderationTimeoutModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local moderationTimeout = p1.moderationTimeout
	local transparency = p1.transparency
	local var3 = moderationTimeout ~= nil and moderationTimeout.status ~= "none"
	local var4 = moderationTimeout ~= nil and moderationTimeout.status == "active"
	local var5 = p1.chatAvailability.canSend and not var3
	local sendMessageDraft = p1.messageDelivery.sendMessageDraft
	local onFocusChanged = p1.onFocusChanged
	local expressionTray = p1.expressionTray
	local destinationSubtitle = p1.destinationSubtitle
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: sendMessageDraft (ref), messageDraftModelModule (copy)
		sendMessageDraft(messageDraftModelModule.fromPlainText(p2))
	end, { sendMessageDraft })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: messageDraftFromExpressionContentModule (copy), sendMessageDraft (ref)
		local var8 = messageDraftFromExpressionContentModule(p2)
		
		if var8 == nil then
			return false
		end
		sendMessageDraft(var8)
		
		return true
	end, { sendMessageDraft })
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
		-- upvalues: var3 (ref), reactModule (copy), moderationTimeoutModule (copy), moderationTimeout (ref), transparency (ref)
		return if var3 then reactModule.createElement(moderationTimeoutModule, { state = moderationTimeout, transparency = transparency }) else nil
	end, { var3, moderationTimeout, transparency })
	
	return {
		composerLayout = true,
		themedColors = true,
		onSend = var6,
		canLocalUserChat = var5,
		disabledOverlay = var14 or (if var5 then nil else p1.chatAvailability.upsell),
		pillStrokeStyle = if var4 then var1.Color.System.Alert else nil,
		expressionTray = reactModule.useMemo(function()
			-- upvalues: var13 (ref), var7 (ref), var5 (ref), var10 (ref), var11 (ref), var12 (ref)
			return if var13 then {
				sendExpression = var7,
				canLocalUserChat = var5,
				canSend = var5,
				fetchExpressionItems = var10,
				onKeyboardActivated = var11,
				cooldownDurationSeconds = var12
			} else nil
		end, {
			var13, var7, var5, var10, var11, var12
		}),
		sideChipText = if destinationSubtitle then destinationSubtitle.text else nil,
		showSideChip = destinationSubtitle ~= nil,
		onSideChipActivated = if destinationSubtitle then destinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		textBoxRef = p1.textBoxRef,
		selectionImageObject = var2,
		fontFace = p1.fontFace,
		transparencyValue = transparency,
		onFocusGained = if onFocusChanged then var8 else nil,
		onFocusLost = if onFocusChanged then var9 else nil
	}
end