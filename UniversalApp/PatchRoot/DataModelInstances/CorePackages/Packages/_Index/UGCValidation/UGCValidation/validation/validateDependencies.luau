local Parent = script.Parent.Parent
local RunService = game:GetService("RunService")
local NoStudioOwnershipCheck = game:DefineFastFlag("NoStudioOwnershipCheck", false)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetAssetCreationDetailsRCCModule = require(Parent.util.getAssetCreationDetailsRCC)
local _ = require(Parent.util.Types)
local ValidateCanLoadModule = require(Parent.validation.validateCanLoad)
local ValidateAssetCreatorModule = require(Parent.validation.validateAssetCreator)

local function validateExistance(List, p1)
	-- upvalues: ValidateCanLoadModule (copy)
	for _, value in pairs(List) do
		if not ValidateCanLoadModule(value.instance[value.fieldName], p1) then
			error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", value.instance.Name))
		end
	end
end

local config = {
	MODERATION_STATE_REVIEWING = { MODERATION_STATE_REVIEWING = true, Reviewing = true },
	MODERATION_STATE_APPROVED = { MODERATION_STATE_APPROVED = true, Approved = true }
}

local function validateCreatorId(p2, UserId, Object, FieldName, p3, p4)
	-- upvalues: AnalyticsModule (copy)
	if p2[tonumber(UserId)] then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDependencies_IsRestrictedUserId, nil, p4)
		
		return false, {
			`{Object:GetFullName()}.{FieldName} ( {p3} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
		}
	end
end

local function validateModerationState(ModerationState, Object, FieldName, p2, p3)
	-- upvalues: config (copy), AnalyticsModule (copy)
	if config.MODERATION_STATE_REVIEWING[ModerationState] then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDependencies_IsReviewing, nil, p3)
		error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
	end
	if config.MODERATION_STATE_APPROVED[ModerationState] then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDependencies_IsNotApproved, nil, p3)
		
		return false, {
			`{Object:GetFullName()}.{FieldName} ( {p2} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
		}
	end
end

local function validateModerationRCC(RestrictedUserIds, List, p2)
	-- upvalues: FailureReasonsAccumulatorModule (copy), GetAssetCreationDetailsRCCModule (copy), validateCreatorId (copy), validateModerationState (copy)
	if not RestrictedUserIds or #RestrictedUserIds == 0 then
		return true
	end
	local t = {}
	
	for _, restrictedUserId in ipairs(RestrictedUserIds) do
		t[tonumber(restrictedUserId.id)] = true
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for i, value in pairs(List) do
		local AssetCreationDetailsRCCModule, AssetCreationDetailsRCCModule2 = GetAssetCreationDetailsRCCModule(i)
		
		if not AssetCreationDetailsRCCModule then
			error("Failed to load asset")
		end
		local Creator = AssetCreationDetailsRCCModule2.creationContext.creator
		NewFailureReasonsAccumulator:updateReasons(validateCreatorId(t, if Creator.userId then Creator.userId else Creator.groupId, value.instance, value.fieldName, i, p2))
		NewFailureReasonsAccumulator:updateReasons(validateModerationState(AssetCreationDetailsRCCModule2.moderationResult.moderationState, value.instance, value.fieldName, i, p2))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateAssetCreatorsRCC(p3, p4)
	-- upvalues: ValidateAssetCreatorModule (copy)
	assert(p4.isServer, "isServer must be true for validateAssetCreatorsRCC")
	
	return ValidateAssetCreatorModule(p3, p4)
end

return function(p3, p4, p5)
	-- upvalues: ParseContentIdsModule (copy), ConstantsModule (copy), AnalyticsModule (copy), validateExistance (copy), FailureReasonsAccumulatorModule (copy), NoStudioOwnershipCheck (copy), RunService (copy), validateAssetCreatorsRCC (copy), validateModerationRCC (copy)
	local CurrentTime = tick()
	local IsServer = if p4 then p4.isServer else nil
	local AllowEditableInstances = p4.allowEditableInstances
	local RestrictedUserIds = if p4 then p4.restrictedUserIds else nil
	local UniverseId = if p4 then p4.universeId else nil
	local SkipExistenceCheck = p5 and p5.skipExistenceCheck or false
	local SkipOwnershipCheck = p5 and p5.skipOwnershipCheck or false
	
	if SkipExistenceCheck and SkipOwnershipCheck then
		return true
	end
	local t = {}
	local ParseWithErrorCheckResult, ParseWithErrorCheckResult2 = ParseContentIdsModule.parseWithErrorCheck({}, t, p3, nil, ConstantsModule.CONTENT_ID_REQUIRED_FIELDS, p4)
	
	if not ParseWithErrorCheckResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDependencies_ParseFailure, nil, p4)
		
		return false, ParseWithErrorCheckResult2
	end
	if IsServer and not AllowEditableInstances and not SkipExistenceCheck then
		validateExistance(t, p4)
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not SkipOwnershipCheck and (not NoStudioOwnershipCheck or NoStudioOwnershipCheck and not RunService:IsStudio()) and IsServer then
		if UniverseId then
			NewFailureReasonsAccumulator:updateReasons(validateAssetCreatorsRCC(t, p4))
		else
			NewFailureReasonsAccumulator:updateReasons(validateModerationRCC(RestrictedUserIds, t, p4))
		end
	end
	if p4 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p4)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end