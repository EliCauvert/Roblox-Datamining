local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ScrollingTextBox = RoactModule.Component:extend("ScrollingTextBox")

function ScrollingTextBox.init(p1, Label) --[[ Line: 12 ]]
	-- upvalues: TextService (copy), RoactModule (copy)
	local ATextSize = TextService:GetTextSize("A", Label.TextSize, Label.Font, Vector2.new(0, 0))
	
	function p1.adjustOffset() --[[ Line: 15 ]]
		-- upvalues: p1 (copy)
		if p1.clipBox.current and p1.textboxRef.current then
			local FontDims = p1.state.fontDims
			local CursorPositionDelta = p1.textboxRef.current.CursorPosition - 1
			local CursorPositionDeltaDelta = CursorPositionDelta - math.ceil(p1.state.innerXOffset / FontDims.X)
			local Floored = math.floor(p1.clipBox.current.AbsoluteSize.X * 0.9 / FontDims.X)
			
			if Floored < CursorPositionDeltaDelta then
				p1:setState({
					innerXOffset = (CursorPositionDelta - Floored) * FontDims.X
				})
				
				return
			end
			if CursorPositionDeltaDelta < 0 then
				p1:setState({ innerXOffset = CursorPositionDelta * FontDims.X })
			end
		end
	end
	
	p1.clipBox = RoactModule.createRef()
	p1.textboxRef = p1.props.forwardRef or RoactModule.createRef()
	p1.state = { innerXOffset = 0, fontDims = ATextSize }
end

function ScrollingTextBox.didMount(p1) --[[ Line: 49 ]]
	-- upvalues: UserInputService (copy)
	if not p1.onFocusConnection then
		p1.onFocusConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 51 ]]
			-- upvalues: p1 (copy)
			if p1.textboxRef.current and p1.textboxRef.current:IsFocused() then
				if Input.KeyCode == Enum.KeyCode.Home then
					p1.textboxRef.current.CursorPosition = 0
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.End then
					p1.textboxRef.current.CursorPosition = #p1.textboxRef.current.text + 1
					
					return
				end
				p1.adjustOffset()
			end
		end)
	end
end

function ScrollingTextBox.willUnmount(p1) --[[ Line: 66 ]]
	if p1.onFocusConnection then
		p1.onFocusConnection:Disconnect()
		p1.onFocusConnection = nil
	end
end

function ScrollingTextBox.render(p1) --[[ Line: 73 ]]
	-- upvalues: RoactModule (copy)
	local InnerXOffset = p1.state.innerXOffset
	
	return RoactModule.createElement("Frame", {
		Position = p1.props.Position,
		Size = p1.props.Size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[RoactModule.Ref] = p1.clipBox
	}, {
		TextBox = RoactModule.createElement("TextBox", {
			Position = UDim2.new(0, -InnerXOffset, 0, 0),
			Size = UDim2.new(1, InnerXOffset, 1, 0),
			BackgroundTransparency = 1,
			ShowNativeInput = p1.props.ShowNativeInput,
			ClearTextOnFocus = p1.props.ClearTextOnFocus,
			TextColor3 = p1.props.TextColor3,
			TextXAlignment = 0,
			TextSize = p1.props.TextSize,
			Text = p1.props.Text,
			Font = p1.props.Font,
			PlaceholderText = p1.props.PlaceholderText,
			[RoactModule.Ref] = p1.textboxRef,
			[RoactModule.Change.CursorPosition] = p1.adjustOffset,
			[RoactModule.Event.FocusLost] = p1.props.TextBoxFocusLost
		})
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 119 ]]
	-- upvalues: RoactModule (copy), ScrollingTextBox (copy), CryoModule (copy)
	return RoactModule.createElement(ScrollingTextBox, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)