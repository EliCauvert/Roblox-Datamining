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
local var7 = (function()
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
deathType.Value = var7
deathType.Parent = robloxReplicatedStorageService

if not avatarJointUpgradeFeatureEngineFeature and var7 ~= "Ragdoll" then return end
local t = {}

if not avatarJointUpgradeFeatureEngineFeature then
	local onRagdoll = Instance.new("RemoteEvent")
	onRagdoll.Name = "OnRagdoll"
	onRagdoll.OnServerEvent:Connect(function(p0, p1)
		-- upvalues: t (ref), ragdollRiggingModule (ref)
		if p1 and t[p0] == p1 then
			local parent = p1 and p1.Parent
			
			if parent and parent:IsA("Model") then
				ragdollRiggingModule.disableMotors(parent, p1.RigType)
			end
			t[p0] = nil
		end
	end)
	onRagdoll.Parent = robloxReplicatedStorageService
end
humanoidReadyUtilModule.registerHumanoidReady(function(p2, p3, p4)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), avatarJointUpgradeDefaultOnFeatureEngineFeature (ref), ragdollRiggingModule (ref), var7 (ref), t (ref)
	if avatarJointUpgradeFeatureEngineFeature then
		if p4.RigType == Enum.HumanoidRigType.R15 and (avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature) then
			ragdollRiggingModule.createRagdollJoints(p3, p4.RigType, avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature)
		elseif var7 == "Ragdoll" then
			ragdollRiggingModule.createRagdollJoints(p3, p4.RigType, false)
		end
	end
	if var7 ~= "Ragdoll" then return end
	local characterRemovingConnection = nil
	
	local function _()
		-- upvalues: characterRemovingConnection (write), t (copy), p2 (ref), p4 (ref)
		characterRemovingConnection:Disconnect()
		
		if t[p2] == p4 then
			t[p2] = nil
		end
	end
	
	characterRemovingConnection = p2.CharacterRemoving:Connect(function(p5)
		-- upvalues: p3 (ref), characterRemovingConnection (write), t (copy), p2 (ref), p4 (ref)
		if p5 == p3 then
			characterRemovingConnection:Disconnect()
			
			if t[p2] == p4 then
				t[p2] = nil
			end
		end
	end)
	p4.BreakJointsOnDeath = false
	
	if not avatarJointUpgradeFeatureEngineFeature then
		ragdollRiggingModule.createRagdollJoints(p3, p4.RigType, avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature)
	end
	t[p2] = p4
	
	if avatarJointUpgradeFeatureEngineFeature then
		p4.Died:Connect(function()
			-- upvalues: t (copy), p2 (ref), p4 (ref), ragdollRiggingModule (copy), avatarJointUpgradeFeatureEngineFeature (copy), avatarJointUpgradeDefaultOnFeatureEngineFeature (copy)
			t[p2] = nil
			local parent = p4.Parent
			
			if parent and parent:IsA("Model") then
				ragdollRiggingModule.disableMotors(parent, p4.RigType)
				
				if avatarJointUpgradeFeatureEngineFeature and avatarJointUpgradeDefaultOnFeatureEngineFeature then
					ragdollRiggingModule.easeNongraphicJointFriction(parent, 0.85)
				end
			end
		end)
	end
end)