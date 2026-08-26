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

local function _(p1, p2)
	local charCount = utf8.len(utf8.nfcnormalize(p1))
	
	return charCount == nil or p2 < charCount
end

function nameTextBox.init(p1)
	p1:setState({
		lastValidName = "",
		isNameValid = true,
		name = p1.props.defaultName or ""
	})
	p1.wasInitiallyFocused = false
	
	function p2.tryFocusTextBox()
		-- upvalues: p1 (ref)
		if p1.wasInitiallyFocused then return end
		local var1 = p1.props.nameTextBoxRef and p1.props.nameTextBoxRef:getValue()
		
		if var1 and var1:IsDescendantOf(game) then
			var1:CaptureFocus()
			p1.wasInitiallyFocused = true
		end
	end
	
	function p2.onTextChanged(p2)
		-- upvalues: p1 (ref)
		local text = p2.Text
		local maxLength = p1.props.maxLength
		local charCount = utf8.len(utf8.nfcnormalize(text))
		
		if charCount == nil or maxLength < charCount then
			text = string.sub(text, 1, utf8.offset(text, maxLength + 1) - 1)
			p2.Text = text
		end
		local var1 = p1:checkIsNameValid(text)
		p1:setState({
			lastValidName = if var1 then p2.Text else p1.state.lastValidName,
			isNameValid = var1,
			name = text
		})
		p1.props.onNameUpdated(text, var1)
	end
end

function nameTextBox.checkIsNameValid(_, p1)
	-- upvalues: removeNameRegex (ref)
	if not removeNameRegex then
		return if string.match(p1, "[0-9a-zA-Z_'%s]+$") then if string.sub(p1, 1, 1) == " " then false else string.match(p1, "^%s*$") else false
	end
end

function nameTextBox.renderWithProviders(p1, p2, p3)
	-- upvalues: roactModule (ref), focusable (ref), cursorKind (ref)
	local font = p2.Font
	local theme = p2.Theme
	local body = font.Body
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.Size,
		Position = p1.props.Position,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		TextBoxContainer = roactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundColor3 = theme.BackgroundMuted.Color,
			Size = p1.props.Size
		}, {
			Textbox = roactModule.createElement(focusable.TextBox, {
				Text = p1.state.name,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = body.Font,
				TextSize = font.BaseSize * body.RelativeSize,
				PlaceholderColor3 = theme.PlaceHolder.Color,
				PlaceholderText = p1.props.defaultName,
				Position = UDim2.fromOffset(6, 0),
				Size = UDim2.new(1, -12, 1, 0),
				TextColor3 = theme.TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = if not p1.props.centerText then Enum.TextYAlignment.Top else nil,
				OverlayNativeInput = true,
				[roactModule.Change.Text] = p1.onTextChanged,
				SelectionImageObject = p3(cursorKind.InputFields),
				NextSelectionDown = p1.props.NextSelectionDown,
				[roactModule.Ref] = p1.props.nameTextBoxRef,
				[roactModule.Event.AncestryChanged] = p1.tryFocusTextBox
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingTop = if not p1.props.centerText then UDim.new(0, 6) else nil
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
		WarningText = not p1.state.isNameValid and roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			TextSize = 12,
			Position = UDim2.new(0, 0, 1, 0),
			Text = p1.props.invalidInputText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, 0, 0, 20),
			TextColor3 = theme.Alert.Color,
			Font = font.Body.Font
		})
	})
end

function nameTextBox.render(p1)
	-- upvalues: withStyle (ref), withSelectionCursorProvider (ref)
	return withStyle(function(p2)
		-- upvalues: withSelectionCursorProvider (copy), p1 (ref)
		return withSelectionCursorProvider(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function nameTextBox.didMount(p1)
	p1.tryFocusTextBox()
end

return nameTextBox