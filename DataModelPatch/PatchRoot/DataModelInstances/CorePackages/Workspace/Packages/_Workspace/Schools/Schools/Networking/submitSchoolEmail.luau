local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local SchoolsUrlModule = require(Schools.Networking.SchoolsUrl)
local MapVerifyErrorModule = require(Schools.Networking.mapVerifyError)
local SchoolVerificationLocalMockModule = require(Schools.Mocks.SchoolVerificationLocalMock)
local DecodeSchoolVerificationModule = require(Schools.Api.decodeSchoolVerification)
local _ = require(Schools.Api.Types)
local config = {
	[409] = "EmailInUse",
	[422] = "NotSchoolEmail",
	[404] = "NotSchoolEmail"
}

return function(EmailAddress, p1)
	-- upvalues: HttpClientModule (copy), SchoolsUrlModule (copy), SchoolVerificationLocalMockModule (copy), DecodeSchoolVerificationModule (copy), PromiseModule (copy), MapVerifyErrorModule (copy), config (copy)
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "school-verification.submit-email",
		url = SchoolsUrlModule.email,
		body = { emailAddress = EmailAddress },
		network = p1 or SchoolVerificationLocalMockModule.createNetwork(),
		decode = function(p2)
			-- upvalues: DecodeSchoolVerificationModule (upval)
			return DecodeSchoolVerificationModule.decodeSchoolVerification(p2)
		end
	}))):catch(function(Err)
		-- upvalues: PromiseModule (upval), MapVerifyErrorModule (upval), config (upval)
		return PromiseModule.reject(MapVerifyErrorModule(Err, config))
	end)
end