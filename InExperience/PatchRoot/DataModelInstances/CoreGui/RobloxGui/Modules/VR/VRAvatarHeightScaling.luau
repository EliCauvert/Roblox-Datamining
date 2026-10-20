local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Players = game:GetService("Players")
local AvatarUtil = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).AvatarUtil
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), AvatarUtil (copy), VRService (copy), UserGameSettings (copy)
	local self = setmetatable({}, Module)
	self.avatarUtil = AvatarUtil.new()
	VRService:GetPropertyChangedSignal("AutomaticScaling"):Connect(function()
		-- upvalues: self (copy)
		self:onScalingChanged()
	end)
	UserGameSettings:GetPropertyChangedSignal("PlayerHeight"):Connect(function()
		-- upvalues: self (copy)
		self:onPlayerHeightChanged()
	end)
	VRService.UserCFrameChanged:Connect(function(UserCFrame, _)
		-- upvalues: self (copy)
		if UserCFrame == Enum.UserCFrame.Floor then
			self:onPlayerHeightChanged()
		end
	end)
	self:onScalingChanged()
	
	return self
end

function Module:setHeadScale(Character)
	-- upvalues: VRService (copy), UserGameSettings (copy)
	if VRService.AutomaticScaling ~= Enum.VRScaling.World then return end
	local SubjectHeight: number = self:GetSubjectHeight(Character)
	
	if not SubjectHeight or SubjectHeight <= 0 then return end
	local Negated = -VRService:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y
	local SubjectHeightRatio = if Negated < 0.8 * UserGameSettings.PlayerHeight then SubjectHeight / UserGameSettings.PlayerHeight else SubjectHeight / Negated
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera then
		CurrentCamera.HeadScale = SubjectHeightRatio
		
		return
	end
end

function Module:GetSubjectHeight(Object): number?
	local Humanoid = Object:FindFirstChild("Humanoid")
	
	if Humanoid and Humanoid:GetState() == Enum.HumanoidStateType.Dead then return end
	local RootPart = Humanoid and Humanoid.RootPart or Object:FindFirstChild("HumanoidRootPart")
	
	if RootPart and Humanoid then
		local HipHeight = if Humanoid.RigType == Enum.HumanoidRigType.R6 then 2 else Humanoid.HipHeight
		
		return if Humanoid.AutomaticScalingEnabled then RootPart.Size.Y / 2 + HipHeight + (RootPart.Size.Y / 2 + 0.5) + Humanoid.CameraOffset.Y else RootPart.Size.Y / 2 + HipHeight + 2 + Humanoid.CameraOffset.Y
	else
		return nil
	end
end

function Module:onPlayerHeightChanged()
	-- upvalues: Players (copy)
	if Players.LocalPlayer and Players.LocalPlayer.Character then
		self:setHeadScale(Players.LocalPlayer.Character)
	end
end

function Module:onScalingChanged()
	-- upvalues: VRService (copy)
	if VRService.AutomaticScaling == Enum.VRScaling.World then
		if not self.characterChangedConnection then
			self.characterChangedConnection = self.avatarUtil:connectLocalCharacterChanges(function(p1)
				-- upvalues: self (copy)
				self:setHeadScale(p1)
			end)
			
			return
		end
	elseif self.characterChangedConnection then
		self.characterChangedConnection:Disconnect()
		self.characterChangedConnection = nil
	end
end

return Module.new()