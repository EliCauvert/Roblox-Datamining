local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local SetDeviceOrientationFunction = require(CorePackages.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local SetIsSmallTouchScreenModule = require(ShareGame.Actions.SetIsSmallTouchScreen)
local SetDeviceLayoutModule = require(ShareGame.Actions.SetDeviceLayout)
local LayoutProvider = RoactModule.Component:extend("LayoutProvider")

function LayoutProvider.didMount(p1)
	if workspace.CurrentCamera then
		p1:setObservedCamera(workspace.CurrentCamera)
	end
	p1.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: p1 (copy)
		if workspace.CurrentCamera then
			p1:setObservedCamera(workspace.CurrentCamera)
		end
	end)
end

function LayoutProvider.willUnmount(p1)
	if p1.cameraChangedListener then
		p1.cameraChangedListener:Disconnect()
	end
	if p1.viewportSizeListener then
		p1.viewportSizeListener:Disconnect()
	end
end

function LayoutProvider.setObservedCamera(p1, Camera: Camera)
	if p1.viewportSizeListener then
		p1.viewportSizeListener:Disconnect()
	end
	p1:checkAllDeviceInfo(Camera.ViewportSize)
	p1.viewportSizeListener = Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: Camera (copy), p1 (copy)
		local ViewportSize = Camera.ViewportSize
		
		if ViewportSize.X > 1 and ViewportSize.Y > 1 then
			p1:checkAllDeviceInfo(ViewportSize)
			
			return
		end
	end)
end

function LayoutProvider.checkDeviceOrientation(p1, Vector)
	-- upvalues: ConstantsModule (copy)
	local LANDSCAPE = Vector.X > Vector.Y and ConstantsModule.DeviceOrientation.LANDSCAPE or ConstantsModule.DeviceOrientation.PORTRAIT
	
	if p1._deviceOrientation ~= LANDSCAPE then
		p1._deviceOrientation = LANDSCAPE
		p1.props.setDeviceOrientation(LANDSCAPE)
	end
end

function LayoutProvider.checkDeviceIsSmallTouchScreen(p1, Vector)
	-- upvalues: UserInputService (copy)
	local IsXBelow: boolean = UserInputService.TouchEnabled and (Vector.X < 700 or Vector.Y < 500)
	
	if p1._isSmallTouchScreen ~= IsXBelow then
		p1._isSmallTouchScreen = IsXBelow
		p1.props.setIsSmallTouchScreen(p1._isSmallTouchScreen)
	end
end

function LayoutProvider.checkDeviceLayout(p1)
	-- upvalues: ConstantsModule (copy), UserInputService (copy)
	local PHONELANDSCAPE = if p1._isSmallTouchScreen then if p1._deviceOrientation == ConstantsModule.DeviceOrientation.LANDSCAPE then ConstantsModule.DeviceLayout.PHONE_LANDSCAPE else ConstantsModule.DeviceLayout.PHONE_PORTRAIT elseif UserInputService.TouchEnabled then if p1._deviceOrientation == ConstantsModule.DeviceOrientation.LANDSCAPE then ConstantsModule.DeviceLayout.TABLET_LANDSCAPE else ConstantsModule.DeviceLayout.TABLET_PORTRAIT else ConstantsModule.DeviceLayout.DESKTOP
	
	if p1._deviceLayout ~= PHONELANDSCAPE then
		p1._deviceLayout = PHONELANDSCAPE
		p1.props.setDeviceLayout(p1._deviceLayout)
	end
end

function LayoutProvider.checkAllDeviceInfo(p1, ViewportSize)
	p1:checkDeviceOrientation(ViewportSize)
	p1:checkDeviceIsSmallTouchScreen(ViewportSize)
	p1:checkDeviceLayout()
end

function LayoutProvider.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.oneChild(p1.props[RoactModule.Children])
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetDeviceOrientationFunction (copy), SetIsSmallTouchScreenModule (copy), SetDeviceLayoutModule (copy)
	return {
		setDeviceOrientation = function(p1)
			-- upvalues: Callback (copy), SetDeviceOrientationFunction (upval)
			return Callback(SetDeviceOrientationFunction(p1))
		end,
		setIsSmallTouchScreen = function(p1)
			-- upvalues: Callback (copy), SetIsSmallTouchScreenModule (upval)
			return Callback(SetIsSmallTouchScreenModule(p1))
		end,
		setDeviceLayout = function(p1)
			-- upvalues: Callback (copy), SetDeviceLayoutModule (upval)
			return Callback(SetDeviceLayoutModule(p1))
		end
	}
end)(LayoutProvider)