local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local runService = game:GetService("RunService")

function returnInvalidArgumentError(p0)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p0 })
	}
end

function verifyUserNotification(p1)
	if p1.path ~= nil then
		local var4 = verifyString(p1.path)
		
		if var4 ~= nil then
			return var4
		elseif p1.id ~= nil then
			local var5 = verifyString(p1.id)
			
			if var5 ~= nil then
				return var5
			elseif p1.source ~= nil then
				local var6 = verifySource(p1.source)
				
				if var6 ~= nil then
					return var6
				elseif p1.payload ~= nil then
					local var7 = verifyPayload(p1.payload)
					
					return if var7 == nil then nil else var7
				end
			end
		end
	end
end

function verifySource(p2)
	if p2.universe ~= nil then
		local var8 = verifyString(p2.universe)
		
		return if var8 == nil then nil else var8
	end
end

function verifyPayload(p3)
	if p3.type ~= nil then
		local var9 = verifyString(p3.type)
		
		if var9 ~= nil then
			return var9
		elseif p3.messageId ~= nil then
			local var10 = verifyString(p3.messageId)
			
			if var10 ~= nil then
				return var10
			elseif p3.joinExperience ~= nil then
				local var11 = verifyJoinExperience(p3.joinExperience)
				
				if var11 ~= nil then
					return var11
				elseif p3.analyticsData ~= nil then
					local var12 = verifyAnalyticsData(p3.analyticsData)
					
					if var12 ~= nil then
						return var12
					elseif p3.parameters ~= nil then
						local var13 = verifyParameters(p3.parameters)
						
						return if var13 == nil then nil else var13
					end
				end
			end
		end
	end
end

function verifyJoinExperience(p4)
	if p4.launchData ~= nil then
		local var14 = verifyString(p4.launchData)
		
		return if var14 == nil then nil else var14
	end
end

function verifyAnalyticsData(p5)
	if p5.category ~= nil then
		local var15 = verifyString(p5.category)
		
		return if var15 == nil then nil else var15
	end
end

function verifyParameters(p6)
	for i, v in pairs(p6) do
		local var17
		local var16 = 0
		
		if v.stringValue ~= nil then
			var16 += 1
			var17 = verifyString(v.stringValue)
			
			if var17 == nil then
				if v.int64Value ~= nil then
					var16 += 1
					var17 = verifyNumber(v.int64Value)
					
					if var17 == nil then
						if var16 > 1 then
							return returnInvalidArgumentError("Too many parameters provided for oneOf object!")
						end
					end
					return var17
				end
			end
			return var17
		end
	end
	return nil
end

function verifyNumber(p7)
	return if typeof(p7) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function verifyString(p8)
	return if typeof(p8) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function getUrlPrefix()
	-- upvalues: runService (ref)
	return if runService:IsStudio() then "user" else "rcc"
end

function createUserNotificationUrl(p9, _)
	-- upvalues: contentProviderService (ref)
	return string.format("%s%s/cloud/v2/users/%d/notifications", string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p9)
end

function userNotification(p10)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p10.user ~= nil then
		local var18 = verifyNumber(p10.user)
		
		if var18 ~= nil then
			return var18
		elseif p10.userNotification ~= nil then
			local var19 = verifyUserNotification(p10.userNotification)
			
			return if var19 == nil then openCloudService:HttpRequestAsync({
				Url = createUserNotificationUrl(p10.user, p10.userNotification),
				Request_Type = "POST",
				Body = httpService:JSONEncode(p10.userNotification)
			}) else var19
		end
	end
end

openCloudService:RegisterOpenCloud("v2", "userNotification", userNotification)
openCloudService:RegistrationComplete()