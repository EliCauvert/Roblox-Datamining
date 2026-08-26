local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50)
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500)
local APIUtilModule = require(parent.util.APIUtil)
local constantsModule = require(parent.Constants)
local getFStringUGCValidationReferenceMeshIdWhitelistForIECModule = require(parent.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC)
local _ = require(parent.util.Types)
local httpService = game:GetService("HttpService")
local formattedText = string.format("https://apis.%s", APIUtilModule.getBaseDomain())

local function getWhitelistIds()
	-- upvalues: getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref)
	local t = {}
	local var1 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule()
	
	if #var1 == 0 then
		return t
	end
	for i in string.gmatch(var1, "([^,%s]+)") do
		t[i] = true
	end
	return t
end

local function createCanPublishPromise(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), httpService (ref), constantsModule (ref)
	return if #p2 == 0 then promiseModule.resolve() else promiseModule.new(function(p6, p7)
		-- upvalues: httpService (copy), p2 (ref), p3 (ref), p5 (ref), p1 (ref), constantsModule (copy), p4 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = p1,
			Body = httpService:JSONEncode({ assetIds = p2, restrictedEntities = p3, universeId = p5 }),
			Headers = {
				[constantsModule.ExperienceAuthHeaderKey] = p4,
				[constantsModule.ContentType] = constantsModule.ApplicationJson
			}
		}):Start(function(p8, p9)
			-- upvalues: p6 (ref), httpService (copy), p7 (ref)
			if p8 and p9.StatusCode == 200 then
				p6(httpService:JSONDecode(p9.Body))
				
				return
			end
			p7()
		end)
	end)
end

return function(value, p1, p2, p3, p4)
	-- upvalues: formattedText (ref), createCanPublishPromise (ref), promiseModule (ref), getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref), getWhitelistIds (ref)
	local UGCValidationCanPublishRequestPageSizeFastInt = game:GetFastInt("UGCValidationCanPublishRequestPageSize")
	local UGCValidationMaxAssetSizeAllowedFastInt = game:GetFastInt("UGCValidationMaxAssetSizeAllowed")
	local text = formattedText .. (if p4 then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local t = {}
	local t_1 = {}
	
	for i, v in value do
		if not t[i] then
			t[i] = true
			table.insert(t_1, i)
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < #t_1 then
		return { status = "tooManyAssets" }
	end
	local t_2 = {}
	local t_3 = {}
	
	for i_1, v_1 in t_1 do
		table.insert(t_3, v_1)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #t_3 then
			table.insert(t_2, createCanPublishPromise(text, t_3, p1, p2, p3))
			t_3 = {}
		end
	end
	if #t_3 > 0 then
		table.insert(t_2, createCanPublishPromise(text, t_3, p1, p2, p3))
	end
	local var2, var3 = promiseModule.all(t_2):await()
	
	if not var2 then
		return { status = "loadFailed" }
	end
	local var4 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local var5 = if var4 then getWhitelistIds() else {}
	local t_4 = {}
	
	for i_2, v_2 in var3 do
		for i_3, v_3 in v_2.result do
			local var6 = value[i_3]
			
			if var6 then
				table.insert(t_4, {
					assetId = i_3,
					allowed = if var4 and not v_3 and var5[i_3] then true else v_3,
					entry = var6[1]
				})
			end
		end
	end
	return { status = "ok", verdicts = t_4 }
end