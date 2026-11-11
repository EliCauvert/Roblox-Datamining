local RunService = game:GetService("RunService")

local function createTicker(p1)
	-- upvalues: RunService (copy)
	local StepSignal = if p1 == nil then nil else p1.stepSignal
	local Clock = (if p1 == nil then nil else p1.clock) or os.clock
	local List = {}
	local Connection = nil
	
	local function _()
		-- upvalues: Connection (ref), List (copy), StepSignal (copy), RunService (upval), Clock (copy)
		if Connection == nil and #List ~= 0 then
			Connection = (StepSignal or RunService.PreRender):Connect(function()
				-- upvalues: Clock (upval), List (upval)
				local v1 = Clock()
				
				for _, value in table.clone(List) do
					value(v1)
				end
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: Connection (ref), List (copy)
		if Connection ~= nil and #List == 0 then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	return {
		add = function(Value)
			-- upvalues: List (copy), Connection (ref), StepSignal (copy), RunService (upval), Clock (copy)
			table.insert(List, Value)
			
			if Connection == nil and #List ~= 0 then
				Connection = (StepSignal or RunService.PreRender):Connect(function()
					-- upvalues: Clock (upval), List (upval)
					local v1 = Clock()
					
					for _, value in table.clone(List) do
						value(v1)
					end
				end)
			end
			local Flag = false
			
			return function()
				-- upvalues: Flag (ref), List (upval), Value (copy), Connection (upval)
				if Flag then return end
				Flag = true
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex ~= nil then
					table.remove(List, FoundIndex)
				end
				if Connection ~= nil and #List == 0 then
					Connection:Disconnect()
					Connection = nil
				end
			end
		end,
		step = function(p2)
			-- upvalues: Clock (copy), List (copy)
			local P1 = p2 or Clock()
			for _, value in table.clone(List) do
				value(P1)
			end
		end,
		getActiveCount = function(): number
			-- upvalues: List (copy)
			return #List
		end,
		isConnected = function(): boolean
			-- upvalues: Connection (ref)
			return Connection ~= nil
		end
	}
end

return { createTicker = createTicker, shared = createTicker() }