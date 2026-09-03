local mutedError = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local fFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local _ = {
	maxRetryCount = 4,
	retryJitterMinMs = 0,
	retryJitterMaxMs = 4000
}
local t = { [408] = true, [503] = true, [504] = true }

local function _(p1, p2, p3)
	return (p2 + math.random() * (p3 - p2)) * math.pow(2, p1 - 1) / 1000
end

local function shouldRetry(p1, p2, p3)
	-- upvalues: fFlagHttpClientRetryExtensionsModule (ref)
	if fFlagHttpClientRetryExtensionsModule then
		if p1.wasTransportFailure and p3 == nil then
			return true, nil
		elseif p3 ~= nil and p1.httpError ~= nil and (p1.httpError ~= Enum.HttpError.OK and p3[p1.httpError]) then
			return true, nil
		elseif p2[p1.statusCode] then
			return true, nil
		elseif p1.statusCode == 429 and p1.headers ~= nil then
			local var1 = tonumber(p1.headers["retry-after"])
			
			if var1 == nil or var1 > 16 then
				return false, nil
			else
				return true, var1
			end
		end
	end
end

return function(p1, p2)
	-- upvalues: t (ref), fFlagHttpClientRetryExtensionsModule (ref), mutedError (ref), shouldRetry (ref)
	p2 = p2 or {}
	local maxRetryCount = p2.maxRetryCount or 4
	local retryJitterMinMs = p2.retryJitterMinMs or 0
	local retryJitterMaxMs = p2.retryJitterMaxMs or 4000
	local retryOnStatuses = p2.retryOnStatuses or t
	local var1 = if fFlagHttpClientRetryExtensionsModule then p2.retryOnHttpErrors else nil
	local var2 = if fFlagHttpClientRetryExtensionsModule then p2.retryBudgetSec else nil
	
	if maxRetryCount < 0 then
		mutedError(`withRetry: maxRetryCount must be >= 0, got {maxRetryCount}; falling back to default`)
		maxRetryCount = 4
	end
	if retryJitterMaxMs <= retryJitterMinMs then
		mutedError(`withRetry: retryJitterMinMs ({retryJitterMinMs}) must be < retryJitterMaxMs ({retryJitterMaxMs}); falling back to default`)
		retryJitterMinMs = 0
		retryJitterMaxMs = 4000
	end
	if var2 ~= nil and var2 <= 0 then
		mutedError(`withRetry: retryBudgetSec must be > 0, got {var2}; ignoring the budget`)
		var2 = nil
	end
	return {
		request = function(p3, p4)
			-- upvalues: fFlagHttpClientRetryExtensionsModule (copy), p2 (ref), p1 (ref), shouldRetry (copy), retryOnStatuses (ref), var1 (ref), maxRetryCount (write), retryJitterMinMs (write), retryJitterMaxMs (write), var2 (write)
			local var3 = 0
			local var4 = if fFlagHttpClientRetryExtensionsModule then os.clock() else nil
			local var5 = false
			local var6 = false
			local var7 = nil
			local var8 = nil
			local _ = nil
			local onMessage = p3.onMessage
			
			local function handleMessage(p5)
				-- upvalues: var6 (write), onMessage (ref)
				var6 = true
				onMessage(p5)
			end
			
			local var9 = function()
				-- upvalues: var5 (write), p3 (ref), fFlagHttpClientRetryExtensionsModule (copy), onMessage (ref), handleMessage (ref), var3 (write), p2 (copy), var7 (write), p1 (copy), var6 (write), p4 (ref), shouldRetry (copy), retryOnStatuses (copy), var1 (copy), maxRetryCount (copy), retryJitterMinMs (copy), retryJitterMaxMs (copy), var2 (copy), var4 (ref), var8 (write), var9 (write)
				if var5 then return end
				local var10 = p3
				
				if fFlagHttpClientRetryExtensionsModule and onMessage ~= nil then
					var10 = table.clone(p3)
					var10.onMessage = handleMessage
				end
				if var3 > 0 then
					local var11 = if p3.headers then table.clone(p3.headers) else {}
					var11["X-Retry-Attempt"] = tostring(var3)
					
					if fFlagHttpClientRetryExtensionsModule then
						if var10 == p3 then
							var10 = table.clone(p3)
						end
						var10.headers = var11
					else
						var10 = {
							url = p3.url,
							method = p3.method,
							body = p3.body,
							headers = var11
						}
					end
					if fFlagHttpClientRetryExtensionsModule and p2.onRetry ~= nil then
						p2.onRetry(var3)
					end
				end
				var7 = p1.request(var10, function(p5, p6)
					-- upvalues: var7 (copy), var5 (copy), fFlagHttpClientRetryExtensionsModule (copy), var6 (copy), p4 (copy), shouldRetry (copy), retryOnStatuses (copy), var1 (copy), var3 (copy), maxRetryCount (copy), retryJitterMinMs (copy), retryJitterMaxMs (copy), var2 (copy), var4 (copy), var8 (copy), var9 (copy)
					var7 = nil
					
					if var5 then return end
					if fFlagHttpClientRetryExtensionsModule and var6 then
						p4(p5, p6)
						
						return
					end
					local var12
					local var13 = nil
					
					if p5 then
						var12, var23 = shouldRetry(p6, retryOnStatuses, var1)
						
						if not var12 or var3 >= maxRetryCount then
							p4(true, p6)
							
							return
						end
						var13 = var23
					elseif var1 ~= nil or maxRetryCount <= var3 then
						p4(false, p6)
						
						return
					end
					var3 += 1
					var12 = var13
					
					if not var12 then
						local var14 = retryJitterMinMs
						var12 = (var14 + math.random() * (retryJitterMaxMs - var14)) * math.pow(2, var3 - 1) / 1000
					end
					if fFlagHttpClientRetryExtensionsModule and var2 ~= nil and (var4 ~= nil and var2 <= os.clock() - var4 + var12) then
						p4(p5, p6)
						
						return
					end
					var8 = task.delay(var12, function()
						-- upvalues: var8 (copy), var9 (copy)
						var8 = nil
						var9()
					end)
				end)
			end
			
			var9()
			
			return function()
				-- upvalues: var5 (write), var8 (write), var7 (write)
				if var5 then return end
				var5 = true
				
				if var8 ~= nil then
					task.cancel(var8)
					var8 = nil
				end
				if var7 ~= nil then
					var7()
					var7 = nil
				end
			end
		end
	}
end