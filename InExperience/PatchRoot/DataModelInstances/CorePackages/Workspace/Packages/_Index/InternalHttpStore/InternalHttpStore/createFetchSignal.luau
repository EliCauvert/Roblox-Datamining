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

local function createHttpFetchWithRetry(p0) --[[ line: 33 ]]
	-- upvalues: signalsModule (ref), httpSignalsModule (ref), t (ref), statusCodes (ref)
	local maxRetryCount = p0.MaxRetryCount or 4
	local retryJitterMinMs = p0.RetryJitterMinMs or 0
	local retryJitterMaxMs = p0.RetryJitterMaxMs or 4000
	local var9 = nil
	local var10 = nil
	local var11, var12 = signalsModule.createSignal(0)
	local var13, var14 = signalsModule.createSignal(false)
	
	local function _() --[[ line: 44 | named "cleanupCurrentFetch" ]]
		-- upvalues: var9 (write), var10 (write)
		if var9 ~= nil then
			task.cancel(var9)
			var9 = nil
		end
		if var10 ~= nil then
			var10()
			var10 = nil
		end
	end
	
	local function dispose() --[[ line: 55 ]]
		-- upvalues: var14 (ref), var9 (write), var10 (write)
		var14(true)
		
		if var9 ~= nil then
			task.cancel(var9)
			var9 = nil
		end
		if var10 ~= nil then
			var10()
			var10 = nil
		end
	end
	
	local function scheduleRetry(p1) --[[ line: 60 ]]
		-- upvalues: var9 (write), var11 (ref), retryJitterMaxMs (ref), retryJitterMinMs (ref), var12 (ref)
		if var9 ~= nil then return end
		local var18 = p1
		
		if var18 == nil or var18 > 16 then
			var18 = math.max(math.pow(2, var11() + 1) + (retryJitterMinMs + math.random() * (retryJitterMaxMs - retryJitterMinMs)) / 1000, 0)
		end
		var9 = task.delay(var18, function() --[[ line: 74 ]]
			-- upvalues: var9 (copy), var12 (copy)
			var9 = nil
			var12(function(p2) --[[ line: 76 ]]
				return p2 + 1
			end)
		end)
	end
	
	local var17 = signalsModule.createComputed(function(p3) --[[ line: 82 ]]
		-- upvalues: var11 (ref), p0 (ref), var9 (write), var10 (write), httpSignalsModule (copy)
		local var19 = var11(p3)
		local var20 = p0
		
		if var19 > 0 then
			var20 = table.clone(p0)
			local var21 = if p0.Headers then table.clone(p0.Headers) else {}
			var21["X-Retry-Attempt"] = tostring(var19)
			var20.Headers = var21
		end
		if var9 ~= nil then
			task.cancel(var9)
			var9 = nil
		end
		if var10 ~= nil then
			var10()
			var10 = nil
		end
		local var22, var23 = httpSignalsModule.fetch(var20)
		var10 = var23
		
		return var22
	end)
	
	return signalsModule.createComputed(function(p4) --[[ line: 100 ]]
		-- upvalues: var13 (ref), var17 (ref), var11 (ref), maxRetryCount (ref), t (copy), scheduleRetry (ref), statusCodes (copy)
		if var13(p4) then
			return {
				status = "error",
				error = { HttpError = Enum.HttpError.Aborted }
			}
		end
		local var24 = var17(p4)(p4)
		
		if var24.status == "pending" then
			return var24
		elseif var24.status == "success" then
			local data = var24.data
			local statusCode = data.StatusCode
			
			if data.Stats and data.Stats.WasRequestRetried then
				return var24
			elseif statusCode >= 200 and statusCode < 400 then
				return var24
			elseif var11() < maxRetryCount then
				if t[statusCode] then
					scheduleRetry()
					
					return { status = "pending" }
				elseif data.IsPrefetch and statusCode == statusCodes.UNAUTHORIZED then
					scheduleRetry()
					
					return { status = "pending" }
				elseif statusCode == statusCodes.TOO_MANY_REQUESTS and data.Headers["Retry-After"] then
					local var25 = tonumber(data.Headers["Retry-After"])
					
					if var25 == nil or var25 > 16 then
						return var24
					else
						scheduleRetry(var25)
						
						return { status = "pending" }
					end
				end
			end
		elseif var24.status ~= "error" then
			return var24
		elseif var11() < maxRetryCount then
			scheduleRetry()
			
			return { status = "pending" }
		end
		return var24
	end), dispose
end

return function(p5) --[[ line: 156 | named "createFetchHttpHandler" ]]
	-- upvalues: mrRouterHeaders (ref), createHttpFetchWithRetry (ref), createParsedResponseModule (ref)
	if p5.MaxRetryCount ~= nil and p5.MaxRetryCount < 0 then
		error(`MaxRetryCount must be >= 0, was provided: {p5.MaxRetryCount}`)
	end
	if p5.RetryJitterMinMs ~= nil and p5.RetryJitterMaxMs ~= nil and p5.RetryJitterMaxMs <= p5.RetryJitterMinMs then
		error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided")
	end
	local var26 = p5
	local var27 = mrRouterHeaders.injectMrRouterHeaders(p5.Headers)
	
	if var27 ~= p5.Headers then
		var26 = table.clone(p5)
		var26.Headers = var27
	end
	local var28, var29 = createHttpFetchWithRetry(var26)
	
	return createParsedResponseModule(var28, var26), var29
end