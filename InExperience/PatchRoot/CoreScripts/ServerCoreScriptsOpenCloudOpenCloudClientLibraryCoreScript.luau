local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local openCloudService = game:GetService("OpenCloudService")
local runService = game:GetService("RunService")

function InvalidArgumentError(p0)
	-- upvalues: httpService (ref)
	return {
		StatusCode = 400,
		Body = httpService:JSONEncode({ code = "INVALID_ARGUMENT", message = p0 })
	}
end

function verifyTable(p1, p2)
	return if p1 == nil then nil elseif typeof(p1) == "table" then nil else InvalidArgumentError(`Argument not a table: {p2}.`)
end

function verifyNumber(p3, p4)
	return if p3 == nil then nil elseif typeof(p3) == "number" then nil else InvalidArgumentError(`Argument not a number: {p4}.`)
end

function verifyString(p5, p6)
	return if p5 == nil then nil elseif typeof(p5) == "string" then nil else InvalidArgumentError(`Argument not a string: {p6}.`)
end

function verifyEnum(p7, p8)
	return if p7 == nil then nil elseif typeof(p7) == "number" or typeof(p7) == "string" then nil else InvalidArgumentError(`Argument not an enum: {p8}.`)
end

function getApisUrl()
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "http:", "https:"), "www", "apis")
end

function getUrlPrefix(p9)
	-- upvalues: runService (ref)
	return if not (p9 ~= nil and p9["x-api-key"] ~= nil) then if runService:IsStudio() then "user" else "rcc" else ""
end

function verifyGetUniverseRequest(p10, p11)
	if p10 == nil then
		return nil
	end
	local var4 = verifyTable(p10, p11)
	
	if var4 ~= nil then
		return var4
	elseif p10.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p11}.path.`)
	end
	local var5 = verifyString(p10.path, `{p11}.path`)
	
	return if var5 == nil then nil else var5
end

function getUniverseUrl(p12, p13)
	return if p12.path == nil then InvalidArgumentError("URL parameter provided was nil: getUniverseRequest.path.") elseif string.match(p12.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getUniverseRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p13), tostring(p12.path))
end

function getUniverse(p14, p15)
	-- upvalues: openCloudService (ref)
	if p14 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var6 = verifyGetUniverseRequest(p14, "getUniverseRequest")
	
	if var6 ~= nil then
		return var6
	end
	local var7 = getUniverseUrl(p14, p15)
	
	return if typeof(var7) == "string" then openCloudService:HttpRequestAsync({ Url = var7, Request_Type = "GET", Headers = p15 }) else var7
end

openCloudService:RegisterOpenCloud("v2", "GetUniverse", getUniverse)

function verifyTranslateTextRequest(p16, p17)
	if p16 == nil then
		return nil
	end
	local var8 = verifyTable(p16, p17)
	
	if var8 ~= nil then
		return var8
	elseif p16.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p17}.path.`)
	end
	local var9 = verifyString(p16.path, `{p17}.path`)
	
	if var9 ~= nil then
		return var9
	elseif p16.text == nil then
		return InvalidArgumentError(`Required argument was not provided: {p17}.text.`)
	end
	local var10 = verifyString(p16.text, `{p17}.text`)
	
	if var10 ~= nil then
		return var10
	end
	local var11 = verifyString(p16.sourceLanguageCode, `{p17}.sourceLanguageCode`)
	
	if var11 ~= nil then
		return var11
	end
	for i, v in p16.targetLanguageCodes do
		local var12 = verifyString(v, `{p17}.targetLanguageCodes[{i}]`)
		
		if var12 ~= nil then
			return var12
		end
	end
	return nil
end

function translateTextUrl(p18)
	return if p18.path == nil then InvalidArgumentError("URL parameter provided was nil: translateTextRequest.path.") elseif string.match(p18.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: translateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:translateText", getApisUrl(), getUrlPrefix(), tostring(p18.path))
end

function translateText(p19)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p19 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var13 = verifyTranslateTextRequest(p19, "translateTextRequest")
	
	if var13 ~= nil then
		return var13
	end
	local var14 = translateTextUrl(p19)
	
	return if typeof(var14) == "string" then openCloudService:HttpRequestAsync({
		Url = var14,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p19)
	}) else var14
end

openCloudService:RegisterOpenCloud("v2", "TranslateText", translateText)

function verifyGenerateSpeechRequest(p20, p21)
	if p20 == nil then
		return nil
	end
	local var15 = verifyTable(p20, p21)
	
	if var15 ~= nil then
		return var15
	elseif p20.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p21}.path.`)
	end
	local var16 = verifyString(p20.path, `{p21}.path`)
	
	if var16 ~= nil then
		return var16
	elseif p20.text == nil then
		return InvalidArgumentError(`Required argument was not provided: {p21}.text.`)
	end
	local var17 = verifyString(p20.text, `{p21}.text`)
	
	if var17 ~= nil then
		return var17
	end
	local var18 = verifyGeneratedSpeechStyle(p20.speechStyle, `{p21}.speechStyle`)
	
	return if var18 == nil then nil else var18
end

function verifyGeneratedSpeechStyle(p22, p23)
	if p22 == nil then
		return nil
	end
	local var19 = verifyTable(p22, p23)
	
	if var19 ~= nil then
		return var19
	end
	local var20 = verifyString(p22.voiceId, `{p23}.voiceId`)
	
	if var20 ~= nil then
		return var20
	end
	local var21 = verifyNumber(p22.pitch, `{p23}.pitch`)
	
	if var21 ~= nil then
		return var21
	end
	local var22 = verifyNumber(p22.speed, `{p23}.speed`)
	
	return if var22 == nil then nil else var22
end

function generateSpeechUrl(p24)
	return if p24.path == nil then InvalidArgumentError("URL parameter provided was nil: generateSpeechRequest.path.") elseif string.match(p24.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateSpeechRequest.path.") else string.format("%s%s/cloud/v2/%s:generateSpeech", getApisUrl(), getUrlPrefix(), tostring(p24.path))
end

function generateSpeech(p25)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p25 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var23 = verifyGenerateSpeechRequest(p25, "generateSpeechRequest")
	
	if var23 ~= nil then
		return var23
	end
	local var24 = generateSpeechUrl(p25)
	
	return if typeof(var24) == "string" then openCloudService:HttpRequestAsync({
		Url = var24,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p25)
	}) else var24
end

openCloudService:RegisterOpenCloud("v2", "GenerateSpeech", generateSpeech)

function verifyGenerateTextRequest(p26, p27)
	if p26 == nil then
		return nil
	end
	local var25 = verifyTable(p26, p27)
	
	if var25 ~= nil then
		return var25
	elseif p26.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p27}.path.`)
	end
	local var26 = verifyString(p26.path, `{p27}.path`)
	
	if var26 ~= nil then
		return var26
	end
	local var27 = verifyString(p26.userPrompt, `{p27}.userPrompt`)
	
	if var27 ~= nil then
		return var27
	end
	local var28 = verifyString(p26.systemPrompt, `{p27}.systemPrompt`)
	
	if var28 ~= nil then
		return var28
	end
	local var29 = verifyNumber(p26.temperature, `{p27}.temperature`)
	
	if var29 ~= nil then
		return var29
	end
	local var30 = verifyNumber(p26.topP, `{p27}.topP`)
	
	if var30 ~= nil then
		return var30
	end
	local var31 = verifyNumber(p26.maxTokens, `{p27}.maxTokens`)
	
	if var31 ~= nil then
		return var31
	end
	local var32 = verifyNumber(p26.seed, `{p27}.seed`)
	
	if var32 ~= nil then
		return var32
	end
	local var33 = verifyString(p26.contextToken, `{p27}.contextToken`)
	
	if var33 ~= nil then
		return var33
	end
	local var34 = verifyString(p26.model, `{p27}.model`)
	
	return if var34 == nil then nil else var34
end

function generateTextUrl(p28)
	return if p28.path == nil then InvalidArgumentError("URL parameter provided was nil: generateTextRequest.path.") elseif string.match(p28.path, "^universes/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: generateTextRequest.path.") else string.format("%s%s/cloud/v2/%s:generateText", getApisUrl(), getUrlPrefix(), tostring(p28.path))
end

function generateText(p29)
	-- upvalues: httpService (ref), openCloudService (ref)
	if p29 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var35 = verifyGenerateTextRequest(p29, "generateTextRequest")
	
	if var35 ~= nil then
		return var35
	end
	local var36 = generateTextUrl(p29)
	
	return if typeof(var36) == "string" then openCloudService:HttpRequestAsync({
		Url = var36,
		Request_Type = "POST",
		Body = httpService:JSONEncode(p29)
	}) else var36
end

openCloudService:RegisterOpenCloud("v2", "GenerateText", generateText)

function verifyGetPlaceRequest(p30, p31)
	if p30 == nil then
		return nil
	end
	local var37 = verifyTable(p30, p31)
	
	if var37 ~= nil then
		return var37
	elseif p30.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p31}.path.`)
	end
	local var38 = verifyString(p30.path, `{p31}.path`)
	
	return if var38 == nil then nil else var38
end

function getPlaceUrl(p32, p33)
	return if p32.path == nil then InvalidArgumentError("URL parameter provided was nil: getPlaceRequest.path.") elseif string.match(p32.path, "^universes/([^/]+)/places/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getPlaceRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p33), tostring(p32.path))
end

function getPlace(p34, p35)
	-- upvalues: openCloudService (ref)
	if p34 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var39 = verifyGetPlaceRequest(p34, "getPlaceRequest")
	
	if var39 ~= nil then
		return var39
	end
	local var40 = getPlaceUrl(p34, p35)
	
	return if typeof(var40) == "string" then openCloudService:HttpRequestAsync({ Url = var40, Request_Type = "GET", Headers = p35 }) else var40
end

openCloudService:RegisterOpenCloud("v2", "GetPlace", getPlace)

function verifyGetGroupRequest(p36, p37)
	if p36 == nil then
		return nil
	end
	local var41 = verifyTable(p36, p37)
	
	if var41 ~= nil then
		return var41
	elseif p36.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p37}.path.`)
	end
	local var42 = verifyString(p36.path, `{p37}.path`)
	
	return if var42 == nil then nil else var42
end

function getGroupUrl(p38, p39)
	return if p38.path == nil then InvalidArgumentError("URL parameter provided was nil: getGroupRequest.path.") elseif string.match(p38.path, "^groups/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getGroupRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p39), tostring(p38.path))
end

function getGroup(p40, p41)
	-- upvalues: openCloudService (ref)
	if p40 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var43 = verifyGetGroupRequest(p40, "getGroupRequest")
	
	if var43 ~= nil then
		return var43
	end
	local var44 = getGroupUrl(p40, p41)
	
	return if typeof(var44) == "string" then openCloudService:HttpRequestAsync({ Url = var44, Request_Type = "GET", Headers = p41 }) else var44
end

openCloudService:RegisterOpenCloud("v2", "GetGroup", getGroup)

function verifyListInventoryItemsRequest(p42, p43)
	if p42 == nil then
		return nil
	end
	local var45 = verifyTable(p42, p43)
	
	if var45 ~= nil then
		return var45
	elseif p42.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p43}.parent.`)
	end
	local var46 = verifyString(p42.parent, `{p43}.parent`)
	
	if var46 ~= nil then
		return var46
	end
	local var47 = verifyNumber(p42.maxPageSize, `{p43}.maxPageSize`)
	
	if var47 ~= nil then
		return var47
	end
	local var48 = verifyString(p42.pageToken, `{p43}.pageToken`)
	
	if var48 ~= nil then
		return var48
	end
	local var49 = verifyString(p42.filter, `{p43}.filter`)
	
	return if var49 == nil then nil else var49
end

function listInventoryItemsUrl(p44, p45)
	if p44.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listInventoryItemsRequest.parent.")
	elseif string.match(p44.parent, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listInventoryItemsRequest.parent.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s/inventory-items", getApisUrl(), getUrlPrefix(p45), tostring(p44.parent))
	
	if p44.maxPageSize == nil and p44.pageToken == nil and p44.filter == nil then
		return formattedText
	end
	local t = {}
	
	if p44.maxPageSize ~= nil then
		table.insert(t, string.format("maxPageSize=%s", tostring(p44.maxPageSize)))
	end
	if p44.pageToken ~= nil then
		table.insert(t, string.format("pageToken=%s", tostring(p44.pageToken)))
	end
	if p44.filter ~= nil then
		table.insert(t, string.format("filter=%s", tostring(p44.filter)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listInventoryItems(p46, p47)
	-- upvalues: openCloudService (ref)
	if p46 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var52 = verifyListInventoryItemsRequest(p46, "listInventoryItemsRequest")
	
	if var52 ~= nil then
		return var52
	end
	local var53 = listInventoryItemsUrl(p46, p47)
	
	return if typeof(var53) == "string" then openCloudService:HttpRequestAsync({ Url = var53, Request_Type = "GET", Headers = p47 }) else var53
end

openCloudService:RegisterOpenCloud("v2", "ListInventoryItems", listInventoryItems)

function verifyListGroupMembershipsRequest(p48, p49)
	if p48 == nil then
		return nil
	end
	local var54 = verifyTable(p48, p49)
	
	if var54 ~= nil then
		return var54
	elseif p48.parent == nil then
		return InvalidArgumentError(`Required argument was not provided: {p49}.parent.`)
	end
	local var55 = verifyString(p48.parent, `{p49}.parent`)
	
	if var55 ~= nil then
		return var55
	end
	local var56 = verifyNumber(p48.maxPageSize, `{p49}.maxPageSize`)
	
	if var56 ~= nil then
		return var56
	end
	local var57 = verifyString(p48.pageToken, `{p49}.pageToken`)
	
	if var57 ~= nil then
		return var57
	end
	local var58 = verifyString(p48.filter, `{p49}.filter`)
	
	return if var58 == nil then nil else var58
end

function listGroupMembershipsUrl(p50, p51)
	if p50.parent == nil then
		return InvalidArgumentError("URL parameter provided was nil: listGroupMembershipsRequest.parent.")
	elseif string.match(p50.parent, "^groups/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: listGroupMembershipsRequest.parent.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s/memberships", getApisUrl(), getUrlPrefix(p51), tostring(p50.parent))
	
	if p50.maxPageSize == nil and p50.pageToken == nil and p50.filter == nil then
		return formattedText
	end
	local t = {}
	
	if p50.maxPageSize ~= nil then
		table.insert(t, string.format("maxPageSize=%s", tostring(p50.maxPageSize)))
	end
	if p50.pageToken ~= nil then
		table.insert(t, string.format("pageToken=%s", tostring(p50.pageToken)))
	end
	if p50.filter ~= nil then
		table.insert(t, string.format("filter=%s", tostring(p50.filter)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function listGroupMemberships(p52, p53)
	-- upvalues: openCloudService (ref)
	if p52 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var61 = verifyListGroupMembershipsRequest(p52, "listGroupMembershipsRequest")
	
	if var61 ~= nil then
		return var61
	end
	local var62 = listGroupMembershipsUrl(p52, p53)
	
	return if typeof(var62) == "string" then openCloudService:HttpRequestAsync({ Url = var62, Request_Type = "GET", Headers = p53 }) else var62
end

openCloudService:RegisterOpenCloud("v2", "ListGroupMemberships", listGroupMemberships)

function verifyGetOperationRequest(p54, p55)
	if p54 == nil then
		return nil
	end
	local var63 = verifyTable(p54, p55)
	
	if var63 ~= nil then
		return var63
	elseif p54.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p55}.path.`)
	end
	local var64 = verifyString(p54.path, `{p55}.path`)
	
	return if var64 == nil then nil else var64
end

function getOperationUrl(p56, p57)
	return if p56.path == nil then InvalidArgumentError("URL parameter provided was nil: getOperationRequest.path.") elseif string.match(p56.path, "^users/([^/]+)/operations/([^/]+)$") == nil then InvalidArgumentError("URL parameter was not formatted correctly: getOperationRequest.path.") else string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(p57), tostring(p56.path))
end

function getOperation(p58, p59)
	-- upvalues: openCloudService (ref)
	if p58 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var65 = verifyGetOperationRequest(p58, "getOperationRequest")
	
	if var65 ~= nil then
		return var65
	end
	local var66 = getOperationUrl(p58, p59)
	
	return if typeof(var66) == "string" then openCloudService:HttpRequestAsync({ Url = var66, Request_Type = "GET", Headers = p59 }) else var66
end

openCloudService:RegisterOpenCloud("v2", "GetOperation", getOperation)

function verifyGenerateUserThumbnailRequest(p60, p61)
	if p60 == nil then
		return nil
	end
	local var67 = verifyTable(p60, p61)
	
	if var67 ~= nil then
		return var67
	elseif p60.path == nil then
		return InvalidArgumentError(`Required argument was not provided: {p61}.path.`)
	end
	local var68 = verifyString(p60.path, `{p61}.path`)
	
	if var68 ~= nil then
		return var68
	end
	local var69 = verifyNumber(p60.size, `{p61}.size`)
	
	if var69 ~= nil then
		return var69
	end
	local var70 = verifyEnum(p60.format, `{p61}.format`)
	
	if var70 ~= nil then
		return var70
	end
	local var71 = verifyEnum(p60.shape, `{p61}.shape`)
	
	return if var71 == nil then nil else var71
end

function generateUserThumbnailUrl(p62, p63)
	if p62.path == nil then
		return InvalidArgumentError("URL parameter provided was nil: generateUserThumbnailRequest.path.")
	elseif string.match(p62.path, "^users/([^/]+)$") == nil then
		return InvalidArgumentError("URL parameter was not formatted correctly: generateUserThumbnailRequest.path.")
	end
	local formattedText = string.format("%s%s/cloud/v2/%s:generateThumbnail", getApisUrl(), getUrlPrefix(p63), tostring(p62.path))
	
	if p62.size == nil and p62.format == nil and p62.shape == nil then
		return formattedText
	end
	local t = {}
	
	if p62.size ~= nil then
		table.insert(t, string.format("size=%s", tostring(p62.size)))
	end
	if p62.format ~= nil then
		table.insert(t, string.format("format=%s", tostring(p62.format)))
	end
	if p62.shape ~= nil then
		table.insert(t, string.format("shape=%s", tostring(p62.shape)))
	end
	return string.format("%s?%s", formattedText, table.concat(t, "&"))
end

function generateUserThumbnail(p64, p65)
	-- upvalues: openCloudService (ref)
	if p64 == nil then
		return InvalidArgumentError("Request provided was nil.")
	end
	local var74 = verifyGenerateUserThumbnailRequest(p64, "generateUserThumbnailRequest")
	
	if var74 ~= nil then
		return var74
	end
	local var75 = generateUserThumbnailUrl(p64, p65)
	
	return if typeof(var75) == "string" then openCloudService:HttpRequestAsync({ Url = var75, Request_Type = "GET", Headers = p65 }) else var75
end

openCloudService:RegisterOpenCloud("v2", "GenerateUserThumbnail", generateUserThumbnail)
openCloudService:RegistrationComplete()