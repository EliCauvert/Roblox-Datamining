local mutedError = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local t = {
	maxRetryCount = 4,
	retryJitterMinMs = 0,
	retryJitterMaxMs = 4000
}
local t_1 = { [408] = true, [503] = true, [504] = true }

local function _(p0, p1, p2) --[[ line: 16 | named "backoffSeconds" ]]
	return (p1 + math.random() * (p2 - p1)) * math.pow(2, p0 - 1) / 1000
end

local _ = function(p3, p4) --[[ line: 20 | named "shouldRetry" ]]
	if p4[p3.statusCode] then
		return true, nil
	elseif p3.statusCode == 429 and p3.headers ~= nil then
		local var2 = tonumber(p3.headers["retry-after"])
		
		if var2 == nil or var2 > 16 then
			return false, nil
		else
			return true, var2
		end
	end
end

return function(p5, p6) --[[ line: 33 | named "withRetry" ]]
	-- upvalues: t (ref), t_1 (ref), mutedError (ref)
	p6 = p6 or {}
	local var4 = p6.maxRetryCount or t.maxRetryCount
	local var5 = p6.retryJitterMinMs or t.retryJitterMinMs
	local var6 = p6.retryJitterMaxMs or t.retryJitterMaxMs
	local retryOnStatuses = p6.retryOnStatuses or t_1
	
	if var4 < 0 then
		mutedError(`withRetry: maxRetryCount must be >= 0, got {var4}; falling back to default`)
		var4 = t.maxRetryCount
	end
	if var6 <= var5 then
		mutedError(`withRetry: retryJitterMinMs ({var5}) must be < retryJitterMaxMs ({var6}); falling back to default`)
		var5 = t.retryJitterMinMs
		var6 = t.retryJitterMaxMs
	end
	return {
		request = function(p7, p8) --[[ line: 53 ]]
			-- upvalues: p5 (ref), retryOnStatuses (ref), var4 (write), var5 (write), var6 (write)
			local var8 = 0
			local var9 = false
			local var10 = nil
			local var11 = nil
			local _ = nil
			
			local var12 = function() --[[ line: 63 ]]
				-- upvalues: var9 (write), p7 (ref), var8 (write), var10 (write), p5 (copy), retryOnStatuses (copy), var4 (copy), p8 (ref), var11 (write), var5 (copy), var6 (copy), var12 (write)
				if var9 then return end
				local var13 = p7
				
				if var8 > 0 then
					local var14 = if p7.headers then table.clone(p7.headers) else {}
					var14["X-Retry-Attempt"] = tostring(var8)
					var13 = {
						url = p7.url,
						method = p7.method,
						body = p7.body,
						headers = var14
					}
				end
				var10 = p5.request(var13, function(p9, p10) --[[ line: 74 ]]
					-- upvalues: var10 (copy), var9 (copy), retryOnStatuses (copy), var8 (copy), var4 (copy), p8 (copy), var11 (copy), var5 (copy), var6 (copy), var12 (copy)
					var10 = nil
					
					if var9 then return end
					local delay, var17
					local var15 = nil
					
					if p9 then
						local var16
						if retryOnStatuses[p10.statusCode] then
							delay = true
							var16 = nil
						elseif p10.statusCode == 429 and p10.headers ~= nil then
							var17 = tonumber(p10.headers["retry-after"])
							
							if var17 == nil or var17 > 16 then
								delay = false
								var16 = nil
							else
								delay = true
								var16 = var17
							end
						end
						if not delay or var8 >= var4 then
							p8(true, p10)
							
							return
						end
						var15 = var16
					elseif var4 <= var8 then
						p8(false, p10)
						
						return
					end
					var8 += 1
					delay = task.delay
					local var18 = var15
					
					if not var18 then
						var17 = var5
						var18 = (var17 + math.random() * (var6 - var17)) * math.pow(2, var8 - 1) / 1000
					end
					var11 = delay(var18, function() --[[ line: 95 ]]
						-- upvalues: var11 (copy), var12 (copy)
						var11 = nil
						var12()
					end)
				end)
			end
			
			var12()
			
			return function() --[[ line: 104 ]]
				-- upvalues: var9 (write), var11 (write), var10 (write)
				if var9 then return end
				var9 = true
				
				if var11 ~= nil then
					task.cancel(var11)
					var11 = nil
				end
				if var10 ~= nil then
					var10()
					var10 = nil
				end
			end
		end
	}
end