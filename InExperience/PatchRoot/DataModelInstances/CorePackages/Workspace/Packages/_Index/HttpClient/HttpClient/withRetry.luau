local mutedError = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local _ = {
	maxRetryCount = 4,
	retryJitterMinMs = 0,
	retryJitterMaxMs = 4000
}
local t = { [408] = true, [503] = true, [504] = true }

local function _(p0, p1, p2)
	return (p1 + math.random() * (p2 - p1)) * math.pow(2, p0 - 1) / 1000
end

local _ = function(p3, p4)
	if p4[p3.statusCode] then
		return true, nil
	elseif p3.statusCode == 429 and p3.headers ~= nil then
		local var1 = tonumber(p3.headers["retry-after"])
		
		if var1 == nil or var1 > 16 then
			return false, nil
		else
			return true, var1
		end
	end
end

return function(p5, p6)
	-- upvalues: t (ref), mutedError (ref)
	p6 = p6 or {}
	local maxRetryCount = p6.maxRetryCount or 4
	local retryJitterMinMs = p6.retryJitterMinMs or 0
	local retryJitterMaxMs = p6.retryJitterMaxMs or 4000
	local retryOnStatuses = p6.retryOnStatuses or t
	
	if maxRetryCount < 0 then
		mutedError(`withRetry: maxRetryCount must be >= 0, got {maxRetryCount}; falling back to default`)
		maxRetryCount = 4
	end
	if retryJitterMaxMs <= retryJitterMinMs then
		mutedError(`withRetry: retryJitterMinMs ({retryJitterMinMs}) must be < retryJitterMaxMs ({retryJitterMaxMs}); falling back to default`)
		retryJitterMinMs = 0
		retryJitterMaxMs = 4000
	end
	return {
		request = function(p7, p8)
			-- upvalues: p5 (ref), retryOnStatuses (ref), maxRetryCount (write), retryJitterMinMs (write), retryJitterMaxMs (write)
			local var7 = 0
			local var8 = false
			local var9 = nil
			local var10 = nil
			local _ = nil
			
			local var11 = function()
				-- upvalues: var8 (write), p7 (ref), var7 (write), var9 (write), p5 (copy), retryOnStatuses (copy), maxRetryCount (copy), p8 (ref), var10 (write), retryJitterMinMs (copy), retryJitterMaxMs (copy), var11 (write)
				if var8 then return end
				local var12 = p7
				
				if var7 > 0 then
					local var13 = if p7.headers then table.clone(p7.headers) else {}
					var13["X-Retry-Attempt"] = tostring(var7)
					var12 = {
						url = p7.url,
						method = p7.method,
						body = p7.body,
						headers = var13
					}
				end
				var9 = p5.request(var12, function(p9, p10)
					-- upvalues: var9 (copy), var8 (copy), retryOnStatuses (copy), var7 (copy), maxRetryCount (copy), p8 (copy), var10 (copy), retryJitterMinMs (copy), retryJitterMaxMs (copy), var11 (copy)
					var9 = nil
					
					if var8 then return end
					local delay, var16
					local var14 = nil
					
					if p9 then
						local var15
						if retryOnStatuses[p10.statusCode] then
							delay = true
							var15 = nil
						elseif p10.statusCode == 429 and p10.headers ~= nil then
							var16 = tonumber(p10.headers["retry-after"])
							
							if var16 == nil or var16 > 16 then
								delay = false
								var15 = nil
							else
								delay = true
								var15 = var16
							end
						end
						if not delay or var7 >= maxRetryCount then
							p8(true, p10)
							
							return
						end
						var14 = var15
					elseif maxRetryCount <= var7 then
						p8(false, p10)
						
						return
					end
					var7 += 1
					delay = task.delay
					local var17 = var14
					
					if not var17 then
						var16 = retryJitterMinMs
						var17 = (var16 + math.random() * (retryJitterMaxMs - var16)) * math.pow(2, var7 - 1) / 1000
					end
					var10 = delay(var17, function()
						-- upvalues: var10 (copy), var11 (copy)
						var10 = nil
						var11()
					end)
				end)
			end
			
			var11()
			
			return function()
				-- upvalues: var8 (write), var10 (write), var9 (write)
				if var8 then return end
				var8 = true
				
				if var10 ~= nil then
					task.cancel(var10)
					var10 = nil
				end
				if var9 ~= nil then
					var9()
					var9 = nil
				end
			end
		end
	}
end