local Parent = script:FindFirstAncestor("DataHydration").Parent
local PromiseModule = require(Parent.Promise)
local HttpClientModule = require(Parent.HttpClient)

local function _(p1) --[[ Line: 29 | Named "toRejection" ]]
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1 else { errorMessage = tostring(p1) }
end

local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1) --[[ Line: 53 | Named "pollAnalyticsOperation" ]]
	-- upvalues: PromiseModule (copy), AsPromiseFunction (copy), FetchFunction (copy)
	local Delay = p1.delay or PromiseModule.delay
	
	return PromiseModule.new(function(Callback2, Callback1, Callback: (any) -> ()) --[[ Line: 61 ]]
		-- upvalues: AsPromiseFunction (upval), FetchFunction (upval), p1 (copy), Delay (copy)
		local Flag = false
		local v1 = nil
		local v2 = nil
		Callback(function() --[[ Line: 66 ]]
			-- upvalues: Flag (ref), v1 (ref), v2 (ref)
			Flag = true
			
			if v1 ~= nil then
				v1:cancel()
			end
			if v2 ~= nil then
				v2:cancel()
			end
		end)
		
		local function postQuery(p2) --[[ Line: 76 ]]
			-- upvalues: Flag (ref), AsPromiseFunction (upval), FetchFunction (upval), p1 (upval), v1 (ref), Callback1 (copy), Delay (upval), v2 (ref), postQuery (copy), Callback2 (copy)
			if not Flag then
				local AsPromiseResult = AsPromiseFunction(FetchFunction({
					method = "POST",
					network = p1.network,
					url = p1.url,
					body = p1.body,
					analyticsKey = p1.analyticsKey,
					decode = function(p3) --[[ Line: 86 ]]
						return p3 and p3.operation or {}
					end
				}))
				v1 = AsPromiseResult
				AsPromiseResult:andThen(function(Result) --[[ Line: 91 ]]
					-- upvalues: Flag (upval), p2 (copy), Callback1 (upval), p1 (upval), Delay (upval), v2 (upval), postQuery (upval), Callback2 (upval)
					if Flag then return end
					if Result.done == true then
						if Result.error ~= nil then
							Callback1({
								responseCode = Result.error.code,
								errorMessage = Result.error.message or "analytics operation returned an error"
							})
							
							return
						end
						local Success, Result1 = pcall(p1.mapResult, Result)
						
						if Success then
							Callback2(Result1)
							
							return
						else
							Callback1(if typeof(Result1) == "table" and typeof(Result1.errorMessage) == "string" then Result1 else { errorMessage = tostring(Result1) })
							
							return
						end
					elseif p2 >= 6 then
						Callback1({ errorMessage = p1.timeoutMessage })
						
						return
					else
						local DelayResult = Delay(2)
						v2 = DelayResult
						DelayResult:andThen(function() --[[ Line: 103 ]]
							-- upvalues: postQuery (upval), p2 (upval)
							postQuery(p2 + 1)
						end)
					end
				end, function(p3) --[[ Line: 125 ]]
					-- upvalues: Callback1 (upval)
					Callback1(if typeof(p3) == "table" and typeof(p3.errorMessage) == "string" then p3 else { errorMessage = tostring(p3) })
				end)
				
				return
			end
		end
		
		postQuery(1)
	end)
end