local Players = game:GetService("Players")
local SignalsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Signals)

local function createRecentlyLeftStore(p1) --[[ Line: 43 ]]
	-- upvalues: SignalsModule (copy), Players (copy)
	local Callback = p1 or os.clock
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 46 ]]
		-- upvalues: Signal (copy)
		local t = {}
		
		for i in Signal(p2) do
			t[i] = true
		end
		return t
	end)
	local Flag = false
	
	local function prune(List) --[[ Line: 55 ]]
		-- upvalues: Callback (copy)
		local CallbackResult = Callback()
		local t = {}
		
		for i, value in List do
			if CallbackResult - value.leftAtClock <= 120 then
				t[i] = value
			end
		end
		return t
	end
	
	local function handlePlayerRemoving(Player: Player) --[[ Line: 67 ]]
		-- upvalues: Players (upval), Signal (copy), Callback (copy), Signal2 (copy), prune (copy)
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer or Player.UserId ~= LocalPlayer.UserId then
			local Copy = table.clone(Signal(false))
			Copy[tostring(Player.UserId)] = {
				userId = Player.UserId,
				username = Player.Name,
				displayName = Player.DisplayName,
				leftAtClock = Callback()
			}
			Signal2((prune(Copy)))
			
			return
		end
	end
	
	local function handlePlayerAdded(Player: Player) --[[ Line: 83 ]]
		-- upvalues: Signal (copy), Signal2 (copy), prune (copy)
		local SignalResult = Signal(false)
		
		if SignalResult[tostring(Player.UserId)] ~= nil then
			local Copy = table.clone(SignalResult)
			Copy[tostring(Player.UserId)] = nil
			Signal2((prune(Copy)))
			
			return
		end
	end
	
	return {
		init = function() --[[ Line: 93 ]]
			-- upvalues: Flag (ref), Players (upval), handlePlayerRemoving (copy), handlePlayerAdded (copy)
			if not Flag then
				Flag = true
				Players.PlayerRemoving:Connect(handlePlayerRemoving)
				Players.PlayerAdded:Connect(handlePlayerAdded)
				
				return
			end
		end,
		getRecentlyLeft = function() --[[ Line: 102 ]]
			-- upvalues: prune (copy), Signal (copy)
			local List = {}
			
			for _, value in prune(Signal(false)) do
				table.insert(List, {
					userId = value.userId,
					username = value.username,
					displayName = value.displayName
				})
			end
			return List
		end,
		getRecentlyLeftIds = function() --[[ Line: 115 ]]
			-- upvalues: Computed (copy)
			return Computed
		end,
		handlePlayerRemoving = handlePlayerRemoving,
		handlePlayerAdded = handlePlayerAdded
	}
end

local RecentlyLeftStore = createRecentlyLeftStore()

return {
	init = RecentlyLeftStore.init,
	getRecentlyLeft = RecentlyLeftStore.getRecentlyLeft,
	getRecentlyLeftIds = RecentlyLeftStore.getRecentlyLeftIds,
	handlePlayerRemoving = RecentlyLeftStore.handlePlayerRemoving,
	handlePlayerAdded = RecentlyLeftStore.handlePlayerAdded,
	createRecentlyLeftStore = createRecentlyLeftStore
}