local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local runService = game:GetService("RunService")

function InvalidArgumentError(p1)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p1 })
	}
end

function verifyTable(p1, p2)
	return if p1 == nil then nil elseif typeof(p1) == "table" then nil else InvalidArgumentError(`Argument not a table: {p2}.`)
end

function verifyNumber(p1, p2)
	return if p1 == nil then nil elseif typeof(p1) == "number" then nil else InvalidArgumentError(`Argument not a number: {p2}.`)
end

function verifyString(p1, p2)
	return if p1 == nil then nil elseif typeof(p1) == "string" then nil else InvalidArgumentError(`Argument not a string: {p2}.`)
end

function verifyEnum(p1, p2)
	return if p1 == nil then nil elseif typeof(p1) == "number" or typeof(p1) == "string" then nil else InvalidArgumentError(`Argument not an enum: {p2}.`)
end

function getApisUrl()
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis")
end

function getUrlPrefix(p1)
	-- upvalues: runService (ref)
	return if not (p1 ~= nil and p1["x-api-key"] ~= nil) then if runService:IsStudio() then "user" else "rcc" else ""
end

function verifyGetUniverseRequest(p1, p2)
	if p1 == nil then
		return nil
	end
	local var1 = verifyTable(p1, p2)
	
	if var1 ~= nil then
		return var1
	elseif p1.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.path.`)
	end
	local var2 = verifyString(p1.path, `{p2}.path`)
	
	return if var2 == nil then nil else var2
end

function getUniverseUrl(p1, p2)
	return if p1.path == nil then InvalidArgumentError("URL parameter provided was nil: getUniverseRequest.path.") elseif string.match(p1.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getUniverseRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p2), tostring(p1.path))
end

function getUniverse(p1, p2)
	-- upvalues: openCloudService (ref)
	if p1 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var1 = verifyGetUniverseRequest(p1, "getUniverseRequest")
	
	if var1 ~= nil then
		return var1
	end
	local var2 = getUniverseUrl(p1, p2)
	
	return if typeof(var2) == "string" then openCloudService:HttpRequestAsync({ Url = var2, Request_Type = "GET", Headers = p2 }) else var2
end

openCloudService:RegisterOpenCloud("v2", "GetUniverse", getUniverse)

function verifyTranslateTextRequest(p1, p2)
	if p1 == nil then
		return nil
	end
	local var1 = verifyTable(p1, p2)
	
	if var1 ~= nil then
		return var1
	elseif p1.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.path.`)
	end
	local var2 = verifyString(p1.path, `{p2}.path`)
	
	if var2 ~= nil then
		return var2
	elseif p1.text == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.text.`)
	end
	local var3 = verifyString(p1.text, `{p2}.text`)
	
	if var3 ~= nil then
		return var3
	end
	local var4 = verifyString(p1.sourceLanguageCode, `{p2}.sourceLanguageCode`)
	
	if var4 ~= nil then
		return var4
	end
	for i, v in p1.targetLanguageCodes do
		local var5 = verifyString(v, `{p2}.targetLanguageCodes[{i}]`)
		
		if var5 ~= nil then
			return var5
		end
	end
	return nil
end

function translateTextUrl(p3)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: translateTextRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: translateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:translateText", getApisUrl(), getUrlPrefix(), tostring(p3.path))
end

function translateText(p3)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyTranslateTextRequest(p3, "translateTextRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = translateTextUrl(p3)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({
		Url = var7,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p3)
	}) else var7
end

openCloudService:RegisterOpenCloud("v2", "TranslateText", translateText)

function verifyGenerateSpeechRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	if var7 ~= nil then
		return var7
	elseif p3.text == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.text.`)
	end
	local var8 = verifyString(p3.text, `{p4}.text`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyGeneratedSpeechStyle(p3.speechStyle, `{p4}.speechStyle`)
	
	return if var9 == nil then nil else var9
end

function verifyGeneratedSpeechStyle(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	end
	local var7 = verifyString(p3.voiceId, `{p4}.voiceId`)
	
	if var7 ~= nil then
		return var7
	end
	local var8 = verifyNumber(p3.pitch, `{p4}.pitch`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyNumber(p3.speed, `{p4}.speed`)
	
	return if var9 == nil then nil else var9
end

function generateSpeechUrl(p3)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: generateSpeechRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateSpeechRequest.path.") else string.format("%s%s/cloud/v2/%s:generateSpeech", getApisUrl(), getUrlPrefix(), tostring(p3.path))
end

function generateSpeech(p3)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGenerateSpeechRequest(p3, "generateSpeechRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = generateSpeechUrl(p3)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({
		Url = var7,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p3)
	}) else var7
end

openCloudService:RegisterOpenCloud("v2", "GenerateSpeech", generateSpeech)

function verifyGenerateTextRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	if var7 ~= nil then
		return var7
	end
	local var8 = verifyString(p3.userPrompt, `{p4}.userPrompt`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyString(p3.systemPrompt, `{p4}.systemPrompt`)
	
	if var9 ~= nil then
		return var9
	end
	local var10 = verifyNumber(p3.temperature, `{p4}.temperature`)
	
	if var10 ~= nil then
		return var10
	end
	local var11 = verifyNumber(p3.topP, `{p4}.topP`)
	
	if var11 ~= nil then
		return var11
	end
	local var12 = verifyNumber(p3.maxTokens, `{p4}.maxTokens`)
	
	if var12 ~= nil then
		return var12
	end
	local var13 = verifyNumber(p3.seed, `{p4}.seed`)
	
	if var13 ~= nil then
		return var13
	end
	local var14 = verifyString(p3.contextToken, `{p4}.contextToken`)
	
	if var14 ~= nil then
		return var14
	end
	local var15 = verifyString(p3.model, `{p4}.model`)
	
	return if var15 == nil then nil else var15
end

function generateTextUrl(p3)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: generateTextRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:generateText", getApisUrl(), getUrlPrefix(), tostring(p3.path))
end

function generateText(p3)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGenerateTextRequest(p3, "generateTextRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = generateTextUrl(p3)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({
		Url = var7,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p3)
	}) else var7
end

openCloudService:RegisterOpenCloud("v2", "GenerateText", generateText)

function verifyGetPlaceRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	return if var7 == nil then nil else var7
end

function getPlaceUrl(p3, p4)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getPlaceRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)/places/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getPlaceRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), tostring(p3.path))
end

function getPlace(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGetPlaceRequest(p3, "getPlaceRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = getPlaceUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "GetPlace", getPlace)

function verifyGetGroupRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	return if var7 == nil then nil else var7
end

function getGroupUrl(p3, p4)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getGroupRequest.path.") elseif string.match(p3.path, "^groups/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getGroupRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), tostring(p3.path))
end

function getGroup(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGetGroupRequest(p3, "getGroupRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = getGroupUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "GetGroup", getGroup)

function verifyListInventoryItemsRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.parent.`)
	end
	local var7 = verifyString(p3.parent, `{p4}.parent`)
	
	if var7 ~= nil then
		return var7
	end
	local var8 = verifyNumber(p3.maxPageSize, `{p4}.maxPageSize`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyString(p3.pageToken, `{p4}.pageToken`)
	
	if var9 ~= nil then
		return var9
	end
	local var10 = verifyString(p3.filter, `{p4}.filter`)
	
	return if var10 == nil then nil else var10
end

function listInventoryItemsUrl(p3, p4)
	if p3.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listInventoryItemsRequest.parent.")
	elseif string.match(p3.parent, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listInventoryItemsRequest.parent.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s/inventory-items", getApisUrl(), getUrlPrefix(p4), tostring(p3.parent))
	
	if p3.maxPageSize == nil and p3.pageToken == nil and p3.filter == nil then
		return formattedText
	end
	local t = {}
	
	if p3.maxPageSize ~= nil then
		table.insert(t, string.format("maxPageSize=%s", tostring(p3.maxPageSize)))
	end
	if p3.pageToken ~= nil then
		table.insert(t, string.format("pageToken=%s", tostring(p3.pageToken)))
	end
	if p3.filter ~= nil then
		table.insert(t, string.format("filter=%s", tostring(p3.filter)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listInventoryItems(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyListInventoryItemsRequest(p3, "listInventoryItemsRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = listInventoryItemsUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "ListInventoryItems", listInventoryItems)

function verifyListGroupMembershipsRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.parent.`)
	end
	local var7 = verifyString(p3.parent, `{p4}.parent`)
	
	if var7 ~= nil then
		return var7
	end
	local var8 = verifyNumber(p3.maxPageSize, `{p4}.maxPageSize`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyString(p3.pageToken, `{p4}.pageToken`)
	
	if var9 ~= nil then
		return var9
	end
	local var10 = verifyString(p3.filter, `{p4}.filter`)
	
	return if var10 == nil then nil else var10
end

function listGroupMembershipsUrl(p3, p4)
	if p3.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listGroupMembershipsRequest.parent.")
	elseif string.match(p3.parent, "^groups/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listGroupMembershipsRequest.parent.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s/memberships", getApisUrl(), getUrlPrefix(p4), tostring(p3.parent))
	
	if p3.maxPageSize == nil and p3.pageToken == nil and p3.filter == nil then
		return formattedText
	end
	local t = {}
	
	if p3.maxPageSize ~= nil then
		table.insert(t, string.format("maxPageSize=%s", tostring(p3.maxPageSize)))
	end
	if p3.pageToken ~= nil then
		table.insert(t, string.format("pageToken=%s", tostring(p3.pageToken)))
	end
	if p3.filter ~= nil then
		table.insert(t, string.format("filter=%s", tostring(p3.filter)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listGroupMemberships(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyListGroupMembershipsRequest(p3, "listGroupMembershipsRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = listGroupMembershipsUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "ListGroupMemberships", listGroupMemberships)

function verifyGetOperationRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	return if var7 == nil then nil else var7
end

function getOperationUrl(p3, p4)
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getOperationRequest.path.") elseif string.match(p3.path, "^users/([^/]+)/operations/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getOperationRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), tostring(p3.path))
end

function getOperation(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGetOperationRequest(p3, "getOperationRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = getOperationUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "GetOperation", getOperation)

function verifyGenerateUserThumbnailRequest(p3, p4)
	if p3 == nil then
		return nil
	end
	local var6 = verifyTable(p3, p4)
	
	if var6 ~= nil then
		return var6
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	end
	local var7 = verifyString(p3.path, `{p4}.path`)
	
	if var7 ~= nil then
		return var7
	end
	local var8 = verifyNumber(p3.size, `{p4}.size`)
	
	if var8 ~= nil then
		return var8
	end
	local var9 = verifyEnum(p3.format, `{p4}.format`)
	
	if var9 ~= nil then
		return var9
	end
	local var10 = verifyEnum(p3.shape, `{p4}.shape`)
	
	return if var10 == nil then nil else var10
end

function generateUserThumbnailUrl(p3, p4)
	if p3.path == nil then
		return InvalidArgumentError("URL parameter provided was nil: generateUserThumbnailRequest.path.")
	elseif string.match(p3.path, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: generateUserThumbnailRequest.path.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s:generateThumbnail", getApisUrl(), getUrlPrefix(p4), tostring(p3.path))
	
	if p3.size == nil and p3.format == nil and p3.shape == nil then
		return formattedText
	end
	local t = {}
	
	if p3.size ~= nil then
		table.insert(t, string.format("size=%s", tostring(p3.size)))
	end
	if p3.format ~= nil then
		table.insert(t, string.format("format=%s", tostring(p3.format)))
	end
	if p3.shape ~= nil then
		table.insert(t, string.format("shape=%s", tostring(p3.shape)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function generateUserThumbnail(p3, p4)
	-- upvalues: openCloudService (ref)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGenerateUserThumbnailRequest(p3, "generateUserThumbnailRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = generateUserThumbnailUrl(p3, p4)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p4 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "GenerateUserThumbnail", generateUserThumbnail)
openCloudService:RegistrationComplete()