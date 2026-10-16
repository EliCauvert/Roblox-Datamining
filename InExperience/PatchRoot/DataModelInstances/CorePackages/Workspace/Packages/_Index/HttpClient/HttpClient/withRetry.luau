local MutedErrorFunction = require(script:FindFirstAncestor("HttpClient").Parent.Loggers).mutedError
local _ = require(script.Parent.types)
local FFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local config = { [408] = true, [503] = true, [504] = true }

local function _(p1: number, p2, p3) --[[ Line: 17 | Named "backoffSeconds" ]]
	return (p2 + math.random() * (p3 - p2)) * math.pow(2, p1 - 1) / 1000
end

local function shouldRetry(p1, RetryOnStatuses, RetryOnHttpErrors) --[[ Line: 21 ]]
	-- upvalues: FFlagHttpClientRetryExtensionsModule (copy)
	if FFlagHttpClientRetryExtensionsModule then
		if p1.wasTransportFailure and RetryOnHttpErrors == nil then
			return true, nil
		end
		if RetryOnHttpErrors ~= nil and p1.httpError ~= nil and p1.httpError ~= Enum.HttpError.OK and RetryOnHttpErrors[p1.httpError] then
			return true, nil
		end
	end
	if RetryOnStatuses[p1.statusCode] then
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

return function(p1, p2) --[[ Line: 52 | Named "withRetry" ]]
	-- upvalues: config (copy), FFlagHttpClientRetryExtensionsModule (copy), MutedErrorFunction (copy), shouldRetry (copy)
	local P7 = p2 or {}
	local MaxRetryCount = P7.maxRetryCount or 4
	local RetryJitterMinMs = P7.retryJitterMinMs or 0
	local RetryJitterMaxMs = P7.retryJitterMaxMs or 4000
	local RetryOnStatuses = P7.retryOnStatuses or config
	local RetryOnHttpErrors = if FFlagHttpClientRetryExtensionsModule then P7.retryOnHttpErrors else nil
	local RetryBudgetSec = if FFlagHttpClientRetryExtensionsModule then P7.retryBudgetSec else nil
	
	if MaxRetryCount < 0 then
		MutedErrorFunction(`withRetry: maxRetryCount must be >= 0, got {MaxRetryCount}; falling back to default`)
		MaxRetryCount = 4
	end
	if RetryJitterMaxMs <= RetryJitterMinMs then
		MutedErrorFunction(`withRetry: retryJitterMinMs ({RetryJitterMinMs}) must be < retryJitterMaxMs ({RetryJitterMaxMs}); falling back to default`)
		RetryJitterMinMs = 0
		RetryJitterMaxMs = 4000
	end
	if RetryBudgetSec ~= nil and RetryBudgetSec <= 0 then
		MutedErrorFunction(`withRetry: retryBudgetSec must be > 0, got {RetryBudgetSec}; ignoring the budget`)
		RetryBudgetSec = nil
	end
	return {
		request = function(Tbl, Callback) --[[ Line: 78 ]]
			-- upvalues: FFlagHttpClientRetryExtensionsModule (upval), P7 (copy), p1 (copy), shouldRetry (upval), RetryOnStatuses (copy), RetryOnHttpErrors (copy), MaxRetryCount (ref), RetryJitterMinMs (ref), RetryJitterMaxMs (ref), RetryBudgetSec (ref)
			local Count = 0
			local ClockTime = if FFlagHttpClientRetryExtensionsModule then os.clock() else nil
			local Flag = false
			local Flag1 = false
			local RequestResult = nil
			local DelayedThread = nil
			local _ = nil
			local OnMessageFunction = Tbl.onMessage
			
			local function handleMessage(p3) --[[ Line: 91 ]]
				-- upvalues: Flag1 (ref), OnMessageFunction (copy)
				Flag1 = true
				OnMessageFunction(p3)
			end
			
			local function v21() --[[ Line: 96 ]]
				-- upvalues: Flag (ref), Tbl (copy), FFlagHttpClientRetryExtensionsModule (upval), OnMessageFunction (copy), handleMessage (copy), Count (ref), P7 (upval), RequestResult (ref), p1 (upval), Flag1 (ref), Callback (copy), shouldRetry (upval), RetryOnStatuses (upval), RetryOnHttpErrors (upval), MaxRetryCount (upval), RetryJitterMinMs (upval), RetryJitterMaxMs (upval), RetryBudgetSec (upval), ClockTime (copy), DelayedThread (ref), v21 (ref)
				if Flag then return end
				local Copy = Tbl
				
				if FFlagHttpClientRetryExtensionsModule and OnMessageFunction ~= nil then
					Copy = table.clone(Tbl)
					Copy.onMessage = handleMessage
				end
				if Count > 0 then
					local Copy1 = if Tbl.headers then table.clone(Tbl.headers) else {}
					Copy1["X-Retry-Attempt"] = tostring(Count)
					
					if FFlagHttpClientRetryExtensionsModule then
						if Copy == Tbl then
							Copy = table.clone(Tbl)
						end
						Copy.headers = Copy1
					else
						Copy = {
							url = Tbl.url,
							method = Tbl.method,
							body = Tbl.body,
							headers = Copy1
						}
					end
					if FFlagHttpClientRetryExtensionsModule and P7.onRetry ~= nil then
						P7.onRetry(Count)
					end
				end
				RequestResult = p1.request(Copy, function(p3, p4) --[[ Line: 121 ]]
					-- upvalues: RequestResult (upval), Flag (upval), FFlagHttpClientRetryExtensionsModule (upval), Flag1 (upval), Callback (upval), shouldRetry (upval), RetryOnStatuses (upval), RetryOnHttpErrors (upval), Count (upval), MaxRetryCount (upval), RetryJitterMinMs (upval), RetryJitterMaxMs (upval), RetryBudgetSec (upval), ClockTime (upval), DelayedThread (upval), v21 (upval)
					RequestResult = nil
					
					if Flag then return end
					if FFlagHttpClientRetryExtensionsModule and Flag1 then
						Callback(p3, p4)
						
						return
					end
					local v1 = nil
					
					if p3 then
						local ShouldRetry, ShouldRetry2 = shouldRetry(p4, RetryOnStatuses, RetryOnHttpErrors)
						
						if not ShouldRetry or Count >= MaxRetryCount then
							Callback(true, p4)
							
							return
						end
						v1 = ShouldRetry2
					elseif RetryOnHttpErrors ~= nil or MaxRetryCount <= Count then
						Callback(false, p4)
						
						return
					end
					Count += 1
					local Delay = v1
					
					if not Delay then
						local RetryJitterMinMs1 = RetryJitterMinMs
						Delay = (RetryJitterMinMs1 + math.random() * (RetryJitterMaxMs - RetryJitterMinMs1)) * math.pow(2, Count - 1) / 1000
					end
					if FFlagHttpClientRetryExtensionsModule and RetryBudgetSec ~= nil and ClockTime ~= nil and RetryBudgetSec <= os.clock() - ClockTime + Delay then
						Callback(p3, p4)
						
						return
					else
						DelayedThread = task.delay(Delay, function() --[[ Line: 163 ]]
							-- upvalues: DelayedThread (upval), v21 (upval)
							DelayedThread = nil
							v21()
						end)
					end
				end)
			end
			
			v21()
			
			return function() --[[ Line: 172 ]]
				-- upvalues: Flag (ref), DelayedThread (ref), RequestResult (ref)
				if Flag then return end
				Flag = true
				
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				if RequestResult ~= nil then
					RequestResult()
					RequestResult = nil
				end
			end
		end
	}
end