local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local playersService = game:GetService("Players")
local avatarUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local t = {}
t.__index = t

function t.new() --[[ line: 13 ]]
	-- upvalues: t (ref), avatarUtil (ref), VRService (ref), userGameSettingsService (ref)
	local tbl = setmetatable({}, t)
	tbl.avatarUtil = avatarUtil.new()
	VRService:GetPropertyChangedSignal("AutomaticScaling"):Connect(function() --[[ line: 17 ]]
		-- upvalues: tbl (ref)
		tbl:onScalingChanged()
	end)
	userGameSettingsService:GetPropertyChangedSignal("PlayerHeight"):Connect(function() --[[ line: 20 ]]
		-- upvalues: tbl (ref)
		tbl:onPlayerHeightChanged()
	end)
	VRService.UserCFrameChanged:Connect(function(p0, _) --[[ line: 23 ]]
		-- upvalues: tbl (ref)
		if p0 == Enum.UserCFrame.Floor then
			tbl:onPlayerHeightChanged()
		end
	end)
	tbl:onScalingChanged()
	
	return tbl
end

function t:setHeadScale(p1) --[[ line: 35 ]]
	-- upvalues: VRService (ref), userGameSettingsService (ref)
	if VRService.AutomaticScaling ~= Enum.VRScaling.World then return end
	local var6 = self:GetSubjectHeight(p1)
	
	if not var6 or var6 <= 0 then return end
	local var7 = -VRService:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y
	local var8 = if var7 < 0.8 * userGameSettingsService.PlayerHeight then var6 / userGameSettingsService.PlayerHeight else var6 / var7
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		currentCamera.HeadScale = var8
		
		return
	end
end

function t.GetSubjectHeight(_, p2) --[[ line: 64 ]]
	local humanoid = p2:FindFirstChild("Humanoid")
	
	if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Dead then return end
	local var10 = if humanoid then humanoid.RootPart else p2:FindFirstChild("HumanoidRootPart")
	
	if not var10 or not humanoid then
		return nil
	end
	local var11 = if humanoid.RigType == Enum.HumanoidRigType.R6 then 2 else humanoid.HipHeight
	
	return if humanoid.AutomaticScalingEnabled then var10.Size.Y / 2 + var11 + (var10.Size.Y / 2 + 0.5) + humanoid.CameraOffset.Y else var10.Size.Y / 2 + var11 + 2 + humanoid.CameraOffset.Y
end

function t:onPlayerHeightChanged() --[[ line: 93 ]]
	-- upvalues: playersService (ref)
	if playersService.LocalPlayer and playersService.LocalPlayer.Character then
		self:setHeadScale(playersService.LocalPlayer.Character)
	end
end

function t:onScalingChanged() --[[ line: 100 ]]
	-- upvalues: VRService (ref)
	if VRService.AutomaticScaling == Enum.VRScaling.World then
		if self.characterChangedConnection then
			return
		else
			self.characterChangedConnection = self.avatarUtil:connectLocalCharacterChanges(function(p3) --[[ line: 104 ]]
				-- upvalues: self (ref)
				self:setHeadScale(p3)
			end)
			
			return
		end
	elseif self.characterChangedConnection then
		self.characterChangedConnection:Disconnect()
		self.characterChangedConnection = nil
	end
end

return t.new()