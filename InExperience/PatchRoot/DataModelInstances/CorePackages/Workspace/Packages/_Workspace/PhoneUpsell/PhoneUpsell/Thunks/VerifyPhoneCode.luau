local httpService = game:GetService("HttpService")
local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local promiseModule = require(phoneUpsell.Parent.Promise)
local postVerifyPhoneCodeModule = require(phoneUpsell.Http.Requests.PostVerifyPhoneCode)

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: postVerifyPhoneCodeModule (ref), promiseModule (ref), httpService (ref)
	return function() --[[ line: 15 ]]
		-- upvalues: postVerifyPhoneCodeModule (copy), p0 (ref), p1 (ref), promiseModule (copy), httpService (copy)
		return postVerifyPhoneCodeModule(p0, p1):andThen(function(_) --[[ line: 16 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve()
		end, function(p2) --[[ line: 18 ]]
			-- upvalues: httpService (copy), promiseModule (copy)
			return promiseModule.reject({
				ErrorCode = if p2.Body then httpService:JSONDecode(p2.Body).errors[1].code else 0
			})
		end)
	end
end