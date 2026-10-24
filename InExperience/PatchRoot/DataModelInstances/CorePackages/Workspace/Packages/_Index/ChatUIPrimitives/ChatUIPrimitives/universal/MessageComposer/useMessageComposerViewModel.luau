local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local MessageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local _ = require(ChatUIPrimitives.createExpressionCatalogResource)
local MessageDraftFromExpressionContentModule = require(script.Parent.Parent.messageDraftFromExpressionContent)
local _ = require(ChatUIPrimitives.universal.Autocomplete.AutocompleteTypes)
local _ = require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local ModerationTimeoutModule = require(script.Parent.ModerationTimeout)

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), MessageDraftModelModule (copy), MessageDraftFromExpressionContentModule (copy), ModerationTimeoutModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCursorResult = FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect)
	local ModerationTimeout = p1.moderationTimeout
	local Transparency = p1.transparency
	local IsNotNone: boolean = ModerationTimeout ~= nil and ModerationTimeout.status ~= "none"
	local IsActive: boolean = ModerationTimeout ~= nil and ModerationTimeout.status == "active"
	local NoIsNotNone: boolean = p1.chatAvailability.canSend and not IsNotNone
	local SendMessageDraftFunction = p1.messageDelivery.sendMessageDraft
	local OnFocusChangedFunction = p1.onFocusChanged
	local ExpressionTray = p1.expressionTray
	local DestinationSubtitle = p1.destinationSubtitle
	local NoIsNotNone1: boolean = (if ExpressionTray and ExpressionTray.canSend ~= nil then ExpressionTray.canSend else p1.chatAvailability.canSend) and not IsNotNone
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: SendMessageDraftFunction (copy), MessageDraftModelModule (upval)
		SendMessageDraftFunction(MessageDraftModelModule.fromPlainText(p2))
	end, { SendMessageDraftFunction })
	local UseResult1 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: MessageDraftFromExpressionContentModule (upval), SendMessageDraftFunction (copy)
		local MessageDraftFromExpressionContentModuleResult = MessageDraftFromExpressionContentModule(p2)
		
		if MessageDraftFromExpressionContentModuleResult == nil then
			return false
		else
			SendMessageDraftFunction(MessageDraftFromExpressionContentModuleResult)
			
			return true
		end
	end, { SendMessageDraftFunction })
	local UseRefResult = ReactModule.useRef(SendMessageDraftFunction)
	UseRefResult.current = SendMessageDraftFunction
	local Autocomplete = p1.autocomplete
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Autocomplete (copy), UseRefResult (copy)
		return if Autocomplete == nil then nil else {
			sources = Autocomplete.sources,
			onAction = function(p2): boolean
				-- upvalues: UseRefResult (upval)
				if p2.kind == "sendDraft" then
					UseRefResult.current(p2.draft)
					
					return true
				else
					return false
				end
			end
		}
	end, { Autocomplete })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(true)
		end
	end, { OnFocusChangedFunction })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(false)
		end
	end, { OnFocusChangedFunction })
	local CatalogResource = if ExpressionTray then ExpressionTray.catalogResource else nil
	local OnKeyboardActivated = if ExpressionTray then ExpressionTray.onKeyboardActivated else nil
	local CooldownDurationSeconds = if ExpressionTray then ExpressionTray.cooldownDurationSeconds else nil
	local CooldownScope = if ExpressionTray then ExpressionTray.cooldownScope else nil
	local HasExpressionTray = ExpressionTray ~= nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: HasExpressionTray (copy), UseResult1 (copy), NoIsNotNone (copy), NoIsNotNone1 (copy), CatalogResource (copy), OnKeyboardActivated (copy), CooldownDurationSeconds (copy), CooldownScope (copy)
		return if HasExpressionTray then {
			sendExpression = UseResult1,
			canLocalUserChat = NoIsNotNone,
			canSend = NoIsNotNone1,
			catalogResource = CatalogResource,
			onKeyboardActivated = OnKeyboardActivated,
			cooldownDurationSeconds = CooldownDurationSeconds,
			cooldownScope = CooldownScope
		} else nil
	end, {
		HasExpressionTray, UseResult1, NoIsNotNone, NoIsNotNone1, CatalogResource,
		OnKeyboardActivated, CooldownDurationSeconds, CooldownScope
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: IsNotNone (copy), ReactModule (upval), ModerationTimeoutModule (upval), ModerationTimeout (copy), Transparency (copy)
		return if IsNotNone then ReactModule.createElement(ModerationTimeoutModule, { state = ModerationTimeout, transparency = Transparency }) else nil
	end, { IsNotNone, ModerationTimeout, Transparency })
	local TextBoxRef = p1.textBoxRef
	local NavigationTargetRef = p1.navigationTargetRef
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = if TextBoxRef == nil and NavigationTargetRef ~= nil then UseRefResult1 else TextBoxRef
	ReactModule.useLayoutEffect(function()
		-- upvalues: NoIsNotNone (copy), NavigationTargetRef (copy), UseRefResult2 (ref)
		if not NoIsNotNone or NavigationTargetRef == nil or UseRefResult2 == nil then return end
		local Current = UseRefResult2.current
		
		if Current == nil then return end
		NavigationTargetRef.current = Current
		
		return function()
			-- upvalues: NavigationTargetRef (upval), Current (copy)
			if NavigationTargetRef.current == Current then
				NavigationTargetRef.current = nil
			end
		end
	end, { NavigationTargetRef, UseRefResult2, NoIsNotNone })
	
	return {
		composerLayout = true,
		themedColors = true,
		onSend = UseResult,
		canLocalUserChat = NoIsNotNone,
		disabledOverlay = if UseMemoResult2 then UseMemoResult2 elseif NoIsNotNone then nil else p1.chatAvailability.upsell,
		pillStrokeStyle = if IsActive then UseTokensResult.Color.System.Alert else nil,
		expressionTray = UseMemoResult1,
		sideChipText = if DestinationSubtitle then DestinationSubtitle.text else nil,
		showSideChip = DestinationSubtitle ~= nil,
		onSideChipActivated = if DestinationSubtitle then DestinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		autocompleteOptions = UseMemoResult,
		textBoxRef = UseRefResult2,
		selectionImageObject = UseCursorResult,
		fontFace = p1.fontFace,
		transparencyValue = Transparency,
		onFocusGained = if OnFocusChangedFunction then UseResult2 else nil,
		onFocusLost = if OnFocusChangedFunction then UseResult3 else nil
	}
end