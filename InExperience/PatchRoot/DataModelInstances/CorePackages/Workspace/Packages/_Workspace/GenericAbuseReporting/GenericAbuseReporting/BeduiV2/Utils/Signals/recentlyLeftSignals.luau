local playersService = game:GetService("Players")
local signalsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Signals)

local function createRecentlyLeftStore(p1)
	-- upvalues: signalsModule (ref), playersService (ref)
	p1 = p1 or os.clock
	local var1, var2 = signalsModule.createSignal({})
	local var3 = signalsModule.createComputed(function(p2)
		-- upvalues: var1 (ref)
		local t = {}
		
		for i in var1(p2) do
			t[i] = true
		end
		return t
	end)
	local var4 = false
	
	local function prune(p3)
		-- upvalues: p1 (ref)
		local var5 = p1()
		local t = {}
		
		for i, v in p3 do
			if var5 - v.leftAtClock <= 120 then
				t[i] = v
			end
		end
		return t
	end
	
	local function handlePlayerRemoving(p4)
		-- upvalues: playersService (copy), var1 (ref), p1 (ref), var2 (ref), prune (ref)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer and p4.UserId == localPlayer.UserId then
			return
		end
		local cloned = table.clone(var1(false))
		cloned[tostring(p4.UserId)] = {
			userId = p4.UserId,
			username = p4.Name,
			displayName = p4.DisplayName,
			leftAtClock = p1()
		}
		var2(prune(cloned))
	end
	
	local function handlePlayerAdded(p4)
		-- upvalues: var1 (ref), var2 (ref), prune (ref)
		local var6 = var1(false)
		
		if var6[tostring(p4.UserId)] == nil then
			return
		end
		local cloned = table.clone(var6)
		cloned[tostring(p4.UserId)] = nil
		var2(prune(cloned))
	end
	
	return {
		init = function()
			-- upvalues: var4 (write), playersService (copy), handlePlayerRemoving (ref), handlePlayerAdded (ref)
			if var4 then
				return
			end
			var4 = true
			playersService.PlayerRemoving:Connect(handlePlayerRemoving)
			playersService.PlayerAdded:Connect(handlePlayerAdded)
		end,
		getRecentlyLeft = function()
			-- upvalues: prune (ref), var1 (ref)
			local t = {}
			
			for i, v in prune(var1(false)) do
				table.insert(t, {
					userId = v.userId,
					username = v.username,
					displayName = v.displayName
				})
			end
			return t
		end,
		getRecentlyLeftIds = function()
			-- upvalues: var3 (ref)
			return var3
		end,
		handlePlayerRemoving = handlePlayerRemoving,
		handlePlayerAdded = handlePlayerAdded
	}
end

local var6 = createRecentlyLeftStore()

return {
	init = var6.init,
	getRecentlyLeft = var6.getRecentlyLeft,
	getRecentlyLeftIds = var6.getRecentlyLeftIds,
	handlePlayerRemoving = var6.handlePlayerRemoving,
	handlePlayerAdded = var6.handlePlayerAdded,
	createRecentlyLeftStore = createRecentlyLeftStore
}