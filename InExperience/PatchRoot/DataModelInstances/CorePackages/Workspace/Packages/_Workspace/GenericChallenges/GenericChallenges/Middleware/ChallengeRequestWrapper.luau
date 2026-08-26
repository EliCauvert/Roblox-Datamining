local parent = script:FindFirstAncestor("GenericChallenges").Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local isChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local interceptChallengeModule = require(script.Parent.InterceptChallenge)
local _ = require(parent.Http)

return function(p1, p2)
	-- upvalues: interceptChallengeModule (ref), promiseModule (ref), isChallengeHttpResponseModule (ref), cryoModule (ref)
	local var1 = if p2 ~= nil then p2 else interceptChallengeModule
	
	return function(p3, p4, p5)
		-- upvalues: p1 (ref), promiseModule (copy), isChallengeHttpResponseModule (copy), cryoModule (copy), var1 (write)
		local var2, var3 = p1(p3, p4, p5)
		
		return var2:andThen(function(p6)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(p6)
		end):catch(function(p6)
			-- upvalues: isChallengeHttpResponseModule (copy), p1 (copy), p3 (ref), p4 (ref), cryoModule (copy), p5 (ref), var1 (copy), promiseModule (copy)
			return if p6.StatusCode == nil or p6.Headers == nil or not isChallengeHttpResponseModule(p6.StatusCode, p6.Headers) then promiseModule.reject(p6) else var1({
				retryRequestCallback = function(p7)
					-- upvalues: p1 (copy), p3 (copy), p4 (copy), cryoModule (copy), p5 (copy)
					return p1(p3, p4, cryoModule.Dictionary.join(p5, { headers = p7 }))
				end,
				rawResponseHeaders = p6.Headers
			})
		end), var3
	end
end