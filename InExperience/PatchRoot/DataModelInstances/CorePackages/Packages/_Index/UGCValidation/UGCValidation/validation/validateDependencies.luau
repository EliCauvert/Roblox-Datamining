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

local function validateCreatorId(p3, p4, p5, p6, p7, p8)
	-- upvalues: analyticsModule (ref)
	if p3[tonumber(p4)] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsRestrictedUserId, nil, p8)
	
	return false, {
		`{p5:GetFullName()}.{p6} ( {p7} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationState(p3, p4, p5, p6, p7)
	-- upvalues: t (ref), analyticsModule (ref)
	if t.MODERATION_STATE_REVIEWING[p3] then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsReviewing, nil, p7)
		error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
	end
	if t.MODERATION_STATE_APPROVED[p3] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsNotApproved, nil, p7)
	
	return false, {
		`{p4:GetFullName()}.{p5} ( {p6} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationRCC(p3, p4, p5)
	-- upvalues: failureReasonsAccumulatorModule (ref), getAssetCreationDetailsRCCModule (ref), validateCreatorId (ref), validateModerationState (ref)
	if not p3 or #p3 == 0 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(p3) do
		t[tonumber(v.id)] = true
	end
	local var1 = failureReasonsAccumulatorModule.new()
	
	for i_1, v_1 in pairs(p4) do
		local var2, var3 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var2 then
			error("Failed to load asset")
		end
		local creator = var3.creationContext.creator
		var1:updateReasons(validateCreatorId(t, if creator.userId then creator.userId else creator.groupId, v_1.instance, v_1.fieldName, i_1, p5))
		var1:updateReasons(validateModerationState(var3.moderationResult.moderationState, v_1.instance, v_1.fieldName, i_1, p5))
	end
	return var1:getFinalResults()
end

local function validateAssetCreatorsRCC(value, p6)
	-- upvalues: validateAssetCreatorModule (ref)
	assert(p6.isServer, "isServer must be true for validateAssetCreatorsRCC")
	
	return validateAssetCreatorModule(value, p6)
end

return function(p6, p7, p8)
	-- upvalues: parseContentIdsModule (ref), constantsModule (ref), analyticsModule (ref), validateExistance (ref), failureReasonsAccumulatorModule (ref), noStudioOwnershipCheck (ref), runService (ref), validateAssetCreatorsRCC (ref), validateModerationRCC (ref)
	local currentTime = tick()
	local var4 = if p7 then p7.isServer else nil
	local allowEditableInstances = p7.allowEditableInstances
	local var5 = if p7 then p7.restrictedUserIds else nil
	local var6 = if p7 then p7.universeId else nil
	local var7 = if p8 then p8.skipExistenceCheck else false
	local var8 = if p8 then p8.skipOwnershipCheck else false
	
	if var7 and var8 then
		return true
	end
	local t = {}
	local var9, var10 = parseContentIdsModule.parseWithErrorCheck({}, t, p6, nil, constantsModule.CONTENT_ID_REQUIRED_FIELDS, p7)
	
	if not var9 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_ParseFailure, nil, p7)
		
		return false, var10
	elseif var4 and not allowEditableInstances and not var7 then
		validateExistance(t, p7)
	end
	local var11 = failureReasonsAccumulatorModule.new()
	
	if not var8 and (not noStudioOwnershipCheck or noStudioOwnershipCheck and not runService:IsStudio()) and var4 then
		if var6 then
			var11:updateReasons(validateAssetCreatorsRCC(t, p7))
		else
			var11:updateReasons(validateModerationRCC(var5, t, p7))
		end
	end
	if p7 then
		analyticsModule.recordScriptTime(script.Name, currentTime, p7)
	end
	return var11:getFinalResults()
end