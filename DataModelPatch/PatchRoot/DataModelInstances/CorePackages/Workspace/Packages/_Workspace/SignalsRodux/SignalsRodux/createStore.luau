local RunService = game:GetService("RunService")
local SignalsModule = require(script.Parent.Parent.Signals)
local _ = require(script.Parent.types)
local CreateEventModule = require(script.Parent.createEvent)

return function(Callback, p1, p2, p3, p4)
	-- upvalues: SignalsModule (copy), CreateEventModule (copy), RunService (copy)
	local v1 = p1
	local Flag = false
	local List = { { type = "@@INIT" } }
	
	local function processActions(p5)
		-- upvalues: List (ref), Callback (copy), v1 (ref), p3 (copy)
		local List1 = List
		List = {}
		local CountList1 = #List1
		
		for i, value in List1 do
			local Thread = coroutine.create(function()
				-- upvalues: i (copy), CountList1 (copy), Callback (upval), v1 (upval), value (copy), p5 (copy)
				return if i == CountList1 then Callback(v1, value, p5) else Callback(v1, value, nil)
			end)
			local Success, Result = coroutine.resume(Thread)
			
			if Success and coroutine.status(Thread) == "dead" then
				v1 = Result
			elseif p3 ~= nil then
				local AttemptedToYieldInReducer: string = if Success then "attempted to yield in reducer" else "caught error in reducer"
				p3.reportReducerError(v1, value, {
					message = AttemptedToYieldInReducer,
					thrownValue = debug.traceback(Thread, if Success then AttemptedToYieldInReducer else tostring(Result))
				})
			end
		end
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(nil, function(): boolean
		return false
	end)
	local Computed = SignalsModule.createComputed(function(p6)
		-- upvalues: Signal (copy), List (ref), Flag (ref), processActions (copy), v1 (ref)
		Signal(p6)
		
		if #List == 0 then
			table.insert(List, { type = "@@RECONCILE" })
		end
		Flag = true
		processActions(p6)
		Flag = false
		
		return v1
	end)
	local EventModule, EventModule2 = CreateEventModule()
	local ComputedResult = Computed()
	
	local function flushHandler()
		-- upvalues: Computed (copy), ComputedResult (ref), EventModule2 (copy), p3 (copy)
		local ComputedResult1 = Computed()
		
		if ComputedResult1 ~= ComputedResult then
			local ComputedResult2 = ComputedResult
			ComputedResult = ComputedResult1
			local Thread = coroutine.create(function()
				-- upvalues: EventModule2 (upval), ComputedResult1 (copy), ComputedResult2 (copy)
				EventModule2(ComputedResult1, ComputedResult2)
			end)
			local Success, Result = coroutine.resume(Thread)
			
			if (not Success or coroutine.status(Thread) ~= "dead") and p3 ~= nil then
				local AttemptedToYieldFlushingStoreUpdates: string = if Success then "attempted to yield flushing store updates" else "caught error flushing store updates"
				p3.reportUpdateError(ComputedResult2, ComputedResult1, {}, {
					message = AttemptedToYieldFlushingStoreUpdates,
					thrownValue = debug.traceback(Thread, if Success then AttemptedToYieldFlushingStoreUpdates else tostring(Result))
				})
			end
		end
	end
	
	local HeartbeatConnection = RunService.Heartbeat:Connect(flushHandler)
	local Flag1 = false
	
	local function v17(p6)
		-- upvalues: List (ref), Signal2 (copy)
		if typeof(p6) ~= "table" or p6.type == nil then
			error("actions must be a table with a 'type' field")
		end
		table.insert(List, p6)
		Signal2()
	end
	
	local config = {
		changed = {
			connect = function(_, p6)
				-- upvalues: EventModule (copy)
				return { disconnect = EventModule(p6) }
			end
		},
		destruct = function(_)
			-- upvalues: Flag1 (ref), HeartbeatConnection (copy)
			if not Flag1 then
				Flag1 = true
				HeartbeatConnection:Disconnect()
				
				return
			end
		end,
		dispatch = function(_, p6)
			-- upvalues: Flag (ref), Flag1 (ref), v17 (ref)
			if Flag then
				error("reducers cannot dispatch actions")
			elseif Flag1 then
				error("cannot dispatch to a destroyed store")
			end
			return v17(p6)
		end,
		getState = function(_, p6)
			-- upvalues: Flag (ref), Computed (copy)
			if Flag then
				error("reducers cannot call getState()")
			end
			return Computed(p6)
		end,
		flush = function(_)
			-- upvalues: Flag (ref), Flag1 (ref), flushHandler (copy)
			if Flag then
				error("reducers cannot flush the store")
			elseif Flag1 then
				error("cannot flush a destroyed store")
			end
			flushHandler()
		end
	}
	
	if p4 ~= nil then
		p4:_hookIntoStore(config)
	end
	if p2 ~= nil and #p2 > 0 then
		for i = #p2, 1, -1 do
			v17 = p2[i](v17, config)
		end
	end
	return config
end