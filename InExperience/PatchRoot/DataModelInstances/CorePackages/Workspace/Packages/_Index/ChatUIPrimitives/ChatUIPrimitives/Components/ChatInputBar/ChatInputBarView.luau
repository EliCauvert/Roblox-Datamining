local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FFlagChatInputBarGuardInvalidUtf8 = require(Parent.SharedFlags).FFlagChatInputBarGuardInvalidUtf8
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetTextLengthIfValidUtf8Module = require(script.Parent.getTextLengthIfValidUtf8)
local ChannelChipModule = require(script.Parent.ChannelChip)
local _ = require(ChatUIPrimitives.universal.Autocomplete.AutocompleteTypes)
local ChatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local UseChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)
local UseAutocompleteSourcesModule = require(ChatUIPrimitives.universal.Autocomplete.useAutocompleteSources)
local ExpressionTrayViewModule = require(ChatUIPrimitives.Components.ExpressionTray.ExpressionTrayView)
local UseExpressionTrayModule = require(ChatUIPrimitives.Hooks.useExpressionTray)

local function _(p1: number, p2): number
	return p1 + p2 * (1 - p1)
end

local function deriveTransparency(p1: number, TransparencyValue)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p2): number
		-- upvalues: p1 (copy)
		return p1 + p2 * (1 - p1)
	end) else p1 + TransparencyValue * (1 - p1)
end

local function deriveBackgroundStyle(SurfaceColor, p1: number, TransparencyValue)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p2)
		-- upvalues: SurfaceColor (copy), p1 (copy)
		return { Color3 = SurfaceColor, Transparency = p1 + p2 * (1 - p1) }
	end) else {
		Color3 = SurfaceColor,
		Transparency = p1 + TransparencyValue * (1 - p1)
	}
end

local _ = function(Tbl, Variant)
	local Copy = table.clone(Tbl)
	Copy.variant = Variant
	
	return Copy
end

local function renderDropdown(p1)
	-- upvalues: ReactModule (copy), ChatAutocompleteDropdownModule (copy)
	if p1.props.autocomplete == nil and p1.props.autocompleteOptions == nil then
		return nil
	else
		local Autocomplete = p1.autocomplete
		
		return ReactModule.createElement(ChatAutocompleteDropdownModule, {
			isOpen = Autocomplete.isOpen,
			results = Autocomplete.results,
			selectedIndex = Autocomplete.selectedIndex,
			keyboardIndex = Autocomplete.keyboardIndex,
			renderEntry = Autocomplete.renderEntry,
			anchorRef = p1.barContainerRef,
			onHover = Autocomplete.setSelectedIndex,
			onSelect = p1.onCommitSelection,
			onDismiss = Autocomplete.dismiss
		})
	end
end

local function renderSideChip(p1)
	-- upvalues: ReactModule (copy), ChannelChipModule (copy)
	return ReactModule.createElement(ChannelChipModule, {
		transparency = p1.transparencyValue,
		sideChipText = p1.props.sideChipText,
		showSideChip = p1.props.showSideChip,
		onSideChipActivated = p1.props.onSideChipActivated,
		onAbsoluteSizeChanged = p1.onChannelChipAbsoluteSizeChanged
	})
end

local function renderSendButton(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.IconButton, {
		isCircular = true,
		icon = FoundationModule.Enums.IconName.ArrowMediumUp,
		variant = if p1.isSendDisabled then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
		size = FoundationModule.Enums.InputSize.Small,
		isDisabled = p1.isSendDisabled,
		onActivated = p1.onSendActivated
	})
end

local function renderFallbackDisabledOverlay(p1)
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), ReactModule (copy), FoundationModule (copy)
	return if FFlagExpChatEnableFriendsTab or p1.canChat or not p1.props.disabledOverlay then nil else ReactModule.createElement(FoundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p1.props.disabledOverlay })
end

local function renderLegacy(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), renderDropdown (copy), deriveBackgroundStyle (copy), ReactIsModule (copy), renderSideChip (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), renderSendButton (copy), renderFallbackDisabledOverlay (copy)
	local Tokens = p1.tokens
	local Props = p1.props
	local TextSize = Props.textSize or Tokens.Typography.CaptionMedium.FontSize
	local NoHasLeadingAction = not p1.shouldReplaceDisabledContent and (not p1.hasLeadingAction or not p1.isEmpty and p1.canChat)
	local XOffset: number = if p1.showLeadingAction then 36 else 0
	local NewSendButtonContainerWidth: number = if NoHasLeadingAction then p1.sendButtonContainerWidth + 6 else 0
	local MapResult = p1.channelChipWidth:map(function(p2): UDim2
		-- upvalues: Tokens (copy)
		return UDim2.new(1, -(p2 + Tokens.Size.Size_200), 0, 0)
	end)
	local CreateElementFunction6 = ReactModule.createElement
	local View = FoundationModule.View
	local config = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = p1.barContainerRef
	}
	local config1 = {
		Dropdown = renderDropdown(p1),
		TrayOverlay = p1.trayOverlay
	}
	local CreateElementFunction5 = ReactModule.createElement
	local View1 = FoundationModule.View
	local config2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t = {}
	local CreateElementFunction4 = ReactModule.createElement
	local View2 = FoundationModule.View
	local Transparency: number = Tokens.Color.Stroke.Default.Transparency
	local TransparencyValue = p1.transparencyValue
	local config3 = {
		LayoutOrder = 2,
		cornerRadius = UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(p1.surfaceColor, 0.2, p1.transparencyValue),
		stroke = {
			Color = Tokens.Color.Stroke.Default.Color3,
			Transparency = if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p2): number
				-- upvalues: Transparency (copy)
				return Transparency + p2 * (1 - Transparency)
			end) else Transparency + TransparencyValue * (1 - Transparency)
		},
		padding = { right = UDim.new(0, 2) }
	}
	local config4 = {
		CustomDisabledContent = if p1.shouldReplaceDisabledContent then Props.disabledOverlay else nil,
		LeadingActionContainer = if p1.showLeadingAction then ReactModule.createElement(FoundationModule.View, {
			tag = "position-top-left",
			Size = UDim2.new(0, XOffset, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Action = p1.leadingAddon
		}) else nil
	}
	local TextContainer = nil
	
	if p1.shouldReplaceDisabledContent then
		TextContainer = nil
	else
		local CreateElementFunction = ReactModule.createElement
		local View3 = FoundationModule.View
		local config5 = {
			tag = "auto-y",
			Position = UDim2.fromOffset(XOffset, 0),
			Size = UDim2.new(1, -(XOffset + NewSendButtonContainerWidth), 0, 0),
			padding = {
				top = UDim.new(0, 10),
				bottom = UDim.new(0, 10),
				left = UDim.new(0, 10),
				right = UDim.new(0, 10)
			}
		}
		local config6 = { SideChip = renderSideChip(p1) }
		local DisabledLabel = nil
		
		if p1.canChat then
			DisabledLabel = nil
		else
			local CreateElementFunction1 = ReactModule.createElement
			local Text = FoundationModule.Text
			local Label = {
				tag = "position-top-right anchor-top-right auto-y text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
				Text = Props.disabledChatPlaceholderText or "",
				Size = MapResult
			}
			local TransparencyValue1: number = p1.transparencyValue
			local MapResult1 = nil
			
			if ReactIsModule.isBinding(TransparencyValue1) then
				local v1 = 0.5
				MapResult1 = TransparencyValue1:map(function(p2): number
					-- upvalues: v1 (copy)
					return v1 + p2 * (1 - v1)
				end)
			else
				MapResult1 = TransparencyValue1 * 0.5 + 0.5
			end
			Label.TextTransparency = MapResult1
			DisabledLabel = CreateElementFunction1(Text, Label)
		end
		config6.DisabledLabel = DisabledLabel
		local TextBoxContainer = nil
		
		if p1.canChat then
			local CreateElementFunction3 = ReactModule.createElement
			local View4 = FoundationModule.View
			local config7 = {
				tag = "position-top-right anchor-top-right auto-y",
				Size = MapResult
			}
			local t1 = {}
			local CreateElementFunction2 = ReactModule.createElement
			local v2 = "TextBox"
			local Label = {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = Props.maximumCharacterLimit or -1,
				Font = if Props.fontFace or FoundationFontFaceMigration then nil else Tokens.Typography.CaptionMedium.Font,
				FontFace = Props.fontFace or (if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.CaptionMedium.Font) else nil),
				PlaceholderText = Props.placeholderText or "",
				PlaceholderColor3 = p1.placeholderColor,
				Size = UDim2.fromScale(1, 0),
				Text = Props.defaultValue or "",
				TextColor3 = p1.textColor,
				TextSize = TextSize
			}
			local TransparencyValue2: number = p1.transparencyValue
			local MapResult2 = nil
			
			if ReactIsModule.isBinding(TransparencyValue2) then
				local v3 = 0
				MapResult2 = TransparencyValue2:map(function(p2): number
					-- upvalues: v3 (copy)
					return v3 + p2 * (1 - v3)
				end)
			else
				MapResult2 = TransparencyValue2 * 1 + 0
			end
			Label.TextTransparency = MapResult2
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.TextYAlignment = Enum.TextYAlignment.Top
			Label.TextEditable = Props.enableFocusedWrite ~= false
			Label.ZIndex = 2
			Label[ReactModule.Change.Text] = p1.onTextChanged
			Label[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard
			Label[ReactModule.Event.Focused] = p1.onFocused
			Label[ReactModule.Event.FocusLost] = p1.onFocusLost
			Label.ref = p1.textBoxRef
			Label.SelectionImageObject = Props.selectionImageObject
			Label.Selectable = Props.selectionImageObject ~= nil or nil
			t1.TextBox = CreateElementFunction2(v2, Label)
			TextBoxContainer = CreateElementFunction3(View4, config7, t1)
		else
			TextBoxContainer = nil
		end
		config6.TextBoxContainer = TextBoxContainer
		TextContainer = CreateElementFunction(View3, config5, config6)
	end
	config4.TextContainer = TextContainer
	config4.SendButtonContainer = if NoHasLeadingAction then ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = p1.transparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, p1.sendButtonContainerWidth + 6, 1, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = renderSendButton(p1)
	}) else nil
	config4.DisabledOverlay = renderFallbackDisabledOverlay(p1)
	t.InputGroup = CreateElementFunction4(View2, config3, config4)
	config1.Container = CreateElementFunction5(View1, config2, t)
	
	return CreateElementFunction6(View, config, config1)
end

local function renderComposer(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), renderDropdown (copy), renderSideChip (copy), ReactIsModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), renderSendButton (copy), renderFallbackDisabledOverlay (copy)
	local Tokens = p1.tokens
	local Props = p1.props
	local FontSize = Tokens.Typography.BodyMedium.FontSize
	local NoShouldReplaceDisabledContent = not p1.shouldReplaceDisabledContent
	local NewSendButtonContainerWidth = p1.sendButtonContainerWidth + 6
	local MapResult = p1.channelChipWidth:map(function(p2: number): UDim2
		-- upvalues: Tokens (copy)
		return UDim2.new(1, -(if p2 > 0 then p2 + Tokens.Size.Size_200 else 0), 0, 0)
	end)
	local CreateElementFunction = ReactModule.createElement
	local View = FoundationModule.View
	local config = { tag = "size-full-0 auto-y", ref = p1.barContainerRef }
	local config1 = {
		Dropdown = renderDropdown(p1),
		TrayOverlay = p1.trayOverlay
	}
	local CreateElementFunction4 = ReactModule.createElement
	local View1 = FoundationModule.View
	local config2 = { tag = "row align-y-center gap-small size-full-0 auto-y" }
	local config3 = {
		LeadingButton = if p1.showLeadingAction then ReactModule.createElement(FoundationModule.View, { LayoutOrder = 1, tag = "auto-xy" }, { Action = p1.leadingAddon }) else nil
	}
	local CreateElementFunction3 = ReactModule.createElement
	local View2 = FoundationModule.View
	local config4 = {
		LayoutOrder = 2,
		tag = "grow size-0 auto-y",
		cornerRadius = UDim.new(0, Tokens.Radius.Circle),
		backgroundStyle = p1.pillBackgroundStyle,
		stroke = p1.pillStroke,
		sizeConstraint = { MinSize = Vector2.new(0, 40) },
		padding = { right = UDim.new(0, 4) }
	}
	local config5 = {
		CustomDisabledContent = if p1.shouldReplaceDisabledContent then Props.disabledOverlay else nil
	}
	local TextContainer = nil
	
	if p1.shouldReplaceDisabledContent then
		TextContainer = nil
	else
		local CreateElementFunction2 = ReactModule.createElement
		local View3 = FoundationModule.View
		local config6 = {
			tag = "auto-y",
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, -NewSendButtonContainerWidth, 0, 0),
			padding = {
				left = UDim.new(0, 16),
				right = UDim.new(0, 4),
				top = UDim.new(0, 10),
				bottom = UDim.new(0, 10)
			}
		}
		local config7 = { SideChip = renderSideChip(p1) }
		local DisabledLabel = nil
		
		if p1.canChat then
			DisabledLabel = nil
		else
			local CreateElementFunction1 = ReactModule.createElement
			local Text = FoundationModule.Text
			local Label = {
				tag = "position-top-right anchor-top-right auto-y text-body-medium text-align-x-left text-truncate-end content-muted",
				Text = Props.disabledChatPlaceholderText or "",
				Size = MapResult
			}
			local TransparencyValue: number = p1.transparencyValue
			local MapResult1 = nil
			
			if ReactIsModule.isBinding(TransparencyValue) then
				local v1 = 0.5
				MapResult1 = TransparencyValue:map(function(p2): number
					-- upvalues: v1 (copy)
					return v1 + p2 * (1 - v1)
				end)
			else
				MapResult1 = TransparencyValue * 0.5 + 0.5
			end
			Label.TextTransparency = MapResult1
			DisabledLabel = CreateElementFunction1(Text, Label)
		end
		config7.DisabledLabel = DisabledLabel
		config7.TextBoxContainer = if p1.canChat then ReactModule.createElement(FoundationModule.View, {
			tag = "position-top-right anchor-top-right auto-y clip",
			Size = MapResult
		}, {
			TextBox = ReactModule.createElement("TextBox", {
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				MaxVisibleGraphemes = Props.maximumCharacterLimit or -1,
				Font = if Props.fontFace or FoundationFontFaceMigration then nil else Tokens.Typography.BodyMedium.Font,
				FontFace = Props.fontFace or (if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyMedium.Font) else nil),
				PlaceholderText = Props.placeholderText or "",
				PlaceholderColor3 = p1.composerPlaceholderColor,
				Size = UDim2.fromScale(1, 0),
				Text = Props.defaultValue or "",
				TextColor3 = p1.textColor,
				TextSize = FontSize,
				TextTransparency = p1.textTransparency,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextEditable = Props.enableFocusedWrite ~= false,
				ZIndex = 2,
				[ReactModule.Change.Text] = p1.onTextChanged,
				[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.onReturnPressedFromOnScreenKeyboard,
				[ReactModule.Event.Focused] = p1.onFocused,
				[ReactModule.Event.FocusLost] = p1.onFocusLost,
				ref = p1.textBoxRef,
				SelectionImageObject = Props.selectionImageObject,
				Selectable = Props.selectionImageObject ~= nil or nil
			})
		}) else nil
		TextContainer = CreateElementFunction2(View3, config6, config7)
	end
	config5.TextContainer = TextContainer
	config5.SendButtonContainer = if NoShouldReplaceDisabledContent then ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		GroupTransparency = p1.pillTransparency,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, 0, 1, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = renderSendButton(p1)
	}) else nil
	config5.DisabledOverlay = renderFallbackDisabledOverlay(p1)
	config3.InputGroup = CreateElementFunction3(View2, config4, config5)
	config1.Container = CreateElementFunction4(View1, config2, config3)
	
	return CreateElementFunction(View, config, config1)
end

return ReactModule.memo(function(Props)
	-- upvalues: FoundationModule (copy), FFlagExpChatEnableFriendsTab (copy), ReactModule (copy), ReactIsModule (copy), deriveBackgroundStyle (copy), deriveTransparency (copy), UseChatAutocompleteEngineModule (copy), UseAutocompleteSourcesModule (copy), FFlagChatInputBarGuardInvalidUtf8 (copy), GetTextLengthIfValidUtf8Module (copy), UseExpressionTrayModule (copy), ExpressionTrayViewModule (copy), renderComposer (copy), renderLegacy (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ThemedColors = Props.themedColors
	local SurfaceColor3 = if ThemedColors then UseTokensResult.Color.Surface.Surface_100.Color3 else UseTokensResult.DarkMode.Surface.Surface_100.Color3
	local MutedColor3 = if ThemedColors then UseTokensResult.Color.Content.Muted.Color3 else UseTokensResult.DarkMode.Content.Muted.Color3
	local EmphasisColor3 = if ThemedColors then UseTokensResult.Color.Content.Emphasis.Color3 else UseTokensResult.DarkMode.Content.Emphasis.Color3
	local DefaultColor3 = if ThemedColors then UseTokensResult.Color.Content.Default.Color3 else UseTokensResult.DarkMode.Content.Default.Color3
	local OnChangeFunction = Props.onChange
	local OnSendFunction = Props.onSend
	local CanLocalUserChat = Props.canLocalUserChat
	local TransparencyValue = Props.transparencyValue or 0
	local MaximumCharacterLimit = Props.maximumCharacterLimit
	local HasDisabledOverlay: boolean = FFlagExpChatEnableFriendsTab and (not CanLocalUserChat and Props.disabledOverlay ~= nil)
	local PillStrokeStyle = Props.pillStrokeStyle
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CanLocalUserChat (copy), PillStrokeStyle (copy), TransparencyValue (copy), ReactIsModule (upval)
		if CanLocalUserChat or PillStrokeStyle ~= nil then
			return TransparencyValue
		elseif ReactIsModule.isBinding(TransparencyValue) then
			local v1 = 0.5
			
			return (TransparencyValue:map(function(p1): number
				-- upvalues: v1 (copy)
				return v1 + p1 * (1 - v1)
			end))
		else
			return TransparencyValue * 0.5 + 0.5
		end
	end, { CanLocalUserChat, TransparencyValue, PillStrokeStyle })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: deriveBackgroundStyle (upval), SurfaceColor3 (copy), UseMemoResult (copy)
		return deriveBackgroundStyle(SurfaceColor3, 0.2, UseMemoResult)
	end, { SurfaceColor3, UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: PillStrokeStyle (copy), TransparencyValue (copy), ReactIsModule (upval), UseTokensResult (copy), UseMemoResult (copy)
		if PillStrokeStyle then
			local Transparency = PillStrokeStyle.Transparency or 0
			
			return {
				Color = PillStrokeStyle.Color3,
				Transparency = if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p1): number
					-- upvalues: Transparency (copy)
					return Transparency + p1 * (1 - Transparency)
				end) else Transparency + TransparencyValue * (1 - Transparency)
			}
		else
			local Transparency1: number = UseTokensResult.Color.Stroke.Default.Transparency
			
			return {
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = if ReactIsModule.isBinding(UseMemoResult) then UseMemoResult:map(function(p1): number
					-- upvalues: Transparency1 (copy)
					return Transparency1 + p1 * (1 - Transparency1)
				end) else Transparency1 + UseMemoResult * (1 - Transparency1)
			}
		end
	end, {
		UseTokensResult,
		UseMemoResult,
		PillStrokeStyle,
		TransparencyValue
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: deriveTransparency (upval), TransparencyValue (copy)
		return deriveTransparency(0, TransparencyValue)
	end, { TransparencyValue })
	local UseRefResult = ReactModule.useRef(nil)
	local TextBoxRef = Props.textBoxRef or UseRefResult
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseChatAutocompleteEngineModuleResult = UseChatAutocompleteEngineModule(TextBoxRef, Props.autocomplete)
	local UseAutocompleteSourcesModuleResult = UseAutocompleteSourcesModule(TextBoxRef, Props.autocompleteOptions)
	local UseChatAutocompleteEngineModuleResult1 = if Props.autocompleteOptions == nil then UseChatAutocompleteEngineModuleResult else UseAutocompleteSourcesModuleResult
	local UseRefResult11 = ReactModule.useRef(Props.defaultValue or "")
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: Props (copy)
		return (Props.defaultValue or "") == ""
	end)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: TextBoxRef (copy), OnSendFunction (copy), UseStateResult2 (copy)
		local Current = TextBoxRef.current
		local Text = if Current then Current.Text else ""
		
		if Text == "" then return end
		OnSendFunction(Text)
		
		if Current then
			Current.Text = ""
		end
		UseStateResult2(true)
	end, { OnSendFunction, TextBoxRef })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: TextBoxRef (copy)
		local Current = TextBoxRef.current
		
		if Current then
			Current:ReleaseFocus(true)
		end
	end, { TextBoxRef })
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: MaximumCharacterLimit (copy), FFlagChatInputBarGuardInvalidUtf8 (upval), GetTextLengthIfValidUtf8Module (upval), UseRefResult11 (copy), UseStateResult2 (copy), OnChangeFunction (copy), UseChatAutocompleteEngineModuleResult1 (copy)
		local Text = p1.Text
		
		if MaximumCharacterLimit ~= nil then
			if FFlagChatInputBarGuardInvalidUtf8 then
				local TextLengthIfValidUtf8Module = GetTextLengthIfValidUtf8Module(Text)
				
				if TextLengthIfValidUtf8Module ~= nil then
					if MaximumCharacterLimit < TextLengthIfValidUtf8Module then
						p1.Text = UseRefResult11.current
						
						return
					end
					UseRefResult11.current = Text
				end
			else
				local NfcnormalizeResult = utf8.nfcnormalize(Text)
				
				if MaximumCharacterLimit < (utf8.len(NfcnormalizeResult) or #NfcnormalizeResult) then
					p1.Text = UseRefResult11.current
					
					return
				end
				UseRefResult11.current = Text
			end
		end
		UseStateResult2(Text == "")
		
		if OnChangeFunction then
			OnChangeFunction(Text)
		end
		UseChatAutocompleteEngineModuleResult1.onTextChanged(Text)
	end, {
		OnChangeFunction,
		MaximumCharacterLimit,
		UseChatAutocompleteEngineModuleResult1.onTextChanged
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: Props (copy)
		if Props.onFocusGained then
			Props.onFocusGained()
		end
	end, { Props.onFocusGained })
	local UseResult5 = ReactModule.useCallback(function(p1)
		-- upvalues: Props (copy), UseStateResult2 (copy)
		if Props.autocompleteOptions ~= nil then
			UseStateResult2(p1.Text == "")
		end
	end, { Props.autocompleteOptions })
	local UseResult6 = ReactModule.useCallback(function(p1)
		-- upvalues: UseChatAutocompleteEngineModuleResult1 (copy), TextBoxRef (copy), UseResult5 (copy)
		UseChatAutocompleteEngineModuleResult1.commitSelection(p1)
		local Current = TextBoxRef.current
		
		if Current ~= nil then
			UseResult5(Current)
		end
	end, {
		UseChatAutocompleteEngineModuleResult1.commitSelection,
		TextBoxRef,
		UseResult5
	})
	local UseResult7 = ReactModule.useCallback(function(_, p1)
		-- upvalues: TextBoxRef (copy), UseChatAutocompleteEngineModuleResult1 (copy), UseResult5 (copy), UseResult1 (copy), Props (copy)
		local Current = TextBoxRef.current
		
		if Current and UseChatAutocompleteEngineModuleResult1.interceptSend(Current, p1) then
			UseResult5(Current)
		elseif p1 then
			UseResult1()
		end
		if Props.onFocusLost then
			Props.onFocusLost()
		end
	end, {
		UseResult1,
		Props.onFocusLost,
		TextBoxRef,
		UseChatAutocompleteEngineModuleResult1.interceptSend,
		UseResult5
	})
	ReactModule.useEffect(function()
		-- upvalues: CanLocalUserChat (copy), UseStateResult2 (copy)
		if not CanLocalUserChat then
			UseStateResult2(true)
		end
	end, { CanLocalUserChat })
	local UseExpressionTrayModuleResult = UseExpressionTrayModule(Props.expressionTray)
	local Element = nil
	local Element1 = nil
	
	if UseExpressionTrayModuleResult ~= nil and UseExpressionTrayModuleResult.isVisible then
		local Copy = table.clone(UseExpressionTrayModuleResult)
		Copy.variant = "entry"
		Element = ReactModule.createElement(ExpressionTrayViewModule, Copy)
		local Copy1 = table.clone(UseExpressionTrayModuleResult)
		Copy1.variant = "overlay"
		Element1 = ReactModule.createElement(ExpressionTrayViewModule, Copy1)
	end
	local LeftAddon = if Element == nil then Props.leftAddon else Element
	local HasLeftAddon = LeftAddon ~= nil
	assert(Props.autocomplete == nil or Props.autocompleteOptions == nil, "Pass autocomplete or autocompleteOptions, not both")
	local config = {
		sendButtonContainerWidth = 30,
		tokens = UseTokensResult,
		props = Props,
		leadingAddon = LeftAddon,
		trayOverlay = Element1,
		canChat = CanLocalUserChat,
		isEmpty = UseStateResult,
		isSendDisabled = UseStateResult or not CanLocalUserChat,
		hasLeadingAction = HasLeftAddon,
		showLeadingAction = HasLeftAddon and (UseStateResult and not HasDisabledOverlay),
		shouldReplaceDisabledContent = HasDisabledOverlay,
		transparencyValue = TransparencyValue,
		textColor = EmphasisColor3,
		surfaceColor = SurfaceColor3,
		placeholderColor = MutedColor3,
		composerPlaceholderColor = DefaultColor3,
		pillTransparency = UseMemoResult,
		pillBackgroundStyle = UseMemoResult1,
		pillStroke = UseMemoResult2,
		textTransparency = UseMemoResult3,
		textBoxRef = TextBoxRef,
		barContainerRef = UseRefResult1,
		channelChipWidth = UseBindingResult,
		autocomplete = UseChatAutocompleteEngineModuleResult1,
		onChannelChipAbsoluteSizeChanged = UseResult,
		onSendActivated = UseResult1,
		onCommitSelection = UseResult6,
		onReturnPressedFromOnScreenKeyboard = UseResult2,
		onTextChanged = UseResult3,
		onFocused = UseResult4,
		onFocusLost = UseResult7
	}
	
	return if Props.composerLayout == true then renderComposer(config) else renderLegacy(config)
end)