local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local frameHeight = constantsModule.TopBarFormatting.FrameHeight
local var5 = 0.5 * frameHeight
local var6 = (frameHeight - var5) / 2
local userInputService = game:GetService("UserInputService")
local var8 = textService:GetTextSize("Developer Console", constantsModule.DefaultFontSize.TopBar, constantsModule.Font.TopBar, Vector2.new(0, 0))
local liveUpdateElementModule = require(script.Parent.Parent.Components.LiveUpdateElement)
local setDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local devConsoleTopBar = roactModule.Component:extend("DevConsoleTopBar")

function devConsoleTopBar.init(p0) --[[ line: 24 ]]
	-- upvalues: userInputService (ref), roactModule (ref)
	p0.inputChangedConnection = nil
	p0.inputChangedDisconnectRetries = 0
	
	function p0.inputBegan(_, p1) --[[ line: 29 ]]
		-- upvalues: p0 (ref), userInputService (copy)
		if p0.props.isMinimized then return end
		if p1.UserInputType == Enum.UserInputType.MouseButton1 then
			local absolutePosition = p0.ref.current.AbsolutePosition
			local vector3 = Vector3.new(absolutePosition.X, absolutePosition.Y, 0)
			
			if p0.inputChangedConnection then
				p0.inputChangedConnection:Disconnect()
				p0.inputChangedConnection = nil
			end
			p0.inputChangedConnection = userInputService.InputChanged:Connect(function(p2) --[[ line: 44 ]]
				-- upvalues: p0 (copy)
				p0.inputChanged(nil, p2)
			end)
			p0:setState({
				moving = true,
				startPos = vector3,
				startOffset = p1.Position
			})
			p0.inputChangedDisconnectRetries = 1
		end
	end
	
	function p0.inputChanged(_, p3) --[[ line: 58 ]]
		-- upvalues: p0 (ref)
		if p0.state.moving then
			if p3.UserInputType == Enum.UserInputType.MouseMovement then
				local var13 = p0.state.startPos - p0.state.startOffset + p3.Position
				p0.props.dispatchSetDevConsolePosition(UDim2.new(0, var13.X, 0, var13.Y))
				
				return
			end
		elseif p0.inputChangedConnection then
			if p0.inputChangedDisconnectRetries > 0 then
				p0.inputChangedDisconnectRetries -= 1
				
				return
			end
			p0.inputChangedConnection:Disconnect()
			p0.inputChangedConnection = nil
		end
	end
	
	function p0.inputEnded(_, p4) --[[ line: 75 ]]
		-- upvalues: p0 (ref)
		if p4.UserInputType == Enum.UserInputType.MouseButton1 and p4.UserInputState == Enum.UserInputState.End then
			if p0.inputChangedConnection then
				p0.inputChangedConnection:Disconnect()
				p0.inputChangedConnection = nil
			end
			p0:setState({ moving = false })
		end
	end
	
	p0.ref = roactModule.createRef()
end

function devConsoleTopBar.render(p5) --[[ line: 95 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), var8 (ref), frameHeight (ref), liveUpdateElementModule (ref), var5 (ref), var6 (ref)
	local isMinimized = p5.props.isMinimized
	local formFactor = p5.props.formFactor
	local onMinimizeClicked = p5.props.onMinimizeClicked
	local onMaximizeClicked = p5.props.onMaximizeClicked
	local onCloseClicked = p5.props.onCloseClicked
	local _ = p5.state.moving
	local t = {
		WindowTitle = roactModule.createElement("TextLabel", {
			Text = "Developer Console",
			BackgroundTransparency = 1,
			TextSize = constantsModule.DefaultFontSize.TopBar,
			TextColor3 = Color3.new(1, 1, 1),
			Font = constantsModule.Font.TopBar,
			Size = UDim2.new(0, var8.X, 0, frameHeight),
			Position = UDim2.new(0, 4, 0, 0),
			BackgroundColor3 = constantsModule.Color.BaseGray,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	}
	local var15 = var8.X + 8
	local uDim2 = UDim2.new(0, var15, 0, 0)
	local uDim2_1 = UDim2.new(1, -2 * var15, 0, frameHeight)
	
	if isMinimized then
		uDim2 = UDim2.new(0, 0, 1, 0)
		uDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p5.ref.current then
		uDim2_1 = UDim2.new(0, p5.ref.current.AbsoluteSize.X - 2 * var8.X, 0, frameHeight)
	end
	t.LiveStatsModule = roactModule.createElement(liveUpdateElementModule, {
		topBarLiveUpdate = p5.props.topBarLiveUpdate,
		size = uDim2_1,
		position = uDim2
	})
	
	if formFactor == constantsModule.FormFactor.Large then
		if isMinimized then
			t.MaxButton = roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var5, 0, var5),
				Position = UDim2.new(1, -2 * frameHeight + var6, 0, var6),
				BorderColor3 = Color3.new(0, 0, 1),
				BackgroundColor3 = constantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = constantsModule.Image.Maximize,
				[roactModule.Event.Activated] = onMaximizeClicked
			})
		else
			t.MinButton = roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var5, 0, var5),
				Position = UDim2.new(1, -2 * frameHeight + var6, 0, var6),
				BorderColor3 = Color3.new(1, 0, 0),
				BackgroundColor3 = constantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = constantsModule.Image.Minimize,
				[roactModule.Event.Activated] = onMinimizeClicked
			})
		end
	end
	t.CloseButton = roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, var5, 0, var5),
		Position = UDim2.new(1, -frameHeight + var6, 0, var6),
		BorderColor3 = Color3.new(0, 1, 0),
		BackgroundColor3 = constantsModule.Color.BaseGray,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Image = constantsModule.Image.Close,
		[roactModule.Event.Activated] = onCloseClicked
	})
	
	return roactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, frameHeight),
		BackgroundColor3 = constantsModule.Color.Black,
		BackgroundTransparency = 0.5,
		AutoButtonColor = false,
		LayoutOrder = 1,
		[roactModule.Ref] = p5.ref,
		[roactModule.Event.InputBegan] = p5.inputBegan,
		[roactModule.Event.InputEnded] = p5.inputEnded
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p6) --[[ line: 191 | named "mapDispatchToProps" ]]
	-- upvalues: setDevConsolePositionModule (ref)
	return {
		dispatchSetDevConsolePosition = function(value) --[[ line: 193 ]]
			-- upvalues: p6 (ref), setDevConsolePositionModule (copy)
			p6(setDevConsolePositionModule(value))
		end
	}
end)(devConsoleTopBar)