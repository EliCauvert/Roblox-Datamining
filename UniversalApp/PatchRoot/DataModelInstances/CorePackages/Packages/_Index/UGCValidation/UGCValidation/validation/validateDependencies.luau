local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local noStudioOwnershipCheck = game:DefineFastFlag("NoStudioOwnershipCheck", false)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getAssetCreationDetailsRCCModule = require(parent.util.getAssetCreationDetailsRCC)
local _ = require(parent.util.Types)
local validateCanLoadModule = require(parent.validation.validateCanLoad)
local validateAssetCreatorModule = require(parent.validation.validateAssetCreator)

local function validateExistance(p1, p2)
	-- upvalues: validateCanLoadModule (ref)
	for i, v in pairs(p1) do
		if not validateCanLoadModule(v.instance[v.fieldName], p2) then
			error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v.instance.Name))
		end
	end
end

local t = {
	MODERATION_STATE_REVIEWING = { MODERATION_STATE_REVIEWING = true, Reviewing = true },
	MODERATION_STATE_APPROVED = { MODERATION_STATE_APPROVED = true, Approved = true }
}

local function validateCreatorId(p1, p2, p3, p4, p5, p6)
	-- upvalues: analyticsModule (ref)
	if p1[tonumber(p2)] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsRestrictedUserId, nil, p6)
	
	return false, {
		`{p3:GetFullName()}.{p4} ( {p5} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationState(p1, p2, p3, p4, p5)
	-- upvalues: t (ref), analyticsModule (ref)
	if t.MODERATION_STATE_REVIEWING[p1] then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsReviewing, nil, p5)
		error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
	end
	if t.MODERATION_STATE_APPROVED[p1] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsNotApproved, nil, p5)
	
	return false, {
		`{p2:GetFullName()}.{p3} ( {p4} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationRCC(p1, p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), getAssetCreationDetailsRCCModule (ref), validateCreatorId (ref), validateModerationState (ref)
	if not p1 or #p1 == 0 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tonumber(v.id)] = true
	end
	local var1 = failureReasonsAccumulatorModule.new()
	
	for i_1, v_1 in pairs(p2) do
		local var2, var3 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var2 then
			error("Failed to load asset")
		end
		local creator = var3.creationContext.creator
		var1:updateReasons(validateCreatorId(t, if creator.userId then creator.userId else creator.groupId, v_1.instance, v_1.fieldName, i_1, p3))
		var1:updateReasons(validateModerationState(var3.moderationResult.moderationState, v_1.instance, v_1.fieldName, i_1, p3))
	end
	return var1:getFinalResults()
end

local function validateAssetCreatorsRCC(value, p1)
	-- upvalues: validateAssetCreatorModule (ref)
	assert(p1.isServer, "isServer must be true for validateAssetCreatorsRCC")
	
	return validateAssetCreatorModule(value, p1)
end

return function(p1, p2, p3)
	-- upvalues: parseContentIdsModule (ref), constantsModule (ref), analyticsModule (ref), validateExistance (ref), failureReasonsAccumulatorModule (ref), noStudioOwnershipCheck (ref), runService (ref), validateAssetCreatorsRCC (ref), validateModerationRCC (ref)
	local currentTime = tick()
	local var1 = if p2 then p2.isServer else nil
	local allowEditableInstances = p2.allowEditableInstances
	local var2 = if p2 then p2.restrictedUserIds else nil
	local var3 = if p2 then p2.universeId else nil
	local var4 = if p3 then p3.skipExistenceCheck else false
	local var5 = if p3 then p3.skipOwnershipCheck else false
	
	if var4 and var5 then
		return true
	end
	local t = {}
	local var6, var7 = parseContentIdsModule.parseWithErrorCheck({}, t, p1, nil, constantsModule.CONTENT_ID_REQUIRED_FIELDS, p2)
	
	if not var6 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_ParseFailure, nil, p2)
		
		return false, var7
	elseif var1 and not allowEditableInstances and not var4 then
		validateExistance(t, p2)
	end
	local var8 = failureReasonsAccumulatorModule.new()
	
	if not var5 and (not noStudioOwnershipCheck or noStudioOwnershipCheck and not runService:IsStudio()) and var1 then
		if var3 then
			var8:updateReasons(validateAssetCreatorsRCC(t, p2))
		else
			var8:updateReasons(validateModerationRCC(var2, t, p2))
		end
	end
	if p2 then
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	end
	return var8:getFinalResults()
end