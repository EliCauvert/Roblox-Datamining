local httpService = game:GetService("HttpService")
local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local promiseModule = require(phoneUpsell.Parent.Promise)
local postResendPhoneCodeModule = require(phoneUpsell.Http.Requests.PostResendPhoneCode)

return function(p0) --[[ line: 14 ]]
	-- upvalues: postResendPhoneCodeModule (ref), promiseModule (ref), httpService (ref)
	return function() --[[ line: 15 ]]
		-- upvalues: postResendPhoneCodeModule (copy), p0 (ref), promiseModule (copy), httpService (copy)
		return postResendPhoneCodeModule(p0):andThen(function(_) --[[ line: 16 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve()
		end, function(p1) --[[ line: 18 ]]
			-- upvalues: httpService (copy), promiseModule (copy)
			return promiseModule.reject({
				ErrorCode = if p1.Body then httpService:JSONDecode(p1.Body).errors[1].code else 0
			})
		end)
	end
end