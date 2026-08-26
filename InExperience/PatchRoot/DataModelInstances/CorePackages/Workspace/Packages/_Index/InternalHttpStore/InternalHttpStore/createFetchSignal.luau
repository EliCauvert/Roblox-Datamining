local parent = script.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local httpSignalsModule = require(parent_1.HttpSignals)
local httpModule = require(parent_1.Http)
local statusCodes = httpModule.StatusCodes
local _ = require(parent.HttpStoreTypes)
local createParsedResponseModule = require(parent.createParsedResponse)
local mrRouterHeaders = httpModule.MrRouterHeaders
local t = {
	[statusCodes.REQUEST_TIMEOUT] = true,
	[statusCodes.SERVICE_UNAVAILABLE] = true,
	[statusCodes.GATEWAY_TIMEOUT] = true
}

local function createHttpFetchWithRetry(p1)
	-- upvalues: signalsModule (ref), httpSignalsModule (ref), t (ref), statusCodes (ref)
	local maxRetryCount = p1.MaxRetryCount or 4
	local retryJitterMinMs = p1.RetryJitterMinMs or 0
	local retryJitterMaxMs = p1.RetryJitterMaxMs or 4000
	local var1 = nil
	local var2 = nil
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal(false)
	
	local function _()
		-- upvalues: var1 (write), var2 (write)
		if var1 ~= nil then
			task.cancel(var1)
			var1 = nil
		end
		if var2 ~= nil then
			var2()
			var2 = nil
		end
	end
	
	local function dispose()
		-- upvalues: var6 (ref), var1 (write), var2 (write)
		var6(true)
		
		if var1 ~= nil then
			task.cancel(var1)
			var1 = nil
		end
		if var2 ~= nil then
			var2()
			var2 = nil
		end
	end
	
	local function scheduleRetry(p2)
		-- upvalues: var1 (write), var3 (ref), retryJitterMaxMs (ref), retryJitterMinMs (ref), var4 (ref)
		if var1 ~= nil then return end
		local var7 = p2
		
		if var7 == nil or var7 > 16 then
			var7 = math.max(math.pow(2, var3() + 1) + (retryJitterMinMs + math.random() * (retryJitterMaxMs - retryJitterMinMs)) / 1000, 0)
		end
		var1 = task.delay(var7, function()
			-- upvalues: var1 (copy), var4 (copy)
			var1 = nil
			var4(function(p3)
				return p3 + 1
			end)
		end)
	end
	
	local var7 = signalsModule.createComputed(function(p2)
		-- upvalues: var3 (ref), p1 (ref), var1 (write), var2 (write), httpSignalsModule (copy)
		local var8 = var3(p2)
		local var9 = p1
		
		if var8 > 0 then
			var9 = table.clone(p1)
			local var10 = if p1.Headers then table.clone(p1.Headers) else {}
			var10["X-Retry-Attempt"] = tostring(var8)
			var9.Headers = var10
		end
		if var1 ~= nil then
			task.cancel(var1)
			var1 = nil
		end
		if var2 ~= nil then
			var2()
			var2 = nil
		end
		local var11, var12 = httpSignalsModule.fetch(var9)
		var2 = var12
		
		return var11
	end)
	
	return signalsModule.createComputed(function(p2)
		-- upvalues: var5 (ref), var7 (ref), var3 (ref), maxRetryCount (ref), t (copy), scheduleRetry (ref), statusCodes (copy)
		if var5(p2) then
			return {
				status = "error",
				error = { HttpError = Enum.HttpError.Aborted }
			}
		end
		local var8 = var7(p2)(p2)
		
		if var8.status == "pending" then
			return var8
		elseif var8.status == "success" then
			local data = var8.data
			local statusCode = data.StatusCode
			
			if data.Stats and data.Stats.WasRequestRetried then
				return var8
			elseif statusCode >= 200 and statusCode < 400 then
				return var8
			elseif var3() < maxRetryCount then
				if t[statusCode] then
					scheduleRetry()
					
					return { status = "pending" }
				elseif data.IsPrefetch and statusCode == statusCodes.UNAUTHORIZED then
					scheduleRetry()
					
					return { status = "pending" }
				elseif statusCode == statusCodes.TOO_MANY_REQUESTS and data.Headers["Retry-After"] then
					local var9 = tonumber(data.Headers["Retry-After"])
					
					if var9 == nil or var9 > 16 then
						return var8
					else
						scheduleRetry(var9)
						
						return { status = "pending" }
					end
				end
			end
		elseif var8.status ~= "error" then
			return var8
		elseif var3() < maxRetryCount then
			scheduleRetry()
			
			return { status = "pending" }
		end
		return var8
	end), dispose
end

return function(p1)
	-- upvalues: mrRouterHeaders (ref), createHttpFetchWithRetry (ref), createParsedResponseModule (ref)
	if p1.MaxRetryCount ~= nil and p1.MaxRetryCount < 0 then
		error(`MaxRetryCount must be >= 0, was provided: {p1.MaxRetryCount}`)
	end
	if p1.RetryJitterMinMs ~= nil and p1.RetryJitterMaxMs ~= nil and p1.RetryJitterMaxMs <= p1.RetryJitterMinMs then
		error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided")
	end
	local var1 = p1
	local var2 = mrRouterHeaders.injectMrRouterHeaders(p1.Headers)
	
	if var2 ~= p1.Headers then
		var1 = table.clone(p1)
		var1.Headers = var2
	end
	local var3, var4 = createHttpFetchWithRetry(var1)
	
	return createParsedResponseModule(var3, var1), var4
end