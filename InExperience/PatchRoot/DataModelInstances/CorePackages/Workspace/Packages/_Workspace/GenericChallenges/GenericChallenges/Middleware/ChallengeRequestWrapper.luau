local parent = script:FindFirstAncestor("GenericChallenges").Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local isChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local interceptChallengeModule = require(script.Parent.InterceptChallenge)
local _ = require(parent.Http)

return function(p0, p1)
	-- upvalues: interceptChallengeModule (ref), promiseModule (ref), isChallengeHttpResponseModule (ref), cryoModule (ref)
	local var4 = if p1 ~= nil then p1 else interceptChallengeModule
	
	return function(p2, p3, p4)
		-- upvalues: p0 (ref), promiseModule (copy), isChallengeHttpResponseModule (copy), cryoModule (copy), var4 (write)
		local var5, var6 = p0(p2, p3, p4)
		
		return var5:andThen(function(p7)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(p7)
		end):catch(function(p5)
			-- upvalues: isChallengeHttpResponseModule (copy), p0 (copy), p2 (ref), p3 (ref), cryoModule (copy), p4 (ref), var4 (copy), promiseModule (copy)
			return if p5.StatusCode == nil or p5.Headers == nil or not isChallengeHttpResponseModule(p5.StatusCode, p5.Headers) then promiseModule.reject(p5) else var4({
				retryRequestCallback = function(p6)
					-- upvalues: p0 (copy), p2 (copy), p3 (copy), cryoModule (copy), p4 (copy)
					return p0(p2, p3, cryoModule.Dictionary.join(p4, { headers = p6 }))
				end,
				rawResponseHeaders = p5.Headers
			})
		end), var6
	end
end