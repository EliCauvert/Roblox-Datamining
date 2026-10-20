local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local MessageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local MessageDraftFromExpressionContentModule = require(script.Parent.messageDraftFromExpressionContent)
local _ = require(ChatUIPrimitives.universal.Autocomplete.AutocompleteTypes)
local _ = require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local ModerationTimeoutModule = require(script.Parent.ModerationTimeout)

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), MessageDraftModelModule (copy), MessageDraftFromExpressionContentModule (copy), ModerationTimeoutModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ModerationTimeout = p1.moderationTimeout
	local Transparency = p1.transparency
	local IsNotNone: boolean = ModerationTimeout ~= nil and ModerationTimeout.status ~= "none"
	local IsActive: boolean = ModerationTimeout ~= nil and ModerationTimeout.status == "active"
	local NoIsNotNone: boolean = p1.chatAvailability.canSend and not IsNotNone
	local SendMessageDraftFunction = p1.messageDelivery.sendMessageDraft
	local OnFocusChangedFunction = p1.onFocusChanged
	local ExpressionTray = p1.expressionTray
	local DestinationSubtitle = p1.destinationSubtitle
	local UseResult = ReactModule.useCallback(function(p2): boolean
		-- upvalues: MessageDraftFromExpressionContentModule (upval), SendMessageDraftFunction (copy)
		local MessageDraftFromExpressionContentModuleResult = MessageDraftFromExpressionContentModule(p2)
		
		if MessageDraftFromExpressionContentModuleResult == nil then
			return false
		else
			SendMessageDraftFunction(MessageDraftFromExpressionContentModuleResult)
			
			return true
		end
	end, { SendMessageDraftFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(true)
		end
	end, { OnFocusChangedFunction })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(false)
		end
	end, { OnFocusChangedFunction })
	local FetchExpressionItems = if ExpressionTray then ExpressionTray.fetchExpressionItems else nil
	local OnKeyboardActivated = if ExpressionTray then ExpressionTray.onKeyboardActivated else nil
	local CooldownDurationSeconds = if ExpressionTray then ExpressionTray.cooldownDurationSeconds else nil
	local HasExpressionTray = ExpressionTray ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsNotNone (copy), ReactModule (upval), ModerationTimeoutModule (upval), ModerationTimeout (copy), Transparency (copy)
		return if IsNotNone then ReactModule.createElement(ModerationTimeoutModule, { state = ModerationTimeout, transparency = Transparency }) else nil
	end, { IsNotNone, ModerationTimeout, Transparency })
	
	return {
		composerLayout = true,
		themedColors = true,
		onSend = ReactModule.useCallback(function(p2)
			-- upvalues: SendMessageDraftFunction (copy), MessageDraftModelModule (upval)
			SendMessageDraftFunction(MessageDraftModelModule.fromPlainText(p2))
		end, { SendMessageDraftFunction }),
		canLocalUserChat = NoIsNotNone,
		disabledOverlay = if UseMemoResult then UseMemoResult elseif NoIsNotNone then nil else p1.chatAvailability.upsell,
		pillStrokeStyle = if IsActive then UseTokensResult.Color.System.Alert else nil,
		expressionTray = ReactModule.useMemo(function()
			-- upvalues: HasExpressionTray (copy), UseResult (copy), NoIsNotNone (copy), FetchExpressionItems (copy), OnKeyboardActivated (copy), CooldownDurationSeconds (copy)
			return if HasExpressionTray then {
				sendExpression = UseResult,
				canLocalUserChat = NoIsNotNone,
				canSend = NoIsNotNone,
				fetchExpressionItems = FetchExpressionItems,
				onKeyboardActivated = OnKeyboardActivated,
				cooldownDurationSeconds = CooldownDurationSeconds
			} else nil
		end, {
			HasExpressionTray, UseResult, NoIsNotNone, FetchExpressionItems,
			OnKeyboardActivated, CooldownDurationSeconds
		}),
		sideChipText = if DestinationSubtitle then DestinationSubtitle.text else nil,
		showSideChip = DestinationSubtitle ~= nil,
		onSideChipActivated = if DestinationSubtitle then DestinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		autocompleteOptions = p1.autocomplete,
		textBoxRef = p1.textBoxRef,
		selectionImageObject = FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect),
		fontFace = p1.fontFace,
		transparencyValue = Transparency,
		onFocusGained = if OnFocusChangedFunction then UseResult1 else nil,
		onFocusLost = if OnFocusChangedFunction then UseResult2 else nil
	}
end