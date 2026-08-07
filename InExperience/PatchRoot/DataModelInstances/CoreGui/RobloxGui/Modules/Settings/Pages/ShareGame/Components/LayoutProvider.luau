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

function layoutProvider.didMount(p0) --[[ line: 22 ]]
	if workspace.CurrentCamera then
		p0:setObservedCamera(workspace.CurrentCamera)
	end
	p0.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 27 ]]
		-- upvalues: p0 (ref)
		if workspace.CurrentCamera then
			p0:setObservedCamera(workspace.CurrentCamera)
		end
	end)
end

function layoutProvider.willUnmount(p1) --[[ line: 34 ]]
	if p1.cameraChangedListener then
		p1.cameraChangedListener:Disconnect()
	end
	if p1.viewportSizeListener then
		p1.viewportSizeListener:Disconnect()
	end
end

function layoutProvider.setObservedCamera(value, p2) --[[ line: 44 ]]
	if value.viewportSizeListener then
		value.viewportSizeListener:Disconnect()
	end
	value:checkAllDeviceInfo(p2.ViewportSize)
	value.viewportSizeListener = p2:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 51 ]]
		-- upvalues: p2 (ref), value (ref)
		local viewportSize = p2.ViewportSize
		
		if viewportSize.X <= 1 or viewportSize.Y <= 1 then
			return
		end
		value:checkAllDeviceInfo(viewportSize)
	end)
end

function layoutProvider.checkDeviceOrientation(p3, p4) --[[ line: 63 ]]
	-- upvalues: constantsModule (ref)
	local var8 = if p4.Y < p4.X then constantsModule.DeviceOrientation.LANDSCAPE else constantsModule.DeviceOrientation.PORTRAIT
	
	if p3._deviceOrientation ~= var8 then
		p3._deviceOrientation = var8
		p3.props.setDeviceOrientation(var8)
	end
end

function layoutProvider.checkDeviceIsSmallTouchScreen(p5, p6) --[[ line: 73 ]]
	-- upvalues: userInputService (ref)
	local var9 = userInputService.TouchEnabled and (if p6.X >= 700 then p6.Y < 500 else true)
	
	if p5._isSmallTouchScreen ~= var9 then
		p5._isSmallTouchScreen = var9
		p5.props.setIsSmallTouchScreen(p5._isSmallTouchScreen)
	end
end

function layoutProvider.checkDeviceLayout(p7) --[[ line: 83 ]]
	-- upvalues: constantsModule (ref), userInputService (ref)
	local var10 = if p7._isSmallTouchScreen then if p7._deviceOrientation == constantsModule.DeviceOrientation.LANDSCAPE then constantsModule.DeviceLayout.PHONE_LANDSCAPE else constantsModule.DeviceLayout.PHONE_PORTRAIT elseif userInputService.TouchEnabled then if p7._deviceOrientation == constantsModule.DeviceOrientation.LANDSCAPE then constantsModule.DeviceLayout.TABLET_LANDSCAPE else constantsModule.DeviceLayout.TABLET_PORTRAIT else constantsModule.DeviceLayout.DESKTOP
	
	if p7._deviceLayout ~= var10 then
		p7._deviceLayout = var10
		p7.props.setDeviceLayout(p7._deviceLayout)
	end
end

function layoutProvider.checkAllDeviceInfo(p8, p9) --[[ line: 108 ]]
	p8:checkDeviceOrientation(p9)
	p8:checkDeviceIsSmallTouchScreen(p9)
	p8:checkDeviceLayout()
end

function layoutProvider.render(p10) --[[ line: 114 ]]
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p10.props[roactModule.Children])
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p11) --[[ line: 118 ]]
	-- upvalues: setDeviceOrientation (ref), setIsSmallTouchScreenModule (ref), setDeviceLayoutModule (ref)
	return {
		setDeviceOrientation = function(value) --[[ line: 120 ]]
			-- upvalues: p11 (ref), setDeviceOrientation (copy)
			return p11(setDeviceOrientation(value))
		end,
		setIsSmallTouchScreen = function(value) --[[ line: 123 ]]
			-- upvalues: p11 (ref), setIsSmallTouchScreenModule (copy)
			return p11(setIsSmallTouchScreenModule(value))
		end,
		setDeviceLayout = function(value) --[[ line: 126 ]]
			-- upvalues: p11 (ref), setDeviceLayoutModule (copy)
			return p11(setDeviceLayoutModule(value))
		end
	}
end)(layoutProvider)