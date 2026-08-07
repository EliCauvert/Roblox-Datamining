local playersService = game:GetService("Players")
local var1 = true
local var2 = false
local var3 = nil
local var4 = false
local var5 = false
local bindableEvent = Instance.new("BindableEvent")

return {
	InitAsync = function(_) --[[ line: 21 ]]
		-- upvalues: var1 (write), var2 (write), var4 (write), var5 (write), bindableEvent (ref), playersService (ref), var3 (write)
		if _G.__TESTEZ_RUNNING_TEST__ then
			var1 = false
			var2 = true
			
			return
		elseif var4 then return end
		if var5 then
			bindableEvent.Event:Wait()
			
			return
		end
		var5 = true
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService.PlayerAdded:Wait()
			localPlayer = playersService.LocalPlayer
		end
		assert(localPlayer, "")
		pcall(function() --[[ line: 45 ]]
			-- upvalues: var3 (copy), localPlayer (write)
			var3 = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(localPlayer)
		end)
		
		if var3 then
			var1 = var3.IsSubjectToChinaPolicies
			var2 = var3.IsContentSharingAllowed
		end
		var4 = true
		bindableEvent:Fire()
	end,
	IsSubjectToChinaPolicies = function(p0) --[[ line: 57 ]]
		-- upvalues: var1 (write)
		p0:InitAsync()
		
		return var1
	end,
	IsContentSharingAllowed = function(p1) --[[ line: 63 ]]
		-- upvalues: var2 (write)
		p1:InitAsync()
		
		return var2
	end
}