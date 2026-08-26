local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local playersService = game:GetService("Players")
local avatarUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), avatarUtil (ref), VRService (ref), userGameSettingsService (ref)
	local tbl = setmetatable({}, t)
	tbl.avatarUtil = avatarUtil.new()
	VRService:GetPropertyChangedSignal("AutomaticScaling"):Connect(function()
		-- upvalues: tbl (ref)
		tbl:onScalingChanged()
	end)
	userGameSettingsService:GetPropertyChangedSignal("PlayerHeight"):Connect(function()
		-- upvalues: tbl (ref)
		tbl:onPlayerHeightChanged()
	end)
	VRService.UserCFrameChanged:Connect(function(p1, _)
		-- upvalues: tbl (ref)
		if p1 == Enum.UserCFrame.Floor then
			tbl:onPlayerHeightChanged()
		end
	end)
	tbl:onScalingChanged()
	
	return tbl
end

function t:setHeadScale(p1)
	-- upvalues: VRService (ref), userGameSettingsService (ref)
	if VRService.AutomaticScaling ~= Enum.VRScaling.World then return end
	local var1 = self:GetSubjectHeight(p1)
	
	if not var1 or var1 <= 0 then return end
	local var2 = -VRService:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y
	local var3 = if var2 < 0.8 * userGameSettingsService.PlayerHeight then var1 / userGameSettingsService.PlayerHeight else var1 / var2
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		currentCamera.HeadScale = var3
		
		return
	end
end

function t.GetSubjectHeight(_, p1)
	local humanoid = p1:FindFirstChild("Humanoid")
	
	if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Dead then return end
	local var1 = if humanoid then humanoid.RootPart else p1:FindFirstChild("HumanoidRootPart")
	
	if not var1 or not humanoid then
		return nil
	end
	local var2 = if humanoid.RigType == Enum.HumanoidRigType.R6 then 2 else humanoid.HipHeight
	
	return if humanoid.AutomaticScalingEnabled then var1.Size.Y / 2 + var2 + (var1.Size.Y / 2 + 0.5) + humanoid.CameraOffset.Y else var1.Size.Y / 2 + var2 + 2 + humanoid.CameraOffset.Y
end

function t:onPlayerHeightChanged()
	-- upvalues: playersService (ref)
	if playersService.LocalPlayer and playersService.LocalPlayer.Character then
		self:setHeadScale(playersService.LocalPlayer.Character)
	end
end

function t:onScalingChanged()
	-- upvalues: VRService (ref)
	if VRService.AutomaticScaling == Enum.VRScaling.World then
		if self.characterChangedConnection then
			return
		else
			self.characterChangedConnection = self.avatarUtil:connectLocalCharacterChanges(function(p1)
				-- upvalues: self (ref)
				self:setHeadScale(p1)
			end)
			
			return
		end
	elseif self.characterChangedConnection then
		self.characterChangedConnection:Disconnect()
		self.characterChangedConnection = nil
	end
end

return t.new()