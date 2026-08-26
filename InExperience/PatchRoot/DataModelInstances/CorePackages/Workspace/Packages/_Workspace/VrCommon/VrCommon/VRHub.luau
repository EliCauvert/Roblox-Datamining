local parent = script:FindFirstAncestor("VrCommon").Parent
local starterGuiService = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local create = require(parent.AppCommonLib).Create
local laserPointerModule = require(script.Parent.LaserPointer)
local VRControllerModelModule = require(script.Parent.VRControllerModel)
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local safetyBubbleModule = require(script.Parent.SafetyBubble)
local t = {
	LaserPointer = nil,
	ControllerModelsEnabled = false,
	LeftControllerModel = nil,
	RightControllerModel = nil,
	isFPSAtTarget = splashScreenManager.isFPSAtTarget(),
	SafetyBubble = nil,
	IsFirstPerson = false
}
local t_1 = {}
local t_2 = {}
local var1 = httpService:GenerateGUID(true)
starterGuiService:RegisterSetCore("VRLaserPointerMode", function(p1)
	-- upvalues: t (ref), laserPointerModule (ref)
	if not t.LaserPointer then return end
	if p1 and tostring(p1) then
		t.LaserPointer:setMode(laserPointerModule.Mode[tostring(p1)] or laserPointerModule.Mode.Disabled)
		
		return
	end
end)

local function enableControllerModels(p1)
	-- upvalues: t (ref), VRControllerModelModule (ref)
	if p1 ~= t.ControllerModelsEnabled then
		t.ControllerModelsEnabled = p1
		
		if p1 then
			if not t.LeftControllerModel then
				t.LeftControllerModel = VRControllerModelModule.new(Enum.UserCFrame.LeftHand)
			end
			t.LeftControllerModel:setEnabled(true)
			
			if not t.RightControllerModel then
				t.RightControllerModel = VRControllerModelModule.new(Enum.UserCFrame.RightHand)
			end
			t.RightControllerModel:setEnabled(true)
			
			return
		elseif t.LeftControllerModel then
			t.LeftControllerModel:setEnabled(false)
		end
		if t.RightControllerModel then
			t.RightControllerModel:setEnabled(false)
		end
	end
end

starterGuiService:RegisterSetCore("VREnableControllerModels", function(p1)
	-- upvalues: VRService (ref)
	if p1 then
		VRService.ControllerModels = Enum.VRControllerModelMode.Transparent
		
		return
	end
	VRService.ControllerModels = Enum.VRControllerModelMode.Disabled
end)
VRService:GetPropertyChangedSignal("ControllerModels"):Connect(function()
	-- upvalues: enableControllerModels (ref), VRService (ref)
	enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
end)
local currentTime = tick()

local function onRenderSteppedLast()
	-- upvalues: currentTime (write), t (ref)
	local currentTime_1 = tick()
	local var2 = currentTime_1 - currentTime
	currentTime = currentTime_1
	
	if t.LaserPointer then
		t.LaserPointer:update(var2)
	end
	if t.LeftControllerModel then
		t.LeftControllerModel:update(var2)
	end
	if t.RightControllerModel then
		t.RightControllerModel:update(var2)
	end
	if t.SafetyBubble then
		t.SafetyBubble:update(var2)
	end
end

local function onCameraCFrameChanged()
	-- upvalues: t (ref)
	if t.LaserPointer then
		t.LaserPointer:update(0)
	end
	if t.LeftControllerModel then
		t.LeftControllerModel:update(0)
	end
	if t.RightControllerModel then
		t.RightControllerModel:update(0)
	end
end

local var2 = nil
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: var2 (write), onCameraCFrameChanged (ref)
	if var2 then
		var2:disconnect()
	end
	if workspace.CurrentCamera then
		var2 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
	end
end)
if workspace.CurrentCamera then
	var2 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
end
local function onVREnabledChanged()
	-- upvalues: VRService (ref), userInputService (ref), t (ref), laserPointerModule (ref), enableControllerModels (ref), runService (ref), var1 (ref), onRenderSteppedLast (ref), safetyBubbleModule (ref), contextActionService (ref)
	if VRService.VREnabled then
		userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		
		if not t.LaserPointer then
			t.LaserPointer = laserPointerModule.new()
		end
		if t.LaserPointer then
			if t.isFPSAtTarget then
				t.LaserPointer:setMode(laserPointerModule.Mode.Navigation)
			else
				t.LaserPointer:setMode(laserPointerModule.Mode.Disabled)
			end
		end
		enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
		runService:BindToRenderStep(var1, Enum.RenderPriority.Last.Value, onRenderSteppedLast)
		
		if t.LaserPointer then
			t.LaserPointer:setForcePointer(true)
		end
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		t.SafetyBubble = safetyBubbleModule.new()
		contextActionService:BindCoreActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		
		return
	elseif t.LaserPointer then
		t.LaserPointer:setMode(laserPointerModule.Mode.Disabled)
	end
	runService:UnbindFromRenderStep(var1)
end

local function onVRSessionStateChanged()
	-- upvalues: VRService (ref), t (ref), laserPointerModule (ref), enableControllerModels (ref)
	if VRService.VRSessionState == Enum.VRSessionState.Focused then
		if t.LaserPointer and t.LaserPointer.Mode.Disabled then
			t.LaserPointer:setMode(laserPointerModule.Mode.Navigation)
			enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
		end
		if t.ControllerModelsEnabled then
			return
		else
			enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
			
			return
		end
	elseif t.LaserPointer and t.LaserPointer.Mode.Navigation then
		t.LaserPointer:setMode(laserPointerModule.Mode.Disabled)
	end
	if t.ControllerModelsEnabled and t.ControllerModelsEnabled ~= false then
		t.ControllerModelsEnabled = false
		
		if t.LeftControllerModel then
			t.LeftControllerModel:setEnabled(false)
		end
		if t.RightControllerModel then
			t.RightControllerModel:setEnabled(false)
		end
	end
end

local function onVRPropertyChanged(p1)
	-- upvalues: onVREnabledChanged (ref), onVRSessionStateChanged (ref)
	if p1 == "VREnabled" then
		onVREnabledChanged()
		
		return
	elseif p1 == "VRSessionState" then
		onVRSessionStateChanged()
	end
end

onVREnabledChanged()
VRService.Changed:connect(onVRPropertyChanged)

function t.RegisterModule(_, p1)
	-- upvalues: t_1 (ref)
	t_1[p1.ModuleName] = p1
end

function t.GetModule(_, p1)
	-- upvalues: t_1 (ref)
	return t_1[p1]
end

function t.IsModuleOpened(_, p1)
	-- upvalues: t_2 (ref)
	return t_2[p1] ~= nil
end

function t.GetOpenedModules(_)
	-- upvalues: t_2 (ref)
	local t = {}
	
	for i, v in pairs(t_2) do
		table.insert(t, v)
	end
	return t
end

t.ModuleOpened = create("BindableEvent")({ Name = "VRModuleOpened" })

function t.FireModuleOpened(_, p1)
	-- upvalues: t_1 (ref), t_2 (ref), t (ref)
	if not t_1[p1] then
		error("Tried to open module that is not registered: " .. p7)
	end
	if t_2[p1] ~= t_1[p1] then
		t_2[p1] = t_1[p1]
		t.ModuleOpened:Fire(p1)
	end
end

t.ModuleClosed = create("BindableEvent")({ Name = "VRModuleClosed" })

function t.FireModuleClosed(_, p1)
	-- upvalues: t_1 (ref), t_2 (ref), t (ref)
	if not t_1[p1] then
		error("Tried to close module that is not registered: " .. p8)
	end
	if t_2[p1] ~= nil then
		t_2[p1] = nil
		t.ModuleClosed:Fire(p1)
	end
end

function t.KeepVRTopbarOpen(_)
	-- upvalues: t_2 (ref)
	for i, v in pairs(t_2) do
		if v.KeepVRTopbarOpen then
			return true
		end
	end
	return false
end

t.ShowHighlightedLeaveGameIcon = false
t.ShowHighlightedLeaveGameIconToggled = create("BindableEvent")({ Name = "ShowHighlightedLeaveGameIconToggled" })

function t.SetShowHighlightedLeaveGameIconToggled(_, p1)
	-- upvalues: t (ref)
	if t.ShowHighlightedLeaveGameIcon ~= p1 then
		t.ShowHighlightedLeaveGameIcon = p1
		t.ShowHighlightedLeaveGameIconToggled:Fire()
	end
end

t.ShowTopBar = true
t.ShowMoreMenu = false
t.ShowTopBarChanged = create("BindableEvent")({ Name = "ShowTopBarChanged" })
t.ShowMoreMenuChanged = create("BindableEvent")({ Name = "ShowMoreMenuChanged" })

function t.SetShowTopBar(_, p1)
	-- upvalues: t (ref)
	if t.ShowTopBar ~= p1 then
		t.ShowTopBar = p1
		t.ShowTopBarChanged:Fire()
	end
end

function t.SetShowMoreMenu(_, p1)
	-- upvalues: t (ref)
	if t.ShowMoreMenu ~= p1 then
		t.ShowMoreMenu = p1
		t.ShowMoreMenuChanged:Fire()
	end
end

function t.ToggleSafetyBubble(_)
	-- upvalues: t (ref)
	if t.SafetyBubble then
		t.SafetyBubble:ToggleEnabled()
	end
end

function t.GetControllerModel(_, p1)
	-- upvalues: t (ref)
	return if p1 == Enum.UserCFrame.LeftHand then t.LeftControllerModel elseif p1 == Enum.UserCFrame.RightHand then t.RightControllerModel else nil
end

function t.GetControllerButtonPosition(_, p1)
	-- upvalues: t (ref)
	return t.LeftControllerModel and t.LeftControllerModel:getButtonPosition(p1), t.RightControllerModel and t.RightControllerModel:getButtonPosition(p1)
end

splashScreenManager.addStatusChangeListener(function(p1)
	-- upvalues: t (ref), onVREnabledChanged (ref)
	t.isFPSAtTarget = p1
	onVREnabledChanged()
end)

return t