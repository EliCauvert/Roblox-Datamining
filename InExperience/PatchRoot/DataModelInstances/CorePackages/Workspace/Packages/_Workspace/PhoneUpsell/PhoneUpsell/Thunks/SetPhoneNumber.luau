local httpService = game:GetService("HttpService")
local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local promiseModule = require(parent.Promise)
local postSetPhoneModule = require(phoneUpsell.Http.Requests.PostSetPhone)
local isStringPhone = require(parent.AuthCommon).Utils.isStringPhone

return function(p0, p1, p2, p3, p4)
	-- upvalues: isStringPhone (ref), promiseModule (ref), postSetPhoneModule (ref), httpService (ref)
	return function()
		-- upvalues: isStringPhone (copy), p2 (ref), p3 (ref), promiseModule (copy), postSetPhoneModule (copy), p0 (ref), p1 (ref), p4 (ref), httpService (copy)
		return if isStringPhone(p2 .. p3) then postSetPhoneModule(p0, p1, p2, p3, p4):andThen(function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve()
		end, function(p5)
			-- upvalues: httpService (copy), promiseModule (copy)
			return promiseModule.reject({
				PhoneRegexFailed = false,
				ErrorCode = if p5.Body then httpService:JSONDecode(p5.Body).errors[1].code else 0
			})
		end) else promiseModule.reject({ PhoneRegexFailed = true })
	end
end