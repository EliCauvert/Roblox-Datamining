local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(script.Parent.Parent.Constants)
local FrameHeight: number = ConstantsModule.TopBarFormatting.FrameHeight
local XOffset = 0.5 * FrameHeight
local FrameHeightRatio = (FrameHeight - XOffset) / 2
local UserInputService = game:GetService("UserInputService")
local DeveloperConsoleTextSize = game:GetService("TextService"):GetTextSize("Developer Console", ConstantsModule.DefaultFontSize.TopBar, ConstantsModule.Font.TopBar, Vector2.new(0, 0))
local LiveUpdateElementModule = require(script.Parent.Parent.Components.LiveUpdateElement)
local SetDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local DevConsoleTopBar = RoactModule.Component:extend("DevConsoleTopBar")

function DevConsoleTopBar.init(p1)
	-- upvalues: UserInputService (copy), RoactModule (copy)
	p1.inputChangedConnection = nil
	p1.inputChangedDisconnectRetries = 0
	
	function p1:inputBegan(Input)
		-- upvalues: p1 (copy), UserInputService (upval)
		if p1.props.isMinimized then return end
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			local AbsolutePosition = p1.ref.current.AbsolutePosition
			local _Vector3 = Vector3.new(AbsolutePosition.X, AbsolutePosition.Y, 0)
			
			if p1.inputChangedConnection then
				p1.inputChangedConnection:Disconnect()
				p1.inputChangedConnection = nil
			end
			p1.inputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: p1 (upval)
				p1.inputChanged(nil, Input)
			end)
			p1:setState({
				moving = true,
				startPos = _Vector3,
				startOffset = Input.Position
			})
			p1.inputChangedDisconnectRetries = 1
		end
	end
	
	function p1:inputChanged(Input)
		-- upvalues: p1 (copy)
		if p1.state.moving then
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				local NewStartPos = p1.state.startPos - p1.state.startOffset + Input.Position
				p1.props.dispatchSetDevConsolePosition((UDim2.new(0, NewStartPos.X, 0, NewStartPos.Y)))
				
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
	
	function p1:inputEnded(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and Input.UserInputState == Enum.UserInputState.End then
			if p1.inputChangedConnection then
				p1.inputChangedConnection:Disconnect()
				p1.inputChangedConnection = nil
			end
			p1:setState({ moving = false })
		end
	end
	
	p1.ref = RoactModule.createRef()
end

function DevConsoleTopBar.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), DeveloperConsoleTextSize (copy), FrameHeight (copy), LiveUpdateElementModule (copy), XOffset (copy), FrameHeightRatio (copy)
	local IsMinimized = p1.props.isMinimized
	local FormFactor = p1.props.formFactor
	local OnMinimizeClicked = p1.props.onMinimizeClicked
	local OnMaximizeClicked = p1.props.onMaximizeClicked
	local OnCloseClicked = p1.props.onCloseClicked
	local _ = p1.state.moving
	local config = {
		WindowTitle = RoactModule.createElement("TextLabel", {
			Text = "Developer Console",
			BackgroundTransparency = 1,
			TextSize = ConstantsModule.DefaultFontSize.TopBar,
			TextColor3 = Color3.new(1, 1, 1),
			Font = ConstantsModule.Font.TopBar,
			Size = UDim2.new(0, DeveloperConsoleTextSize.X, 0, FrameHeight),
			Position = UDim2.new(0, 4, 0, 0),
			BackgroundColor3 = ConstantsModule.Color.BaseGray,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	}
	local NewX = DeveloperConsoleTextSize.X + 8
	local _UDim2 = UDim2.new(0, NewX, 0, 0)
	local _UDim2_1 = UDim2.new(1, -2 * NewX, 0, FrameHeight)
	
	if IsMinimized then
		_UDim2 = UDim2.new(0, 0, 1, 0)
		_UDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p1.ref.current then
		_UDim2_1 = UDim2.new(0, p1.ref.current.AbsoluteSize.X - 2 * DeveloperConsoleTextSize.X, 0, FrameHeight)
	end
	config.LiveStatsModule = RoactModule.createElement(LiveUpdateElementModule, {
		topBarLiveUpdate = p1.props.topBarLiveUpdate,
		size = _UDim2_1,
		position = _UDim2
	})
	
	if FormFactor == ConstantsModule.FormFactor.Large then
		if IsMinimized then
			config.MaxButton = RoactModule.createElement("ImageButton", {
				Size = UDim2.new(0, XOffset, 0, XOffset),
				Position = UDim2.new(1, -2 * FrameHeight + FrameHeightRatio, 0, FrameHeightRatio),
				BorderColor3 = Color3.new(0, 0, 1),
				BackgroundColor3 = ConstantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = ConstantsModule.Image.Maximize,
				[RoactModule.Event.Activated] = OnMaximizeClicked
			})
		else
			config.MinButton = RoactModule.createElement("ImageButton", {
				Size = UDim2.new(0, XOffset, 0, XOffset),
				Position = UDim2.new(1, -2 * FrameHeight + FrameHeightRatio, 0, FrameHeightRatio),
				BorderColor3 = Color3.new(1, 0, 0),
				BackgroundColor3 = ConstantsModule.Color.BaseGray,
				BackgroundTransparency = 1,
				Image = ConstantsModule.Image.Minimize,
				[RoactModule.Event.Activated] = OnMinimizeClicked
			})
		end
	end
	config.CloseButton = RoactModule.createElement("ImageButton", {
		Size = UDim2.new(0, XOffset, 0, XOffset),
		Position = UDim2.new(1, -FrameHeight + FrameHeightRatio, 0, FrameHeightRatio),
		BorderColor3 = Color3.new(0, 1, 0),
		BackgroundColor3 = ConstantsModule.Color.BaseGray,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Image = ConstantsModule.Image.Close,
		[RoactModule.Event.Activated] = OnCloseClicked
	})
	
	return RoactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, FrameHeight),
		BackgroundColor3 = ConstantsModule.Color.Black,
		BackgroundTransparency = 0.5,
		AutoButtonColor = false,
		LayoutOrder = 1,
		[RoactModule.Ref] = p1.ref,
		[RoactModule.Event.InputBegan] = p1.inputBegan,
		[RoactModule.Event.InputEnded] = p1.inputEnded
	}, config)
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetDevConsolePositionModule (copy)
	return {
		dispatchSetDevConsolePosition = function(p1)
			-- upvalues: Callback (copy), SetDevConsolePositionModule (upval)
			Callback(SetDevConsolePositionModule(p1))
		end
	}
end)(DevConsoleTopBar)