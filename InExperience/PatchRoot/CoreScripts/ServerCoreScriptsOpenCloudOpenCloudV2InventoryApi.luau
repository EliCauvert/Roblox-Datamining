local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local OpenCloudService = game:GetService("OpenCloudService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

function returnInvalidArgumentError(Message) --[[ Line: 23 ]]
	-- upvalues: HttpService (copy)
	return {
		StatusCode = 400,
		Body = HttpService:JSONEncode({ code = "INVALID_ARGUMENT", message = Message })
	}
end

function verifyPlayerOnServer(Player) --[[ Line: 33 ]]
	-- upvalues: Players (copy)
	local VerifyPlayerResult = verifyPlayer(Player)
	
	if VerifyPlayerResult ~= nil then
		return VerifyPlayerResult
	end
	for _, player in ipairs((Players:GetPlayers())) do
		if player.UserId == Player.UserId then
			return nil
		end
	end
	return returnInvalidArgumentError("Player not found on server.")
end

function verifyPlayer(Player: Player) --[[ Line: 49 ]]
	return if typeof(Player) == "Instance" and Player.ClassName == "Player" then nil else returnInvalidArgumentError("user argument not a Player instance.")
end

function verifyString(p1) --[[ Line: 56 ]]
	return if typeof(p1) == "string" then nil else returnInvalidArgumentError("Argument not a string.")
end

function verifyNumber(p1) --[[ Line: 63 ]]
	return if typeof(p1) == "number" then nil else returnInvalidArgumentError("Argument not a number.")
end

function getUrlPrefix(): string --[[ Line: 70 ]]
	-- upvalues: RunService (copy)
	return if RunService:IsStudio() then "user" else "rcc"
end

function createListInventoryItemsUrl(p1, p2, p3, p4): string --[[ Line: 77 ]]
	-- upvalues: ContentProvider (copy)
	local Formatted = string.format("%s%s/cloud/v2/users/%d/inventory-items", string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), p1)
	
	if p2 == nil and p3 == nil and p4 == nil then
		return Formatted
	end
	local List = {}
	
	if p2 ~= nil then
		table.insert(List, string.format("maxPageSize=%d", p2))
	end
	if p3 ~= nil then
		table.insert(List, string.format("pageToken=%s", p3))
	end
	if p4 ~= nil then
		table.insert(List, string.format("filter=%s", p4))
	end
	return (string.format("%s?%s", Formatted, table.concat(List, "&")))
end

function listInventoryItems(p1) --[[ Line: 102 ]]
	-- upvalues: OpenCloudService (copy)
	if p1.user == nil then
		return returnInvalidArgumentError("user argument was not provided.")
	end
	local VerifyPlayerOnServerResult = verifyPlayerOnServer(p1.user)
	
	if VerifyPlayerOnServerResult ~= nil then
		return VerifyPlayerOnServerResult
	end
	if p1.maxPageSize ~= nil then
		local VerifyNumberResult = verifyNumber(p1.maxPageSize)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
	end
	if p1.pageToken ~= nil then
		local VerifyStringResult = verifyString(p1.pageToken)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	if p1.filter ~= nil then
		local VerifyStringResult = verifyString(p1.filter)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
	end
	return OpenCloudService:HttpRequestAsync({
		Url = createListInventoryItemsUrl(p1.user.UserId, p1.maxPageSize, p1.pageToken, p1.filter),
		Request_Type = "GET"
	})
end

OpenCloudService:RegisterOpenCloud("v2", "listInventoryItems", listInventoryItems)
OpenCloudService:RegistrationComplete()