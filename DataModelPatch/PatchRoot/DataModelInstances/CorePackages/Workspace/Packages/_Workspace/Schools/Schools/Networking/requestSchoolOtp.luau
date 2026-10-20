local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local SchoolsUrlModule = require(Schools.Networking.SchoolsUrl)
local MapVerifyErrorModule = require(Schools.Networking.mapVerifyError)
local SchoolVerificationLocalMockModule = require(Schools.Mocks.SchoolVerificationLocalMock)
local DecodeSchoolVerificationModule = require(Schools.Api.decodeSchoolVerification)
local _ = require(Schools.Api.Types)

return function(SchoolId, GraduationYear, p1)
	-- upvalues: HttpClientModule (copy), SchoolsUrlModule (copy), SchoolVerificationLocalMockModule (copy), DecodeSchoolVerificationModule (copy), PromiseModule (copy), MapVerifyErrorModule (copy)
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "school-verification.request-otp",
		url = SchoolsUrlModule.request,
		body = {
			method = "email",
			schoolId = SchoolId,
			graduationYear = GraduationYear
		},
		network = p1 or SchoolVerificationLocalMockModule.createNetwork(),
		decode = function(p2)
			-- upvalues: DecodeSchoolVerificationModule (upval)
			return DecodeSchoolVerificationModule.decodeRequestOtp(p2)
		end
	}))):catch(function(Err)
		-- upvalues: PromiseModule (upval), MapVerifyErrorModule (upval)
		return PromiseModule.reject(MapVerifyErrorModule(Err))
	end)
end