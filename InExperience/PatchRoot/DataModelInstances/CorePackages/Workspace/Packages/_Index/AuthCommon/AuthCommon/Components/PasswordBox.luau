local UserInputService = game:GetService("UserInputService")
local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local AreaTestModule = require(AuthCommon.Utils.AreaTest)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local GetFFlagLuaAppFixSelectionCursorFunction = require(Parent.SharedFlags).GetFFlagLuaAppFixSelectionCursor
local GetFFlagEnableTextFieldContentTypeFunction = require(Parent.SharedFlags).GetFFlagEnableTextFieldContentType
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local GuiObjectInputSinkEngineFeature = game:GetEngineFeature("GuiObjectInputSink")
local EnableKeyboardVisibilityCheckOnPasswordFocus = game:DefineFastFlag("EnableKeyboardVisibilityCheckOnPasswordFocus", false)
local EnableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass = require(Parent.SharedFlags).FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass
local FStringLuaMultiPageSignupIxpLayer = require(Parent.SharedFlags).FStringLuaMultiPageSignupIxpLayer
local PasswordBox = RoactModule.PureComponent:extend("PasswordBox")

function PasswordBox.init(p1) --[[ Line: 52 ]]
	-- upvalues: RoactModule (copy), AreaTestModule (copy), EnableKeyboardVisibilityCheckOnPasswordFocus (copy), UserInputService (copy)
	p1.state = { hidePassword = true, containerSize = Vector2.new(0, 0) }
	
	function p1.getHidePassword() --[[ Line: 59 ]]
		-- upvalues: p1 (copy)
		return if p1.props.hidePassword == nil then p1.state.hidePassword else p1.props.hidePassword
	end
	
	p1.isMounted = false
	p1.passwordBoxRef = RoactModule.createRef()
	local Ref = RoactModule.createRef()
	
	function p1.getPasswordTextBoxRef() --[[ Line: 71 ]]
		-- upvalues: p1 (copy), Ref (copy)
		return p1.props.TextBoxRef or Ref
	end
	
	function p1.isTouchPositionInPasswordBox(p2) --[[ Line: 75 ]]
		-- upvalues: p1 (copy), AreaTestModule (upval)
		if p1.passwordBoxRef.current then
			local AbsolutePosition = p1.passwordBoxRef.current.AbsolutePosition
			
			return AreaTestModule.IsPointInRect(Rect.new(AbsolutePosition, AbsolutePosition + p1.passwordBoxRef.current.AbsoluteSize), p2)
		else
			return false
		end
	end
	
	p1.tapBeganInTextbox = false
	
	function p1.tapEventBegan(Position, _) --[[ Line: 89 ]]
		-- upvalues: p1 (copy), EnableKeyboardVisibilityCheckOnPasswordFocus (upval), UserInputService (upval)
		if p1.props.CentralOverlayBlocksInput and p1.props.centralOverlay and p1.props.centralOverlay.OverlayType ~= nil then return end
		if EnableKeyboardVisibilityCheckOnPasswordFocus and not UserInputService.OnScreenKeyboardVisible then return end
		p1.tapBeganInTextbox = p1.isTouchPositionInPasswordBox(Position)
		local Current = p1.getPasswordTextBoxRef().current
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if Current and FocusedTextBox ~= Current and p1.tapBeganInTextbox and p1.props.CaptureFocusOnTapStart then
			if FocusedTextBox then
				FocusedTextBox:ReleaseFocus()
			end
			Current:CaptureFocus()
		end
	end
	
	function p1.tapEventEnded(Position, _) --[[ Line: 123 ]]
		-- upvalues: p1 (copy), UserInputService (upval)
		if p1.tapBeganInTextbox then
			p1.tapBeganInTextbox = false
			
			return
		end
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		local Current = p1.getPasswordTextBoxRef().current
		
		if not FocusedTextBox or FocusedTextBox ~= Current then return end
		if not p1.isTouchPositionInPasswordBox(Position) then
			Current:ReleaseFocus()
		end
	end
	
	function p1.onAbsoluteSizeChanged(Frame) --[[ Line: 141 ]]
		-- upvalues: p1 (copy)
		local ContainerSize = p1.state.containerSize
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and ContainerSize ~= AbsoluteSize then
			spawn(function() --[[ Line: 147 ]]
				-- upvalues: p1 (upval), AbsoluteSize (copy)
				if p1.isMounted then
					p1:setState({ containerSize = AbsoluteSize })
				end
			end)
		end
	end
	
	function p1:onTogglerActivated() --[[ Line: 157 ]]
		-- upvalues: p1 (copy)
		local OnToggleCallbackFunction: (any) -> () = p1.props.onToggleCallback
		local HidePassword = p1.getHidePassword()
		
		if OnToggleCallbackFunction then
			OnToggleCallbackFunction(HidePassword)
		end
		if p1.isMounted then
			p1:setState({ hidePassword = not HidePassword })
		end
	end
	
	function p1.shouldTakeInput(Input): boolean --[[ Line: 172 ]]
		-- upvalues: p1 (copy)
		if p1.props.Disabled then
			return false
		else
			local IsUserInputTypeMatch: boolean = Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
			
			return not p1.props.ManualFocusRelease and IsUserInputTypeMatch
		end
	end
end

PasswordBox.defaultProps = {
	PaddingX = 10,
	PaddingY = 7,
	ClearTextOnFocus = false,
	IsKeyboardOverlayUsed = true,
	TextXAlignment = Enum.TextXAlignment.Left
}

function PasswordBox.didMount(p1) --[[ Line: 192 ]]
	-- upvalues: UserInputService (copy)
	p1.isMounted = true
	
	if p1.props.IsKeyboardOverlayUsed then
		p1.inputBeganConnection = UserInputService.InputBegan:connect(function(Input, GameProcessed) --[[ Line: 196 ]]
			-- upvalues: p1 (copy)
			if p1.shouldTakeInput(Input) then
				p1.tapEventBegan(Input.Position, GameProcessed)
			end
		end)
		p1.inputEndedConnection = UserInputService.InputEnded:connect(function(Input, GameProcessed) --[[ Line: 202 ]]
			-- upvalues: p1 (copy)
			if p1.shouldTakeInput(Input) then
				p1.tapEventEnded(Input.Position, GameProcessed)
			end
		end)
	end
end

function PasswordBox.willUnmount(p1) --[[ Line: 210 ]]
	p1.isMounted = false
	
	if p1.props.IsKeyboardOverlayUsed then
		if p1.inputBeganConnection then
			p1.inputBeganConnection:disconnect()
		end
		if p1.inputEndedConnection then
			p1.inputEndedConnection:disconnect()
		end
	end
end

function PasswordBox.render(p1) --[[ Line: 222 ]]
	-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (copy), WithSelectionCursorProviderFunction (copy)
	return if GetFFlagLuaAppFixSelectionCursorFunction() then WithSelectionCursorProviderFunction(function(p2) --[[ Line: 224 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end) else p1:renderWithSelectionCursor(nil)
end

function PasswordBox.renderWithSelectionCursor(p1, Callback) --[[ Line: 233 ]]
	-- upvalues: EnableAndroidPasswordSuggestionEngineFeature (copy), GetFFlagEnableTextFieldContentTypeFunction (copy), WithStyleFunction (copy), GetFFlagLuaAppFixSelectionCursorFunction (copy), CursorKind (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GuiObjectInputSinkEngineFeature (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local Text = p1.props.Text
	local TextSize = p1.props.TextSize
	local PlaceholderText = p1.props.PlaceholderText
	local TextXAlignment = p1.props.TextXAlignment
	local TextColor = p1.props.TextColor
	local PlaceholderColor = p1.props.PlaceholderColor
	local ClearTextOnFocus = p1.props.ClearTextOnFocus
	local Color = p1.props.Color
	local Transparency = p1.props.Transparency
	local TextTransparency = p1.props.TextTransparency
	local ReturnKeyType = p1.props.ReturnKeyType
	local NextSelectionDown = p1.props.NextSelectionDown
	local NextSelectionLeft = p1.props.NextSelectionLeft
	local NextSelectionRight = p1.props.NextSelectionRight
	local NextSelectionUp = p1.props.NextSelectionUp
	local PaddingX = p1.props.PaddingX
	local PaddingY = p1.props.PaddingY
	local HidePassword = p1.getHidePassword()
	local Y = p1.state.containerSize.Y
	local OnFocused = p1.props.onFocused
	local OnFocusLost = p1.props.onFocusLost
	local OnMouseEnter = p1.props.onMouseEnter
	local OnMouseLeave = p1.props.onMouseLeave
	local EnablePasswordSuggestion = p1.props.IsNewPassword and p1.props.enablePasswordSuggestion
	local NewPassword = EnablePasswordSuggestion and EnableAndroidPasswordSuggestionEngineFeature and Enum.TextInputType.NewPassword or Enum.TextInputType.Password
	local NewPasswordShown = EnablePasswordSuggestion and EnableAndroidPasswordSuggestionEngineFeature and Enum.TextInputType.NewPasswordShown or (GetFFlagEnableTextFieldContentTypeFunction() and Enum.TextInputType.PasswordShown or Enum.TextInputType.NoSuggestions)
	
	return WithStyleFunction(function(p2) --[[ Line: 280 ]]
		-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (upval), Callback (copy), CursorKind (upval), RoactModule (upval), ImageSetLabel (upval), Size (copy), Position (copy), LayoutOrder (copy), GetImageDataFunction (upval), Color (copy), Transparency (copy), p1 (copy), Y (copy), Text (copy), PlaceholderText (copy), PlaceholderColor (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), GuiObjectInputSinkEngineFeature (upval), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), OpenTypeSupport (upval), TextSize (copy), TextColor (copy), TextTransparency (copy), TextXAlignment (copy), ClearTextOnFocus (copy), HidePassword (copy), NewPassword (copy), NewPasswordShown (copy), ReturnKeyType (copy), NextSelectionDown (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), OnFocused (copy), OnFocusLost (copy), OnMouseEnter (copy), OnMouseLeave (copy), PaddingY (copy), PaddingX (copy)
		local CallbackResult = if GetFFlagLuaAppFixSelectionCursorFunction() then Callback(CursorKind.InputButton) else nil
		
		return RoactModule.createElement(ImageSetLabel, {
			Size = Size,
			Position = Position,
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = 1,
			Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
			ImageColor3 = Color,
			ImageTransparency = Transparency,
			BorderSizePixel = 0,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			[RoactModule.Ref] = p1.passwordBoxRef,
			[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		}, {
			TextBoxContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -Y, 1, 0)
			}, {
				TextBox = RoactModule.createElement("TextBox", {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Text = Text,
					PlaceholderText = PlaceholderText,
					PlaceholderColor3 = PlaceholderColor,
					Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
					InputSink = if GuiObjectInputSinkEngineFeature then Enum.InputSink.None else nil,
					OpenTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getPasswordStylisticAlternative() else nil,
					TextSize = TextSize,
					TextColor3 = TextColor,
					TextTransparency = TextTransparency,
					TextXAlignment = TextXAlignment,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundTransparency = 1,
					ClearTextOnFocus = ClearTextOnFocus,
					OverlayNativeInput = true,
					ManualFocusRelease = p1.props.IsKeyboardOverlayUsed,
					ClipsDescendants = true,
					TextInputType = HidePassword and NewPassword or NewPasswordShown,
					ReturnKeyType = ReturnKeyType,
					NextSelectionDown = NextSelectionDown,
					NextSelectionLeft = NextSelectionLeft,
					NextSelectionRight = NextSelectionRight,
					NextSelectionUp = NextSelectionUp,
					SelectionImageObject = CallbackResult,
					[RoactModule.Ref] = p1.getPasswordTextBoxRef(),
					[RoactModule.Change.Text] = p1.props.onChangeText,
					[RoactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.props.onReturnPressedFromOnScreenKeyboard,
					[RoactModule.Event.Focused] = OnFocused,
					[RoactModule.Event.FocusLost] = OnFocusLost,
					[RoactModule.Event.MouseEnter] = OnMouseEnter,
					[RoactModule.Event.MouseLeave] = OnMouseLeave
				}),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, PaddingY),
					PaddingBottom = UDim.new(0, PaddingY),
					PaddingLeft = UDim.new(0, PaddingX),
					PaddingRight = UDim.new(0, PaddingX)
				})
			}),
			Toggler = RoactModule.createElement("TextButton", {
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.new(0, Y, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Text = "",
				BackgroundTransparency = 1,
				SelectionImageObject = CallbackResult,
				[RoactModule.Event.Activated] = p1.onTogglerActivated
			}, {
				ImageLabel = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = if HidePassword then GetImageDataFunction("LuaApp/icons/actions_privacy_show") or "LuaApp/icons/actions_privacy_show" else GetImageDataFunction("LuaApp/icons/actions_edit_hide") or "LuaApp/icons/actions_edit_hide",
					ImageColor3 = p2.Theme.IconDefault.Color,
					ImageTransparency = p2.Theme.IconDefault.Transparency
				})
			})
		})
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _) --[[ Line: 375 ]]
	return { centralOverlay = p1.CentralOverlay }
end)(PasswordBox)

if EnableAndroidPasswordSuggestionEngineFeature then
	v1 = RoactAppExperimentModule.connectBrowserTrackerLayer({ FStringLuaMultiPageSignupIxpLayer }, function(p1, _) --[[ Line: 384 ]]
		-- upvalues: FStringLuaMultiPageSignupIxpLayer (copy), FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass (copy)
		return {
			enablePasswordSuggestion = (p1[FStringLuaMultiPageSignupIxpLayer] or {}).enablePasswordSuggestion or (FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass or false)
		}
	end)(v1)
end
return v1