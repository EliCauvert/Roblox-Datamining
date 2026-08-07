local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("CoreGuiCommon").Parent
local cryoModule = require(parent.Cryo)
local createSignal = require(parent.Signals).createSignal

return function() --[[ line: 24 ]]
	-- upvalues: createSignal (ref), cryoModule (ref), playersService (ref)
	local var2, var3 = createSignal(nil)
	local var4, var5 = createSignal({}, cryoModule.Dictionary.equals)
	local var6 = nil
	local var7 = nil
	local var8 = nil
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local function updateHealthValue() --[[ line: 41 ]]
		-- upvalues: var2 (ref), var5 (ref)
		local var13 = var2(false)
		var5(if var13 then {
			health = var13.Health,
			maxHealth = var13.MaxHealth,
			isDead = var13.Health <= 0
		} else {})
	end
	
	local function _() --[[ line: 52 | named "unobserveHumanoid" ]]
		-- upvalues: var8 (write), var6 (write), var7 (write), var3 (ref)
		if var8 then
			var8:Disconnect()
			var8 = nil
		end
		if var6 then
			var6:Disconnect()
			var6 = nil
		end
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		var3(nil)
	end
	
	local function observeHumanoid() --[[ line: 69 ]]
		-- upvalues: var8 (write), var6 (write), var7 (write), var3 (ref), localPlayer (ref), updateHealthValue (ref), observeHumanoid (ref)
		if var8 then
			var8:Disconnect()
			var8 = nil
		end
		if var6 then
			var6:Disconnect()
			var6 = nil
		end
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		var3(nil)
		local character = localPlayer.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if humanoid then
				var3(humanoid)
				var6 = humanoid.HealthChanged:Connect(updateHealthValue)
				var7 = humanoid.Died:Connect(updateHealthValue)
			else
				var8 = character.ChildAdded:Connect(function(p0) --[[ line: 79 ]]
					-- upvalues: observeHumanoid (copy)
					if p0:IsA("Humanoid") then
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
		getLocalHumanoid = var2,
		getHealthValue = var4,
		cleanup = function() --[[ line: 93 ]]
			-- upvalues: characterAddedConnection (ref), characterRemovingConnection (ref), var8 (write), var6 (write), var7 (write), var3 (ref)
			characterAddedConnection:Disconnect()
			characterRemovingConnection:Disconnect()
			
			if var8 then
				var8:Disconnect()
				var8 = nil
			end
			if var6 then
				var6:Disconnect()
				var6 = nil
			end
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
			var3(nil)
		end
	}
end