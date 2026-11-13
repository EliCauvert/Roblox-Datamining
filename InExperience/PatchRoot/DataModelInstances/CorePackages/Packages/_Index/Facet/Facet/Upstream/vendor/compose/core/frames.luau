local _ = require("./host")
local OwnerModule = require("./ownership/owner")
local ReactorModule = require("./reactive/reactor")

return function(p1, p2)
	-- upvalues: ReactorModule (copy), OwnerModule (copy)
	local List = {}
	local OnFrameResult = nil
	local Flag = false
	local Count = 0
	
	local function compact()
		-- upvalues: Flag (ref), Count (ref), List (copy), OnFrameResult (ref)
		if Flag or Count == 0 then return end
		Count = 0
		local Count1 = 0
		
		for _, value in List do
			if value.live then
				Count1 += 1
				List[Count1] = value
			end
		end
		for i = #List, Count1 + 1, -1 do
			List[i] = nil
		end
		if Count1 == 0 and OnFrameResult then
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			Callback()
		end
	end
	
	local v1 = 0
	local Count1 = 0
	local Count2 = 0
	local v2 = nil
	
	local function sweep()
		-- upvalues: v1 (ref), Count1 (ref), Count2 (ref), List (copy)
		local v3 = v1
		while Count1 < Count2 do
			Count1 += 1
			local Entry = List[Count1]
			
			if Entry.live then
				Entry.body(v3)
			end
		end
	end
	
	local function dispatch()
		-- upvalues: Count1 (ref), Count2 (ref), List (copy), sweep (copy), v2 (ref)
		Count1 = 0
		Count2 = #List
		while true do
			local Success, Result = pcall(sweep)
			if Success then break end
			local V11 = v2 or {}
			v2 = V11
			table.insert(V11, Result)
		end
	end
	
	local function batched()
		-- upvalues: ReactorModule (upval), p2 (copy), dispatch (copy)
		ReactorModule.batch(p2, dispatch)
	end
	
	return {
		now = p1.now,
		onFrame = function(Body)
			-- upvalues: List (copy), OnFrameResult (ref), p1 (copy), Flag (ref), v1 (ref), Count1 (ref), Count2 (ref), v2 (ref), batched (copy), compact (copy), OwnerModule (upval), Count (ref)
			local config = { live = true, body = Body }
			table.insert(List, config)
			
			if OnFrameResult == nil then
				OnFrameResult = p1.onFrame(function(p3)
					-- upvalues: Flag (upval), v1 (upval), Count1 (upval), Count2 (upval), v2 (upval), batched (upval), compact (upval), OwnerModule (upval)
					local Flag1: boolean = Flag
					local v4 = v1
					local Count = Count1
					local Count3 = Count2
					local v5 = v2
					Flag = true
					v2 = nil
					v1 = p3
					local Success, Result = pcall(batched)
					Flag = Flag1
					compact()
					local V11 = v2 or {}
					v1 = v4
					Count1 = Count
					Count2 = Count3
					v2 = v5
					
					if not Success then
						table.insert(V11, Result)
					end
					OwnerModule.raiseAll(V11)
				end)
			end
			return function()
				-- upvalues: config (copy), Count (upval), compact (upval)
				if config.live then
					config.live = false
					Count += 1
				end
				compact()
			end
		end
	}
end