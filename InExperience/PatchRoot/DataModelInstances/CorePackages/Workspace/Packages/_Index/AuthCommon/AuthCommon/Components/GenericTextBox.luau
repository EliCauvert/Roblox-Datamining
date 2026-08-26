local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local getFFlagLuaAppFixSelectionCursor = require(parent.SharedFlags).GetFFlagLuaAppFixSelectionCursor
local genericTextBox = roactModule.PureComponent:extend("GenericTextBox")
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local enableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
genericTextBox.defaultProps = { PaddingX = 0, PaddingY = 0 }

function genericTextBox.render(p1)
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), withSelectionCursorProvider (ref)
	return if getFFlagLuaAppFixSelectionCursor() then withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end) else p1:renderWithSelectionCursor(nil)
end

function genericTextBox.renderWithSelectionCursor(p1, p2)
	-- upvalues: getFFlagLuaAppFixSelectionCursor (ref), cursorKind (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), enableAndroidPasswordSuggestionEngineFeature (ref), openTypeSupport (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref)
	local size = p1.props.Size
	local position = p1.props.Position
	local layoutOrder = p1.props.LayoutOrder
	local text = p1.props.Text
	local font = p1.props.Font
	local textSize = p1.props.TextSize
	local placeholderText = p1.props.PlaceholderText
	local textXAlignment = p1.props.TextXAlignment
	local textColor = p1.props.TextColor
	local placeholderColor = p1.props.PlaceholderColor
	local clearTextOnFocus = p1.props.ClearTextOnFocus
	local textInputType = p1.props.TextInputType
	local returnKeyType = p1.props.ReturnKeyType
	local manualFocusRelease = p1.props.ManualFocusRelease
	local nextSelectionDown = p1.props.NextSelectionDown
	local nextSelectionLeft = p1.props.NextSelectionLeft
	local nextSelectionRight = p1.props.NextSelectionRight
	local nextSelectionUp = p1.props.NextSelectionUp
	local color = p1.props.Color
	local transparency = p1.props.Transparency
	local textTransparency = p1.props.TextTransparency
	local maxLength = p1.props.maxLength
	local onChangeText = p1.props.onChangeText
	local onAncestryChanged = p1.props.onAncestryChanged
	local onReturnPressedFromOnScreenKeyboard = p1.props.onReturnPressedFromOnScreenKeyboard
	local onFocused = p1.props.onFocused
	local onFocusLost = p1.props.onFocusLost
	local onMouseEnter = p1.props.onMouseEnter
	local onMouseLeave = p1.props.onMouseLeave
	local paddingX = p1.props.PaddingX
	local paddingY = p1.props.PaddingY
	local textBoxRef = p1.props.TextBoxRef
	local var1 = if getFFlagLuaAppFixSelectionCursor() then p2(cursorKind.InputButton) else nil
	local userNameStylisticAlternative = nil
	
	if not getFFlagLuaAppEnableOpenTypeSupport() then
		userNameStylisticAlternative = nil
	elseif p1.props.openTypeFeatures ~= nil then
		userNameStylisticAlternative = p1.props.openTypeFeatures
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
			SelectionImageObject = var1,
			OpenTypeFeatures = userNameStylisticAlternative or nil,
			RichText = if userNameStylisticAlternative then true else nil,
			[roactModule.Ref] = textBoxRef,
			[roactModule.Change.Text] = function(p3)
				-- upvalues: maxLength (ref), onChangeText (ref)
				if maxLength then
					local substring = string.sub(p3.Text, 1, maxLength)
					
					if substring ~= p3.Text then
						p3.Text = substring
						
						return
					elseif onChangeText then
						onChangeText(p3)
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