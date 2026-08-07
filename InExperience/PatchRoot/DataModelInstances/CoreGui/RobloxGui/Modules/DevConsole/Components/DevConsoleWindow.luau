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

function devConsoleWindow.onMinimizeClicked(a) --[[ line: 30 ]]
	a.props.dispatchSetDevConsoleMinimized(true)
end

function devConsoleWindow.onMaximizeClicked(a) --[[ line: 34 ]]
	a.props.dispatchSetDevConsoleMinimized(false)
end

function devConsoleWindow.onCloseClicked(p0) --[[ line: 38 ]]
	p0.props.onCloseCallback(false)
	p0.props.dispatchSetDevConsolVisibility(false)
end

function devConsoleWindow.init(p1) --[[ line: 43 ]]
	-- upvalues: minSize (ref), userInputService (ref), roactModule (ref)
	function p1.setDevConsoleSize(p2, p3, p4) --[[ line: 44 ]]
		-- upvalues: minSize (copy)
		local var12 = p4.X - p3.X
		local var13 = p4.Y - p3.Y
		p2.props.dispatchChangeDevConsoleSize(UDim2.new(0, if var12 < minSize.X then minSize.X else var12, 0, if var13 < minSize.Y then minSize.Y else var13))
	end
	
	function p1.resizeInputBegan(_, p5) --[[ line: 54 ]]
		-- upvalues: p1 (ref), userInputService (copy)
		if p5.UserInputType == Enum.UserInputType.MouseButton1 then
			local inputChangedConnection = nil
			local inputEndedConnection = nil
			
			local function onInputEnded(p6) --[[ line: 64 ]]
				-- upvalues: inputChangedConnection (write), inputEndedConnection (write)
				if p6.UserInputType == Enum.UserInputType.MouseButton1 then
					inputChangedConnection:Disconnect()
					inputEndedConnection:Disconnect()
				end
			end
			
			inputChangedConnection = userInputService.InputChanged:Connect(function(p7) --[[ line: 58 | named "onInputChanged" ]]
				-- upvalues: p1 (copy)
				p1:setDevConsoleSize(p1.ref.current.AbsolutePosition, p7.Position)
			end)
			inputEndedConnection = userInputService.InputEnded:Connect(onInputEnded)
		end
	end
	
	function p1.doGamepadMenuButton(p8) --[[ line: 76 ]]
		-- upvalues: p1 (ref)
		if p1.props.isVisible then
			if if p8.KeyCode ~= Enum.KeyCode.ButtonStart then p8.KeyCode == Enum.KeyCode.Escape else true then
				p1.props.dispatchSetDevConsolVisibility(false)
			end
		end
	end
	
	p1.ref = roactModule.createRef()
	p1.state = { resizing = false }
end

function devConsoleWindow.didMount(p9) --[[ line: 92 ]]
	-- upvalues: setMouseVisibilityModule (ref), userInputService (ref)
	delay(0, function() --[[ line: 96 ]]
		-- upvalues: p9 (ref)
		if p9.ref.current then
			p9:setDevConsoleSize(p9.ref.current.AbsolutePosition, p9.ref.current.ResizeButton.AbsolutePosition)
		end
	end)
	setMouseVisibilityModule(p9.props.isVisible)
	p9.gamepadMenuListener = userInputService.InputBegan:Connect(p9.doGamepadMenuButton)
end

function devConsoleWindow.willUnmount(p10) --[[ line: 108 ]]
	-- upvalues: guiService (ref)
	if guiService.SelectedCoreObject == p10.ref.current then
		guiService.SelectedCoreObject = nil
	end
	p10.gamepadMenuListener:Disconnect()
end

function devConsoleWindow.didUpdate(p11, p12, _) --[[ line: 116 ]]
	-- upvalues: setMouseVisibilityModule (ref), guiService (ref), userInputService (ref)
	setMouseVisibilityModule(p11.props.isVisible)
	
	if p11.props.isMinimized and guiService.SelectedCoreObject == p11.ref.current then
		guiService.SelectedCoreObject = nil
		
		return
	elseif p11.props.isVisible ~= p12.isVisible or p11.props.currTabIndex ~= p12.currTabIndex then
		if Enum.UserInputType.Gamepad1 == userInputService:GetLastInputType() and p11.props.isVisible then
			guiService.SelectedCoreObject = p11.ref.current
			
			return
		end
		guiService.SelectedCoreObject = nil
	end
end

function devConsoleWindow.render(p13) --[[ line: 133 ]]
	-- upvalues: constantsModule (ref), robloxGui (ref), roactModule (ref), windowPadding (ref), devConsoleTopBarModule (ref), frameHeight (ref)
	local isVisible = p13.props.isVisible
	local formFactor = p13.props.formFactor
	local isDeveloperView = p13.props.isDeveloperView
	local currTabIndex = p13.props.currTabIndex
	local tabList = p13.props.tabList
	local isMinimized = p13.props.isMinimized
	local position = p13.props.position
	local size = p13.props.size
	local _ = p13.state.resizing
	local var17 = size
	local uDim2 = UDim2.new()
	local t = {}
	local var20 = 16
	
	if formFactor ~= constantsModule.FormFactor.Large then
		local absoluteSize = robloxGui.AbsoluteSize
		size = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
		position = UDim2.new(0, 0, 0, 0)
		uDim2 = UDim2.new(0, 16, 0, 0)
		var17 = size + UDim2.new(0, -32, 0, 0)
		var20 = 0
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
			onMinimizeClicked = function() --[[ line: 176 ]]
				-- upvalues: p13 (ref)
				p13:onMinimizeClicked()
			end,
			onMaximizeClicked = function() --[[ line: 179 ]]
				-- upvalues: p13 (ref)
				p13:onMaximizeClicked()
			end,
			onCloseClicked = function() --[[ line: 182 ]]
				-- upvalues: p13 (ref)
				p13:onCloseClicked()
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
			[roactModule.Ref] = p13.ref
		}, t)
	end
	t.TopBar = roactModule.createElement(devConsoleTopBarModule, {
		LayoutOrder = 1,
		isMinimized = false,
		formFactor = formFactor,
		onMinimizeClicked = function() --[[ line: 205 ]]
			-- upvalues: p13 (ref)
			p13:onMinimizeClicked()
		end,
		onMaximizeClicked = function() --[[ line: 208 ]]
			-- upvalues: p13 (ref)
			p13:onMaximizeClicked()
		end,
		onCloseClicked = function() --[[ line: 211 ]]
			-- upvalues: p13 (ref)
			p13:onCloseClicked()
		end
	})
	local var21 = var17 - UDim2.new(0, 0, 0, frameHeight + 2 * windowPadding)
	
	if p13.ref.current and isVisible and tabList then
		local var22 = tabList[currTabIndex]
		
		if var22 then
			t.MainView = roactModule.createElement(var22.tab, {
				size = var21,
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
		BorderSizePixel = var20,
		Active = true,
		AutoLocalize = false,
		Selectable = false,
		[roactModule.Ref] = p13.ref
	}, {
		DevConsoleUI = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = var17,
			Position = uDim2
		}, t),
		ResizeButton = roactModule.createElement("ImageButton", {
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.new(0, var20, 0, var20),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Modal = true,
			[roactModule.Event.InputBegan] = p13.resizeInputBegan
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p14, _) --[[ line: 266 | named "mapStateToProps" ]]
	return {
		isVisible = p14.DisplayOptions.isVisible,
		isMinimized = p14.DisplayOptions.isMinimized,
		position = p14.DisplayOptions.position,
		size = p14.DisplayOptions.size,
		isDeveloperView = p14.MainView.isDeveloperView,
		currTabIndex = p14.MainView.currTabIndex,
		tabList = p14.MainView.tabList
	}
end, function(p15) --[[ line: 278 | named "mapDispatchToProps" ]]
	-- upvalues: changeDevConsoleSizeModule (ref), setDevConsoleVisibilityModule (ref), setDevConsoleMinimizedModule (ref)
	return {
		dispatchChangeDevConsoleSize = function(p16) --[[ line: 280 ]]
			-- upvalues: p15 (ref), changeDevConsoleSizeModule (copy)
			p15(changeDevConsoleSizeModule(p16))
		end,
		dispatchSetDevConsolVisibility = function(value) --[[ line: 283 ]]
			-- upvalues: p15 (ref), setDevConsoleVisibilityModule (copy)
			p15(setDevConsoleVisibilityModule(value))
		end,
		dispatchSetDevConsoleMinimized = function(a) --[[ line: 286 ]]
			-- upvalues: p15 (ref), setDevConsoleMinimizedModule (copy)
			p15(setDevConsoleMinimizedModule(a))
		end
	}
end)(devConsoleWindow)