local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("StarterPlayer")
local Common = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local AvatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local AvatarJointUpgradeDefaultOnFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeDefaultOnFeature")

local function _()
	-- upvalues: AvatarJointUpgradeFeatureEngineFeature (copy), AvatarJointUpgradeDefaultOnFeatureEngineFeature (copy)
	return AvatarJointUpgradeFeatureEngineFeature and AvatarJointUpgradeDefaultOnFeatureEngineFeature
end

local RagdollRiggingModule = require(Common:FindFirstChild("RagdollRigging"))
local HumanoidReadyUtilModule = require(Common:FindFirstChild("HumanoidReadyUtil"))
local Value = (function()
	if not game:GetEngineFeature("PolicyInfoForServerRobloxOnlyAsyncEnabled") then
		return game:DefineFastString("DeathTypeValue", "Classic")
	end
	local DefaultAvatarDeathType = game:GetService("PolicyService"):GetPolicyInfoForServerRobloxOnlyAsync().DefaultAvatarDeathType
	
	if DefaultAvatarDeathType == nil then
		error("PolicyService did not have death type policy")
	end
	return DefaultAvatarDeathType
end)()
local DeathType = Instance.new("StringValue")
DeathType.Name = "DeathType"
DeathType.Value = Value
DeathType.Parent = RobloxReplicatedStorage

if not AvatarJointUpgradeFeatureEngineFeature and Value ~= "Ragdoll" then return end
local Humanoids = {}

if not AvatarJointUpgradeFeatureEngineFeature then
	local OnRagdoll = Instance.new("RemoteEvent")
	OnRagdoll.Name = "OnRagdoll"
	OnRagdoll.OnServerEvent:Connect(function(Player, Humanoid)
		-- upvalues: Humanoids (copy), RagdollRiggingModule (copy)
		if Humanoid and Humanoids[Player] == Humanoid then
			local Parent = Humanoid and Humanoid.Parent
			
			if Parent and Parent:IsA("Model") then
				RagdollRiggingModule.disableMotors(Parent, Humanoid.RigType)
			end
			Humanoids[Player] = nil
		end
	end)
	OnRagdoll.Parent = RobloxReplicatedStorage
end
HumanoidReadyUtilModule.registerHumanoidReady(function(Player, p1, Humanoid: Humanoid)
	-- upvalues: AvatarJointUpgradeFeatureEngineFeature (copy), AvatarJointUpgradeDefaultOnFeatureEngineFeature (copy), RagdollRiggingModule (copy), Value (copy), Humanoids (copy)
	if AvatarJointUpgradeFeatureEngineFeature then
		if Humanoid.RigType == Enum.HumanoidRigType.R15 and (AvatarJointUpgradeFeatureEngineFeature and AvatarJointUpgradeDefaultOnFeatureEngineFeature) then
			RagdollRiggingModule.createRagdollJoints(p1, Humanoid.RigType, AvatarJointUpgradeFeatureEngineFeature and AvatarJointUpgradeDefaultOnFeatureEngineFeature)
		elseif Value == "Ragdoll" then
			RagdollRiggingModule.createRagdollJoints(p1, Humanoid.RigType, false)
		end
	end
	if Value ~= "Ragdoll" then return end
	local Connection = nil
	
	local function _()
		-- upvalues: Connection (ref), Humanoids (upval), Player (copy), Humanoid (copy)
		Connection:Disconnect()
		
		if Humanoids[Player] == Humanoid then
			Humanoids[Player] = nil
		end
	end
	
	Connection = Player.CharacterRemoving:Connect(function(Character)
		-- upvalues: p1 (copy), Connection (ref), Humanoids (upval), Player (copy), Humanoid (copy)
		if Character == p1 then
			Connection:Disconnect()
			
			if Humanoids[Player] == Humanoid then
				Humanoids[Player] = nil
			end
		end
	end)
	Humanoid.BreakJointsOnDeath = false
	
	if not AvatarJointUpgradeFeatureEngineFeature then
		RagdollRiggingModule.createRagdollJoints(p1, Humanoid.RigType, AvatarJointUpgradeFeatureEngineFeature and AvatarJointUpgradeDefaultOnFeatureEngineFeature)
	end
	Humanoids[Player] = Humanoid
	
	if AvatarJointUpgradeFeatureEngineFeature then
		Humanoid.Died:Connect(function()
			-- upvalues: Humanoids (upval), Player (copy), Humanoid (copy), RagdollRiggingModule (upval), AvatarJointUpgradeFeatureEngineFeature (upval), AvatarJointUpgradeDefaultOnFeatureEngineFeature (upval)
			Humanoids[Player] = nil
			local Parent = Humanoid.Parent
			
			if Parent and Parent:IsA("Model") then
				RagdollRiggingModule.disableMotors(Parent, Humanoid.RigType)
				
				if AvatarJointUpgradeFeatureEngineFeature and AvatarJointUpgradeDefaultOnFeatureEngineFeature then
					RagdollRiggingModule.easeNongraphicJointFriction(Parent, 0.85)
				end
			end
		end)
	end
end)