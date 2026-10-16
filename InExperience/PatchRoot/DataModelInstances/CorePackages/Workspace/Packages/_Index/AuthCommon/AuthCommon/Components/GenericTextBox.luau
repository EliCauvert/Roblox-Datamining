local Parent = script:FindFirstAncestor("AuthCommon").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local GetFFlagLuaAppFixSelectionCursorFunction = require(Parent.SharedFlags).GetFFlagLuaAppFixSelectionCursor
local GenericTextBox = RoactModule.PureComponent:extend("GenericTextBox")
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local EnableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
GenericTextBox.defaultProps = { PaddingX = 0, PaddingY = 0 }

function GenericTextBox.render(p1) --[[ Line: 27 ]]
	-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (copy), WithSelectionCursorProviderFunction (copy)
	return if GetFFlagLuaAppFixSelectionCursorFunction() then WithSelectionCursorProviderFunction(function(p2) --[[ Line: 29 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end) else p1:renderWithSelectionCursor(nil)
end

function GenericTextBox.renderWithSelectionCursor(p1, Callback) --[[ Line: 38 ]]
	-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (copy), CursorKind (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), EnableAndroidPasswordSuggestionEngineFeature (copy), OpenTypeSupport (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	local TextInputType = p1.props.TextInputType
	local MaxLength = p1.props.maxLength
	local OnChangeTextFunction = p1.props.onChangeText
	local PaddingX = p1.props.PaddingX
	local PaddingY = p1.props.PaddingY
	local PasswordStylisticAlternative = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then if p1.props.openTypeFeatures == nil then if TextInputType == Enum.TextInputType.Password or TextInputType == Enum.TextInputType.PasswordShown or TextInputType == Enum.TextInputType.OneTimePassword or EnableAndroidPasswordSuggestionEngineFeature and TextInputType == Enum.TextInputType.NewPassword then OpenTypeSupport:getPasswordStylisticAlternative() elseif EnableAndroidPasswordSuggestionEngineFeature and TextInputType == Enum.TextInputType.NewPasswordShown then OpenTypeSupport:getPasswordStylisticAlternative() elseif TextInputType == Enum.TextInputType.Username then OpenTypeSupport:getUserNameStylisticAlternative() else nil else p1.props.openTypeFeatures else nil
	
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.Size,
		Position = p1.props.Position,
		LayoutOrder = p1.props.LayoutOrder,
		Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
		ImageColor3 = p1.props.Color,
		ImageTransparency = p1.props.Transparency,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9)
	}, {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, PaddingY),
			PaddingBottom = UDim.new(0, PaddingY),
			PaddingLeft = UDim.new(0, PaddingX),
			PaddingRight = UDim.new(0, PaddingX)
		}),
		TextBox = RoactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = p1.props.Text,
			PlaceholderText = p1.props.PlaceholderText,
			PlaceholderColor3 = p1.props.PlaceholderColor,
			Font = p1.props.Font,
			TextSize = p1.props.TextSize,
			TextColor3 = p1.props.TextColor,
			TextTransparency = p1.props.TextTransparency,
			TextXAlignment = p1.props.TextXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundTransparency = 1,
			ClearTextOnFocus = p1.props.ClearTextOnFocus,
			OverlayNativeInput = true,
			ClipsDescendants = true,
			TextInputType = TextInputType,
			ReturnKeyType = p1.props.ReturnKeyType,
			ManualFocusRelease = p1.props.ManualFocusRelease,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			SelectionImageObject = if GetFFlagLuaAppFixSelectionCursorFunction() then Callback(CursorKind.InputButton) else nil,
			OpenTypeFeatures = PasswordStylisticAlternative or nil,
			RichText = if PasswordStylisticAlternative then true else nil,
			[RoactModule.Ref] = p1.props.TextBoxRef,
			[RoactModule.Change.Text] = function(p2) --[[ Line: 102 ]]
				-- upvalues: MaxLength (copy), OnChangeTextFunction (copy)
				if MaxLength then
					local Segment = string.sub(p2.Text, 1, MaxLength)
					
					if Segment ~= p2.Text then
						p2.Text = Segment
						
						return
					end
				end
				if OnChangeTextFunction then
					OnChangeTextFunction(p2)
				end
			end,
			[RoactModule.Event.AncestryChanged] = p1.props.onAncestryChanged,
			[RoactModule.Event.ReturnPressedFromOnScreenKeyboard] = p1.props.onReturnPressedFromOnScreenKeyboard,
			[RoactModule.Event.Focused] = p1.props.onFocused,
			[RoactModule.Event.FocusLost] = p1.props.onFocusLost,
			[RoactModule.Event.MouseEnter] = p1.props.onMouseEnter,
			[RoactModule.Event.MouseLeave] = p1.props.onMouseLeave
		})
	})
end

return GenericTextBox