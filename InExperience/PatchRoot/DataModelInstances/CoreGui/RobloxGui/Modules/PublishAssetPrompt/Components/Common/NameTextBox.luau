local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local NameTextBox = RoactModule.PureComponent:extend("NameTextBox")
local RemoveNameRegex = game:DefineFastFlag("RemoveNameRegex", false)
NameTextBox.validateProps = TModule.strictInterface({
	Size = TModule.optional(TModule.UDim2),
	Position = TModule.optional(TModule.UDim2),
	centerText = TModule.optional(TModule.boolean),
	maxLength = TModule.optional(TModule.number),
	onNameUpdated = TModule.callback,
	LayoutOrder = TModule.optional(TModule.number),
	nameTextBoxRef = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	defaultName = TModule.optional(TModule.string),
	invalidInputText = TModule.optional(TModule.string)
})
NameTextBox.defaultProps = {
	maxLength = 50,
	centerText = true,
	invalidInputText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName")
}

local function _(p1, p2): boolean --[[ Line: 50 | Named "isNameTooLong" ]]
	local Length = utf8.len(utf8.nfcnormalize(p1))
	
	return Length == nil or p2 < Length
end

function NameTextBox.init(p1) --[[ Line: 59 ]]
	p1:setState({
		lastValidName = "",
		isNameValid = true,
		name = p1.props.defaultName or ""
	})
	p1.wasInitiallyFocused = false
	
	function p1.tryFocusTextBox() --[[ Line: 68 ]]
		-- upvalues: p1 (copy)
		if p1.wasInitiallyFocused then return end
		local Value = p1.props.nameTextBoxRef and p1.props.nameTextBoxRef:getValue()
		
		if Value and Value:IsDescendantOf(game) then
			Value:CaptureFocus()
			p1.wasInitiallyFocused = true
		end
	end
	
	function p1.onTextChanged(p2) --[[ Line: 80 ]]
		-- upvalues: p1 (copy)
		local Text = p2.Text
		local MaxLength: number = p1.props.maxLength
		local Length = utf8.len(utf8.nfcnormalize(Text))
		
		if Length == nil or MaxLength < Length then
			Text = string.sub(Text, 1, utf8.offset(Text, MaxLength + 1) - 1)
			p2.Text = Text
		end
		local CheckIsNameValidResult = p1:checkIsNameValid(Text)
		p1:setState({
			lastValidName = if CheckIsNameValidResult then p2.Text else p1.state.lastValidName,
			isNameValid = CheckIsNameValidResult,
			name = Text
		})
		p1.props.onNameUpdated(Text, CheckIsNameValidResult)
	end
end

function NameTextBox:checkIsNameValid(Text: string): boolean --[[ Line: 107 ]]
	-- upvalues: RemoveNameRegex (copy)
	if not RemoveNameRegex then
		if not string.match(Text, "[0-9a-zA-Z_'%s]+$") then
			return false
		elseif string.sub(Text, 1, 1) == " " then
			return false
		end
	end
	return not string.match(Text, "^%s*$")
end

function NameTextBox.renderWithProviders(p1, p2, Callback) --[[ Line: 127 ]]
	-- upvalues: RoactModule (copy), Focusable (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CursorKind (copy)
	local _Font = p2.Font
	local Theme = p2.Theme
	local Body = _Font.Body
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.Size,
		Position = p1.props.Position,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		TextBoxContainer = RoactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundColor3 = Theme.BackgroundMuted.Color,
			Size = p1.props.Size
		}, {
			Textbox = RoactModule.createElement(Focusable.TextBox, {
				Text = p1.state.name,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = if FoundationFontFaceMigration then nil else Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
				TextSize = _Font.BaseSize * Body.RelativeSize,
				PlaceholderColor3 = Theme.PlaceHolder.Color,
				PlaceholderText = p1.props.defaultName,
				Position = UDim2.fromOffset(6, 0),
				Size = UDim2.new(1, -12, 1, 0),
				TextColor3 = Theme.TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = if p1.props.centerText then nil else Enum.TextYAlignment.Top,
				OverlayNativeInput = true,
				[RoactModule.Change.Text] = p1.onTextChanged,
				SelectionImageObject = Callback(CursorKind.InputFields),
				NextSelectionDown = p1.props.NextSelectionDown,
				[RoactModule.Ref] = p1.props.nameTextBoxRef,
				[RoactModule.Event.AncestryChanged] = p1.tryFocusTextBox
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingTop = if p1.props.centerText then nil else UDim.new(0, 6)
				})
			}),
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIStroke = RoactModule.createElement("UIStroke", {
				Thickness = 0.5,
				Transparency = Theme.Divider.Transparency,
				Color = Theme.Divider.Color,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			})
		}),
		WarningText = not p1.state.isNameValid and RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			TextSize = 12,
			Position = UDim2.new(0, 0, 1, 0),
			Text = p1.props.invalidInputText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, 0, 0, 20),
			TextColor3 = Theme.Alert.Color,
			Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil
		})
	})
end

function NameTextBox.render(p1) --[[ Line: 209 ]]
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2) --[[ Line: 210 ]]
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3) --[[ Line: 211 ]]
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function NameTextBox.didMount(p1) --[[ Line: 217 ]]
	p1.tryFocusTextBox()
end

return NameTextBox