local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local UserAgreementErrorCodes = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementErrorCodes
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging

return function(Callback, List, Callback1)
	-- upvalues: UrlModule (copy), HttpService (copy), Logging (copy), UserAgreementErrorCodes (copy)
	local Text = UrlModule.APIS_URL .. "user-agreements/v1/acceptances"
	local Acceptances = {}
	
	for _, value in ipairs(List) do
		table.insert(Acceptances, { agreementId = value.id })
	end
	return Callback(Text, "POST", {
		postBody = HttpService:JSONEncode({ acceptances = Acceptances })
	}):andThen(function(Result)
		-- upvalues: Logging (upval), Text (copy), Callback1 (copy), UserAgreementErrorCodes (upval)
		Logging.warn(string.format("Url: %s, responseCode: %s", Text, (tostring(Result.responseCode))))
		
		if Result.responseCode == 200 then
			local ResponseBody = Result.responseBody
			
			if ResponseBody.results and #ResponseBody.results > 0 then
				local NoError = UserAgreementErrorCodes.NoError
				
				for _, result in ipairs(ResponseBody.results) do
					if result.errorCode ~= UserAgreementErrorCodes.NoError and result.errorCode ~= UserAgreementErrorCodes.ItemAlreadyExists then
						Logging.warn(string.format("errorCode: %s, agreementId: %s, message: %s", tostring(result.errorCode), result.agreementId, result.message))
						
						if NoError == UserAgreementErrorCodes.NoError then
							NoError = result.errorCode
						end
						if result.errorCode == UserAgreementErrorCodes.InvalidState then
							NoError = UserAgreementErrorCodes.InvalidState
						end
					end
				end
				if Callback1 then
					Callback1(NoError)
				end
				return
			elseif Callback1 then
				Callback1(UserAgreementErrorCodes.NoError)
			end
			return
		elseif Callback1 then
			Callback1(UserAgreementErrorCodes.Exception)
		end
	end, function(p1)
		-- upvalues: Logging (upval), Text (copy), Callback1 (copy), UserAgreementErrorCodes (upval)
		Logging.warn(string.format("Url: %s, Status: %s, isJSONValid: %s", Text, tostring(p1.HttpError), (tostring(p1.isJSONValid))))
		
		if Callback1 then
			Callback1(UserAgreementErrorCodes.Exception)
		end
	end)
end