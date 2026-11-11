local MutedErrorFunction = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local config = { [408] = true, [503] = true, [504] = true }

local function _(p1: number, p2, p3)
	return (p2 + math.random() * (p3 - p2)) * math.pow(2, p1 - 1) / 1000
end

local _ = function(p1, p2)
	if p2[p1.statusCode] then
		return true, nil
	end
	if p1.statusCode == 429 and p1.headers ~= nil then
		local Number: number? = tonumber(p1.headers["retry-after"])
		
		if Number ~= nil and Number <= 16 then
			return true, Number
		end
	end
	return false, nil
end

return function(p1, p2)
	-- upvalues: config (copy), MutedErrorFunction (copy)
	local P6 = p2 or {}
	local MaxRetryCount = P6.maxRetryCount or 4
	local RetryJitterMinMs = P6.retryJitterMinMs or 0
	local RetryJitterMaxMs = P6.retryJitterMaxMs or 4000
	local RetryOnStatuses = P6.retryOnStatuses or config
	
	if MaxRetryCount < 0 then
		MutedErrorFunction(`withRetry: maxRetryCount must be >= 0, got {MaxRetryCount}; falling back to default`)
		MaxRetryCount = 4
	end
	if RetryJitterMaxMs <= RetryJitterMinMs then
		MutedErrorFunction(`withRetry: retryJitterMinMs ({RetryJitterMinMs}) must be < retryJitterMaxMs ({RetryJitterMaxMs}); falling back to default`)
		RetryJitterMinMs = 0
		RetryJitterMaxMs = 4000
	end
	return {
		request = function(p3, Callback)
			-- upvalues: p1 (copy), RetryOnStatuses (copy), MaxRetryCount (ref), RetryJitterMinMs (ref), RetryJitterMaxMs (ref)
			local Count = 0
			local Flag = false
			local RequestResult = nil
			local v1 = nil
			local _ = nil
			
			local function v15()
				-- upvalues: Flag (ref), p3 (copy), Count (ref), RequestResult (ref), p1 (upval), RetryOnStatuses (upval), MaxRetryCount (upval), Callback (copy), v1 (ref), RetryJitterMinMs (upval), RetryJitterMaxMs (upval), v15 (ref)
				if Flag then return end
				local v2 = p3
				
				if Count > 0 then
					local Copy = if p3.headers then table.clone(p3.headers) else {}
					Copy["X-Retry-Attempt"] = tostring(Count)
					v2 = {
						url = p3.url,
						method = p3.method,
						body = p3.body,
						headers = Copy
					}
				end
				RequestResult = p1.request(v2, function(p4, p5)
					-- upvalues: RequestResult (upval), Flag (upval), RetryOnStatuses (upval), Count (upval), MaxRetryCount (upval), Callback (upval), v1 (upval), RetryJitterMinMs (upval), RetryJitterMaxMs (upval), v15 (upval)
					RequestResult = nil
					
					if Flag then return end
					local v3: number? = nil
					local Flag1 = nil
					local v4 = nil
					
					if p4 then
						repeat
							if RetryOnStatuses[p5.statusCode] then
								Flag1 = true
								v4 = nil
								break
							end
							if p5.statusCode == 429 and p5.headers ~= nil then
								local Number: number? = tonumber(p5.headers["retry-after"])
								
								if Number ~= nil and Number <= 16 then
									Flag1 = true
									v4 = Number
									break
								end
							end
							Flag1 = false
							v4 = nil
						until true
						if not Flag1 or Count >= MaxRetryCount then
							Callback(true, p5)
							
							return
						end
						v3 = v4
					elseif MaxRetryCount <= Count then
						Callback(false, p5)
						
						return
					end
					Count += 1
					local DelayFunction = task.delay
					local RandomValueRatio: number = v3
					
					if not RandomValueRatio then
						local RetryJitterMinMs1 = RetryJitterMinMs
						RandomValueRatio = (RetryJitterMinMs1 + math.random() * (RetryJitterMaxMs - RetryJitterMinMs1)) * math.pow(2, Count - 1) / 1000
					end
					v1 = DelayFunction(RandomValueRatio, function()
						-- upvalues: v1 (upval), v15 (upval)
						v1 = nil
						v15()
					end)
				end)
			end
			
			v15()
			
			return function()
				-- upvalues: Flag (ref), v1 (ref), RequestResult (ref)
				if Flag then return end
				Flag = true
				
				if v1 ~= nil then
					task.cancel(v1)
					v1 = nil
				end
				if RequestResult ~= nil then
					RequestResult()
					RequestResult = nil
				end
			end
		end
	}
end