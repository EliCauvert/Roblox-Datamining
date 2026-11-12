local SignalsSchedulerResetStateAfterErrors = require(script.Parent.Parent.SignalsFlags).SignalsSchedulerResetStateAfterErrors
local Flag = false
local Tbl = {}

local function noop() end

local OnBatch = noop
local OnContinuations = noop

local function _()
	-- upvalues: Tbl (copy)
	local Count = 1
	while Count <= #Tbl do
		Tbl[Count]()
		Count += 1
	end
end

local function runContinuations()
	-- upvalues: Tbl (copy)
	local v1 = nil
	local Count = 1
	while Count <= #Tbl do
		local Success, Result = xpcall(Tbl[Count], debug.traceback)
		
		if not Success and v1 == nil then
			v1 = Result
		end
		Count += 1
	end
	return v1 == nil, v1
end

local function batch(Callback: () -> ())
	-- upvalues: Flag (ref), OnBatch (ref), SignalsSchedulerResetStateAfterErrors (copy), OnContinuations (ref), Tbl (copy), runContinuations (copy)
	if Flag then
		Callback()
	else
		OnBatch()
		Flag = true
		
		if SignalsSchedulerResetStateAfterErrors then
			local Success, Result = xpcall(Callback, debug.traceback)
			OnContinuations(#Tbl)
			local RunContinuationsResult, RunContinuationsResult2 = runContinuations()
			table.clear(Tbl)
			Flag = false
			
			if not Success then
				error(Result, 0)
			end
			if not RunContinuationsResult then
				error(RunContinuationsResult2, 0)
				
				return
			end
		else
			Callback()
			OnContinuations(#Tbl)
			local Count = 1
			while Count <= #Tbl do
				Tbl[Count]()
				Count += 1
			end
			table.clear(Tbl)
			Flag = false
			
			return
		end
	end
end

return {
	batch = batch,
	flush = function()
		-- upvalues: batch (copy)
		batch(function() end)
	end,
	schedule = function(p1)
		-- upvalues: Tbl (copy)
		table.insert(Tbl, p1)
	end,
	setHooks = function(p1)
		-- upvalues: OnBatch (ref), noop (copy), OnContinuations (ref)
		local T = if p1 == nil then {} else p1
		OnBatch = T.onBatch or noop
		OnContinuations = T.onContinuations or noop
	end
}