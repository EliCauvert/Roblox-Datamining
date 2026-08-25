local parent = script:FindFirstAncestor("GenericChallenges").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.HttpClient)
local isChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local interceptChallengeModule = require(script.Parent.InterceptChallenge)

return function(p0, p1)
	-- upvalues: interceptChallengeModule (ref), promiseModule (ref), isChallengeHttpResponseModule (ref)
	p1 = p1 or interceptChallengeModule
	
	return {
		request = function(p2, p3)
			-- upvalues: promiseModule (copy), p0 (ref), isChallengeHttpResponseModule (copy), p1 (ref)
			local var4 = false
			local var5 = false
			local var6 = nil
			
			local function _(value, p4)
				-- upvalues: var4 (write), var5 (write), p3 (ref)
				if var4 or var5 then
					return
				end
				var5 = true
				p3(value, p4)
			end
			
			local function retryWithChallengeHeaders(p5)
				-- upvalues: var4 (write), promiseModule (copy), p2 (ref), var6 (write), p0 (copy)
				return if var4 then promiseModule.reject() else promiseModule.new(function(p6)
					-- upvalues: p2 (copy), p5 (ref), var6 (copy), p0 (copy)
					local var8 = if p2.headers then table.clone(p2.headers) else {}
					
					for i, v in p5 do
						var8[i] = v
					end
					local cloned = table.clone(p2)
					cloned.headers = var8
					var6 = p0.request(cloned, function(p7, p8)
						-- upvalues: p6 (ref)
						p6({ success = p7, response = p8 })
					end)
				end)
			end
			
			var6 = p0.request(p2, function(p9, p10)
				-- upvalues: var6 (write), var4 (write), var5 (write), p3 (ref), isChallengeHttpResponseModule (copy), p1 (copy), retryWithChallengeHeaders (ref)
				var6 = nil
				
				if var4 then return end
				if p9 then
					local headers = p10.headers
					
					if headers and isChallengeHttpResponseModule(p10.statusCode, headers) then
						local ok, status = pcall(p1, {
							rawResponseHeaders = headers,
							retryRequestCallback = retryWithChallengeHeaders
						})
						
						if ok then
							status:andThen(function(p11)
								-- upvalues: var4 (copy), var5 (copy), p3 (copy)
								local success = p11.success
								local response = p11.response
								
								if not var4 then
									if var5 then return end
									var5 = true
									p3(success, response)
								end
							end):catch(function()
								-- upvalues: p9 (ref), p10 (ref), var4 (copy), var5 (copy), p3 (copy)
								if not var4 then
									if var5 then return end
									var5 = true
									p3(p9, p10)
								end
							end)
							
							return
						elseif not var4 then
							if var5 then return end
							var5 = true
							p3(p9, p10)
						end
						return
					elseif not var4 then
						if var5 then return end
						var5 = true
						p3(p9, p10)
					end
					return
				elseif not var4 then
					if var5 then return end
					var5 = true
					p3(p9, p10)
				end
			end)
			
			return function()
				-- upvalues: var4 (write), var6 (write)
				var4 = true
				
				if var6 ~= nil then
					var6()
					var6 = nil
				end
			end
		end
	}
end