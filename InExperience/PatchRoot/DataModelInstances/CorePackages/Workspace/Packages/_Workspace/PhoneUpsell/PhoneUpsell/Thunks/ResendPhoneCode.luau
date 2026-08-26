local httpService = game:GetService("HttpService")
local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local promiseModule = require(phoneUpsell.Parent.Promise)
local postResendPhoneCodeModule = require(phoneUpsell.Http.Requests.PostResendPhoneCode)

return function(p1)
	-- upvalues: postResendPhoneCodeModule (ref), promiseModule (ref), httpService (ref)
	return function()
		-- upvalues: postResendPhoneCodeModule (copy), p1 (ref), promiseModule (copy), httpService (copy)
		return postResendPhoneCodeModule(p1):andThen(function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve()
		end, function(p2)
			-- upvalues: httpService (copy), promiseModule (copy)
			return promiseModule.reject({
				ErrorCode = if p2.Body then httpService:JSONDecode(p2.Body).errors[1].code else 0
			})
		end)
	end
end