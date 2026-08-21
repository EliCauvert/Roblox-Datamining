local parent = script.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local httpSignalsModule = require(parent_1.HttpSignals)
local statusCodes = require(parent_1.Http).StatusCodes
local _ = require(parent.HttpStoreTypes)
local createParsedResponseModule = require(parent.createParsedResponse)
local t = {
	[statusCodes.REQUEST_TIMEOUT] = true,
	[statusCodes.SERVICE_UNAVAILABLE] = true,
	[statusCodes.GATEWAY_TIMEOUT] = true
}

local function createHttpFetchWithRetry(p0) --[[ line: 31 ]]
	-- upvalues: signalsModule (ref), httpSignalsModule (ref), t (ref), statusCodes (ref)
	local maxRetryCount = p0.MaxRetryCount or 4
	local retryJitterMinMs = p0.RetryJitterMinMs or 0
	local retryJitterMaxMs = p0.RetryJitterMaxMs or 4000
	local var8 = nil
	local var9 = nil
	local var10, var11 = signalsModule.createSignal(0)
	local var12, var13 = signalsModule.createSignal(false)
	
	local function _() --[[ line: 42 | named "cleanupCurrentFetch" ]]
		-- upvalues: var8 (write), var9 (write)
		if var8 ~= nil then
			task.cancel(var8)
			var8 = nil
		end
		if var9 ~= nil then
			var9()
			var9 = nil
		end
	end
	
	local function dispose() --[[ line: 53 ]]
		-- upvalues: var13 (ref), var8 (write), var9 (write)
		var13(true)
		
		if var8 ~= nil then
			task.cancel(var8)
			var8 = nil
		end
		if var9 ~= nil then
			var9()
			var9 = nil
		end
	end
	
	local function scheduleRetry(p1) --[[ line: 58 ]]
		-- upvalues: var8 (write), var10 (ref), retryJitterMaxMs (ref), retryJitterMinMs (ref), var11 (ref)
		if var8 ~= nil then return end
		local var17 = p1
		
		if var17 == nil or var17 > 16 then
			var17 = math.max(math.pow(2, var10() + 1) + (retryJitterMinMs + math.random() * (retryJitterMaxMs - retryJitterMinMs)) / 1000, 0)
		end
		var8 = task.delay(var17, function() --[[ line: 72 ]]
			-- upvalues: var8 (copy), var11 (copy)
			var8 = nil
			var11(function(p2) --[[ line: 74 ]]
				return p2 + 1
			end)
		end)
	end
	
	local var16 = signalsModule.createComputed(function(p3) --[[ line: 80 ]]
		-- upvalues: var10 (ref), p0 (ref), var8 (write), var9 (write), httpSignalsModule (copy)
		local var18 = var10(p3)
		local var19 = p0
		
		if var18 > 0 then
			var19 = table.clone(p0)
			local var20 = if p0.Headers then table.clone(p0.Headers) else {}
			var20["X-Retry-Attempt"] = tostring(var18)
			var19.Headers = var20
		end
		if var8 ~= nil then
			task.cancel(var8)
			var8 = nil
		end
		if var9 ~= nil then
			var9()
			var9 = nil
		end
		local var21, var22 = httpSignalsModule.fetch(var19)
		var9 = var22
		
		return var21
	end)
	
	return signalsModule.createComputed(function(p4) --[[ line: 98 ]]
		-- upvalues: var12 (ref), var16 (ref), var10 (ref), maxRetryCount (ref), t (copy), scheduleRetry (ref), statusCodes (copy)
		if var12(p4) then
			return {
				status = "error",
				error = { HttpError = Enum.HttpError.Aborted }
			}
		end
		local var23 = var16(p4)(p4)
		
		if var23.status == "pending" then
			return var23
		elseif var23.status == "success" then
			local data = var23.data
			local statusCode = data.StatusCode
			
			if data.Stats and data.Stats.WasRequestRetried then
				return var23
			elseif statusCode >= 200 and statusCode < 400 then
				return var23
			elseif var10() < maxRetryCount then
				if t[statusCode] then
					scheduleRetry()
					
					return { status = "pending" }
				elseif data.IsPrefetch and statusCode == statusCodes.UNAUTHORIZED then
					scheduleRetry()
					
					return { status = "pending" }
				elseif statusCode == statusCodes.TOO_MANY_REQUESTS and data.Headers["Retry-After"] then
					local var24 = tonumber(data.Headers["Retry-After"])
					
					if var24 == nil or var24 > 16 then
						return var23
					else
						scheduleRetry(var24)
						
						return { status = "pending" }
					end
				end
			end
		elseif var23.status ~= "error" then
			return var23
		elseif var10() < maxRetryCount then
			scheduleRetry()
			
			return { status = "pending" }
		end
		return var23
	end), dispose
end

return function(p5) --[[ line: 154 | named "createFetchHttpHandler" ]]
	-- upvalues: createHttpFetchWithRetry (ref), createParsedResponseModule (ref)
	if p5.MaxRetryCount ~= nil and p5.MaxRetryCount < 0 then
		error(`MaxRetryCount must be >= 0, was provided: {p5.MaxRetryCount}`)
	end
	if p5.RetryJitterMinMs ~= nil and p5.RetryJitterMaxMs ~= nil and p5.RetryJitterMaxMs <= p5.RetryJitterMinMs then
		error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided")
	end
	local var25, var26 = createHttpFetchWithRetry(p5)
	
	return createParsedResponseModule(var25, p5), var26
end