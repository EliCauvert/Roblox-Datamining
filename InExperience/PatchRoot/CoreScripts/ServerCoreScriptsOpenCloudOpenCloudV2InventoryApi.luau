local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")

function returnInvalidArgumentError(p1)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p1 })
	}
end

function verifyPlayerOnServer(p1)
	-- upvalues: playersService (ref)
	local var1 = verifyPlayer(p1)
	
	if var1 ~= nil then
		return var1
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

function verifyString(p2)
	return if typeof(p2) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function verifyNumber(p2)
	return if typeof(p2) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function getUrlPrefix()
	-- upvalues: runService (ref)
	return if runService:IsStudio() then "user" else "rcc"
end

function createListInventoryItemsUrl(p2, p3, p4, p5)
	-- upvalues: contentProviderService (ref)
	local formattedText = string.format("%s%s/cloud/v2/users/%d/inventory-items", string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p2)
	
	if p3 == nil and p4 == nil and p5 == nil then
		return formattedText
	end
	local t = {}
	
	if p3 ~= nil then
		table.insert(t, string.format("maxPageSize=%d", p3))
	end
	if p4 ~= nil then
		table.insert(t, string.format("pageToken=%s", p4))
	end
	if p5 ~= nil then
		table.insert(t, string.format("filter=%s", p5))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listInventoryItems(p2)
	-- upvalues: openCloudService (ref)
	if p2.user == nil then
		return returnInvalidArgumentError("user argument was not provided.")
	end
	local var2 = verifyPlayerOnServer(p2.user)
	
	if var2 ~= nil then
		return var2
	elseif p2.maxPageSize ~= nil then
		local var3 = verifyNumber(p2.maxPageSize)
		
		if var3 ~= nil then
			return var3
		elseif p2.pageToken ~= nil then
			local var4 = verifyString(p2.pageToken)
			
			if var4 ~= nil then
				return var4
			elseif p2.filter ~= nil then
				local var5 = verifyString(p2.filter)
				
				return if var5 == nil then openCloudService:HttpRequestAsync({
					Url = createListInventoryItemsUrl(p2.user.UserId, p2.maxPageSize, p2.pageToken, p2.filter),
					Request_Type = "GET"
				}) else var5
			end
		end
	end
end

openCloudService:RegisterOpenCloud("v2", "listInventoryItems", listInventoryItems)
openCloudService:RegistrationComplete()