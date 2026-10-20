local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local HttpService = game:GetService("HttpService")
local _ = require(Parent.Common.otpLoginTypes)
local NewResult = DependenciesModule.UrlBuilder.UrlBuilder.new({
	path = "otp-service/v1/sendCode",
	base = DependenciesModule.UrlBuilder.UrlBase.APIS
})

return function(Callback, p1)
	-- upvalues: NewResult (copy), HttpService (copy)
	return Callback(NewResult(), "POST", {
		postBody = HttpService:JSONEncode({
			origin = p1.origin,
			contactType = p1.contactType,
			contactValue = p1.contactValue
		})
	})
end