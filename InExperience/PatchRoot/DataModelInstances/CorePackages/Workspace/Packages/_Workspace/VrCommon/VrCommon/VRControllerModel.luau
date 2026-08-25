local VRService = game:GetService("VRService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local vrCommon = script:FindFirstAncestor("VrCommon")
local viveControllerModule = require(vrCommon.Controllers.ViveController)
local touchControllerModule = require(vrCommon.Controllers.TouchController)
local riftControllerModule = require(vrCommon.Controllers.RiftController)
local indexControllerModule = require(vrCommon.Controllers.IndexController)
local VRUtilModule = require(vrCommon.VRUtil)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.Changed:wait()
	localPlayer = playersService.LocalPlayer
end
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref), VRService (ref)
	local tbl = setmetatable({}, t)
	tbl.userCFrame = p0
	tbl.enabled = false
	tbl.currentModel = nil
	tbl.currentVRDeviceName = VRService.VRDeviceName
	tbl.modelIsInWorkspace = false
	tbl.onVRDeviceChangedConn = nil
	tbl.onCurrentCameraChangedConn = nil
	tbl.onUserCFrameEnabledChangedConn = nil
	tbl.onInputBeganConn = nil
	tbl.onInputChangedConn = nil
	tbl.onInputEndedConn = nil
	tbl.controllerModel = nil
	
	return tbl
end

function t:createControllerModel()
	-- upvalues: VRUtilModule (ref), viveControllerModule (ref), riftControllerModule (ref), indexControllerModule (ref), touchControllerModule (ref)
	local currentControllerType = VRUtilModule.getCurrentControllerType()
	
	if currentControllerType == "Vive" then
		self.controllerModel = viveControllerModule.new(self.userCFrame)
		
		return
	elseif currentControllerType == "Rift" then
		self.controllerModel = riftControllerModule.new(self.userCFrame)
		
		return
	elseif currentControllerType == "Index" then
		self.controllerModel = indexControllerModule.new(self.userCFrame)
		
		return
	elseif currentControllerType == "Touch" then
		self.controllerModel = touchControllerModule.new(self.userCFrame)
		
		return
	end
	self.controllerModel = riftControllerModule.new(self.userCFrame)
end

function t:setCurrentModel()
	-- upvalues: VRService (ref)
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

function t:setModelInWorkspace(p1)
	if not self.currentModel then return end
	if p1 ~= self.modelIsInWorkspace then
		self.modelIsInWorkspace = p1
		
		if self.currentModel.model then
			if self.modelIsInWorkspace then
				self.currentModel.model.Parent = workspace
				
				return
			end
			self.currentModel.model.Parent = nil
			
			return
		else
			self.currentModel:setInWorkspace(p1)
		end
	end
end

function t:setEnabled(p2)
	-- upvalues: VRService (ref), userInputService (ref)
	if p2 ~= self.enabled then
		self.enabled = p2
		
		if self.enabled then
			self:setCurrentModel()
			self.onCurrentCameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
				-- upvalues: self (ref), VRService (copy)
				self:setModelInWorkspace(VRService:GetUserCFrameEnabled(self.userCFrame))
			end)
			self.onUserCFrameEnabledChangedConn = VRService.UserCFrameEnabled:connect(function(p3, p4)
				-- upvalues: self (ref)
				if p3 == self.userCFrame then
					self:setModelInWorkspace(p4)
				end
			end)
			self.onInputBeganConn = userInputService.InputBegan:connect(function(...)
				-- upvalues: self (ref)
				self:onInputBegan(...)
			end)
			self.onInputChangedConn = userInputService.InputChanged:connect(function(...)
				-- upvalues: self (ref)
				self:onInputChanged(...)
			end)
			self.onInputEndedConn = userInputService.InputEnded:connect(function(...)
				-- upvalues: self (ref)
				self:onInputEnded(...)
			end)
			self:setModelInWorkspace(VRService:GetUserCFrameEnabled(self.userCFrame))
			
			return
		elseif self.onVRDeviceChangedConn then
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

function t:update(_)
	-- upvalues: VRUtilModule (ref)
	if not self.enabled then return end
	if self.currentModel then
		self.currentModel:setCFrameAndScale(VRUtilModule.GetUserCFrameWorldSpace(self.userCFrame), workspace.CurrentCamera.HeadScale)
	end
end

function t:onInputBegan(p5, _)
	if not self.enabled or not self.modelIsInWorkspace then return end
	if self.currentModel then
		self.currentModel:onInputBegan(p5)
	end
end

function t:onInputChanged(p6, _)
	if not self.enabled or not self.modelIsInWorkspace then return end
	if self.currentModel then
		self.currentModel:onInputChanged(p6)
	end
end

function t:onInputEnded(p7, _)
	if self.currentModel then
		self.currentModel:onInputEnded(p7)
	end
end

function t:getButtonPosition(p8)
	if self.currentModel and self.currentModel.getButtonPart then
		local var12 = self.currentModel:getButtonPart(p8)
		
		if var12 then
			return var12.Position
		end
	end
end

return t