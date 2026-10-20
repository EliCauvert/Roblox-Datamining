local Parent = script.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local HttpSignalsModule = require(Parent1.HttpSignals)
local StatusCodes = require(Parent1.Http).StatusCodes
local _ = require(Parent.HttpStoreTypes)
local CreateParsedResponseModule = require(Parent.createParsedResponse)
local config = {
	[StatusCodes.REQUEST_TIMEOUT] = true,
	[StatusCodes.SERVICE_UNAVAILABLE] = true,
	[StatusCodes.GATEWAY_TIMEOUT] = true
}

local function createHttpFetchWithRetry(Tbl)
	-- upvalues: SignalsModule (copy), HttpSignalsModule (copy), config (copy), StatusCodes (copy)
	local MaxRetryCount = Tbl.MaxRetryCount or 4
	local RetryJitterMinMs = Tbl.RetryJitterMinMs or 0
	local RetryJitterMaxMs = Tbl.RetryJitterMaxMs or 4000
	local DelayedThread = nil
	local Callback: (() -> ())? = nil
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	
	local function _()
		-- upvalues: DelayedThread (ref), Callback (ref)
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
	end
	
	local function scheduleRetry(Number)
		-- upvalues: DelayedThread (ref), Signal (copy), RetryJitterMaxMs (copy), RetryJitterMinMs (copy), Signal2 (copy)
		if DelayedThread ~= nil then return end
		local Delay: number = Number
		
		if Delay == nil or Delay > 16 then
			Delay = math.max(math.pow(2, Signal() + 1) + (RetryJitterMinMs + math.random() * (RetryJitterMaxMs - RetryJitterMinMs)) / 1000, 0)
		end
		DelayedThread = task.delay(Delay, function()
			-- upvalues: DelayedThread (upval), Signal2 (upval)
			DelayedThread = nil
			Signal2(function(p1: number): number
				return p1 + 1
			end)
		end)
	end
	
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal (copy), Tbl (copy), DelayedThread (ref), Callback (ref), HttpSignalsModule (upval)
		local SignalResult: number = Signal(p1)
		local Tbl1 = Tbl
		
		if SignalResult > 0 then
			Tbl1 = table.clone(Tbl)
			local Copy = if Tbl.Headers then table.clone(Tbl.Headers) else {}
			Copy["X-Retry-Attempt"] = tostring(SignalResult)
			Tbl1.Headers = Copy
		end
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		local FetchResult, FetchResult2 = HttpSignalsModule.fetch(Tbl1)
		Callback = FetchResult2
		
		return FetchResult
	end)
	
	return SignalsModule.createComputed(function(p1)
		-- upvalues: Signal1 (copy), Computed (copy), Signal (copy), MaxRetryCount (copy), config (upval), scheduleRetry (copy), StatusCodes (upval)
		if Signal1(p1) then
			return {
				status = "error",
				error = { HttpError = Enum.HttpError.Aborted }
			}
		end
		local v1 = Computed(p1)(p1)
		
		if v1.status == "pending" then
			return v1
		end
		if v1.status == "success" then
			local Data = v1.data
			local StatusCode: number = Data.StatusCode
			
			if Data.Stats and Data.Stats.WasRequestRetried then
				return v1
			end
			if StatusCode >= 200 and StatusCode < 400 then
				return v1
			end
			if Signal() < MaxRetryCount then
				if config[StatusCode] then
					scheduleRetry()
					
					return { status = "pending" }
				end
				if Data.IsPrefetch and StatusCode == StatusCodes.UNAUTHORIZED then
					scheduleRetry()
					
					return { status = "pending" }
				end
				if StatusCode == StatusCodes.TOO_MANY_REQUESTS and Data.Headers["Retry-After"] then
					local Number: number? = tonumber(Data.Headers["Retry-After"])
					
					if Number ~= nil and Number <= 16 then
						scheduleRetry(Number)
						
						return { status = "pending" }
					end
				end
			end
			return v1
		elseif v1.status ~= "error" then
			return v1
		elseif Signal() < MaxRetryCount then
			scheduleRetry()
			
			return { status = "pending" }
		else
			return v1
		end
	end), function()
		-- upvalues: Signal2_1 (copy), DelayedThread (ref), Callback (ref)
		Signal2_1(true)
		
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
	end
end

return function(p1)
	-- upvalues: createHttpFetchWithRetry (copy), CreateParsedResponseModule (copy)
	if p1.MaxRetryCount ~= nil and p1.MaxRetryCount < 0 then
		error(`MaxRetryCount must be >= 0, was provided: {p1.MaxRetryCount}`)
	end
	if p1.RetryJitterMinMs ~= nil and p1.RetryJitterMaxMs ~= nil and p1.RetryJitterMaxMs <= p1.RetryJitterMinMs then
		error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided")
	end
	local HttpFetchWithRetry, HttpFetchWithRetry2 = createHttpFetchWithRetry(p1)
	
	return CreateParsedResponseModule(HttpFetchWithRetry, p1), HttpFetchWithRetry2
end