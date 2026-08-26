local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local setDeviceOrientation = require(corePackagesService.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local setIsSmallTouchScreenModule = require(shareGame.Actions.SetIsSmallTouchScreen)
local setDeviceLayoutModule = require(shareGame.Actions.SetDeviceLayout)
local layoutProvider = roactModule.Component:extend("LayoutProvider")

function layoutProvider.didMount(p1)
	if workspace.CurrentCamera then
		p1:setObservedCamera(workspace.CurrentCamera)
	end
	p1.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: p1 (ref)
		if workspace.CurrentCamera then
			p1:setObservedCamera(workspace.CurrentCamera)
		end
	end)
end

function layoutProvider.willUnmount(p1)
	if p1.cameraChangedListener then
		p1.cameraChangedListener:Disconnect()
	end
	if p1.viewportSizeListener then
		p1.viewportSizeListener:Disconnect()
	end
end

function layoutProvider.setObservedCamera(value, p1)
	if value.viewportSizeListener then
		value.viewportSizeListener:Disconnect()
	end
	value:checkAllDeviceInfo(p1.ViewportSize)
	value.viewportSizeListener = p1:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: p1 (ref), value (ref)
		local viewportSize = p1.ViewportSize
		
		if viewportSize.X <= 1 or viewportSize.Y <= 1 then
			return
		end
		value:checkAllDeviceInfo(viewportSize)
	end)
end

function layoutProvider.checkDeviceOrientation(p1, p2)
	-- upvalues: constantsModule (ref)
	local var1 = if p2.Y < p2.X then constantsModule.DeviceOrientation.LANDSCAPE else constantsModule.DeviceOrientation.PORTRAIT
	
	if p1._deviceOrientation ~= var1 then
		p1._deviceOrientation = var1
		p1.props.setDeviceOrientation(var1)
	end
end

function layoutProvider.checkDeviceIsSmallTouchScreen(p1, p2)
	-- upvalues: userInputService (ref)
	local var1 = userInputService.TouchEnabled and (if p2.X >= 700 then p2.Y < 500 else true)
	
	if p1._isSmallTouchScreen ~= var1 then
		p1._isSmallTouchScreen = var1
		p1.props.setIsSmallTouchScreen(p1._isSmallTouchScreen)
	end
end

function layoutProvider.checkDeviceLayout(p1)
	-- upvalues: constantsModule (ref), userInputService (ref)
	local var1 = if p1._isSmallTouchScreen then if p1._deviceOrientation == constantsModule.DeviceOrientation.LANDSCAPE then constantsModule.DeviceLayout.PHONE_LANDSCAPE else constantsModule.DeviceLayout.PHONE_PORTRAIT elseif userInputService.TouchEnabled then if p1._deviceOrientation == constantsModule.DeviceOrientation.LANDSCAPE then constantsModule.DeviceLayout.TABLET_LANDSCAPE else constantsModule.DeviceLayout.TABLET_PORTRAIT else constantsModule.DeviceLayout.DESKTOP
	
	if p1._deviceLayout ~= var1 then
		p1._deviceLayout = var1
		p1.props.setDeviceLayout(p1._deviceLayout)
	end
end

function layoutProvider.checkAllDeviceInfo(p1, p2)
	p1:checkDeviceOrientation(p2)
	p1:checkDeviceIsSmallTouchScreen(p2)
	p1:checkDeviceLayout()
end

function layoutProvider.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p1.props[roactModule.Children])
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setDeviceOrientation (ref), setIsSmallTouchScreenModule (ref), setDeviceLayoutModule (ref)
	return {
		setDeviceOrientation = function(value)
			-- upvalues: p1 (ref), setDeviceOrientation (copy)
			return p1(setDeviceOrientation(value))
		end,
		setIsSmallTouchScreen = function(value)
			-- upvalues: p1 (ref), setIsSmallTouchScreenModule (copy)
			return p1(setIsSmallTouchScreenModule(value))
		end,
		setDeviceLayout = function(value)
			-- upvalues: p1 (ref), setDeviceLayoutModule (copy)
			return p1(setDeviceLayoutModule(value))
		end
	}
end)(layoutProvider)