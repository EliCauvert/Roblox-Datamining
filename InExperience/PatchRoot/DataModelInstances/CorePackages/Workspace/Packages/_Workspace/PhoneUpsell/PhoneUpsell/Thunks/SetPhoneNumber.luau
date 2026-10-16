local HttpService = game:GetService("HttpService")
local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local PromiseModule = require(Parent.Promise)
local PostSetPhoneModule = require(PhoneUpsell.Http.Requests.PostSetPhone)
local IsStringPhoneFunction = require(Parent.AuthCommon).Utils.isStringPhone

return function(p1, p2, p3, p4, p5) --[[ Line: 16 ]]
	-- upvalues: IsStringPhoneFunction (copy), PromiseModule (copy), PostSetPhoneModule (copy), HttpService (copy)
	return function() --[[ Line: 17 ]]
		-- upvalues: IsStringPhoneFunction (upval), p3 (copy), p4 (copy), PromiseModule (upval), PostSetPhoneModule (upval), p1 (copy), p2 (copy), p5 (copy), HttpService (upval)
		return if IsStringPhoneFunction(p3 .. p4) then PostSetPhoneModule(p1, p2, p3, p4, p5):andThen(function(_) --[[ Line: 23 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end, function(p6) --[[ Line: 25 ]]
			-- upvalues: HttpService (upval), PromiseModule (upval)
			return PromiseModule.reject({
				PhoneRegexFailed = false,
				ErrorCode = if p6.Body then HttpService:JSONDecode(p6.Body).errors[1].code else 0
			})
		end) else PromiseModule.reject({ PhoneRegexFailed = true })
	end
end