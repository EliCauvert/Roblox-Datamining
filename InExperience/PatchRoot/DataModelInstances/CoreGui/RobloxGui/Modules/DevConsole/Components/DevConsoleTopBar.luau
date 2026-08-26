local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local frameHeight = constantsModule.TopBarFormatting.FrameHeight
local var1 = 0.5 * frameHeight
local var2 = (frameHeight - var1) / 2
local userInputService = game:GetService("UserInputService")
local var3 = textService:GetTextSize("Developer Console", constantsModule.DefaultFontSize.TopBar, constantsModule.Font.TopBar, Vector2.new(0, 0))
local liveUpdateElementModule = require(script.Parent.Parent.Components.LiveUpdateElement)
local setDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local devConsoleTopBar = roactModule.Component:extend("DevConsoleTopBar")

function devConsoleTopBar.init(p1)
	-- upvalues: userInputService (ref), roactModule (ref)
	p1.inputChangedConnection = nil
	p1.inputChangedDisconnectRetries = 0
	
	function p0.inputBegan(_, p2)
		-- upvalues: p1 (ref), userInputService (copy)
		if p1.props.isMinimized then return end
		if p2.UserInputType == Enum.UserInputType.MouseButton1 then
			local absolutePosition = p1.ref.current.AbsolutePosition
			local vector3 = Vector3.new(absolutePosition.X, absolutePosition.Y, 0)
			
			if p1.inputChangedConnection then
				p1.inputChangedConnection:Disconnect()
				p1.inputChangedConnection = nil
			end
			p1.inputChangedConnection = userInputService.InputChanged:Connect(function(p3)
				-- upvalues: p1 (copy)
				p1.inputChanged(nil, p3)
			end)
			p1:setState({
				moving = true,
				startPos = vector3,
				startOffset = p2.Position
			})
			p1.inputChangedDisconnectRetries = 1
		end
	end
	
	function p0.inputChanged(_, p2)
		-- upvalues: p1 (ref)
		if p1.state.moving then
			if p2.UserInputType == Enum.UserInputType.MouseMovement then
				local var4 = p1.state.startPos - p1.state.startOffset + p2.Position
				p1.props.dispatchSetDevConsolePosition(UDim2.new(0, var4.X, 0, var4.Y))
				
				return
			end
		elseif p1.inputChangedConnection then
			if p1.inputChangedDisconnectRetries > 0 then
				p1.inputChangedDisconnectRetries -= 1
				
				return
			end
			p1.inputChangedConnection:Disconnect()
			p1.inputChangedConnection = nil
		end
	end
	
	function p0.inputEnded(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 and p2.UserInputState == Enum.UserInputState.End then
			if p1.inputChangedConnection then
				p1.inputChangedConnection:Disconnect()
				p1.inputChangedConnection = nil
			end
			p1:setState({ moving = false })
		end
	end
	
	p1.ref = roactModule.createRef()
end

function devConsoleTopBar.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), var3 (ref), frameHeight (ref), liveUpdateElementModule (ref), var1 (ref), var2 (ref)
	local isMinimized = p1.props.isMinimized
	local formFactor = p1.props.formFactor
	local onMinimizeClicked = p1.props.onMinimizeClicked
	local onMaximizeClicked = p1.props.onMaximizeClicked
	local onCloseClicked = p1.props.onCloseClicked
	local _ = p1.state.moving
	local t = {
		WindowTitle = roactModule.createElement("TextLabel", {
			Text = "Developer Console",
			BackgroundTransparency = 1,
			TextSize = constantsModule.DefaultFontSize.TopBar,
			TextColor3 = Color3.new(1, 1, 1),
			Font = constantsModule.Font.TopBar,
			Size = UDim2.new(0, var3.X, 0, frameHeight),
			Position = UDim2.new(0, 4, 0, 0),
			BackgroundColor3 = constantsModule.Color.BaseGray,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	}
	local var4 = var3.X + 8
	local uDim2 = UDim2.new(0, var4, 0, 0)
	local uDim2_1 = UDim2.new(1, -2 * var4, 0, frameHeight)
	
	if isMinimized then
		uDim2 = UDim2.new(0, 0, 1, 0)
		uDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p1.ref.current then
		uDim2_1 = UDim2.new(0, p1.ref.current.AbsoluteSize.X - 2 * var3.X, 0, frameHeight)
	end
	t.LiveStatsModule = roactModule.createElement(liveUpdateElementModule, {
		topBarLiveUpdate = p1.props.topBarLiveUpdate,
		size = uDim2_1,
		position = uDim2
	})
	
	if formFactor == constantsModule.FormFactor.Large then
		if isMinimized then
			t.MaxButton = roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var1, 0, var1),
				Position = UDim2.new(1, -2 * frameHeight + var2, 0, var2),
				BorderColor3 = Color3.new(0, 0, 1),
				BackgroundColor3 = constantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = constantsModule.Image.Maximize,
				[roactModule.Event.Activated] = onMaximizeClicked
			})
		else
			t.MinButton = roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var1, 0, var1),
				Position = UDim2.new(1, -2 * frameHeight + var2, 0, var2),
				BorderColor3 = Color3.new(1, 0, 0),
				BackgroundColor3 = constantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = constantsModule.Image.Minimize,
				[roactModule.Event.Activated] = onMinimizeClicked
			})
		end
	end
	t.CloseButton = roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, var1, 0, var1),
		Position = UDim2.new(1, -frameHeight + var2, 0, var2),
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
		[roactModule.Ref] = p1.ref,
		[roactModule.Event.InputBegan] = p1.inputBegan,
		[roactModule.Event.InputEnded] = p1.inputEnded
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setDevConsolePositionModule (ref)
	return {
		dispatchSetDevConsolePosition = function(value)
			-- upvalues: p1 (ref), setDevConsolePositionModule (copy)
			p1(setDevConsolePositionModule(value))
		end
	}
end)(devConsoleTopBar)