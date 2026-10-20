local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local ChannelChipModule = require(script.Parent.ChannelChip)
local ChatAutocompleteDropdownModule = require(script.Parent.Autocomplete.ChatAutocompleteDropdown)
local UseChatAutocompleteEngineModule = require(script.Parent.Autocomplete.useChatAutocompleteEngine)

local function _(p1: number, p2): number
	return p1 + p2 * (1 - p1)
end

local _ = function(p1: number, p2)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p2) then p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end) else p1 + p2 * (1 - p1)
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

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), UseChatAutocompleteEngineModule (copy), ChatAutocompleteDropdownModule (copy), deriveBackgroundStyle (copy), ReactIsModule (copy), ChannelChipModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local OnChangeFunction = p1.onChange
	local OnSendFunction = p1.onSend
	local CanLocalUserChat = p1.canLocalUserChat
	local TransparencyValue = p1.transparencyValue or 0
	local TextSize = p1.textSize or UseTokensResult.Typography.CaptionMedium.FontSize
	local MaximumCharacterLimit = p1.maximumCharacterLimit
	local UseRefResult = ReactModule.useRef(nil)
	local TextBoxRef = p1.textBoxRef or UseRefResult
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseChatAutocompleteEngineModuleResult = UseChatAutocompleteEngineModule(TextBoxRef, p1.autocomplete)
	local UseRefResult11 = ReactModule.useRef(p1.defaultValue or "")
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: p1 (copy)
		return (p1.defaultValue or "") == ""
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
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: MaximumCharacterLimit (copy), UseRefResult11 (copy), UseStateResult2 (copy), OnChangeFunction (copy), UseChatAutocompleteEngineModuleResult (copy)
		local Text = p2.Text
		
		if MaximumCharacterLimit ~= nil then
			local NfcnormalizeResult = utf8.nfcnormalize(Text)
			
			if MaximumCharacterLimit < (utf8.len(NfcnormalizeResult) or #NfcnormalizeResult) then
				p2.Text = UseRefResult11.current
				
				return
			end
			UseRefResult11.current = Text
		end
		UseStateResult2(Text == "")
		
		if OnChangeFunction then
			OnChangeFunction(Text)
		end
		UseChatAutocompleteEngineModuleResult.onTextChanged(Text)
	end, {
		OnChangeFunction,
		MaximumCharacterLimit,
		UseChatAutocompleteEngineModuleResult.onTextChanged
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onFocusGained then
			p1.onFocusGained()
		end
	end, { p1.onFocusGained })
	local UseResult4 = ReactModule.useCallback(function(_, p2)
		-- upvalues: TextBoxRef (copy), UseChatAutocompleteEngineModuleResult (copy), UseResult1 (copy), p1 (copy)
		local Current = TextBoxRef.current
		
		if (not Current or not UseChatAutocompleteEngineModuleResult.interceptSend(Current, p2)) and p2 then
			UseResult1()
			
			if p1.retainFocusOnSend then
				task.delay(0, function()
					-- upvalues: TextBoxRef (upval)
					local Current = TextBoxRef.current
					
					if Current then
						Current:CaptureFocus()
					end
				end)
			end
		end
		if p1.onFocusLost then
			p1.onFocusLost()
		end
	end, {
		UseResult1,
		p1.onFocusLost,
		p1.retainFocusOnSend,
		TextBoxRef,
		UseChatAutocompleteEngineModuleResult.interceptSend
	})
	local CreateElementFunction6 = ReactModule.createElement
	local View = FoundationModule.View
	local config = {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		ref = UseRefResult1
	}
	local config1 = {
		Dropdown = if p1.autocomplete then ReactModule.createElement(ChatAutocompleteDropdownModule, {
			isOpen = UseChatAutocompleteEngineModuleResult.isOpen,
			results = UseChatAutocompleteEngineModuleResult.results,
			selectedIndex = UseChatAutocompleteEngineModuleResult.selectedIndex,
			keyboardIndex = UseChatAutocompleteEngineModuleResult.keyboardIndex,
			renderEntry = UseChatAutocompleteEngineModuleResult.renderEntry,
			anchorRef = UseRefResult1,
			onHover = UseChatAutocompleteEngineModuleResult.setSelectedIndex,
			onSelect = UseChatAutocompleteEngineModuleResult.commitSelection,
			onDismiss = UseChatAutocompleteEngineModuleResult.dismiss
		}) else nil
	}
	local CreateElementFunction1 = ReactModule.createElement
	local View1 = FoundationModule.View
	local config2 = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
	local t = {}
	local CreateElementFunction5 = ReactModule.createElement
	local View2 = FoundationModule.View
	local Transparency: number = UseTokensResult.Color.Stroke.Default.Transparency
	local config3 = {
		cornerRadius = UDim.new(0, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		backgroundStyle = deriveBackgroundStyle(UseTokensResult.DarkMode.Surface.Surface_100.Color3, 0.2, TransparencyValue),
		stroke = {
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p2): number
				-- upvalues: Transparency (copy)
				return Transparency + p2 * (1 - Transparency)
			end) else Transparency + TransparencyValue * (1 - Transparency)
		},
		padding = { right = UDim.new(0, 2) }
	}
	local t1 = {}
	local CreateElementFunction4 = ReactModule.createElement
	local View3 = FoundationModule.View
	local config4 = {
		tag = "auto-y",
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.new(1, -36, 0, 0),
		padding = {
			top = UDim.new(0, 10),
			bottom = UDim.new(0, 10),
			left = UDim.new(0, 10),
			right = UDim.new(0, 10)
		}
	}
	local config5 = {
		SideChip = ReactModule.createElement(ChannelChipModule, {
			transparency = TransparencyValue,
			sideChipText = p1.sideChipText,
			showSideChip = p1.showSideChip,
			onSideChipActivated = p1.onSideChipActivated,
			onAbsoluteSizeChanged = UseResult
		})
	}
	local DisabledLabel = nil
	
	if CanLocalUserChat then
		DisabledLabel = nil
	else
		local CreateElementFunction3 = ReactModule.createElement
		local Text = FoundationModule.Text
		local Label = {
			tag = "text-caption-medium text-wrap text-align-x-left text-align-y-top content-muted",
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.disabledChatPlaceholderText or "",
			Position = UDim2.fromScale(1, 0),
			Size = UseBindingResult:map(function(p2: number): UDim2
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end)
		}
		local MapResult = nil
		
		if ReactIsModule.isBinding(TransparencyValue) then
			local v1 = 0.5
			MapResult = TransparencyValue:map(function(p2): number
				-- upvalues: v1 (copy)
				return v1 + p2 * (1 - v1)
			end)
		else
			MapResult = TransparencyValue * 0.5 + 0.5
		end
		Label.TextTransparency = MapResult
		DisabledLabel = CreateElementFunction3(Text, Label)
	end
	config5.DisabledLabel = DisabledLabel
	local Element = nil
	
	if CanLocalUserChat then
		local CreateElementFunction2 = ReactModule.createElement
		local View4 = FoundationModule.View
		local config6 = {
			tag = "auto-y",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UseBindingResult:map(function(p2: number): UDim2
				return UDim2.new(1, -(p2 + 8), 0, 0)
			end)
		}
		local t2 = {}
		local CreateElementFunction = ReactModule.createElement
		local v2 = "TextBox"
		local UseResults = {
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			MaxVisibleGraphemes = MaximumCharacterLimit or -1,
			Font = UseTokensResult.Typography.CaptionMedium.Font,
			PlaceholderText = p1.placeholderText or "",
			PlaceholderColor3 = UseTokensResult.DarkMode.Content.Muted.Color3,
			Size = UDim2.fromScale(1, 0),
			Text = p1.defaultValue or "",
			TextColor3 = UseTokensResult.DarkMode.Content.Emphasis.Color3,
			TextSize = TextSize
		}
		local NewTransparencyValue = nil
		
		if ReactIsModule.isBinding(TransparencyValue) then
			local v3 = 0
			NewTransparencyValue = TransparencyValue:map(function(p2): number
				-- upvalues: v3 (copy)
				return v3 + p2 * (1 - v3)
			end)
		else
			NewTransparencyValue = TransparencyValue * 1 + 0
		end
		UseResults.TextTransparency = NewTransparencyValue
		UseResults.TextWrapped = true
		UseResults.TextXAlignment = Enum.TextXAlignment.Left
		UseResults.TextYAlignment = Enum.TextYAlignment.Top
		UseResults.TextEditable = p1.enableFocusedWrite ~= false
		UseResults.ZIndex = 2
		UseResults[ReactModule.Change.Text] = UseResult2
		UseResults[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = UseResult1
		UseResults[ReactModule.Event.Focused] = UseResult3
		UseResults[ReactModule.Event.FocusLost] = UseResult4
		UseResults.ref = TextBoxRef
		t2.TextBox = CreateElementFunction(v2, UseResults)
		Element = CreateElementFunction2(View4, config6, t2)
	else
		Element = nil
	end
	config5.TextBoxContainer = Element
	t1.TextContainer = CreateElementFunction4(View3, config4, config5)
	t1.SendButtonContainer = ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		GroupTransparency = TransparencyValue,
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.new(0, 36, 1, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SendButton = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = FoundationModule.Enums.IconName.ArrowMediumUp,
			variant = if UseStateResult then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
			size = FoundationModule.Enums.InputSize.Small,
			isDisabled = UseStateResult,
			onActivated = UseResult1
		})
	})
	t1.DisabledOverlay = if CanLocalUserChat or not p1.disabledOverlay then nil else ReactModule.createElement(FoundationModule.View, { ZIndex = 5, Size = UDim2.fromScale(1, 1) }, { Overlay = p1.disabledOverlay })
	t.InputGroup = CreateElementFunction5(View2, config3, t1)
	config1.Container = CreateElementFunction1(View1, config2, t)
	
	return CreateElementFunction6(View, config, config1)
end)