local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local SchoolsUrlModule = require(Schools.Networking.SchoolsUrl)
local MapVerifyErrorModule = require(Schools.Networking.mapVerifyError)
local SchoolVerificationLocalMockModule = require(Schools.Mocks.SchoolVerificationLocalMock)
local DecodeSchoolVerificationModule = require(Schools.Api.decodeSchoolVerification)
local _ = require(Schools.Api.Types)

return function(p1)
	-- upvalues: HttpClientModule (copy), SchoolsUrlModule (copy), SchoolVerificationLocalMockModule (copy), DecodeSchoolVerificationModule (copy), PromiseModule (copy), MapVerifyErrorModule (copy)
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "school-verification.get-school",
		url = SchoolsUrlModule.school,
		network = p1 or SchoolVerificationLocalMockModule.createNetwork(),
		decode = function(p2)
			-- upvalues: DecodeSchoolVerificationModule (upval)
			return if typeof(p2) == "table" and p2.groupId ~= nil then DecodeSchoolVerificationModule.decodeVerifiedSchool(p2) else nil
		end
	}))):catch(function(Err)
		-- upvalues: PromiseModule (upval), MapVerifyErrorModule (upval)
		return PromiseModule.reject(MapVerifyErrorModule(Err))
	end)
end