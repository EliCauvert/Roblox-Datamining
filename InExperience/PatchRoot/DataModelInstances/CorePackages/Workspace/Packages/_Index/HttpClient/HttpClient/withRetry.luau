local mutedError = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local _ = {
	maxRetryCount = 4,
	retryJitterMinMs = 0,
	retryJitterMaxMs = 4000
}
local t = { [408] = true, [503] = true, [504] = true }

local function _(p1, p2, p3)
	return (p2 + math.random() * (p3 - p2)) * math.pow(2, p1 - 1) / 1000
end

local _ = function(p1, p2)
	if p2[p1.statusCode] then
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

return function(p1, p2)
	-- upvalues: t (ref), mutedError (ref)
	p2 = p2 or {}
	local maxRetryCount = p2.maxRetryCount or 4
	local retryJitterMinMs = p2.retryJitterMinMs or 0
	local retryJitterMaxMs = p2.retryJitterMaxMs or 4000
	local retryOnStatuses = p2.retryOnStatuses or t
	
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
		request = function(p3, p4)
			-- upvalues: p1 (ref), retryOnStatuses (ref), maxRetryCount (write), retryJitterMinMs (write), retryJitterMaxMs (write)
			local var1 = 0
			local var2 = false
			local var3 = nil
			local var4 = nil
			local _ = nil
			
			local var5 = function()
				-- upvalues: var2 (write), p3 (ref), var1 (write), var3 (write), p1 (copy), retryOnStatuses (copy), maxRetryCount (copy), p4 (ref), var4 (write), retryJitterMinMs (copy), retryJitterMaxMs (copy), var5 (write)
				if var2 then return end
				local var6 = p3
				
				if var1 > 0 then
					local var7 = if p3.headers then table.clone(p3.headers) else {}
					var7["X-Retry-Attempt"] = tostring(var1)
					var6 = {
						url = p3.url,
						method = p3.method,
						body = p3.body,
						headers = var7
					}
				end
				var3 = p1.request(var6, function(p5, p6)
					-- upvalues: var3 (copy), var2 (copy), retryOnStatuses (copy), var1 (copy), maxRetryCount (copy), p4 (copy), var4 (copy), retryJitterMinMs (copy), retryJitterMaxMs (copy), var5 (copy)
					var3 = nil
					
					if var2 then return end
					local delay, var8
					local var9 = nil
					
					if p5 then
						local var10
						if retryOnStatuses[p6.statusCode] then
							delay = true
							var10 = nil
						elseif p6.statusCode == 429 and p6.headers ~= nil then
							var8 = tonumber(p6.headers["retry-after"])
							
							if var8 == nil or var8 > 16 then
								delay = false
								var10 = nil
							else
								delay = true
								var10 = var8
							end
						end
						if not delay or var1 >= maxRetryCount then
							p4(true, p6)
							
							return
						end
						var9 = var10
					elseif maxRetryCount <= var1 then
						p4(false, p6)
						
						return
					end
					var1 += 1
					delay = task.delay
					local var11 = var9
					
					if not var11 then
						var8 = retryJitterMinMs
						var11 = (var8 + math.random() * (retryJitterMaxMs - var8)) * math.pow(2, var1 - 1) / 1000
					end
					var4 = delay(var11, function()
						-- upvalues: var4 (copy), var5 (copy)
						var4 = nil
						var5()
					end)
				end)
			end
			
			var5()
			
			return function()
				-- upvalues: var2 (write), var4 (write), var3 (write)
				if var2 then return end
				var2 = true
				
				if var4 ~= nil then
					task.cancel(var4)
					var4 = nil
				end
				if var3 ~= nil then
					var3()
					var3 = nil
				end
			end
		end
	}
end