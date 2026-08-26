local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local textService = game:GetService("TextService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local scrollingTextBox = roactModule.Component:extend("ScrollingTextBox")

function scrollingTextBox.init(p1, p2)
	-- upvalues: textService (ref), roactModule (ref)
	local aTextSize = textService:GetTextSize("A", p2.TextSize, p2.Font, Vector2.new(0, 0))
	
	function p0.adjustOffset()
		-- upvalues: p1 (ref)
		if p1.clipBox.current and p1.textboxRef.current then
			local fontDims = p1.state.fontDims
			local var1 = p1.textboxRef.current.CursorPosition - 1
			local var2 = var1 - math.ceil(p1.state.innerXOffset / fontDims.X)
			local floored = math.floor(p1.clipBox.current.AbsoluteSize.X * 0.9 / fontDims.X)
			
			if floored < var2 then
				p1:setState({ innerXOffset = (var1 - floored) * fontDims.X })
				
				return
			elseif var2 < 0 then
				p1:setState({ innerXOffset = var1 * fontDims.X })
			end
		end
	end
	
	p1.clipBox = roactModule.createRef()
	p1.textboxRef = p1.props.forwardRef or roactModule.createRef()
	p1.state = { innerXOffset = 0, fontDims = aTextSize }
end

function scrollingTextBox.didMount(p1)
	-- upvalues: userInputService (ref)
	if not p1.onFocusConnection then
		p1.onFocusConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: p1 (ref)
			if p1.textboxRef.current and p1.textboxRef.current:IsFocused() then
				if p2.KeyCode == Enum.KeyCode.Home then
					p1.textboxRef.current.CursorPosition = 0
					
					return
				elseif p2.KeyCode == Enum.KeyCode.End then
					p1.textboxRef.current.CursorPosition = #p1.textboxRef.current.text + 1
					
					return
				end
				p1.adjustOffset()
			end
		end)
	end
end

function scrollingTextBox.willUnmount(p1)
	if p1.onFocusConnection then
		p1.onFocusConnection:Disconnect()
		p1.onFocusConnection = nil
	end
end

function scrollingTextBox.render(p1)
	-- upvalues: roactModule (ref)
	local innerXOffset = p1.state.innerXOffset
	
	return roactModule.createElement("Frame", {
		Position = p1.props.Position,
		Size = p1.props.Size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[roactModule.Ref] = p1.clipBox
	}, {
		TextBox = roactModule.createElement("TextBox", {
			Position = UDim2.new(0, -innerXOffset, 0, 0),
			Size = UDim2.new(1, innerXOffset, 1, 0),
			BackgroundTransparency = 1,
			ShowNativeInput = p1.props.ShowNativeInput,
			ClearTextOnFocus = p1.props.ClearTextOnFocus,
			TextColor3 = p1.props.TextColor3,
			TextXAlignment = 0,
			TextSize = p1.props.TextSize,
			Text = p1.props.Text,
			Font = p1.props.Font,
			PlaceholderText = p1.props.PlaceholderText,
			[roactModule.Ref] = p1.textboxRef,
			[roactModule.Change.CursorPosition] = p1.adjustOffset,
			[roactModule.Event.FocusLost] = p1.props.TextBoxFocusLost
		})
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), scrollingTextBox (ref), cryoModule (ref)
	return roactModule.createElement(scrollingTextBox, cryoModule.Dictionary.join(p1, { forwardRef = p2 }))
end)