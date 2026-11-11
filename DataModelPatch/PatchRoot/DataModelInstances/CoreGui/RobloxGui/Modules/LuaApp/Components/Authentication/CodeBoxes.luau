local UserInputService = game:GetService("UserInputService")
local AppFonts = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local GenericTextButtonModule = require(Modules.LuaApp.Components.GenericTextButton)
local ColorsModule = require(Modules.LuaApp.Themes.Colors)
local CodeBoxes = RoactModule.Component:extend("CodeBoxes")
CodeBoxes.defaultProps = { characterCount = 6, value = "", Transparency = 0 }

function CodeBoxes.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { textCursorVisible = true, textBoxOffset = 1000 }
	p1.textBoxRef = RoactModule.createRef()
	
	function p1.onTextChanged(p2, CharacterCount)
		-- upvalues: p1 (copy)
		local D = p2.Text:gsub("[^%d]", "")
		
		if CharacterCount < #p2.Text then
			D = D:sub(1, CharacterCount)
		end
		if p2.Text ~= D then
			p2.Text = D
			
			return
		end
		if p1.props.onValueChanged then
			p1.props.onValueChanged(D)
		end
		if #p2.Text == CharacterCount and p1.props.onAllBoxesFilled then
			p1.props.onAllBoxesFilled()
		end
	end
	
	function p1:onCodeBoxActivated()
		-- upvalues: p1 (copy)
		local TextBoxRef = p1.textBoxRef
		
		if not TextBoxRef then return end
		if TextBoxRef.current then
			TextBoxRef.current:CaptureFocus()
			
			return
		end
	end
	
	function p1.updateTextBoxOffset(Frame)
		-- upvalues: p1 (copy)
		if p1.mounted and p1.props.screenHeight then
			p1:setState({
				textBoxOffset = p1.props.screenHeight - Frame.AbsolutePosition.Y + 100
			})
		end
	end
end

function CodeBoxes.didMount(p1)
	p1.mounted = true
	spawn(function()
		-- upvalues: p1 (copy)
		if p1.mounted and p1.props.shouldFocus and p1.textBoxRef.current then
			p1.textBoxRef.current:CaptureFocus()
		end
		while p1.mounted do
			p1:setState({ textCursorVisible = not p1.state.textCursorVisible })
			wait(0.5)
		end
	end)
end

function CodeBoxes.willUnmount(p2)
	p2.mounted = false
end

function CodeBoxes.didUpdate(p2, p3, _)
	if p2.textBoxRef.current and not p3.shouldFocus and p2.props.shouldFocus then
		p2.textBoxRef.current:CaptureFocus()
	end
end

function CodeBoxes.render(p2)
	-- upvalues: RoactModule (copy), UserInputService (copy), GenericTextButtonModule (copy), AppFonts (copy), ColorsModule (copy)
	local CharacterCount: number = p2.props.characterCount
	local LayoutOrder = p2.props.LayoutOrder
	local Value: string = p2.props.value
	local Transparency: number = p2.props.Transparency
	local TextBoxRef = p2.textBoxRef
	local OnInvisibleTextBoxAncestryChanged = p2.props.onInvisibleTextBoxAncestryChanged
	local OnInvisibleTextBoxFocused = p2.props.onInvisibleTextBoxFocused
	local NewTransparency = 0.3 + Transparency * 0.7
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 13)
		})
	}
	local _UDim2 = UDim2.new(1 / CharacterCount, 13 / (CharacterCount + 1) - 13, 1, 0)
	
	for i = 1, CharacterCount do
		config[i] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = _UDim2,
			LayoutOrder = i
		}, {
			Character = RoactModule.createElement(GenericTextButtonModule, {
				TextSize = 16,
				isDisabled = false,
				isLoading = false,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 1, 0),
				Text = if TextBoxRef and TextBoxRef.current and i == #Value + 1 and UserInputService:GetFocusedTextBox() == TextBoxRef.current then if p2.state.textCursorVisible then "|" else "" else Value:sub(i, i) or "",
				Font = AppFonts.default:getDefault(),
				themeSettings = {
					Color = ColorsModule.Black,
					Transparency = NewTransparency,
					OnPressColor = ColorsModule.Black,
					OnPressTransparency = NewTransparency,
					Text = { Color = ColorsModule.White, Transparency = Transparency },
					Border = { Hidden = true, Transparency = 1 }
				},
				onActivated = p2.onCodeBoxActivated
			})
		})
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		[RoactModule.Change.AbsolutePosition] = p2.updateTextBoxOffset
	}, {
		CodeCharacters = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 36),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, config),
		InvisibleTextBox = RoactModule.createElement("TextBox", {
			Size = UDim2.new(0, 1, 0, 1),
			Position = UDim2.new(0, 0, 0, p2.state.textBoxOffset),
			BackgroundTransparency = 1,
			TextTransparency = 1,
			Text = Value,
			TextSize = 1,
			OverlayNativeInput = true,
			ManualFocusRelease = true,
			ClearTextOnFocus = false,
			TextInputType = Enum.TextInputType.Number,
			[RoactModule.Ref] = TextBoxRef,
			[RoactModule.Change.Text] = function(p3)
				-- upvalues: p2 (copy), CharacterCount (copy)
				p2.onTextChanged(p3, CharacterCount)
			end,
			[RoactModule.Event.AncestryChanged] = OnInvisibleTextBoxAncestryChanged,
			[RoactModule.Event.Focused] = OnInvisibleTextBoxFocused
		})
	})
end

return (RoactRoduxModule.connect(function(p3, _)
	return { screenHeight = p3.ScreenSize.Y }
end)(CodeBoxes))