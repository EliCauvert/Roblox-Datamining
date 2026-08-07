local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local focusable = require(corePackagesService.Packages.RoactGamepad).Focusable
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local nameTextBox = roactModule.PureComponent:extend("NameTextBox")
local removeNameRegex = game:DefineFastFlag("RemoveNameRegex", false)
nameTextBox.validateProps = tModule.strictInterface({
	Size = tModule.optional(tModule.UDim2),
	Position = tModule.optional(tModule.UDim2),
	centerText = tModule.optional(tModule.boolean),
	maxLength = tModule.optional(tModule.number),
	onNameUpdated = tModule.callback,
	LayoutOrder = tModule.optional(tModule.number),
	nameTextBoxRef = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	defaultName = tModule.optional(tModule.string),
	invalidInputText = tModule.optional(tModule.string)
})
nameTextBox.defaultProps = {
	maxLength = 50,
	centerText = true,
	invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName")
}

local function _(p0, p1) --[[ line: 47 | named "isNameTooLong" ]]
	local charCount = utf8.len(utf8.nfcnormalize(p0))
	
	return charCount == nil or p1 < charCount
end

function nameTextBox.init(p2) --[[ line: 56 ]]
	p2:setState({
		lastValidName = "",
		isNameValid = true,
		name = p2.props.defaultName or ""
	})
	p2.wasInitiallyFocused = false
	
	function p2.tryFocusTextBox() --[[ line: 65 ]]
		-- upvalues: p2 (ref)
		if p2.wasInitiallyFocused then return end
		local var8 = p2.props.nameTextBoxRef and p2.props.nameTextBoxRef:getValue()
		
		if var8 and var8:IsDescendantOf(game) then
			var8:CaptureFocus()
			p2.wasInitiallyFocused = true
		end
	end
	
	function p2.onTextChanged(p3) --[[ line: 77 ]]
		-- upvalues: p2 (ref)
		local text = p3.Text
		local maxLength = p2.props.maxLength
		local charCount = utf8.len(utf8.nfcnormalize(text))
		
		if charCount == nil or maxLength < charCount then
			text = string.sub(text, 1, utf8.offset(text, maxLength + 1) - 1)
			p3.Text = text
		end
		local var10 = p2:checkIsNameValid(text)
		p2:setState({
			lastValidName = if var10 then p3.Text else p2.state.lastValidName,
			isNameValid = var10,
			name = text
		})
		p2.props.onNameUpdated(text, var10)
	end
end

function nameTextBox.checkIsNameValid(_, p4) --[[ line: 104 ]]
	-- upvalues: removeNameRegex (ref)
	if not removeNameRegex then
		return if string.match(p4, "[0-9a-zA-Z_'%s]+$") then if string.sub(p4, 1, 1) == " " then false else string.match(p4, "^%s*$") else false
	end
end

function nameTextBox.renderWithProviders(p5, p6, p7) --[[ line: 124 ]]
	-- upvalues: roactModule (ref), focusable (ref), cursorKind (ref)
	local font = p6.Font
	local theme = p6.Theme
	local body = font.Body
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p5.props.Size,
		Position = p5.props.Position,
		LayoutOrder = p5.props.LayoutOrder
	}, {
		TextBoxContainer = roactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundColor3 = theme.BackgroundMuted.Color,
			Size = p5.props.Size
		}, {
			Textbox = roactModule.createElement(focusable.TextBox, {
				Text = p5.state.name,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = body.Font,
				TextSize = font.BaseSize * body.RelativeSize,
				PlaceholderColor3 = theme.PlaceHolder.Color,
				PlaceholderText = p5.props.defaultName,
				Position = UDim2.fromOffset(6, 0),
				Size = UDim2.new(1, -12, 1, 0),
				TextColor3 = theme.TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = if not p5.props.centerText then Enum.TextYAlignment.Top else nil,
				OverlayNativeInput = true,
				[roactModule.Change.Text] = p5.onTextChanged,
				SelectionImageObject = p7(cursorKind.InputFields),
				NextSelectionDown = p5.props.NextSelectionDown,
				[roactModule.Ref] = p5.props.nameTextBoxRef,
				[roactModule.Event.AncestryChanged] = p5.tryFocusTextBox
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingTop = if not p5.props.centerText then UDim.new(0, 6) else nil
				})
			}),
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIStroke = roactModule.createElement("UIStroke", {
				Thickness = 0.5,
				Transparency = theme.Divider.Transparency,
				Color = theme.Divider.Color,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			})
		}),
		WarningText = not p5.state.isNameValid and roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			TextSize = 12,
			Position = UDim2.new(0, 0, 1, 0),
			Text = p5.props.invalidInputText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, 0, 0, 20),
			TextColor3 = theme.Alert.Color,
			Font = font.Body.Font
		})
	})
end

function nameTextBox.render(p8) --[[ line: 200 ]]
	-- upvalues: withStyle (ref), withSelectionCursorProvider (ref)
	return withStyle(function(p9) --[[ line: 201 ]]
		-- upvalues: withSelectionCursorProvider (copy), p8 (ref)
		return withSelectionCursorProvider(function(p10) --[[ line: 202 ]]
			-- upvalues: p8 (copy), p9 (ref)
			return p8:renderWithProviders(p9, p10)
		end)
	end)
end

function nameTextBox.didMount(p11) --[[ line: 208 ]]
	p11.tryFocusTextBox()
end

return nameTextBox