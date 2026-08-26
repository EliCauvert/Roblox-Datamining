local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local cryoModule = require(parent.Cryo)
local createSignal = require(parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref), cryoModule (ref), playersService (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal({}, cryoModule.Dictionary.equals)
	local var5 = nil
	local var6 = nil
	local var7 = nil
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local function updateHealthValue()
		-- upvalues: var1 (ref), var4 (ref)
		local var8 = var1(false)
		var4(if var8 then {
			health = var8.Health,
			maxHealth = var8.MaxHealth,
			isDead = var8.Health <= 0
		} else {})
	end
	
	local function _()
		-- upvalues: var7 (write), var5 (write), var6 (write), var2 (ref)
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		if var5 then
			var5:Disconnect()
			var5 = nil
		end
		if var6 then
			var6:Disconnect()
			var6 = nil
		end
		var2(nil)
	end
	
	local function observeHumanoid()
		-- upvalues: var7 (write), var5 (write), var6 (write), var2 (ref), localPlayer (ref), updateHealthValue (ref), observeHumanoid (ref)
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		if var5 then
			var5:Disconnect()
			var5 = nil
		end
		if var6 then
			var6:Disconnect()
			var6 = nil
		end
		var2(nil)
		local character = localPlayer.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if humanoid then
				var2(humanoid)
				var5 = humanoid.HealthChanged:Connect(updateHealthValue)
				var6 = humanoid.Died:Connect(updateHealthValue)
			else
				var7 = character.ChildAdded:Connect(function(p1)
					-- upvalues: observeHumanoid (copy)
					if p1:IsA("Humanoid") then
						observeHumanoid()
					end
				end)
			end
		end
		updateHealthValue()
	end
	
	local characterAddedConnection = localPlayer.CharacterAdded:Connect(observeHumanoid)
	local characterRemovingConnection = localPlayer.CharacterRemoving:Connect(observeHumanoid)
	observeHumanoid()
	
	return {
		getLocalHumanoid = var1,
		getHealthValue = var3,
		cleanup = function()
			-- upvalues: characterAddedConnection (ref), characterRemovingConnection (ref), var7 (write), var5 (write), var6 (write), var2 (ref)
			characterAddedConnection:Disconnect()
			characterRemovingConnection:Disconnect()
			
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
			if var6 then
				var6:Disconnect()
				var6 = nil
			end
			var2(nil)
		end
	}
end