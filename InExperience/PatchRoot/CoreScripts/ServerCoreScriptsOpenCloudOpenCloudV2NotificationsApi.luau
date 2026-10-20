local OpenCloudNotificationScheduledTimeEnabled = game:DefineFastFlag("OpenCloudNotificationScheduledTimeEnabled", false)
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local OpenCloudService = game:GetService("OpenCloudService")
local RunService = game:GetService("RunService")

function returnInvalidArgumentError(Message)
	-- upvalues: HttpService (copy)
	return {
		StatusCode = 400,
		Body = HttpService:JSONEncode({ code = "INVALID_ARGUMENT", message = Message })
	}
end

function verifyUserNotification(p1)
	if p1.path ~= nil then
		local VerifyStringResult = verifyString(p1.path)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	if p1.id ~= nil then
		local VerifyStringResult = verifyString(p1.id)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	if p1.source ~= nil then
		local VerifySourceResult = verifySource(p1.source)
		
		if VerifySourceResult ~= nil then
			return VerifySourceResult
		end
	end
	if p1.payload ~= nil then
		local VerifyPayloadResult = verifyPayload(p1.payload)
		
		if VerifyPayloadResult ~= nil then
			return VerifyPayloadResult
		end
	end
	return nil
end

function verifySource(p1)
	if p1.universe ~= nil then
		local VerifyStringResult = verifyString(p1.universe)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	return nil
end

function verifyPayload(p1)
	-- upvalues: OpenCloudNotificationScheduledTimeEnabled (copy)
	if p1.type ~= nil then
		local VerifyStringResult = verifyString(p1.type)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	if p1.messageId ~= nil then
		local VerifyStringResult = verifyString(p1.messageId)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	if p1.joinExperience ~= nil then
		local VerifyJoinExperienceResult = verifyJoinExperience(p1.joinExperience)
		
		if VerifyJoinExperienceResult ~= nil then
			return VerifyJoinExperienceResult
		end
	end
	if p1.analyticsData ~= nil then
		local VerifyAnalyticsDataResult = verifyAnalyticsData(p1.analyticsData)
		
		if VerifyAnalyticsDataResult ~= nil then
			return VerifyAnalyticsDataResult
		end
	end
	if p1.parameters ~= nil then
		local VerifyParametersResult = verifyParameters(p1.parameters)
		
		if VerifyParametersResult ~= nil then
			return VerifyParametersResult
		end
	end
	if OpenCloudNotificationScheduledTimeEnabled and p1.scheduleTime ~= nil then
		local VerifyStringResult = verifyString(p1.scheduleTime)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	return nil
end

function verifyJoinExperience(p1)
	if p1.launchData ~= nil then
		local VerifyStringResult = verifyString(p1.launchData)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	return nil
end

function verifyAnalyticsData(p1)
	if p1.category ~= nil then
		local VerifyStringResult = verifyString(p1.category)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	return nil
end

function verifyParameters(List)
	local VerifyNumberResult = nil
	local VerifyStringResult = nil
	for _, value in pairs(List) do
		local Count = 0
		local NoStringValue = value.stringValue == nil
		
		if not NoStringValue then
			Count += 1
			VerifyStringResult = verifyString(value.stringValue)
			NoStringValue = VerifyStringResult == nil
		end
		if not NoStringValue then
			return VerifyStringResult
		end
		local NoInt64Value = value.int64Value == nil
		
		if not NoInt64Value then
			Count += 1
			VerifyNumberResult = verifyNumber(value.int64Value)
			NoInt64Value = VerifyNumberResult == nil
		end
		if not NoInt64Value then
			return VerifyNumberResult
		elseif Count > 1 then
			return returnInvalidArgumentError("Too many parameters provided for oneOf object!")
		end
	end
	return nil
end

function verifyNumber(p1)
	return if typeof(p1) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function verifyString(p1)
	return if typeof(p1) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function getUrlPrefix(): string
	-- upvalues: RunService (copy)
	return if RunService:IsStudio() then "user" else "rcc"
end

function createUserNotificationUrl(p1, _): string
	-- upvalues: ContentProvider (copy)
	return (string.format("%s%s/cloud/v2/users/%d/notifications", string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p1))
end

function userNotification(p1)
	-- upvalues: HttpService (copy), OpenCloudService (copy)
	if p1.user ~= nil then
		local VerifyNumberResult = verifyNumber(p1.user)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
	end
	if p1.userNotification ~= nil then
		local VerifyUserNotificationResult = verifyUserNotification(p1.userNotification)
		
		if VerifyUserNotificationResult ~= nil then
			return VerifyUserNotificationResult
		end
	end
	return OpenCloudService:HttpRequestAsync({
		Url = createUserNotificationUrl(p1.user, p1.userNotification),
		Request_Type = "POST",
		Body = HttpService:JSONEncode(p1.userNotification)
	})
end

OpenCloudService:RegisterOpenCloud("v2", "userNotification", userNotification)
OpenCloudService:RegistrationComplete()