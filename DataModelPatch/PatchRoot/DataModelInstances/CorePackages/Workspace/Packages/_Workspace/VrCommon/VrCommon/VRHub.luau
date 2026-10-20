local Parent = script:FindFirstAncestor("VrCommon").Parent
local StarterGui = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local CreateFunction = require(Parent.AppCommonLib).Create
local LaserPointerModule = require(script.Parent.LaserPointer)
local VRControllerModelModule = require(script.Parent.VRControllerModel)
local SplashScreenManager = require(Parent.SplashScreenManager).SplashScreenManager
local SafetyBubbleModule = require(script.Parent.SafetyBubble)
local t = {}
local t1 = {}
local Guid = game:GetService("HttpService"):GenerateGUID(true)
local VRHubModule = {
	LaserPointer = nil,
	ControllerModelsEnabled = false,
	LeftControllerModel = nil,
	RightControllerModel = nil,
	isFPSAtTarget = SplashScreenManager.isFPSAtTarget(),
	SafetyBubble = nil,
	IsFirstPerson = false
}
StarterGui:RegisterSetCore("VRLaserPointerMode", function(p1)
	-- upvalues: VRHubModule (copy), LaserPointerModule (copy)
	if not VRHubModule.LaserPointer then return end
	if p1 and tostring(p1) then
		VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode[tostring(p1)] or LaserPointerModule.Mode.Disabled)
		
		return
	end
end)

local function enableControllerModels(IsControllerModelsMatch)
	-- upvalues: VRHubModule (copy), VRControllerModelModule (copy)
	if IsControllerModelsMatch ~= VRHubModule.ControllerModelsEnabled then
		VRHubModule.ControllerModelsEnabled = IsControllerModelsMatch
		
		if IsControllerModelsMatch then
			if not VRHubModule.LeftControllerModel then
				VRHubModule.LeftControllerModel = VRControllerModelModule.new(Enum.UserCFrame.LeftHand)
			end
			VRHubModule.LeftControllerModel:setEnabled(true)
			
			if not VRHubModule.RightControllerModel then
				VRHubModule.RightControllerModel = VRControllerModelModule.new(Enum.UserCFrame.RightHand)
			end
			VRHubModule.RightControllerModel:setEnabled(true)
			
			return
		else
			if VRHubModule.LeftControllerModel then
				VRHubModule.LeftControllerModel:setEnabled(false)
			end
			if VRHubModule.RightControllerModel then
				VRHubModule.RightControllerModel:setEnabled(false)
			end
		end
	end
end

StarterGui:RegisterSetCore("VREnableControllerModels", function(p1)
	-- upvalues: VRService (copy)
	if p1 then
		VRService.ControllerModels = Enum.VRControllerModelMode.Transparent
		
		return
	else
		VRService.ControllerModels = Enum.VRControllerModelMode.Disabled
	end
end)
VRService:GetPropertyChangedSignal("ControllerModels"):Connect(function()
	-- upvalues: enableControllerModels (copy), VRService (copy)
	enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
end)
local CurrentTime = tick()

local function onRenderSteppedLast()
	-- upvalues: CurrentTime (ref), VRHubModule (copy)
	local CurrentTime1 = tick()
	local CurrentTimeDelta = CurrentTime1 - CurrentTime
	CurrentTime = CurrentTime1
	
	if VRHubModule.LaserPointer then
		VRHubModule.LaserPointer:update(CurrentTimeDelta)
	end
	if VRHubModule.LeftControllerModel then
		VRHubModule.LeftControllerModel:update(CurrentTimeDelta)
	end
	if VRHubModule.RightControllerModel then
		VRHubModule.RightControllerModel:update(CurrentTimeDelta)
	end
	if VRHubModule.SafetyBubble then
		VRHubModule.SafetyBubble:update(CurrentTimeDelta)
	end
end

local function onCameraCFrameChanged()
	-- upvalues: VRHubModule (copy)
	if VRHubModule.LaserPointer then
		VRHubModule.LaserPointer:update(0)
	end
	if VRHubModule.LeftControllerModel then
		VRHubModule.LeftControllerModel:update(0)
	end
	if VRHubModule.RightControllerModel then
		VRHubModule.RightControllerModel:update(0)
	end
end

local Connection = nil
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: Connection (ref), onCameraCFrameChanged (copy)
	if Connection then
		Connection:disconnect()
	end
	if workspace.CurrentCamera then
		Connection = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
	end
end)

if Connection then
	Connection:disconnect()
end
if workspace.CurrentCamera then
	Connection = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
end
local function onVREnabledChanged()
	-- upvalues: VRService (copy), UserInputService (copy), VRHubModule (copy), LaserPointerModule (copy), enableControllerModels (copy), RunService (copy), Guid (copy), onRenderSteppedLast (copy), SafetyBubbleModule (copy), ContextActionService (copy)
	if VRService.VREnabled then
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		
		if not VRHubModule.LaserPointer then
			VRHubModule.LaserPointer = LaserPointerModule.new()
		end
		if VRHubModule.LaserPointer then
			if VRHubModule.isFPSAtTarget then
				VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode.Navigation)
			else
				VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode.Disabled)
			end
		end
		enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
		RunService:BindToRenderStep(Guid, Enum.RenderPriority.Last.Value, onRenderSteppedLast)
		
		if VRHubModule.LaserPointer then
			VRHubModule.LaserPointer:setForcePointer(true)
		end
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		VRHubModule.SafetyBubble = SafetyBubbleModule.new()
		ContextActionService:BindCoreActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		
		return
	else
		if VRHubModule.LaserPointer then
			VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode.Disabled)
		end
		RunService:UnbindFromRenderStep(Guid)
	end
end

local function onVRSessionStateChanged()
	-- upvalues: VRService (copy), VRHubModule (copy), LaserPointerModule (copy), enableControllerModels (copy)
	if VRService.VRSessionState == Enum.VRSessionState.Focused then
		if VRHubModule.LaserPointer and VRHubModule.LaserPointer.Mode.Disabled then
			VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode.Navigation)
			enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
		end
		if not VRHubModule.ControllerModelsEnabled then
			enableControllerModels(VRService.ControllerModels == Enum.VRControllerModelMode.Transparent)
			
			return
		end
	else
		if VRHubModule.LaserPointer and VRHubModule.LaserPointer.Mode.Navigation then
			VRHubModule.LaserPointer:setMode(LaserPointerModule.Mode.Disabled)
		end
		if VRHubModule.ControllerModelsEnabled and VRHubModule.ControllerModelsEnabled ~= false then
			VRHubModule.ControllerModelsEnabled = false
			
			if VRHubModule.LeftControllerModel then
				VRHubModule.LeftControllerModel:setEnabled(false)
			end
			if VRHubModule.RightControllerModel then
				VRHubModule.RightControllerModel:setEnabled(false)
			end
		end
	end
end

local function onVRPropertyChanged(Property)
	-- upvalues: onVREnabledChanged (copy), onVRSessionStateChanged (copy)
	if Property == "VREnabled" then
		onVREnabledChanged()
		
		return
	end
	if Property == "VRSessionState" then
		onVRSessionStateChanged()
	end
end

onVREnabledChanged()
VRService.Changed:connect(onVRPropertyChanged)

function VRHubModule:RegisterModule(p1)
	-- upvalues: t (copy)
	t[p1.ModuleName] = p1
end

function VRHubModule:GetModule(p1)
	-- upvalues: t (copy)
	return t[p1]
end

function VRHubModule:IsModuleOpened(p1): boolean
	-- upvalues: t1 (copy)
	return t1[p1] ~= nil
end

function VRHubModule:GetOpenedModules()
	-- upvalues: t1 (copy)
	local List = {}
	
	for _, value in pairs(t1) do
		table.insert(List, value)
	end
	return List
end

VRHubModule.ModuleOpened = CreateFunction("BindableEvent")({ Name = "VRModuleOpened" })

function VRHubModule:FireModuleOpened(Key)
	-- upvalues: t (copy), t1 (copy), VRHubModule (copy)
	if not t[Key] then
		error("Tried to open module that is not registered: " .. Key)
	end
	if t1[Key] ~= t[Key] then
		t1[Key] = t[Key]
		VRHubModule.ModuleOpened:Fire(Key)
	end
end

VRHubModule.ModuleClosed = CreateFunction("BindableEvent")({ Name = "VRModuleClosed" })

function VRHubModule:FireModuleClosed(Key)
	-- upvalues: t (copy), t1 (copy), VRHubModule (copy)
	if not t[Key] then
		error("Tried to close module that is not registered: " .. Key)
	end
	if t1[Key] ~= nil then
		t1[Key] = nil
		VRHubModule.ModuleClosed:Fire(Key)
	end
end

function VRHubModule:KeepVRTopbarOpen(): boolean
	-- upvalues: t1 (copy)
	for _, value in pairs(t1) do
		if value.KeepVRTopbarOpen then
			return true
		end
	end
	return false
end

VRHubModule.ShowHighlightedLeaveGameIcon = false
VRHubModule.ShowHighlightedLeaveGameIconToggled = CreateFunction("BindableEvent")({ Name = "ShowHighlightedLeaveGameIconToggled" })

function VRHubModule:SetShowHighlightedLeaveGameIconToggled(ShowHighlightedLeaveGameIcon)
	-- upvalues: VRHubModule (copy)
	if VRHubModule.ShowHighlightedLeaveGameIcon ~= ShowHighlightedLeaveGameIcon then
		VRHubModule.ShowHighlightedLeaveGameIcon = ShowHighlightedLeaveGameIcon
		VRHubModule.ShowHighlightedLeaveGameIconToggled:Fire()
	end
end

VRHubModule.ShowTopBar = true
VRHubModule.ShowMoreMenu = false
VRHubModule.ShowTopBarChanged = CreateFunction("BindableEvent")({ Name = "ShowTopBarChanged" })
VRHubModule.ShowMoreMenuChanged = CreateFunction("BindableEvent")({ Name = "ShowMoreMenuChanged" })

function VRHubModule:SetShowTopBar(ShowTopBar)
	-- upvalues: VRHubModule (copy)
	if VRHubModule.ShowTopBar ~= ShowTopBar then
		VRHubModule.ShowTopBar = ShowTopBar
		VRHubModule.ShowTopBarChanged:Fire()
	end
end

function VRHubModule:SetShowMoreMenu(ShowMoreMenu)
	-- upvalues: VRHubModule (copy)
	if VRHubModule.ShowMoreMenu ~= ShowMoreMenu then
		VRHubModule.ShowMoreMenu = ShowMoreMenu
		VRHubModule.ShowMoreMenuChanged:Fire()
	end
end

function VRHubModule:ToggleSafetyBubble()
	-- upvalues: VRHubModule (copy)
	if VRHubModule.SafetyBubble then
		VRHubModule.SafetyBubble:ToggleEnabled()
	end
end

function VRHubModule:GetControllerModel(UserCFrame)
	-- upvalues: VRHubModule (copy)
	return if UserCFrame == Enum.UserCFrame.LeftHand then VRHubModule.LeftControllerModel elseif UserCFrame == Enum.UserCFrame.RightHand then VRHubModule.RightControllerModel else nil
end

function VRHubModule:GetControllerButtonPosition(p1)
	-- upvalues: VRHubModule (copy)
	return VRHubModule.LeftControllerModel and VRHubModule.LeftControllerModel:getButtonPosition(p1), VRHubModule.RightControllerModel and VRHubModule.RightControllerModel:getButtonPosition(p1)
end

SplashScreenManager.addStatusChangeListener(function(IsFPSAtTarget)
	-- upvalues: VRHubModule (copy), onVREnabledChanged (copy)
	VRHubModule.isFPSAtTarget = IsFPSAtTarget
	onVREnabledChanged()
end)

return VRHubModule