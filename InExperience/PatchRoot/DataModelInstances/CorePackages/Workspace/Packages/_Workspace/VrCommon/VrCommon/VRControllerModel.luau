local VRService = game:GetService("VRService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VrCommon = script:FindFirstAncestor("VrCommon")
local ViveControllerModule = require(VrCommon.Controllers.ViveController)
local TouchControllerModule = require(VrCommon.Controllers.TouchController)
local RiftControllerModule = require(VrCommon.Controllers.RiftController)
local IndexControllerModule = require(VrCommon.Controllers.IndexController)
local VRUtilModule = require(VrCommon.VRUtil)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.Changed:wait()
	LocalPlayer = Players.LocalPlayer
end
local Module = {}
Module.__index = Module

function Module.new(UserCFrame) --[[ Line: 23 ]]
	-- upvalues: Module (copy), VRService (copy)
	local self = setmetatable({}, Module)
	self.userCFrame = UserCFrame
	self.enabled = false
	self.currentModel = nil
	self.currentVRDeviceName = VRService.VRDeviceName
	self.modelIsInWorkspace = false
	self.onVRDeviceChangedConn = nil
	self.onCurrentCameraChangedConn = nil
	self.onUserCFrameEnabledChangedConn = nil
	self.onInputBeganConn = nil
	self.onInputChangedConn = nil
	self.onInputEndedConn = nil
	self.controllerModel = nil
	
	return self
end

function Module:createControllerModel() --[[ Line: 45 ]]
	-- upvalues: VRUtilModule (copy), ViveControllerModule (copy), RiftControllerModule (copy), IndexControllerModule (copy), TouchControllerModule (copy)
	local CurrentControllerType = VRUtilModule.getCurrentControllerType()
	
	if CurrentControllerType == "Vive" then
		self.controllerModel = ViveControllerModule.new(self.userCFrame)
		
		return
	end
	if CurrentControllerType == "Rift" then
		self.controllerModel = RiftControllerModule.new(self.userCFrame)
		
		return
	end
	if CurrentControllerType == "Index" then
		self.controllerModel = IndexControllerModule.new(self.userCFrame)
		
		return
	end
	if CurrentControllerType == "Touch" then
		self.controllerModel = TouchControllerModule.new(self.userCFrame)
		
		return
	else
		self.controllerModel = RiftControllerModule.new(self.userCFrame)
	end
end

function Module:setCurrentModel() --[[ Line: 62 ]]
	-- upvalues: VRService (copy)
	if self.currentModel then
		self:setModelInWorkspace(false)
	end
	if not self.controllerModel then
		self:createControllerModel()
	end
	self.currentModel = self.controllerModel
	
	if self.enabled then
		self:setModelInWorkspace(VRService:GetUserCFrameEnabled(self.userCFrame))
	end
end

function Module:setModelInWorkspace(ModelIsInWorkspace) --[[ Line: 79 ]]
	if not self.currentModel then return end
	if ModelIsInWorkspace ~= self.modelIsInWorkspace then
		self.modelIsInWorkspace = ModelIsInWorkspace
		
		if not self.currentModel.model then
			self.currentModel:setInWorkspace(ModelIsInWorkspace)
		elseif self.modelIsInWorkspace then
			self.currentModel.model.Parent = workspace
			
			return
		else
			self.currentModel.model.Parent = nil
			
			return
		end
	end
end

function Module:setEnabled(Enabled) --[[ Line: 98 ]]
	-- upvalues: VRService (copy), UserInputService (copy)
	if Enabled ~= self.enabled then
		self.enabled = Enabled
		
		if self.enabled then
			self:setCurrentModel()
			self.onCurrentCameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 105 ]]
				-- upvalues: self (copy), VRService (upval)
				self:setModelInWorkspace(VRService:GetUserCFrameEnabled(self.userCFrame))
			end)
			self.onUserCFrameEnabledChangedConn = VRService.UserCFrameEnabled:connect(function(UserCFrame, ModelIsInWorkspace) --[[ Line: 109 ]]
				-- upvalues: self (copy)
				if UserCFrame == self.userCFrame then
					self:setModelInWorkspace(ModelIsInWorkspace)
				end
			end)
			self.onInputBeganConn = UserInputService.InputBegan:connect(function(...) --[[ Line: 115 ]]
				-- upvalues: self (copy)
				self:onInputBegan(...)
			end)
			self.onInputChangedConn = UserInputService.InputChanged:connect(function(...) --[[ Line: 118 ]]
				-- upvalues: self (copy)
				self:onInputChanged(...)
			end)
			self.onInputEndedConn = UserInputService.InputEnded:connect(function(...) --[[ Line: 121 ]]
				-- upvalues: self (copy)
				self:onInputEnded(...)
			end)
			self:setModelInWorkspace(VRService:GetUserCFrameEnabled(self.userCFrame))
			
			return
		end
		if self.onVRDeviceChangedConn then
			self.onVRDeviceChangedConn:disconnect()
			self.onVRDeviceChangedConn = nil
		end
		if self.onCurrentCameraChangedConn then
			self.onCurrentCameraChangedConn:disconnect()
			self.onCurrentCameraChangedConn = nil
		end
		if self.onUserCFrameEnabledChangedConn then
			self.onUserCFrameEnabledChangedConn:disconnect()
			self.onUserCFrameEnabledChangedConn = nil
		end
		if self.onInputBeganConn then
			self.onInputBeganConn:disconnect()
			self.onInputBeganConn = nil
		end
		if self.onInputChangedConn then
			self.onInputChangedConn:disconnect()
			self.onInputChangedConn = nil
		end
		if self.onInputEndedConn then
			self.onInputEndedConn:disconnect()
			self.onInputEndedConn = nil
		end
		if self.currentModel then
			self:setModelInWorkspace(false)
		end
	end
end

function Module:update(_) --[[ Line: 162 ]]
	-- upvalues: VRUtilModule (copy)
	if not self.enabled then return end
	if self.currentModel then
		self.currentModel:setCFrameAndScale(VRUtilModule.GetUserCFrameWorldSpace(self.userCFrame), workspace.CurrentCamera.HeadScale)
	end
end

function Module:onInputBegan(p1, _) --[[ Line: 173 ]]
	if not self.enabled or not self.modelIsInWorkspace then return end
	if self.currentModel then
		self.currentModel:onInputBegan(p1)
	end
end

function Module:onInputChanged(p1, _) --[[ Line: 182 ]]
	if not self.enabled or not self.modelIsInWorkspace then return end
	if self.currentModel then
		self.currentModel:onInputChanged(p1)
	end
end

function Module:onInputEnded(p1, _) --[[ Line: 191 ]]
	if self.currentModel then
		self.currentModel:onInputEnded(p1)
	end
end

function Module:getButtonPosition(p1) --[[ Line: 197 ]]
	if self.currentModel and self.currentModel.getButtonPart then
		local ButtonPart = self.currentModel:getButtonPart(p1)
		
		if ButtonPart then
			return ButtonPart.Position
		end
	end
end

return Module