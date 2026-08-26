local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("StarterPlayer")
local common = coreGuiService:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local ragdollRiggingModule = require(common:FindFirstChild("RagdollRigging"))
local humanoidReadyUtilModule = require(common:FindFirstChild("HumanoidReadyUtil"))
local avatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local localPlayer = playersService.LocalPlayer

if not localPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local deathType = robloxReplicatedStorageService:WaitForChild("DeathType", 1e999)

if not deathType or not avatarJointUpgradeFeatureEngineFeature and deathType.Value ~= "Ragdoll" then return end
local onRagdoll = nil

if not avatarJointUpgradeFeatureEngineFeature then
	onRagdoll = robloxReplicatedStorageService:WaitForChild("OnRagdoll", 1e999)
	
	if onRagdoll and onRagdoll:IsA("RemoteEvent") then
		local function onOwnedHumanoidDeath(p1, p2)
			-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), deathType (ref), ragdollRiggingModule (ref), onRagdoll (write)
			if avatarJointUpgradeFeatureEngineFeature then
				if deathType.Value == "Ragdoll" then
					ragdollRiggingModule.disableMotors(p1, p2.RigType)
					
					return
				end
			else
				local var1 = ragdollRiggingModule.disableMotors(p1, p2.RigType)
				local animator = p2:FindFirstChildWhichIsA("Animator")
				
				if animator then
					animator:ApplyJointVelocities(var1)
				end
				onRagdoll:FireServer(p2)
				wait(0.1)
				ragdollRiggingModule.easeJointFriction_OLD(p1, 0.85)
			end
		end
		
		humanoidReadyUtilModule.registerHumanoidReady(function(p1, p2, p3)
			-- upvalues: deathType (ref), ragdollRiggingModule (ref), localPlayer (write), onOwnedHumanoidDeath (ref)
			local characterRemovingConnection = nil
			local diedConnection = nil
			
			local function _()
				-- upvalues: characterRemovingConnection (write), diedConnection (write)
				characterRemovingConnection:Disconnect()
				diedConnection:Disconnect()
			end
			
			diedConnection = p3.Died:Connect(function()
				-- upvalues: characterRemovingConnection (write), diedConnection (write), deathType (copy), ragdollRiggingModule (copy), p2 (ref), p1 (ref), localPlayer (copy), onOwnedHumanoidDeath (copy), p3 (ref)
				characterRemovingConnection:Disconnect()
				diedConnection:Disconnect()
				
				if deathType.Value == "Ragdoll" then
					delay(2, function()
						-- upvalues: ragdollRiggingModule (copy), p2 (copy)
						ragdollRiggingModule.disableParticleEmittersAndFadeOut(p2, 0.4)
					end)
				end
				if p1 == localPlayer then
					onOwnedHumanoidDeath(p2, p3)
				end
			end)
			characterRemovingConnection = p1.CharacterRemoving:Connect(function(p4)
				-- upvalues: p2 (ref), characterRemovingConnection (write), diedConnection (write)
				if p4 == p2 then
					characterRemovingConnection:Disconnect()
					diedConnection:Disconnect()
				end
			end)
		end)
		
		return
	else
	end
end