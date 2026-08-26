local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local setMouseVisibilityModule = require(script.Parent.Parent.Util.setMouseVisibility)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local frameHeight = constantsModule.TopBarFormatting.FrameHeight
local windowPadding = constantsModule.Padding.WindowPadding
local minSize = constantsModule.MainWindowInit.MinSize
local devConsoleTopBarModule = require(parent.Components.DevConsoleTopBar)
local actions = script.Parent.Parent.Actions
local changeDevConsoleSizeModule = require(actions.ChangeDevConsoleSize)
local setDevConsoleVisibilityModule = require(actions.SetDevConsoleVisibility)
local setDevConsoleMinimizedModule = require(actions.SetDevConsoleMinimized)
local devConsoleWindow = roactModule.PureComponent:extend("DevConsoleWindow")

function devConsoleWindow.onMinimizeClicked(a)
	a.props.dispatchSetDevConsoleMinimized(true)
end

function devConsoleWindow.onMaximizeClicked(a)
	a.props.dispatchSetDevConsoleMinimized(false)
end

function devConsoleWindow.onCloseClicked(p1)
	p1.props.onCloseCallback(false)
	p1.props.dispatchSetDevConsolVisibility(false)
end

function devConsoleWindow.init(p1)
	-- upvalues: minSize (ref), userInputService (ref), roactModule (ref)
	function p1.setDevConsoleSize(p2, p3, p4)
		-- upvalues: minSize (copy)
		local var1 = p4.X - p3.X
		local var2 = p4.Y - p3.Y
		p2.props.dispatchChangeDevConsoleSize(UDim2.new(0, if var1 < minSize.X then minSize.X else var1, 0, if var2 < minSize.Y then minSize.Y else var2))
	end
	
	function p1.resizeInputBegan(_, p2)
		-- upvalues: p1 (ref), userInputService (copy)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 then
			local inputChangedConnection = nil
			local inputEndedConnection = nil
			
			local function onInputEnded(p3)
				-- upvalues: inputChangedConnection (write), inputEndedConnection (write)
				if p3.UserInputType == Enum.UserInputType.MouseButton1 then
					inputChangedConnection:Disconnect()
					inputEndedConnection:Disconnect()
				end
			end
			
			inputChangedConnection = userInputService.InputChanged:Connect(function(p3)
				-- upvalues: p1 (copy)
				p1:setDevConsoleSize(p1.ref.current.AbsolutePosition, p3.Position)
			end)
			inputEndedConnection = userInputService.InputEnded:Connect(onInputEnded)
		end
	end
	
	function p1.doGamepadMenuButton(p2)
		-- upvalues: p1 (ref)
		if p1.props.isVisible then
			if if p2.KeyCode ~= Enum.KeyCode.ButtonStart then p2.KeyCode == Enum.KeyCode.Escape else true then
				p1.props.dispatchSetDevConsolVisibility(false)
			end
		end
	end
	
	p1.ref = roactModule.createRef()
	p1.state = { resizing = false }
end

function devConsoleWindow.didMount(p1)
	-- upvalues: setMouseVisibilityModule (ref), userInputService (ref)
	delay(0, function()
		-- upvalues: p1 (ref)
		if p1.ref.current then
			p1:setDevConsoleSize(p1.ref.current.AbsolutePosition, p1.ref.current.ResizeButton.AbsolutePosition)
		end
	end)
	setMouseVisibilityModule(p1.props.isVisible)
	p1.gamepadMenuListener = userInputService.InputBegan:Connect(p1.doGamepadMenuButton)
end

function devConsoleWindow.willUnmount(p1)
	-- upvalues: guiService (ref)
	if guiService.SelectedCoreObject == p1.ref.current then
		guiService.SelectedCoreObject = nil
	end
	p1.gamepadMenuListener:Disconnect()
end

function devConsoleWindow.didUpdate(p1, p2, _)
	-- upvalues: setMouseVisibilityModule (ref), guiService (ref), userInputService (ref)
	setMouseVisibilityModule(p1.props.isVisible)
	
	if p1.props.isMinimized and guiService.SelectedCoreObject == p1.ref.current then
		guiService.SelectedCoreObject = nil
		
		return
	elseif p1.props.isVisible ~= p2.isVisible or p1.props.currTabIndex ~= p2.currTabIndex then
		if Enum.UserInputType.Gamepad1 == userInputService:GetLastInputType() and p1.props.isVisible then
			guiService.SelectedCoreObject = p1.ref.current
			
			return
		end
		guiService.SelectedCoreObject = nil
	end
end

function devConsoleWindow.render(p1)
	-- upvalues: constantsModule (ref), robloxGui (ref), roactModule (ref), windowPadding (ref), devConsoleTopBarModule (ref), frameHeight (ref)
	local isVisible = p1.props.isVisible
	local formFactor = p1.props.formFactor
	local isDeveloperView = p1.props.isDeveloperView
	local currTabIndex = p1.props.currTabIndex
	local tabList = p1.props.tabList
	local isMinimized = p1.props.isMinimized
	local position = p1.props.position
	local size = p1.props.size
	local _ = p1.state.resizing
	local var1 = size
	local uDim2 = UDim2.new()
	local t = {}
	local var2 = 16
	
	if formFactor ~= constantsModule.FormFactor.Large then
		local absoluteSize = robloxGui.AbsoluteSize
		size = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
		position = UDim2.new(0, 0, 0, 0)
		uDim2 = UDim2.new(0, 16, 0, 0)
		var1 = size + UDim2.new(0, -32, 0, 0)
		var2 = 0
	end
	t.UIListLayout = roactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, windowPadding)
	})
	
	if isMinimized then
		t.TopBar = roactModule.createElement(devConsoleTopBarModule, {
			LayoutOrder = 1,
			isMinimized = true,
			formFactor = formFactor,
			onMinimizeClicked = function()
				-- upvalues: p1 (ref)
				p1:onMinimizeClicked()
			end,
			onMaximizeClicked = function()
				-- upvalues: p1 (ref)
				p1:onMaximizeClicked()
			end,
			onCloseClicked = function()
				-- upvalues: p1 (ref)
				p1:onCloseClicked()
			end
		})
		
		return roactModule.createElement("Frame", {
			Position = UDim2.new(1, -500, 1, -2 * frameHeight),
			Size = UDim2.new(0, 500, 0, 2 * frameHeight),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Transparency = constantsModule.MainWindowInit.Transparency,
			Active = true,
			AutoLocalize = false,
			Visible = isVisible,
			Selectable = true,
			BorderColor3 = constantsModule.Color.BaseGray,
			[roactModule.Ref] = p1.ref
		}, t)
	end
	t.TopBar = roactModule.createElement(devConsoleTopBarModule, {
		LayoutOrder = 1,
		isMinimized = false,
		formFactor = formFactor,
		onMinimizeClicked = function()
			-- upvalues: p1 (ref)
			p1:onMinimizeClicked()
		end,
		onMaximizeClicked = function()
			-- upvalues: p1 (ref)
			p1:onMaximizeClicked()
		end,
		onCloseClicked = function()
			-- upvalues: p1 (ref)
			p1:onCloseClicked()
		end
	})
	local var3 = var1 - UDim2.new(0, 0, 0, frameHeight + 2 * windowPadding)
	
	if p1.ref.current and isVisible and tabList then
		local var4 = tabList[currTabIndex]
		
		if var4 then
			t.MainView = roactModule.createElement(var4.tab, {
				size = var3,
				formFactor = formFactor,
				isDeveloperView = isDeveloperView,
				tabList = tabList
			})
		end
	end
	return roactModule.createElement("Frame", {
		Position = position,
		Size = size,
		Visible = isVisible,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Transparency = constantsModule.MainWindowInit.Transparency,
		BorderColor3 = constantsModule.Color.BaseGray,
		BorderSizePixel = var2,
		Active = true,
		AutoLocalize = false,
		Selectable = false,
		[roactModule.Ref] = p1.ref
	}, {
		DevConsoleUI = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = var1,
			Position = uDim2
		}, t),
		ResizeButton = roactModule.createElement("ImageButton", {
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.new(0, var2, 0, var2),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Modal = true,
			[roactModule.Event.InputBegan] = p1.resizeInputBegan
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isVisible = p1.DisplayOptions.isVisible,
		isMinimized = p1.DisplayOptions.isMinimized,
		position = p1.DisplayOptions.position,
		size = p1.DisplayOptions.size,
		isDeveloperView = p1.MainView.isDeveloperView,
		currTabIndex = p1.MainView.currTabIndex,
		tabList = p1.MainView.tabList
	}
end, function(p1)
	-- upvalues: changeDevConsoleSizeModule (ref), setDevConsoleVisibilityModule (ref), setDevConsoleMinimizedModule (ref)
	return {
		dispatchChangeDevConsoleSize = function(p2)
			-- upvalues: p1 (ref), changeDevConsoleSizeModule (copy)
			p1(changeDevConsoleSizeModule(p2))
		end,
		dispatchSetDevConsolVisibility = function(value)
			-- upvalues: p1 (ref), setDevConsoleVisibilityModule (copy)
			p1(setDevConsoleVisibilityModule(value))
		end,
		dispatchSetDevConsoleMinimized = function(a)
			-- upvalues: p1 (ref), setDevConsoleMinimizedModule (copy)
			p1(setDevConsoleMinimizedModule(a))
		end
	}
end)(devConsoleWindow)