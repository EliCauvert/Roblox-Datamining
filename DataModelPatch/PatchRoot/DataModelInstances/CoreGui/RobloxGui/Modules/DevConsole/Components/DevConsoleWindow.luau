local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local SetMouseVisibilityModule = require(script.Parent.Parent.Util.setMouseVisibility)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local FrameHeight = ConstantsModule.TopBarFormatting.FrameHeight
local WindowPadding = ConstantsModule.Padding.WindowPadding
local MinSize = ConstantsModule.MainWindowInit.MinSize
local DevConsoleTopBarModule = require(Parent.Components.DevConsoleTopBar)
local Actions = script.Parent.Parent.Actions
local ChangeDevConsoleSizeModule = require(Actions.ChangeDevConsoleSize)
local SetDevConsoleVisibilityModule = require(Actions.SetDevConsoleVisibility)
local SetDevConsoleMinimizedModule = require(Actions.SetDevConsoleMinimized)
local DevConsoleWindow = RoactModule.PureComponent:extend("DevConsoleWindow")

function DevConsoleWindow.onMinimizeClicked(p1)
	p1.props.dispatchSetDevConsoleMinimized(true)
end

function DevConsoleWindow.onMaximizeClicked(p1)
	p1.props.dispatchSetDevConsoleMinimized(false)
end

function DevConsoleWindow.onCloseClicked(p1)
	p1.props.onCloseCallback(false)
	p1.props.dispatchSetDevConsolVisibility(false)
end

function DevConsoleWindow.init(p1)
	-- upvalues: MinSize (copy), UserInputService (copy), RoactModule (copy)
	function p1.setDevConsoleSize(p2, AbsolutePosition, AbsolutePosition1)
		-- upvalues: MinSize (upval)
		local XDelta = AbsolutePosition1.X - AbsolutePosition.X
		local YDelta = AbsolutePosition1.Y - AbsolutePosition.Y
		p2.props.dispatchChangeDevConsoleSize(UDim2.new(0, XDelta < MinSize.X and MinSize.X or XDelta, 0, YDelta < MinSize.Y and MinSize.Y or YDelta))
	end
	
	function p1:resizeInputBegan(Input)
		-- upvalues: p1 (copy), UserInputService (upval)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			local Connection = nil
			local Connection1 = nil
			
			local function onInputEnded(Input)
				-- upvalues: Connection (ref), Connection1 (ref)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Connection:Disconnect()
					Connection1:Disconnect()
				end
			end
			
			Connection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: p1 (upval)
				p1:setDevConsoleSize(p1.ref.current.AbsolutePosition, Input.Position)
			end)
			Connection1 = UserInputService.InputEnded:Connect(onInputEnded)
		end
	end
	
	function p1.doGamepadMenuButton(Input)
		-- upvalues: p1 (copy)
		if p1.props.isVisible and (Input.KeyCode == Enum.KeyCode.ButtonStart or Input.KeyCode == Enum.KeyCode.Escape) then
			p1.props.dispatchSetDevConsolVisibility(false)
		end
	end
	
	p1.ref = RoactModule.createRef()
	p1.state = { resizing = false }
end

function DevConsoleWindow.didMount(p1)
	-- upvalues: SetMouseVisibilityModule (copy), UserInputService (copy)
	delay(0, function()
		-- upvalues: p1 (copy)
		if p1.ref.current then
			p1:setDevConsoleSize(p1.ref.current.AbsolutePosition, p1.ref.current.ResizeButton.AbsolutePosition)
		end
	end)
	SetMouseVisibilityModule(p1.props.isVisible)
	p1.gamepadMenuListener = UserInputService.InputBegan:Connect(p1.doGamepadMenuButton)
end

function DevConsoleWindow.willUnmount(p1)
	-- upvalues: GuiService (copy)
	if GuiService.SelectedCoreObject == p1.ref.current then
		GuiService.SelectedCoreObject = nil
	end
	p1.gamepadMenuListener:Disconnect()
end

function DevConsoleWindow.didUpdate(p1, p2, _)
	-- upvalues: SetMouseVisibilityModule (copy), GuiService (copy), UserInputService (copy)
	SetMouseVisibilityModule(p1.props.isVisible)
	
	if p1.props.isMinimized and GuiService.SelectedCoreObject == p1.ref.current then
		GuiService.SelectedCoreObject = nil
		
		return
	end
	if p1.props.isVisible ~= p2.isVisible or p1.props.currTabIndex ~= p2.currTabIndex then
		if Enum.UserInputType.Gamepad1 == UserInputService:GetLastInputType() and p1.props.isVisible then
			GuiService.SelectedCoreObject = p1.ref.current
			
			return
		end
		GuiService.SelectedCoreObject = nil
	end
end

function DevConsoleWindow.render(p1)
	-- upvalues: ConstantsModule (copy), RobloxGui (copy), RoactModule (copy), WindowPadding (copy), DevConsoleTopBarModule (copy), FrameHeight (copy)
	local IsVisible = p1.props.isVisible
	local FormFactor = p1.props.formFactor
	local IsDeveloperView = p1.props.isDeveloperView
	local CurrTabIndex = p1.props.currTabIndex
	local TabList = p1.props.tabList
	local IsMinimized = p1.props.isMinimized
	local Position = p1.props.position
	local Size = p1.props.size
	local _ = p1.state.resizing
	local Size1: UDim2 = Size
	local _UDim2 = UDim2.new()
	local t = {}
	local XOffset = 16
	
	if FormFactor ~= ConstantsModule.FormFactor.Large then
		local AbsoluteSize = RobloxGui.AbsoluteSize
		Size = UDim2.new(0, AbsoluteSize.X, 0, AbsoluteSize.Y)
		Position = UDim2.new(0, 0, 0, 0)
		_UDim2 = UDim2.new(0, 16, 0, 0)
		Size1 = Size + UDim2.new(0, -32, 0, 0)
		XOffset = 0
	end
	t.UIListLayout = RoactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, WindowPadding)
	})
	
	if IsMinimized then
		t.TopBar = RoactModule.createElement(DevConsoleTopBarModule, {
			LayoutOrder = 1,
			isMinimized = true,
			formFactor = FormFactor,
			onMinimizeClicked = function()
				-- upvalues: p1 (copy)
				p1:onMinimizeClicked()
			end,
			onMaximizeClicked = function()
				-- upvalues: p1 (copy)
				p1:onMaximizeClicked()
			end,
			onCloseClicked = function()
				-- upvalues: p1 (copy)
				p1:onCloseClicked()
			end
		})
		
		return RoactModule.createElement("Frame", {
			Position = UDim2.new(1, -500, 1, -2 * FrameHeight),
			Size = UDim2.new(0, 500, 0, 2 * FrameHeight),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Transparency = ConstantsModule.MainWindowInit.Transparency,
			Active = true,
			AutoLocalize = false,
			Visible = IsVisible,
			Selectable = true,
			BorderColor3 = ConstantsModule.Color.BaseGray,
			[RoactModule.Ref] = p1.ref
		}, t)
	end
	t.TopBar = RoactModule.createElement(DevConsoleTopBarModule, {
		LayoutOrder = 1,
		isMinimized = false,
		formFactor = FormFactor,
		onMinimizeClicked = function()
			-- upvalues: p1 (copy)
			p1:onMinimizeClicked()
		end,
		onMaximizeClicked = function()
			-- upvalues: p1 (copy)
			p1:onMaximizeClicked()
		end,
		onCloseClicked = function()
			-- upvalues: p1 (copy)
			p1:onCloseClicked()
		end
	})
	local SizeDelta: UDim2 = Size1 - UDim2.new(0, 0, 0, FrameHeight + 2 * WindowPadding)
	
	if p1.ref.current and IsVisible and TabList then
		local Tab = TabList[CurrTabIndex]
		
		if Tab then
			t.MainView = RoactModule.createElement(Tab.tab, {
				size = SizeDelta,
				formFactor = FormFactor,
				isDeveloperView = IsDeveloperView,
				tabList = TabList
			})
		end
	end
	return RoactModule.createElement("Frame", {
		Position = Position,
		Size = Size,
		Visible = IsVisible,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Transparency = ConstantsModule.MainWindowInit.Transparency,
		BorderColor3 = ConstantsModule.Color.BaseGray,
		BorderSizePixel = XOffset,
		Active = true,
		AutoLocalize = false,
		Selectable = false,
		[RoactModule.Ref] = p1.ref
	}, {
		DevConsoleUI = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = Size1,
			Position = _UDim2
		}, t),
		ResizeButton = RoactModule.createElement("ImageButton", {
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.new(0, XOffset, 0, XOffset),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Modal = true,
			[RoactModule.Event.InputBegan] = p1.resizeInputBegan
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isVisible = p1.DisplayOptions.isVisible,
		isMinimized = p1.DisplayOptions.isMinimized,
		position = p1.DisplayOptions.position,
		size = p1.DisplayOptions.size,
		isDeveloperView = p1.MainView.isDeveloperView,
		currTabIndex = p1.MainView.currTabIndex,
		tabList = p1.MainView.tabList
	}
end, function(Callback)
	-- upvalues: ChangeDevConsoleSizeModule (copy), SetDevConsoleVisibilityModule (copy), SetDevConsoleMinimizedModule (copy)
	return {
		dispatchChangeDevConsoleSize = function(p1)
			-- upvalues: Callback (copy), ChangeDevConsoleSizeModule (upval)
			Callback(ChangeDevConsoleSizeModule(p1))
		end,
		dispatchSetDevConsolVisibility = function(p1)
			-- upvalues: Callback (copy), SetDevConsoleVisibilityModule (upval)
			Callback(SetDevConsoleVisibilityModule(p1))
		end,
		dispatchSetDevConsoleMinimized = function(p1)
			-- upvalues: Callback (copy), SetDevConsoleMinimizedModule (upval)
			Callback(SetDevConsoleMinimizedModule(p1))
		end
	}
end)(DevConsoleWindow)