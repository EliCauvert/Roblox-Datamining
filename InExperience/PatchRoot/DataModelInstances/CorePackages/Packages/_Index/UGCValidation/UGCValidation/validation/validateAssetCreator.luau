local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50)
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500)
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local HttpService = game:GetService("HttpService")
local Formatted = string.format("https://apis.%s", (require(Parent.util.APIUtil).getBaseDomain()))
local UGCValidationCanPublishRequestPageSizeFastInt = game:GetFastInt("UGCValidationCanPublishRequestPageSize")
local UGCValidationMaxAssetSizeAllowedFastInt = game:GetFastInt("UGCValidationMaxAssetSizeAllowed")
local ConstantsModule = require(Parent.Constants)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule = require(Parent.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC)

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

local function _(Url, AssetIds, RestrictedEntities, p1, UniverseId)
	-- upvalues: PromiseModule (copy), HttpService (copy), ConstantsModule (copy)
	return if #AssetIds == 0 then PromiseModule.resolve() else PromiseModule.new(function(Callback, Callback1)
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
			-- upvalues: HttpService (upval), Callback (copy), Callback1 (copy)
			if p2 and p3.StatusCode == 200 then
				Callback((HttpService:JSONDecode(p3.Body)))
				
				return
			else
				Callback1()
			end
		end)
	end)
end

return function(List, p1)
	-- upvalues: Formatted (copy), FailureReasonsAccumulatorModule (copy), UGCValidationMaxAssetSizeAllowedFastInt (copy), AnalyticsModule (copy), UGCValidationCanPublishRequestPageSizeFastInt (copy), PromiseModule (copy), HttpService (copy), ConstantsModule (copy), GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule (copy), getWhitelistIds (copy)
	local IsServer = p1.isServer
	local RestrictedUserIds = if p1.restrictedUserIds then p1.restrictedUserIds else {}
	local Token = p1.token
	local UniverseId = p1.universeId
	local Text = Formatted .. (if IsServer then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local config = { User = {}, Group = {} }
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local t = {}
	local List1 = {}
	local Count = 0
	
	for _, restrictedUserId in ipairs(RestrictedUserIds) do
		config[restrictedUserId.creatorType][tonumber(restrictedUserId.id)] = true
	end
	for i, _ in List do
		if not t[i] then
			Count += 1
			t[i] = true
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < Count then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetCreator_TooManyDependencies, nil, p1)
		
		return false, {
			"Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
		}
	end
	local AssetIds = {}
	
	for i1, _ in t do
		table.insert(AssetIds, i1)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #AssetIds then
			table.insert(List1, if #AssetIds == 0 then PromiseModule.resolve() else PromiseModule.new(function(Callback, Callback1)
				-- upvalues: HttpService (upval), AssetIds (copy), RestrictedUserIds (copy), UniverseId (copy), Text (copy), ConstantsModule (upval), Token (copy)
				HttpService:RequestInternal({
					Method = "POST",
					Url = Text,
					Body = HttpService:JSONEncode({
						assetIds = AssetIds,
						restrictedEntities = RestrictedUserIds,
						universeId = UniverseId
					}),
					Headers = {
						[ConstantsModule.ExperienceAuthHeaderKey] = Token,
						[ConstantsModule.ContentType] = ConstantsModule.ApplicationJson
					}
				}):Start(function(p2, p3)
					-- upvalues: HttpService (upval), Callback (copy), Callback1 (copy)
					if p2 and p3.StatusCode == 200 then
						Callback((HttpService:JSONDecode(p3.Body)))
						
						return
					else
						Callback1()
					end
				end)
			end))
			AssetIds = {}
		end
	end
	if #AssetIds > 0 then
		table.insert(List1, if #AssetIds == 0 then PromiseModule.resolve() else PromiseModule.new(function(Callback, Callback1)
			-- upvalues: HttpService (upval), AssetIds (copy), RestrictedUserIds (copy), UniverseId (copy), Text (copy), ConstantsModule (upval), Token (copy)
			HttpService:RequestInternal({
				Method = "POST",
				Url = Text,
				Body = HttpService:JSONEncode({
					assetIds = AssetIds,
					restrictedEntities = RestrictedUserIds,
					universeId = UniverseId
				}),
				Headers = {
					[ConstantsModule.ExperienceAuthHeaderKey] = Token,
					[ConstantsModule.ContentType] = ConstantsModule.ApplicationJson
				}
			}):Start(function(p2, p3)
				-- upvalues: HttpService (upval), Callback (copy), Callback1 (copy)
				if p2 and p3.StatusCode == 200 then
					Callback((HttpService:JSONDecode(p3.Body)))
					
					return
				else
					Callback1()
				end
			end)
		end))
	end
	local v1, v2 = PromiseModule.all(List1):await()
	
	if not v1 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetCreator_FailedToLoad, nil, p1)
		
		return false, {
			"Failed to load detailed information for model assets. Make sure all model assets exist and try again."
		}
	end
	local IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch = GetFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local WhitelistIds = if IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch then getWhitelistIds() else {}
	for _, value in v2 do
		for i2, value1 in pairs(value.result) do
			local v3 = if IsNotFStringUGCValidationReferenceMeshIdWhitelistForIECModuleMatch then value1 or WhitelistIds[i2] else value1
			
			if not v3 then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, p1)
			end
			local Entry = List[i2]
			NewFailureReasonsAccumulator:updateReasons(v3, {
				(string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", Entry.instance:GetFullName(), Entry.fieldName, i2))
			})
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end