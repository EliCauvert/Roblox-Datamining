local playersService = game:GetService("Players")
local signalsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Signals)

local function createRecentlyLeftStore(p0)
	-- upvalues: signalsModule (ref), playersService (ref)
	p0 = p0 or os.clock
	local var5, var6 = signalsModule.createSignal({})
	local var7 = signalsModule.createComputed(function(p1)
		-- upvalues: var5 (ref)
		local t = {}
		
		for i in var5(p1) do
			t[i] = true
		end
		return t
	end)
	local var8 = false
	
	local function prune(p2)
		-- upvalues: p0 (ref)
		local var13 = p0()
		local t = {}
		
		for i, v in p2 do
			if var13 - v.leftAtClock <= 120 then
				t[i] = v
			end
		end
		return t
	end
	
	local function handlePlayerRemoving(p3)
		-- upvalues: playersService (copy), var5 (ref), p0 (ref), var6 (ref), prune (ref)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer and p3.UserId == localPlayer.UserId then
			return
		end
		local cloned = table.clone(var5(false))
		cloned[tostring(p3.UserId)] = {
			userId = p3.UserId,
			username = p3.Name,
			displayName = p3.DisplayName,
			leftAtClock = p0()
		}
		var6(prune(cloned))
	end
	
	local function handlePlayerAdded(p4)
		-- upvalues: var5 (ref), var6 (ref), prune (ref)
		local var16 = var5(false)
		
		if var16[tostring(p4.UserId)] == nil then
			return
		end
		local cloned = table.clone(var16)
		cloned[tostring(p4.UserId)] = nil
		var6(prune(cloned))
	end
	
	return {
		init = function()
			-- upvalues: var8 (write), playersService (copy), handlePlayerRemoving (ref), handlePlayerAdded (ref)
			if var8 then
				return
			end
			var8 = true
			playersService.PlayerRemoving:Connect(handlePlayerRemoving)
			playersService.PlayerAdded:Connect(handlePlayerAdded)
		end,
		getRecentlyLeft = function()
			-- upvalues: prune (ref), var5 (ref)
			local t = {}
			
			for i, v in prune(var5(false)) do
				table.insert(t, {
					userId = v.userId,
					username = v.username,
					displayName = v.displayName
				})
			end
			return t
		end,
		getRecentlyLeftIds = function()
			-- upvalues: var7 (ref)
			return var7
		end,
		handlePlayerRemoving = handlePlayerRemoving,
		handlePlayerAdded = handlePlayerAdded
	}
end

local var3 = createRecentlyLeftStore()

return {
	init = var3.init,
	getRecentlyLeft = var3.getRecentlyLeft,
	getRecentlyLeftIds = var3.getRecentlyLeftIds,
	handlePlayerRemoving = var3.handlePlayerRemoving,
	handlePlayerAdded = var3.handlePlayerAdded,
	createRecentlyLeftStore = createRecentlyLeftStore
}