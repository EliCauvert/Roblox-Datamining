local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local runService = game:GetService("RunService")

function returnInvalidArgumentError(p1)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p1 })
	}
end

function verifyUserNotification(p1)
	if p1.path ~= nil then
		local var1 = verifyString(p1.path)
		
		if var1 ~= nil then
			return var1
		elseif p1.id ~= nil then
			local var2 = verifyString(p1.id)
			
			if var2 ~= nil then
				return var2
			elseif p1.source ~= nil then
				local var3 = verifySource(p1.source)
				
				if var3 ~= nil then
					return var3
				elseif p1.payload ~= nil then
					local var4 = verifyPayload(p1.payload)
					
					return if var4 == nil then nil else var4
				end
			end
		end
	end
end

function verifySource(p1)
	if p1.universe ~= nil then
		local var1 = verifyString(p1.universe)
		
		return if var1 == nil then nil else var1
	end
end

function verifyPayload(p1)
	if p1.type ~= nil then
		local var1 = verifyString(p1.type)
		
		if var1 ~= nil then
			return var1
		elseif p1.messageId ~= nil then
			local var2 = verifyString(p1.messageId)
			
			if var2 ~= nil then
				return var2
			elseif p1.joinExperience ~= nil then
				local var3 = verifyJoinExperience(p1.joinExperience)
				
				if var3 ~= nil then
					return var3
				elseif p1.analyticsData ~= nil then
					local var4 = verifyAnalyticsData(p1.analyticsData)
					
					if var4 ~= nil then
						return var4
					elseif p1.parameters ~= nil then
						local var5 = verifyParameters(p1.parameters)
						
						return if var5 == nil then nil else var5
					end
				end
			end
		end
	end
end

function verifyJoinExperience(p1)
	if p1.launchData ~= nil then
		local var1 = verifyString(p1.launchData)
		
		return if var1 == nil then nil else var1
	end
end

function verifyAnalyticsData(p1)
	if p1.category ~= nil then
		local var1 = verifyString(p1.category)
		
		return if var1 == nil then nil else var1
	end
end

function verifyParameters(p1)
	for i, v in pairs(p1) do
		local var1
		local var2 = 0
		
		if v.stringValue ~= nil then
			var2 += 1
			var1 = verifyString(v.stringValue)
			
			if var1 == nil then
				if v.int64Value ~= nil then
					var2 += 1
					var1 = verifyNumber(v.int64Value)
					
					if var1 == nil then
						if var2 > 1 then
							return returnInvalidArgumentError("Too many parameters provided for oneOf object!")
						end
					end
					return var1
				end
			end
			return var1
		end
	end
	return nil
end

function verifyNumber(p2)
	return if typeof(p2) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function verifyString(p2)
	return if typeof(p2) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function getUrlPrefix()
	-- upvalues: runService (ref)
	return if runService:IsStudio() then "user" else "rcc"
end

function createUserNotificationUrl(p2, _)
	-- upvalues: contentProviderService (ref)
	return string.format("%s%s/cloud/v2/users/%d/notifications", string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p2)
end

function userNotification(p2)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p2.user ~= nil then
		local var3 = verifyNumber(p2.user)
		
		if var3 ~= nil then
			return var3
		elseif p2.userNotification ~= nil then
			local var4 = verifyUserNotification(p2.userNotification)
			
			return if var4 == nil then openCloudService:HttpRequestAsync({
				Url = createUserNotificationUrl(p2.user, p2.userNotification),
				Request_Type = "POST",
				Body = httpService:JSONEncode(p2.userNotification)
			}) else var4
		end
	end
end

openCloudService:RegisterOpenCloud("v2", "userNotification", userNotification)
openCloudService:RegistrationComplete()