local parent = script:FindFirstAncestor("GenericChallenges").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.HttpClient)
local isChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local interceptChallengeModule = require(script.Parent.InterceptChallenge)

return function(p1, p2)
	-- upvalues: interceptChallengeModule (ref), promiseModule (ref), isChallengeHttpResponseModule (ref)
	p2 = p2 or interceptChallengeModule
	
	return {
		request = function(p3, p4)
			-- upvalues: promiseModule (copy), p1 (ref), isChallengeHttpResponseModule (copy), p2 (ref)
			local var1 = false
			local var2 = false
			local var3 = nil
			
			local function _(value, p5)
				-- upvalues: var1 (write), var2 (write), p4 (ref)
				if var1 or var2 then
					return
				end
				var2 = true
				p4(value, p5)
			end
			
			local function retryWithChallengeHeaders(p5)
				-- upvalues: var1 (write), promiseModule (copy), p3 (ref), var3 (write), p1 (copy)
				return if var1 then promiseModule.reject() else promiseModule.new(function(p6)
					-- upvalues: p3 (copy), p5 (ref), var3 (copy), p1 (copy)
					local var4 = if p3.headers then table.clone(p3.headers) else {}
					
					for i, v in p5 do
						var4[i] = v
					end
					local cloned = table.clone(p3)
					cloned.headers = var4
					var3 = p1.request(cloned, function(p7, p8)
						-- upvalues: p6 (ref)
						p6({ success = p7, response = p8 })
					end)
				end)
			end
			
			var3 = p1.request(p3, function(p6, p7)
				-- upvalues: var3 (write), var1 (write), var2 (write), p4 (ref), isChallengeHttpResponseModule (copy), p2 (copy), retryWithChallengeHeaders (ref)
				var3 = nil
				
				if var1 then return end
				if p6 then
					local headers = p7.headers
					
					if headers and isChallengeHttpResponseModule(p7.statusCode, headers) then
						local ok, status = pcall(p2, {
							rawResponseHeaders = headers,
							retryRequestCallback = retryWithChallengeHeaders
						})
						
						if ok then
							status:andThen(function(p8)
								-- upvalues: var1 (copy), var2 (copy), p4 (copy)
								local success = p8.success
								local response = p8.response
								
								if not var1 then
									if var2 then return end
									var2 = true
									p4(success, response)
								end
							end):catch(function()
								-- upvalues: p6 (ref), p7 (ref), var1 (copy), var2 (copy), p4 (copy)
								if not var1 then
									if var2 then return end
									var2 = true
									p4(p6, p7)
								end
							end)
							
							return
						elseif not var1 then
							if var2 then return end
							var2 = true
							p4(p6, p7)
						end
						return
					elseif not var1 then
						if var2 then return end
						var2 = true
						p4(p6, p7)
					end
					return
				elseif not var1 then
					if var2 then return end
					var2 = true
					p4(p6, p7)
				end
			end)
			
			return function()
				-- upvalues: var1 (write), var3 (write)
				var1 = true
				
				if var3 ~= nil then
					var3()
					var3 = nil
				end
			end
		end
	}
end