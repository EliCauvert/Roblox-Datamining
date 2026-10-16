local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local OpenCloudService = game:GetService("OpenCloudService")
local RunService = game:GetService("RunService")

function InvalidArgumentError(Message) --[[ Line: 19 ]]
	-- upvalues: HttpService (copy)
	return {
		StatusCode = 400,
		Body = HttpService:JSONEncode({ code = "INVALID_ARGUMENT", message = Message })
	}
end

function verifyTable(p1, p2) --[[ Line: 37 ]]
	return if p1 == nil then nil elseif typeof(p1) == "table" then nil else InvalidArgumentError(`Argument not a table: {p2}.`)
end

function verifyNumber(p1, p2) --[[ Line: 49 ]]
	return if p1 == nil then nil elseif typeof(p1) == "number" then nil else InvalidArgumentError(`Argument not a number: {p2}.`)
end

function verifyString(p1, p2) --[[ Line: 61 ]]
	return if p1 == nil then nil elseif typeof(p1) == "string" then nil else InvalidArgumentError(`Argument not a string: {p2}.`)
end

function verifyEnum(p1, p2) --[[ Line: 73 ]]
	return if p1 == nil then nil elseif typeof(p1) == "number" or typeof(p1) == "string" then nil else InvalidArgumentError(`Argument not an enum: {p2}.`)
end

function getApisUrl(): string --[[ Line: 85 ]]
	-- upvalues: ContentProvider (copy)
	return string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "http:", "https:"), "www", "apis")
end

function getUrlPrefix(p1): string --[[ Line: 91 ]]
	-- upvalues: RunService (copy)
	return if p1 == nil or p1["x-api-key"] == nil then if RunService:IsStudio() then "user" else "rcc" else ""
end

function verifyGetUniverseRequest(p1, p2) --[[ Line: 101 ]]
	if p1 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p1, p2)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p1.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.path.`)
	else
		local VerifyStringResult = verifyString(p1.path, `{p2}.path`)
		
		return if VerifyStringResult == nil then nil else VerifyStringResult
	end
end

function getUniverseUrl(p1, p2) --[[ Line: 122 ]]
	return if p1.path == nil then InvalidArgumentError("URL parameter provided was nil: getUniverseRequest.path.") elseif string.match(p1.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getUniverseRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p2), (tostring(p1.path)))
end

function getUniverse(p1, Headers) --[[ Line: 135 ]]
	-- upvalues: OpenCloudService (copy)
	if p1 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GetUniverseRequest = verifyGetUniverseRequest(p1, "getUniverseRequest")
	
	if GetUniverseRequest == nil then
		local UniverseUrl = getUniverseUrl(p1, Headers)
		
		return if typeof(UniverseUrl) == "string" then OpenCloudService:HttpRequestAsync({
			Url = UniverseUrl,
			Request_Type = "GET",
			Headers = Headers
		}) else UniverseUrl
	else
		return GetUniverseRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GetUniverse", getUniverse)

function verifyTranslateTextRequest(p1, p2) --[[ Line: 155 ]]
	if p1 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p1, p2)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	end
	if p1.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.path.`)
	end
	local VerifyStringResult = verifyString(p1.path, `{p2}.path`)
	
	if VerifyStringResult ~= nil then
		return VerifyStringResult
	end
	if p1.text == nil then
		return InvalidArgumentError(`Required argument was not provided: {p2}.text.`)
	end
	local VerifyStringResult1 = verifyString(p1.text, `{p2}.text`)
	
	if VerifyStringResult1 ~= nil then
		return VerifyStringResult1
	end
	local VerifyStringResult2 = verifyString(p1.sourceLanguageCode, `{p2}.sourceLanguageCode`)
	
	if VerifyStringResult2 ~= nil then
		return VerifyStringResult2
	end
	local VerifyStringResult3 = nil
	for i, targetLanguageCode in p1.targetLanguageCodes do
		VerifyStringResult3 = verifyString(targetLanguageCode, `{p2}.targetLanguageCodes[{i}]`)
		
		if VerifyStringResult3 ~= nil then
			return VerifyStringResult3
		end
	end
	return nil
end

function translateTextUrl(p3) --[[ Line: 196 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: translateTextRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: translateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:translateText", getApisUrl(), getUrlPrefix(), (tostring(p3.path)))
end

function translateText(Input) --[[ Line: 209 ]]
	-- upvalues: HttpService (copy), OpenCloudService (copy)
	if Input == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local TranslateTextRequest = verifyTranslateTextRequest(Input, "translateTextRequest")
	
	if TranslateTextRequest == nil then
		local TranslateTextUrlResult = translateTextUrl(Input)
		
		return if typeof(TranslateTextUrlResult) == "string" then OpenCloudService:HttpRequestAsync({
			Url = TranslateTextUrlResult,
			Request_Type = "POST",
			Body = HttpService:JSONEncode(Input)
		}) else TranslateTextUrlResult
	else
		return TranslateTextRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "TranslateText", translateText)

function verifyGenerateSpeechRequest(p3, p4) --[[ Line: 231 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		elseif p3.text == nil then
			return InvalidArgumentError(`Required argument was not provided: {p4}.text.`)
		else
			local VerifyStringResult1 = verifyString(p3.text, `{p4}.text`)
			
			if VerifyStringResult1 == nil then
				local VerifyGeneratedSpeechStyleResult = verifyGeneratedSpeechStyle(p3.speechStyle, `{p4}.speechStyle`)
				
				return if VerifyGeneratedSpeechStyleResult == nil then nil else VerifyGeneratedSpeechStyleResult
			else
				return VerifyStringResult1
			end
		end
	end
end

function verifyGeneratedSpeechStyle(p3, p4) --[[ Line: 265 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	end
	local VerifyStringResult = verifyString(p3.voiceId, `{p4}.voiceId`)
	
	if VerifyStringResult ~= nil then
		return VerifyStringResult
	end
	local VerifyNumberResult = verifyNumber(p3.pitch, `{p4}.pitch`)
	
	if VerifyNumberResult == nil then
		local VerifyNumberResult1 = verifyNumber(p3.speed, `{p4}.speed`)
		
		return if VerifyNumberResult1 == nil then nil else VerifyNumberResult1
	else
		return VerifyNumberResult
	end
end

function generateSpeechUrl(p3) --[[ Line: 293 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: generateSpeechRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateSpeechRequest.path.") else string.format("%s%s/cloud/v2/%s:generateSpeech", getApisUrl(), getUrlPrefix(), (tostring(p3.path)))
end

function generateSpeech(Input) --[[ Line: 306 ]]
	-- upvalues: HttpService (copy), OpenCloudService (copy)
	if Input == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GenerateSpeechRequest = verifyGenerateSpeechRequest(Input, "generateSpeechRequest")
	
	if GenerateSpeechRequest == nil then
		local SpeechUrl = generateSpeechUrl(Input)
		
		return if typeof(SpeechUrl) == "string" then OpenCloudService:HttpRequestAsync({
			Url = SpeechUrl,
			Request_Type = "POST",
			Body = HttpService:JSONEncode(Input)
		}) else SpeechUrl
	else
		return GenerateSpeechRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GenerateSpeech", generateSpeech)

function verifyGenerateTextRequest(p3, p4) --[[ Line: 328 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
		local VerifyStringResult1 = verifyString(p3.userPrompt, `{p4}.userPrompt`)
		
		if VerifyStringResult1 ~= nil then
			return VerifyStringResult1
		end
		local VerifyStringResult2 = verifyString(p3.systemPrompt, `{p4}.systemPrompt`)
		
		if VerifyStringResult2 ~= nil then
			return VerifyStringResult2
		end
		local VerifyNumberResult = verifyNumber(p3.temperature, `{p4}.temperature`)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
		local VerifyNumberResult1 = verifyNumber(p3.topP, `{p4}.topP`)
		
		if VerifyNumberResult1 ~= nil then
			return VerifyNumberResult1
		end
		local VerifyNumberResult2 = verifyNumber(p3.maxTokens, `{p4}.maxTokens`)
		
		if VerifyNumberResult2 ~= nil then
			return VerifyNumberResult2
		end
		local VerifyNumberResult3 = verifyNumber(p3.seed, `{p4}.seed`)
		
		if VerifyNumberResult3 ~= nil then
			return VerifyNumberResult3
		end
		local VerifyStringResult3 = verifyString(p3.contextToken, `{p4}.contextToken`)
		
		if VerifyStringResult3 == nil then
			local VerifyStringResult4 = verifyString(p3.model, `{p4}.model`)
			
			return if VerifyStringResult4 == nil then nil else VerifyStringResult4
		else
			return VerifyStringResult3
		end
	end
end

function generateTextUrl(p3) --[[ Line: 389 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: generateTextRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:generateText", getApisUrl(), getUrlPrefix(), (tostring(p3.path)))
end

function generateText(Input) --[[ Line: 402 ]]
	-- upvalues: HttpService (copy), OpenCloudService (copy)
	if Input == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GenerateTextRequest = verifyGenerateTextRequest(Input, "generateTextRequest")
	
	if GenerateTextRequest == nil then
		local TextUrl = generateTextUrl(Input)
		
		return if typeof(TextUrl) == "string" then OpenCloudService:HttpRequestAsync({
			Url = TextUrl,
			Request_Type = "POST",
			Body = HttpService:JSONEncode(Input)
		}) else TextUrl
	else
		return GenerateTextRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GenerateText", generateText)

function verifyGetPlaceRequest(p3, p4) --[[ Line: 424 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		return if VerifyStringResult == nil then nil else VerifyStringResult
	end
end

function getPlaceUrl(p3, p4) --[[ Line: 445 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getPlaceRequest.path.") elseif string.match(p3.path, "^universes/([^/]+)/places/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getPlaceRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), (tostring(p3.path)))
end

function getPlace(p3, Headers) --[[ Line: 458 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GetPlaceRequest = verifyGetPlaceRequest(p3, "getPlaceRequest")
	
	if GetPlaceRequest == nil then
		local PlaceUrl = getPlaceUrl(p3, Headers)
		
		return if typeof(PlaceUrl) == "string" then OpenCloudService:HttpRequestAsync({ Url = PlaceUrl, Request_Type = "GET", Headers = Headers }) else PlaceUrl
	else
		return GetPlaceRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GetPlace", getPlace)

function verifyGetGroupRequest(p3, p4) --[[ Line: 478 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		return if VerifyStringResult == nil then nil else VerifyStringResult
	end
end

function getGroupUrl(p3, p4) --[[ Line: 499 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getGroupRequest.path.") elseif string.match(p3.path, "^groups/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getGroupRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), (tostring(p3.path)))
end

function getGroup(p3, Headers) --[[ Line: 512 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GetGroupRequest = verifyGetGroupRequest(p3, "getGroupRequest")
	
	if GetGroupRequest == nil then
		local GroupUrl = getGroupUrl(p3, Headers)
		
		return if typeof(GroupUrl) == "string" then OpenCloudService:HttpRequestAsync({ Url = GroupUrl, Request_Type = "GET", Headers = Headers }) else GroupUrl
	else
		return GetGroupRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GetGroup", getGroup)

function verifyListInventoryItemsRequest(p3, p4) --[[ Line: 532 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.parent.`)
	else
		local VerifyStringResult = verifyString(p3.parent, `{p4}.parent`)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
		local VerifyNumberResult = verifyNumber(p3.maxPageSize, `{p4}.maxPageSize`)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
		local VerifyStringResult1 = verifyString(p3.pageToken, `{p4}.pageToken`)
		
		if VerifyStringResult1 == nil then
			local VerifyStringResult2 = verifyString(p3.filter, `{p4}.filter`)
			
			return if VerifyStringResult2 == nil then nil else VerifyStringResult2
		else
			return VerifyStringResult1
		end
	end
end

function listInventoryItemsUrl(p3, p4) --[[ Line: 568 ]]
	if p3.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listInventoryItemsRequest.parent.")
	end
	if string.match(p3.parent, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listInventoryItemsRequest.parent.")
	end
	local Formatted = string.format("%s%s/cloud/v2/%s/inventory-items", getApisUrl(), getUrlPrefix(p4), (tostring(p3.parent)))
	
	if p3.maxPageSize == nil and p3.pageToken == nil and p3.filter == nil then
		return Formatted
	end
	local List = {}
	
	if p3.maxPageSize ~= nil then
		table.insert(List, string.format("maxPageSize=%s", (tostring(p3.maxPageSize))))
	end
	if p3.pageToken ~= nil then
		table.insert(List, string.format("pageToken=%s", (tostring(p3.pageToken))))
	end
	if p3.filter ~= nil then
		table.insert(List, string.format("filter=%s", (tostring(p3.filter))))
	end
	return (string.format("%s?%s", Formatted, table.concat(List, "&")))
end

function listInventoryItems(p3, Headers) --[[ Line: 598 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local ListInventoryItemsRequest = verifyListInventoryItemsRequest(p3, "listInventoryItemsRequest")
	
	if ListInventoryItemsRequest == nil then
		local ListInventoryItemsUrlResult = listInventoryItemsUrl(p3, Headers)
		
		return if typeof(ListInventoryItemsUrlResult) == "string" then OpenCloudService:HttpRequestAsync({
			Url = ListInventoryItemsUrlResult,
			Request_Type = "GET",
			Headers = Headers
		}) else ListInventoryItemsUrlResult
	else
		return ListInventoryItemsRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "ListInventoryItems", listInventoryItems)

function verifyListGroupMembershipsRequest(p3, p4) --[[ Line: 618 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.parent.`)
	else
		local VerifyStringResult = verifyString(p3.parent, `{p4}.parent`)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
		local VerifyNumberResult = verifyNumber(p3.maxPageSize, `{p4}.maxPageSize`)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
		local VerifyStringResult1 = verifyString(p3.pageToken, `{p4}.pageToken`)
		
		if VerifyStringResult1 == nil then
			local VerifyStringResult2 = verifyString(p3.filter, `{p4}.filter`)
			
			return if VerifyStringResult2 == nil then nil else VerifyStringResult2
		else
			return VerifyStringResult1
		end
	end
end

function listGroupMembershipsUrl(p3, p4) --[[ Line: 654 ]]
	if p3.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listGroupMembershipsRequest.parent.")
	end
	if string.match(p3.parent, "^groups/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listGroupMembershipsRequest.parent.")
	end
	local Formatted = string.format("%s%s/cloud/v2/%s/memberships", getApisUrl(), getUrlPrefix(p4), (tostring(p3.parent)))
	
	if p3.maxPageSize == nil and p3.pageToken == nil and p3.filter == nil then
		return Formatted
	end
	local List = {}
	
	if p3.maxPageSize ~= nil then
		table.insert(List, string.format("maxPageSize=%s", (tostring(p3.maxPageSize))))
	end
	if p3.pageToken ~= nil then
		table.insert(List, string.format("pageToken=%s", (tostring(p3.pageToken))))
	end
	if p3.filter ~= nil then
		table.insert(List, string.format("filter=%s", (tostring(p3.filter))))
	end
	return (string.format("%s?%s", Formatted, table.concat(List, "&")))
end

function listGroupMemberships(p3, Headers) --[[ Line: 684 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local ListGroupMembershipsRequest = verifyListGroupMembershipsRequest(p3, "listGroupMembershipsRequest")
	
	if ListGroupMembershipsRequest == nil then
		local ListGroupMembershipsUrlResult = listGroupMembershipsUrl(p3, Headers)
		
		return if typeof(ListGroupMembershipsUrlResult) == "string" then OpenCloudService:HttpRequestAsync({
			Url = ListGroupMembershipsUrlResult,
			Request_Type = "GET",
			Headers = Headers
		}) else ListGroupMembershipsUrlResult
	else
		return ListGroupMembershipsRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "ListGroupMemberships", listGroupMemberships)

function verifyGetOperationRequest(p3, p4) --[[ Line: 704 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		return if VerifyStringResult == nil then nil else VerifyStringResult
	end
end

function getOperationUrl(p3, p4) --[[ Line: 725 ]]
	return if p3.path == nil then InvalidArgumentError("URL parameter provided was nil: getOperationRequest.path.") elseif string.match(p3.path, "^users/([^/]+)/operations/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getOperationRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p4), (tostring(p3.path)))
end

function getOperation(p3, Headers) --[[ Line: 738 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GetOperationRequest = verifyGetOperationRequest(p3, "getOperationRequest")
	
	if GetOperationRequest == nil then
		local OperationUrl = getOperationUrl(p3, Headers)
		
		return if typeof(OperationUrl) == "string" then OpenCloudService:HttpRequestAsync({
			Url = OperationUrl,
			Request_Type = "GET",
			Headers = Headers
		}) else OperationUrl
	else
		return GetOperationRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GetOperation", getOperation)

function verifyGenerateUserThumbnailRequest(p3, p4) --[[ Line: 758 ]]
	if p3 == nil then
		return nil
	end
	local VerifyTableResult = verifyTable(p3, p4)
	
	if VerifyTableResult ~= nil then
		return VerifyTableResult
	elseif p3.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p4}.path.`)
	else
		local VerifyStringResult = verifyString(p3.path, `{p4}.path`)
		
		if VerifyStringResult ~= nil then
			return VerifyStringResult
		end
		local VerifyNumberResult = verifyNumber(p3.size, `{p4}.size`)
		
		if VerifyNumberResult ~= nil then
			return VerifyNumberResult
		end
		local VerifyEnumResult = verifyEnum(p3.format, `{p4}.format`)
		
		if VerifyEnumResult == nil then
			local VerifyEnumResult1 = verifyEnum(p3.shape, `{p4}.shape`)
			
			return if VerifyEnumResult1 == nil then nil else VerifyEnumResult1
		else
			return VerifyEnumResult
		end
	end
end

function generateUserThumbnailUrl(p3, p4) --[[ Line: 794 ]]
	if p3.path == nil then
		return InvalidArgumentError("URL parameter provided was nil: generateUserThumbnailRequest.path.")
	end
	if string.match(p3.path, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: generateUserThumbnailRequest.path.")
	end
	local Formatted = string.format("%s%s/cloud/v2/%s:generateThumbnail", getApisUrl(), getUrlPrefix(p4), (tostring(p3.path)))
	
	if p3.size == nil and p3.format == nil and p3.shape == nil then
		return Formatted
	end
	local List = {}
	
	if p3.size ~= nil then
		table.insert(List, string.format("size=%s", (tostring(p3.size))))
	end
	if p3.format ~= nil then
		table.insert(List, string.format("format=%s", (tostring(p3.format))))
	end
	if p3.shape ~= nil then
		table.insert(List, string.format("shape=%s", (tostring(p3.shape))))
	end
	return (string.format("%s?%s", Formatted, table.concat(List, "&")))
end

function generateUserThumbnail(p3, Headers) --[[ Line: 824 ]]
	-- upvalues: OpenCloudService (copy)
	if p3 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local GenerateUserThumbnailRequest = verifyGenerateUserThumbnailRequest(p3, "generateUserThumbnailRequest")
	
	if GenerateUserThumbnailRequest == nil then
		local UserThumbnailUrl = generateUserThumbnailUrl(p3, Headers)
		
		return if typeof(UserThumbnailUrl) == "string" then OpenCloudService:HttpRequestAsync({
			Url = UserThumbnailUrl,
			Request_Type = "GET",
			Headers = Headers
		}) else UserThumbnailUrl
	else
		return GenerateUserThumbnailRequest
	end
end

OpenCloudService:RegisterOpenCloud("v2", "GenerateUserThumbnail", generateUserThumbnail)
OpenCloudService:RegistrationComplete()