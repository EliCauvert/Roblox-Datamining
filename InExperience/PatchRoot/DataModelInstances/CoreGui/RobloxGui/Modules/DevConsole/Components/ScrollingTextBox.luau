local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local textService = game:GetService("TextService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local scrollingTextBox = roactModule.Component:extend("ScrollingTextBox")

function scrollingTextBox.init(p0, p1) --[[ line: 12 ]]
	-- upvalues: textService (ref), roactModule (ref)
	local aTextSize = textService:GetTextSize("A", p1.TextSize, p1.Font, Vector2.new(0, 0))
	
	function p0.adjustOffset() --[[ line: 15 ]]
		-- upvalues: p0 (ref)
		if p0.clipBox.current and p0.textboxRef.current then
			local fontDims = p0.state.fontDims
			local var7 = p0.textboxRef.current.CursorPosition - 1
			local var8 = var7 - math.ceil(p0.state.innerXOffset / fontDims.X)
			local floored = math.floor(p0.clipBox.current.AbsoluteSize.X * 0.9 / fontDims.X)
			
			if floored < var8 then
				p0:setState({ innerXOffset = (var7 - floored) * fontDims.X })
				
				return
			elseif var8 < 0 then
				p0:setState({ innerXOffset = var7 * fontDims.X })
			end
		end
	end
	
	p0.clipBox = roactModule.createRef()
	p0.textboxRef = p0.props.forwardRef or roactModule.createRef()
	p0.state = { innerXOffset = 0, fontDims = aTextSize }
end

function scrollingTextBox.didMount(p2) --[[ line: 49 ]]
	-- upvalues: userInputService (ref)
	if not p2.onFocusConnection then
		p2.onFocusConnection = userInputService.InputBegan:Connect(function(p3) --[[ line: 51 ]]
			-- upvalues: p2 (ref)
			if p2.textboxRef.current and p2.textboxRef.current:IsFocused() then
				if p3.KeyCode == Enum.KeyCode.Home then
					p2.textboxRef.current.CursorPosition = 0
					
					return
				elseif p3.KeyCode == Enum.KeyCode.End then
					p2.textboxRef.current.CursorPosition = #p2.textboxRef.current.text + 1
					
					return
				end
				p2.adjustOffset()
			end
		end)
	end
end

function scrollingTextBox.willUnmount(p4) --[[ line: 66 ]]
	if p4.onFocusConnection then
		p4.onFocusConnection:Disconnect()
		p4.onFocusConnection = nil
	end
end

function scrollingTextBox.render(p5) --[[ line: 73 ]]
	-- upvalues: roactModule (ref)
	local innerXOffset = p5.state.innerXOffset
	
	return roactModule.createElement("Frame", {
		Position = p5.props.Position,
		Size = p5.props.Size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[roactModule.Ref] = p5.clipBox
	}, {
		TextBox = roactModule.createElement("TextBox", {
			Position = UDim2.new(0, -innerXOffset, 0, 0),
			Size = UDim2.new(1, innerXOffset, 1, 0),
			BackgroundTransparency = 1,
			ShowNativeInput = p5.props.ShowNativeInput,
			ClearTextOnFocus = p5.props.ClearTextOnFocus,
			TextColor3 = p5.props.TextColor3,
			TextXAlignment = 0,
			TextSize = p5.props.TextSize,
			Text = p5.props.Text,
			Font = p5.props.Font,
			PlaceholderText = p5.props.PlaceholderText,
			[roactModule.Ref] = p5.textboxRef,
			[roactModule.Change.CursorPosition] = p5.adjustOffset,
			[roactModule.Event.FocusLost] = p5.props.TextBoxFocusLost
		})
	})
end

return roactModule.forwardRef(function(p6, p7) --[[ line: 119 ]]
	-- upvalues: roactModule (ref), scrollingTextBox (ref), cryoModule (ref)
	return roactModule.createElement(scrollingTextBox, cryoModule.Dictionary.join(p6, { forwardRef = p7 }))
end)