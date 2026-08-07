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
		local function onOwnedHumanoidDeath(p0, p1) --[[ line: 36 ]]
			-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), deathType (ref), ragdollRiggingModule (ref), onRagdoll (write)
			if avatarJointUpgradeFeatureEngineFeature then
				if deathType.Value == "Ragdoll" then
					ragdollRiggingModule.disableMotors(p0, p1.RigType)
					
					return
				end
			else
				local var10 = ragdollRiggingModule.disableMotors(p0, p1.RigType)
				local animator = p1:FindFirstChildWhichIsA("Animator")
				
				if animator then
					animator:ApplyJointVelocities(var10)
				end
				onRagdoll:FireServer(p1)
				wait(0.1)
				ragdollRiggingModule.easeJointFriction_OLD(p0, 0.85)
			end
		end
		
		humanoidReadyUtilModule.registerHumanoidReady(function(p2, p3, p4) --[[ line: 91 ]]
			-- upvalues: deathType (ref), ragdollRiggingModule (ref), localPlayer (write), onOwnedHumanoidDeath (ref)
			local characterRemovingConnection = nil
			local diedConnection = nil
			
			local function _() --[[ line: 94 | named "disconnect" ]]
				-- upvalues: characterRemovingConnection (write), diedConnection (write)
				characterRemovingConnection:Disconnect()
				diedConnection:Disconnect()
			end
			
			diedConnection = p4.Died:Connect(function() --[[ line: 100 ]]
				-- upvalues: characterRemovingConnection (write), diedConnection (write), deathType (copy), ragdollRiggingModule (copy), p3 (ref), p2 (ref), localPlayer (copy), onOwnedHumanoidDeath (copy), p4 (ref)
				characterRemovingConnection:Disconnect()
				diedConnection:Disconnect()
				
				if deathType.Value == "Ragdoll" then
					delay(2, function() --[[ line: 105 ]]
						-- upvalues: ragdollRiggingModule (copy), p3 (copy)
						ragdollRiggingModule.disableParticleEmittersAndFadeOut(p3, 0.4)
					end)
				end
				if p2 == localPlayer then
					onOwnedHumanoidDeath(p3, p4)
				end
			end)
			characterRemovingConnection = p2.CharacterRemoving:Connect(function(p5) --[[ line: 117 ]]
				-- upvalues: p3 (ref), characterRemovingConnection (write), diedConnection (write)
				if p5 == p3 then
					characterRemovingConnection:Disconnect()
					diedConnection:Disconnect()
				end
			end)
		end)
		
		return
	else
	end
end