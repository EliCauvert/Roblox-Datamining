local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local PromiseModule = require(Parent.Promise)
local CryoModule = require(Parent.Cryo)
local IsChallengeHttpResponseModule = require(script.Parent.IsChallengeHttpResponse)
local InterceptChallengeModule = require(script.Parent.InterceptChallenge)
local _ = require(Parent.Http)

return function(Callback, p1)
	-- upvalues: InterceptChallengeModule (copy), PromiseModule (copy), IsChallengeHttpResponseModule (copy), CryoModule (copy)
	local InterceptChallengeModule1 = if p1 == nil then InterceptChallengeModule else p1
	
	return function(p2, p3, p4)
		-- upvalues: Callback (copy), PromiseModule (upval), IsChallengeHttpResponseModule (upval), CryoModule (upval), InterceptChallengeModule1 (ref)
		local CallbackResult, CallbackResult2 = Callback(p2, p3, p4)
		
		return CallbackResult:andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result)
		end):catch(function(Err)
			-- upvalues: IsChallengeHttpResponseModule (upval), Callback (upval), p2 (copy), p3 (copy), CryoModule (upval), p4 (copy), InterceptChallengeModule1 (upval), PromiseModule (upval)
			return if Err.StatusCode == nil or Err.Headers == nil or not IsChallengeHttpResponseModule(Err.StatusCode, Err.Headers) then PromiseModule.reject(Err) else InterceptChallengeModule1({
				retryRequestCallback = function(Headers)
					-- upvalues: Callback (upval), p2 (upval), p3 (upval), CryoModule (upval), p4 (upval)
					return Callback(p2, p3, CryoModule.Dictionary.join(p4, { headers = Headers }))
				end,
				rawResponseHeaders = Err.Headers
			})
		end), CallbackResult2
	end
end