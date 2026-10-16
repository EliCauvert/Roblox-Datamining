local Parent = script.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local HttpSignalsModule = require(Parent1.HttpSignals)
local HttpModule = require(Parent1.Http)
local StatusCodes = HttpModule.StatusCodes
local _ = require(Parent.HttpStoreTypes)
local CreateParsedResponseModule = require(Parent.createParsedResponse)
local MrRouterHeaders = HttpModule.MrRouterHeaders
local config = {
	[StatusCodes.REQUEST_TIMEOUT] = true,
	[StatusCodes.SERVICE_UNAVAILABLE] = true,
	[StatusCodes.GATEWAY_TIMEOUT] = true
}

local function createHttpFetchWithRetry(Tbl) --[[ Line: 33 ]]
	-- upvalues: SignalsModule (copy), HttpSignalsModule (copy), config (copy), StatusCodes (copy)
	local MaxRetryCount = Tbl.MaxRetryCount or 4
	local RetryJitterMinMs = Tbl.RetryJitterMinMs or 0
	local RetryJitterMaxMs = Tbl.RetryJitterMaxMs or 4000
	local DelayedThread = nil
	local Callback: (() -> ())? = nil
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	
	local function _() --[[ Line: 44 | Named "cleanupCurrentFetch" ]]
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
	
	local function scheduleRetry(Number) --[[ Line: 60 ]]
		-- upvalues: DelayedThread (ref), Signal (copy), RetryJitterMaxMs (copy), RetryJitterMinMs (copy), Signal2 (copy)
		if DelayedThread ~= nil then return end
		local Delay: number = Number
		
		if Delay == nil or Delay > 16 then
			Delay = math.max(math.pow(2, Signal() + 1) + (RetryJitterMinMs + math.random() * (RetryJitterMaxMs - RetryJitterMinMs)) / 1000, 0)
		end
		DelayedThread = task.delay(Delay, function() --[[ Line: 74 ]]
			-- upvalues: DelayedThread (upval), Signal2 (upval)
			DelayedThread = nil
			Signal2(function(p1: number): number --[[ Line: 76 ]]
				return p1 + 1
			end)
		end)
	end
	
	local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 82 ]]
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
	
	return SignalsModule.createComputed(function(p1) --[[ Line: 100 ]]
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
	end), function() --[[ Line: 55 | Named "dispose" ]]
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

return function(Tbl) --[[ Line: 156 | Named "createFetchHttpHandler" ]]
	-- upvalues: MrRouterHeaders (copy), createHttpFetchWithRetry (copy), CreateParsedResponseModule (copy)
	if Tbl.MaxRetryCount ~= nil and Tbl.MaxRetryCount < 0 then
		error(`MaxRetryCount must be >= 0, was provided: {Tbl.MaxRetryCount}`)
	end
	if Tbl.RetryJitterMinMs ~= nil and Tbl.RetryJitterMaxMs ~= nil and Tbl.RetryJitterMaxMs <= Tbl.RetryJitterMinMs then
		error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided")
	end
	local Tbl1 = Tbl
	local InjectMrRouterHeadersResult = MrRouterHeaders.injectMrRouterHeaders(Tbl.Headers)
	
	if InjectMrRouterHeadersResult ~= Tbl.Headers then
		Tbl1 = table.clone(Tbl)
		Tbl1.Headers = InjectMrRouterHeadersResult
	end
	local HttpFetchWithRetry, HttpFetchWithRetry2 = createHttpFetchWithRetry(Tbl1)
	
	return CreateParsedResponseModule(HttpFetchWithRetry, Tbl1), HttpFetchWithRetry2
end