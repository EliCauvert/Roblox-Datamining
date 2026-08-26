local httpService = game:GetService("HttpService")
local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local promiseModule = require(phoneUpsell.Parent.Promise)
local postVerifyPhoneCodeModule = require(phoneUpsell.Http.Requests.PostVerifyPhoneCode)

return function(p1, p2)
	-- upvalues: postVerifyPhoneCodeModule (ref), promiseModule (ref), httpService (ref)
	return function()
		-- upvalues: postVerifyPhoneCodeModule (copy), p1 (ref), p2 (ref), promiseModule (copy), httpService (copy)
		return postVerifyPhoneCodeModule(p1, p2):andThen(function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve()
		end, function(p3)
			-- upvalues: httpService (copy), promiseModule (copy)
			return promiseModule.reject({
				ErrorCode = if p3.Body then httpService:JSONDecode(p3.Body).errors[1].code else 0
			})
		end)
	end
end