local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50)
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500)
local ConstantsModule = require(Parent.Constants)
local GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule = require(Parent.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC)
local _ = require(Parent.util.Types)
local HttpService = game:GetService("HttpService")
local Formatted = string.format("https://apis.%s", (require(Parent.util.APIUtil).getBaseDomain()))

local function getWhitelistIds()
	-- upvalues: GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule (copy)
	local t = {}
	local FStringUGCValidationReferenceMeshIdWhitelistForIECModule: string = GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule()
	
	if #FStringUGCValidationReferenceMeshIdWhitelistForIECModule == 0 then
		return t
	end
	for i in string.gmatch(FStringUGCValidationReferenceMeshIdWhitelistForIECModule, "([^,%s]+)") do
		t[i] = true
	end
	return t
end

local function createCanPublishPromise(Url, AssetIds, RestrictedEntities, p1, UniverseId)
	-- upvalues: PromiseModule (copy), HttpService (copy), ConstantsModule (copy)
	return if #AssetIds == 0 then PromiseModule.resolve() else PromiseModule.new(function(Callback1, Callback)
		-- upvalues: HttpService (upval), AssetIds (copy), RestrictedEntities (copy), UniverseId (copy), Url (copy), ConstantsModule (upval), p1 (copy)
		HttpService:RequestInternal({
			Method = "POST",
			Url = Url,
			Body = HttpService:JSONEncode({
				assetIds = AssetIds,
				restrictedEntities = RestrictedEntities,
				universeId = UniverseId
			}),
			Headers = {
				[ConstantsModule.ExperienceAuthHeaderKey] = p1,
				[ConstantsModule.ContentType] = ConstantsModule.ApplicationJson
			}
		}):Start(function(p2, p3)
			-- upvalues: Callback1 (copy), HttpService (upval), Callback (copy)
			if p2 and p3.StatusCode == 200 then
				Callback1(HttpService:JSONDecode(p3.Body))
				
				return
			else
				Callback()
			end
		end)
	end)
end

return function(List, RestrictedEntities, p1, UniverseId, p2)
	-- upvalues: Formatted (copy), createCanPublishPromise (copy), PromiseModule (copy), GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule (copy), getWhitelistIds (copy)
	local UGCValidationCanPublishRequestPageSizeFastInt = game:GetFastInt("UGCValidationCanPublishRequestPageSize")
	local UGCValidationMaxAssetSizeAllowedFastInt = game:GetFastInt("UGCValidationMaxAssetSizeAllowed")
	local Text = Formatted .. (if p2 then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local t = {}
	local List1 = {}
	
	for i, _ in List do
		if not t[i] then
			t[i] = true
			table.insert(List1, i)
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < #List1 then
		return { status = "tooManyAssets" }
	end
	local List2 = {}
	local AssetIds = {}
	
	for _, value in List1 do
		table.insert(AssetIds, value)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #AssetIds then
			table.insert(List2, createCanPublishPromise(Text, AssetIds, RestrictedEntities, p1, UniverseId))
			AssetIds = {}
		end
	end
	if #AssetIds > 0 then
		table.insert(List2, createCanPublishPromise(Text, AssetIds, RestrictedEntities, p1, UniverseId))
	end
	local v1, v2 = PromiseModule.all(List2):await()
	
	if not v1 then
		return { status = "loadFailed" }
	end
	local IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch = GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local WhitelistIds = if IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch then getWhitelistIds() else {}
	local Verdicts = {}
	
	for _, value1 in v2 do
		for AssetId, value2 in value1.result do
			local Entry = List[AssetId]
			
			if Entry then
				table.insert(Verdicts, {
					assetId = AssetId,
					allowed = if IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch and not value2 and WhitelistIds[AssetId] then true else value2,
					entry = Entry[1]
				})
			end
		end
	end
	return { status = "ok", verdicts = Verdicts }
end