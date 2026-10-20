local Parent = script:FindFirstAncestor("UserAgreements").Parent
local Url = require(Parent.Http).Url
local Logger = require(Parent.Loggers).Logger
local UserAgreements = Logger.new(Logger, "UserAgreements")
local UserAgreementsCounterNamesModule = require(script.Parent.UserAgreementsCounterNames)
game:DefineFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling", 10000)

return function(Callback, p1)
	-- upvalues: Url (copy), UserAgreements (copy), UserAgreementsCounterNamesModule (copy)
	local Text = Url.APIS_URL .. "user-agreements/v1/agreements-resolution-signup/Web"
	
	return Callback(Text, "GET"):andThen(function(Result)
		if Result.responseCode ~= 200 then return end
		return Result.responseBody
	end, function(p2)
		-- upvalues: UserAgreements (upval), Text (copy), p1 (copy), UserAgreementsCounterNamesModule (upval)
		UserAgreements:warning(string.format("Url: %s, Status: %s, isJSONValid: %s", Text, tostring(p2.HttpError), (tostring(p2.isJSONValid))))
		
		if p1 then
			p1.Diag:reportCounter(UserAgreementsCounterNamesModule.FetchAgreementsHttpRequestFailure, 1)
			p1.InfluxDb:reportSeries(script.Name, {
				url = Text,
				statusCode = p2.StatusCode,
				errorMessage = p2.Body
			}, game:GetFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling"))
		end
	end)
end