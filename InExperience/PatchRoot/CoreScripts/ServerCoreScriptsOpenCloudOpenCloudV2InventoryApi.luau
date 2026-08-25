local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")

function returnInvalidArgumentError(p0)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p0 })
	}
end

function verifyPlayerOnServer(p1)
	-- upvalues: playersService (ref)
	local var5 = verifyPlayer(p1)
	
	if var5 ~= nil then
		return var5
	end
	for i, v in ipairs(playersService:GetPlayers()) do
		if v.UserId == p1.UserId then
			return nil
		end
	end
	return returnInvalidArgumentError("Player not found on server.")
end

function verifyPlayer(p2)
	return if typeof(p2) == "Instance" and p2.ClassName == "Player" then nil else returnInvalidArgumentError("user argument not a Player instance.")
end

function verifyString(p3)
	return if typeof(p3) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function verifyNumber(p4)
	return if typeof(p4) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function getUrlPrefix()
	-- upvalues: runService (ref)
	return if runService:IsStudio() then "user" else "rcc"
end

function createListInventoryItemsUrl(p5, p6, p7, p8)
	-- upvalues: contentProviderService (ref)
	local formattedText = string.format("%s%s/cloud/v2/users/%d/inventory-items", string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p5)
	
	if p6 == nil and p7 == nil and p8 == nil then
		return formattedText
	end
	local t = {}
	
	if p6 ~= nil then
		table.insert(t, string.format("maxPageSize=%d", p6))
	end
	if p7 ~= nil then
		table.insert(t, string.format("pageToken=%s", p7))
	end
	if p8 ~= nil then
		table.insert(t, string.format("filter=%s", p8))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listInventoryItems(p9)
	-- upvalues: openCloudService (ref)
	if p9.user == nil then
		return returnInvalidArgumentError("user argument was not provided.")
	end
	local var8 = verifyPlayerOnServer(p9.user)
	
	if var8 ~= nil then
		return var8
	elseif p9.maxPageSize ~= nil then
		local var9 = verifyNumber(p9.maxPageSize)
		
		if var9 ~= nil then
			return var9
		elseif p9.pageToken ~= nil then
			local var10 = verifyString(p9.pageToken)
			
			if var10 ~= nil then
				return var10
			elseif p9.filter ~= nil then
				local var11 = verifyString(p9.filter)
				
				return if var11 == nil then openCloudService:HttpRequestAsync({
					Url = createListInventoryItemsUrl(p9.user.UserId, p9.maxPageSize, p9.pageToken, p9.filter),
					Request_Type = "GET"
				}) else var11
			end
		end
	end
end

openCloudService:RegisterOpenCloud("v2", "listInventoryItems", listInventoryItems)
openCloudService:RegistrationComplete()