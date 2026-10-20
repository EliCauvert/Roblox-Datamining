local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("StarterPlayer")
local Common = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local RagdollRiggingModule = require(Common:FindFirstChild("RagdollRigging"))
local HumanoidReadyUtilModule = require(Common:FindFirstChild("HumanoidReadyUtil"))
local AvatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local DeathType = RobloxReplicatedStorage:WaitForChild("DeathType", 1e999)

if not DeathType or not AvatarJointUpgradeFeatureEngineFeature and DeathType.Value ~= "Ragdoll" then return end
local RemoteEvent = nil

if not AvatarJointUpgradeFeatureEngineFeature then
	RemoteEvent = RobloxReplicatedStorage:WaitForChild("OnRagdoll", 1e999)
	
	if not RemoteEvent or not RemoteEvent:IsA("RemoteEvent") then return end
end
local function onOwnedHumanoidDeath(p1, Humanoid: Humanoid)
	-- upvalues: AvatarJointUpgradeFeatureEngineFeature (copy), DeathType (copy), RagdollRiggingModule (copy), RemoteEvent (ref)
	if not AvatarJointUpgradeFeatureEngineFeature then
		local DisableMotorsResult = RagdollRiggingModule.disableMotors(p1, Humanoid.RigType)
		local Animator = Humanoid:FindFirstChildWhichIsA("Animator")
		
		if Animator then
			Animator:ApplyJointVelocities(DisableMotorsResult)
		end
		RemoteEvent:FireServer(Humanoid)
		wait(0.1)
		RagdollRiggingModule.easeJointFriction_OLD(p1, 0.85)
	elseif DeathType.Value == "Ragdoll" then
		RagdollRiggingModule.disableMotors(p1, Humanoid.RigType)
		
		return
	end
end

HumanoidReadyUtilModule.registerHumanoidReady(function(Player, p1, Humanoid: Humanoid)
	-- upvalues: DeathType (copy), RagdollRiggingModule (copy), LocalPlayer (ref), onOwnedHumanoidDeath (copy)
	local Connection = nil
	local Connection1 = nil
	
	local function _()
		-- upvalues: Connection (ref), Connection1 (ref)
		Connection:Disconnect()
		Connection1:Disconnect()
	end
	
	Connection1 = Humanoid.Died:Connect(function()
		-- upvalues: Connection (ref), Connection1 (ref), DeathType (upval), RagdollRiggingModule (upval), p1 (copy), Player (copy), LocalPlayer (upval), onOwnedHumanoidDeath (upval), Humanoid (copy)
		Connection:Disconnect()
		Connection1:Disconnect()
		
		if DeathType.Value == "Ragdoll" then
			delay(2, function()
				-- upvalues: RagdollRiggingModule (upval), p1 (upval)
				RagdollRiggingModule.disableParticleEmittersAndFadeOut(p1, 0.4)
			end)
		end
		if Player == LocalPlayer then
			onOwnedHumanoidDeath(p1, Humanoid)
		end
	end)
	Connection = Player.CharacterRemoving:Connect(function(Character)
		-- upvalues: p1 (copy), Connection (ref), Connection1 (ref)
		if Character == p1 then
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end)
end)