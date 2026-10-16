local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local IsChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local InterceptChallengeModule = require(script.Parent.InterceptChallenge)

return function(p1, p2) --[[ Line: 16 ]]
	-- upvalues: InterceptChallengeModule (copy), PromiseModule (copy), IsChallengeHttpResponseModule (copy)
	local P1 = p2 or InterceptChallengeModule
	
	return {
		request = function(Tbl, Callback) --[[ Line: 22 ]]
			-- upvalues: PromiseModule (upval), p1 (copy), IsChallengeHttpResponseModule (upval), P1 (copy)
			local Flag = false
			local Flag1 = false
			local RequestResult = nil
			
			local function _(p3, p4) --[[ Line: 31 | Named "settle" ]]
				-- upvalues: Flag (ref), Flag1 (ref), Callback (copy)
				if not Flag and not Flag1 then
					Flag1 = true
					Callback(p3, p4)
					
					return
				end
			end
			
			local function retryWithChallengeHeaders(p3) --[[ Line: 39 ]]
				-- upvalues: Flag (ref), PromiseModule (upval), Tbl (copy), RequestResult (ref), p1 (upval)
				return if Flag then PromiseModule.reject() else PromiseModule.new(function(Callback) --[[ Line: 43 ]]
					-- upvalues: Tbl (upval), p3 (copy), RequestResult (upval), p1 (upval)
					local Copy = if Tbl.headers then table.clone(Tbl.headers) else {}
					for i, value in p3 do
						Copy[i] = value
					end
					local Copy1 = table.clone(Tbl)
					Copy1.headers = Copy
					RequestResult = p1.request(Copy1, function(Success, Response) --[[ Line: 51 ]]
						-- upvalues: Callback (copy)
						Callback({ success = Success, response = Response })
					end)
				end)
			end
			
			RequestResult = p1.request(Tbl, function(p4, p5) --[[ Line: 57 ]]
				-- upvalues: RequestResult (ref), Flag (ref), Flag1 (ref), Callback (copy), IsChallengeHttpResponseModule (upval), P1 (upval), retryWithChallengeHeaders (copy)
				RequestResult = nil
				
				if Flag then return end
				if p4 then
					local Headers = p5.headers
					
					if Headers and IsChallengeHttpResponseModule(p5.statusCode, Headers) then
						local Success, Result = pcall(P1, {
							rawResponseHeaders = Headers,
							retryRequestCallback = retryWithChallengeHeaders
						})
						
						if Success then
							Result:andThen(function(Result) --[[ Line: 84 ]]
								-- upvalues: Flag (upval), Flag1 (upval), Callback (upval)
								local Success = Result.success
								local Response = Result.response
								
								if not Flag then
									if Flag1 then return end
									Flag1 = true
									Callback(Success, Response)
								end
							end):catch(function() --[[ Line: 87 ]]
								-- upvalues: p4 (copy), p5 (copy), Flag (upval), Flag1 (upval), Callback (upval)
								if not Flag then
									if Flag1 then return end
									Flag1 = true
									Callback(p4, p5)
								end
							end)
							
							return
						end
						if not Flag then
							if Flag1 then return end
							Flag1 = true
							Callback(p4, p5)
						end
						return
					elseif not Flag then
						if Flag1 then return end
						Flag1 = true
						Callback(p4, p5)
					end
					return
				elseif not Flag then
					if Flag1 then return end
					Flag1 = true
					Callback(p4, p5)
				end
			end)
			
			return function() --[[ Line: 93 ]]
				-- upvalues: Flag (ref), RequestResult (ref)
				Flag = true
				
				if RequestResult ~= nil then
					RequestResult()
					RequestResult = nil
				end
			end
		end
	}
end