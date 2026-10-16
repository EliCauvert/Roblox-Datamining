local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function() --[[ Line: 24 ]]
	-- upvalues: CreateSignalFunction (copy), CryoModule (copy), Players (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction({}, CryoModule.Dictionary.equals)
	local HealthChangedConnection = nil
	local DiedConnection = nil
	local ChildAddedConnection = nil
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players.LocalPlayer
	end
	local function updateHealthValue() --[[ Line: 41 ]]
		-- upvalues: Signal (copy), Signal2_1 (copy)
		local SignalResult = Signal(false)
		Signal2_1(if SignalResult then {
			health = SignalResult.Health,
			maxHealth = SignalResult.MaxHealth,
			isDead = SignalResult.Health <= 0
		} else {})
	end
	
	local function _() --[[ Line: 52 | Named "unobserveHumanoid" ]]
		-- upvalues: ChildAddedConnection (ref), HealthChangedConnection (ref), DiedConnection (ref), Signal2 (copy)
		if ChildAddedConnection then
			ChildAddedConnection:Disconnect()
			ChildAddedConnection = nil
		end
		if HealthChangedConnection then
			HealthChangedConnection:Disconnect()
			HealthChangedConnection = nil
		end
		if DiedConnection then
			DiedConnection:Disconnect()
			DiedConnection = nil
		end
		Signal2(nil)
	end
	
	local function observeHumanoid() --[[ Line: 69 ]]
		-- upvalues: ChildAddedConnection (ref), HealthChangedConnection (ref), DiedConnection (ref), Signal2 (copy), LocalPlayer (copy), updateHealthValue (copy), observeHumanoid (copy)
		if ChildAddedConnection then
			ChildAddedConnection:Disconnect()
			ChildAddedConnection = nil
		end
		if HealthChangedConnection then
			HealthChangedConnection:Disconnect()
			HealthChangedConnection = nil
		end
		if DiedConnection then
			DiedConnection:Disconnect()
			DiedConnection = nil
		end
		Signal2(nil)
		local Character = LocalPlayer.Character
		
		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid then
				Signal2(Humanoid)
				HealthChangedConnection = Humanoid.HealthChanged:Connect(updateHealthValue)
				DiedConnection = Humanoid.Died:Connect(updateHealthValue)
			else
				ChildAddedConnection = Character.ChildAdded:Connect(function(Child: Humanoid) --[[ Line: 79 ]]
					-- upvalues: observeHumanoid (upval)
					if Child:IsA("Humanoid") then
						observeHumanoid()
					end
				end)
			end
		end
		updateHealthValue()
	end
	
	local CharacterAddedConnection = LocalPlayer.CharacterAdded:Connect(observeHumanoid)
	local CharacterRemovingConnection = LocalPlayer.CharacterRemoving:Connect(observeHumanoid)
	observeHumanoid()
	
	return {
		getLocalHumanoid = Signal,
		getHealthValue = Signal1,
		cleanup = function() --[[ Line: 93 ]]
			-- upvalues: CharacterAddedConnection (copy), CharacterRemovingConnection (copy), ChildAddedConnection (ref), HealthChangedConnection (ref), DiedConnection (ref), Signal2 (copy)
			CharacterAddedConnection:Disconnect()
			CharacterRemovingConnection:Disconnect()
			
			if ChildAddedConnection then
				ChildAddedConnection:Disconnect()
				ChildAddedConnection = nil
			end
			if HealthChangedConnection then
				HealthChangedConnection:Disconnect()
				HealthChangedConnection = nil
			end
			if DiedConnection then
				DiedConnection:Disconnect()
				DiedConnection = nil
			end
			Signal2(nil)
		end
	}
end