local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local GetAssetCreationDetailsModule = require(Parent.util.getAssetCreationDetails)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)

local function validateUser(List, List1, p1)
	if not List or #List == 0 then
		return true
	end
	local t = {}
	
	for _, value in ipairs(List) do
		t[tonumber(value.id)] = true
	end
	for _, value1 in ipairs(List1) do
		if not t[tonumber(value1.creatorTargetId)] then
			local v1 = p1[tostring(value1.assetId)]
			assert(v1)
			
			return false, {
				string.format("Failed to validate current user owns %s.%s ( %s ). Make sure you own the assets being validated and try again.", v1.instance:GetFullName(), v1.fieldName, (tostring(value1.assetId)))
			}
		end
	end
	return true
end

return function(Object, p2, p3)
	-- upvalues: ParseContentIdsModule (copy), AnalyticsModule (copy), GetAssetCreationDetailsModule (copy), validateUser (copy), ConstantsModule (copy)
	if p3.isServer or p3.allowUnreviewedAssets then
		return true
	end
	local t = {}
	local t1 = {}
	local ParseWithErrorCheckResult, ParseWithErrorCheckResult2 = ParseContentIdsModule.parseWithErrorCheck(t1, t, Object, nil, nil, p3)
	
	if not ParseWithErrorCheckResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateModeration_FailedToParse, nil, p3)
		
		return false, ParseWithErrorCheckResult2
	end
	local AssetIds = {}
	local AssetCreationDetailsModule, AssetCreationDetailsModule2 = GetAssetCreationDetailsModule(t1)
	
	if not AssetCreationDetailsModule or #AssetCreationDetailsModule2 ~= #t1 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateModeration_CouldNotFetchModerationDetails, nil, p3)
		
		return false, {
			string.format("Failed to fetch moderation results for %s. Make sure all assets are owned by the current user.", Object:GetFullName())
		}
	end
	local ValidateUserResult, ValidateUserResult2 = validateUser(p2, AssetCreationDetailsModule2, t)
	
	if not ValidateUserResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateModeration_ValidateUser, nil, p3)
		
		return ValidateUserResult, ValidateUserResult2
	end
	for _, value in pairs(AssetCreationDetailsModule2) do
		if value.status == ConstantsModule.ASSET_STATUS.UNKNOWN or value.status == ConstantsModule.ASSET_STATUS.REVIEW_PENDING or value.status == ConstantsModule.ASSET_STATUS.MODERATED then
			table.insert(AssetIds, value.assetId)
		end
	end
	if #AssetIds <= 0 then
		return true
	end
	local t2 = {}
	
	for i, assetId in pairs(AssetIds) do
		local Entry = t[assetId]
		
		if Entry then
			t2[i] = string.format("%s.%s ( %s )", Entry.instance:GetFullName(), Entry.fieldName, assetId)
		else
			t2[i] = assetId
		end
	end
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateModeration_AssetsHaveNotPassedModeration, nil, p3)
	
	return false, { "Asset(s) failed to pass moderation:", unpack(t2) }
end