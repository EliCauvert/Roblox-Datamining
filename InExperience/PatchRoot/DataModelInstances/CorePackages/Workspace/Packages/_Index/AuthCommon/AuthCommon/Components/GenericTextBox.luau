local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local getFFlagLuaAppFixSelectionCursor = require(parent.SharedFlags).GetFFlagLuaAppFixSelectionCursor
local fFlagPhoneUpsellEnforceCodeInputLimit = require(parent.SharedFlags).FFlagPhoneUpsellEnforceCodeInputLimit
local genericTextBox = roactModule.PureComponent:extend("GenericTextBox")
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local enableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
genericTextBox.defaultProps = { PaddingX = 0, PaddingY = 0 }

function genericTextBox.render(p0) --[[ line: 28 ]]
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), withSelectionCursorProvider (ref)
	return if getFFlagLuaAppFixSelectionCursor() then withSelectionCursorProvider(function(p1) --[[ line: 30 ]]
		-- upvalues: p0 (ref)
		return p0:renderWithSelectionCursor(p1)
	end) else p0:renderWithSelectionCursor(nil)
end

function genericTextBox.renderWithSelectionCursor(p2, p3) --[[ line: 39 ]]
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), cursorKind (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), enableAndroidPasswordSuggestionEngineFeature (ref), openTypeSupport (ref), fFlagPhoneUpsellEnforceCodeInputLimit (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref)
	local size = p2.props.Size
	local position = p2.props.Position
	local layoutOrder = p2.props.LayoutOrder
	local text = p2.props.Text
	local font = p2.props.Font
	local textSize = p2.props.TextSize
	local placeholderText = p2.props.PlaceholderText
	local textXAlignment = p2.props.TextXAlignment
	local textColor = p2.props.TextColor
	local placeholderColor = p2.props.PlaceholderColor
	local clearTextOnFocus = p2.props.ClearTextOnFocus
	local textInputType = p2.props.TextInputType
	local returnKeyType = p2.props.ReturnKeyType
	local manualFocusRelease = p2.props.ManualFocusRelease
	local nextSelectionDown = p2.props.NextSelectionDown
	local nextSelectionLeft = p2.props.NextSelectionLeft
	local nextSelectionRight = p2.props.NextSelectionRight
	local nextSelectionUp = p2.props.NextSelectionUp
	local color = p2.props.Color
	local transparency = p2.props.Transparency
	local textTransparency = p2.props.TextTransparency
	local maxLength = p2.props.maxLength
	local onChangeText = p2.props.onChangeText
	local onAncestryChanged = p2.props.onAncestryChanged
	local onReturnPressedFromOnScreenKeyboard = p2.props.onReturnPressedFromOnScreenKeyboard
	local onFocused = p2.props.onFocused
	local onFocusLost = p2.props.onFocusLost
	local onMouseEnter = p2.props.onMouseEnter
	local onMouseLeave = p2.props.onMouseLeave
	local paddingX = p2.props.PaddingX
	local paddingY = p2.props.PaddingY
	local textBoxRef = p2.props.TextBoxRef
	local var4 = if getFFlagLuaAppFixSelectionCursor() then p3(cursorKind.InputButton) else nil
	local userNameStylisticAlternative = nil
	
	if not getFFlagLuaAppEnableOpenTypeSupport() then
		userNameStylisticAlternative = nil
	elseif p2.props.openTypeFeatures ~= nil then
		userNameStylisticAlternative = p2.props.openTypeFeatures
	elseif textInputType == Enum.TextInputType.Password or textInputType == Enum.TextInputType.PasswordShown or textInputType == Enum.TextInputType.OneTimePassword or (enableAndroidPasswordSuggestionEngineFeature and textInputType == Enum.TextInputType.NewPassword or enableAndroidPasswordSuggestionEngineFeature and textInputType == Enum.TextInputType.NewPasswordShown) then
		userNameStylisticAlternative = openTypeSupport:getPasswordStylisticAlternative()
	elseif textInputType == Enum.TextInputType.Username then
		userNameStylisticAlternative = openTypeSupport:getUserNameStylisticAlternative()
	end
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = size,
		Position = position,
		LayoutOrder = layoutOrder,
		Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
		ImageColor3 = color,
		ImageTransparency = transparency,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9)
	}, {
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, paddingY),
			PaddingBottom = UDim.new(0, paddingY),
			PaddingLeft = UDim.new(0, paddingX),
			PaddingRight = UDim.new(0, paddingX)
		}),
		TextBox = roactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = text,
			PlaceholderText = placeholderText,
			PlaceholderColor3 = placeholderColor,
			Font = font,
			TextSize = textSize,
			TextColor3 = textColor,
			TextTransparency = textTransparency,
			TextXAlignment = textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundTransparency = 1,
			ClearTextOnFocus = clearTextOnFocus,
			OverlayNativeInput = true,
			ClipsDescendants = true,
			TextInputType = textInputType,
			ReturnKeyType = returnKeyType,
			ManualFocusRelease = manualFocusRelease,
			NextSelectionDown = nextSelectionDown,
			NextSelectionLeft = nextSelectionLeft,
			NextSelectionRight = nextSelectionRight,
			NextSelectionUp = nextSelectionUp,
			SelectionImageObject = var4,
			OpenTypeFeatures = userNameStylisticAlternative or nil,
			RichText = if userNameStylisticAlternative then true else nil,
			[roactModule.Ref] = textBoxRef,
			[roactModule.Change.Text] = function(p4) --[[ line: 103 ]]
				-- upvalues: fFlagPhoneUpsellEnforceCodeInputLimit (copy), maxLength (ref), onChangeText (ref)
				if fFlagPhoneUpsellEnforceCodeInputLimit and maxLength then
					local substring = string.sub(p4.Text, 1, maxLength)
					
					if substring ~= p4.Text then
						p4.Text = substring
						
						return
					elseif onChangeText then
						onChangeText(p4)
					end
				end
			end,
			[roactModule.Event.AncestryChanged] = onAncestryChanged,
			[roactModule.Event.ReturnPressedFromOnScreenKeyboard] = onReturnPressedFromOnScreenKeyboard,
			[roactModule.Event.Focused] = onFocused,
			[roactModule.Event.FocusLost] = onFocusLost,
			[roactModule.Event.MouseEnter] = onMouseEnter,
			[roactModule.Event.MouseLeave] = onMouseLeave
		})
	})
end

return genericTextBox