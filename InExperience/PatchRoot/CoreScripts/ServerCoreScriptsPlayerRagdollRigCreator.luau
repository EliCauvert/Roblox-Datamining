local coreGuiService = game:GetService("CoreGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("StarterPlayer")
local common = coreGuiService:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local avatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local avatarJointUpgradeDefaultOnFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeDefaultOnFeature")

local function _()
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), avatarJointUpgradeDefaultOnFeatureEngineFeature (ref)
	return avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature
end

local ragdollRiggingModule = require(common:FindFirstChild("RagdollRigging"))
local humanoidReadyUtilModule = require(common:FindFirstChild("HumanoidReadyUtil"))
local var1 = (function()
	if not game:GetEngineFeature("PolicyInfoForServerRobloxOnlyAsyncEnabled") then
		return game:DefineFastString("DeathTypeValue", "Classic")
	end
	local defaultAvatarDeathType = game:GetService("PolicyService"):GetPolicyInfoForServerRobloxOnlyAsync().DefaultAvatarDeathType
	
	if defaultAvatarDeathType == nil then
		error("PolicyService did not have death type policy")
	end
	return defaultAvatarDeathType
end)()
local deathType = Instance.new("StringValue")
deathType.Name = "DeathType"
deathType.Value = var1
deathType.Parent = robloxReplicatedStorageService

if not avatarJointUpgradeFeatureEngineFeature and var1 ~= "Ragdoll" then return end
local t = {}

if not avatarJointUpgradeFeatureEngineFeature then
	local onRagdoll = Instance.new("RemoteEvent")
	onRagdoll.Name = "OnRagdoll"
	onRagdoll.OnServerEvent:Connect(function(p1, p2)
		-- upvalues: t (ref), ragdollRiggingModule (ref)
		if p2 and t[p1] == p2 then
			local parent = p2 and p2.Parent
			
			if parent and parent:IsA("Model") then
				ragdollRiggingModule.disableMotors(parent, p2.RigType)
			end
			t[p1] = nil
		end
	end)
	onRagdoll.Parent = robloxReplicatedStorageService
end
humanoidReadyUtilModule.registerHumanoidReady(function(p1, p2, p3)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), avatarJointUpgradeDefaultOnFeatureEngineFeature (ref), ragdollRiggingModule (ref), var1 (ref), t (ref)
	if avatarJointUpgradeFeatureEngineFeature then
		if p3.RigType == Enum.HumanoidRigType.R15 and (avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature) then
			ragdollRiggingModule.createRagdollJoints(p2, p3.RigType, avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature)
		elseif var1 == "Ragdoll" then
			ragdollRiggingModule.createRagdollJoints(p2, p3.RigType, false)
		end
	end
	if var1 ~= "Ragdoll" then return end
	local characterRemovingConnection = nil
	
	local function _()
		-- upvalues: characterRemovingConnection (write), t (copy), p1 (ref), p3 (ref)
		characterRemovingConnection:Disconnect()
		
		if t[p1] == p3 then
			t[p1] = nil
		end
	end
	
	characterRemovingConnection = p1.CharacterRemoving:Connect(function(p4)
		-- upvalues: p2 (ref), characterRemovingConnection (write), t (copy), p1 (ref), p3 (ref)
		if p4 == p2 then
			characterRemovingConnection:Disconnect()
			
			if t[p1] == p3 then
				t[p1] = nil
			end
		end
	end)
	p3.BreakJointsOnDeath = false
	
	if not avatarJointUpgradeFeatureEngineFeature then
		ragdollRiggingModule.createRagdollJoints(p2, p3.RigType, avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature)
	end
	t[p1] = p3
	
	if avatarJointUpgradeFeatureEngineFeature then
		p3.Died:Connect(function()
			-- upvalues: t (copy), p1 (ref), p3 (ref), ragdollRiggingModule (copy), avatarJointUpgradeFeatureEngineFeature (copy), avatarJointUpgradeDefaultOnFeatureEngineFeature (copy)
			t[p1] = nil
			local parent = p3.Parent
			
			if parent and parent:IsA("Model") then
				ragdollRiggingModule.disableMotors(parent, p3.RigType)
				
				if avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature then
					ragdollRiggingModule.easeNongraphicJointFriction(parent, 0.85)
				end
			end
		end)
	end
end)