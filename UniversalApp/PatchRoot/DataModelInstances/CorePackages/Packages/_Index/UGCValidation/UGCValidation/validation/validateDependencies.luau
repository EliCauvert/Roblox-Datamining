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

local function validateExistance(p0, p1) --[[ line: 23 ]]
	-- upvalues: validateCanLoadModule (ref)
	for i, v in pairs(p0) do
		if not validateCanLoadModule(v.instance[v.fieldName], p1) then
			error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v.instance.Name))
		end
	end
end

local t = {
	MODERATION_STATE_REVIEWING = { MODERATION_STATE_REVIEWING = true, Reviewing = true },
	MODERATION_STATE_APPROVED = { MODERATION_STATE_APPROVED = true, Approved = true }
}

local function validateCreatorId(p2, p3, p4, p5, p6, p7) --[[ line: 44 ]]
	-- upvalues: analyticsModule (ref)
	if p2[tonumber(p3)] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsRestrictedUserId, nil, p7)
	
	return false, {
		`{p4:GetFullName()}.{p5} ( {p6} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationState(p8, p9, p10, p11, p12) --[[ line: 62 ]]
	-- upvalues: t (ref), analyticsModule (ref)
	if t.MODERATION_STATE_REVIEWING[p8] then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsReviewing, nil, p12)
		error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
	end
	if t.MODERATION_STATE_APPROVED[p8] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_IsNotApproved, nil, p12)
	
	return false, {
		`{p9:GetFullName()}.{p10} ( {p11} ) is not owned by the current user. You can only validate assets that you or a group you belong to owns.`
	}
end

local function validateModerationRCC(p13, p14, p15) --[[ line: 91 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), getAssetCreationDetailsRCCModule (ref), validateCreatorId (ref), validateModerationState (ref)
	if not p13 or #p13 == 0 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(p13) do
		t[tonumber(v.id)] = true
	end
	local var16 = failureReasonsAccumulatorModule.new()
	
	for i_1, v_1 in pairs(p14) do
		local var17, var18 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var17 then
			error("Failed to load asset")
		end
		local creator = var18.creationContext.creator
		var16:updateReasons(validateCreatorId(t, if creator.userId then creator.userId else creator.groupId, v_1.instance, v_1.fieldName, i_1, p15))
		var16:updateReasons(validateModerationState(var18.moderationResult.moderationState, v_1.instance, v_1.fieldName, i_1, p15))
	end
	return var16:getFinalResults()
end

local function validateAssetCreatorsRCC(value, p16) --[[ line: 136 ]]
	-- upvalues: validateAssetCreatorModule (ref)
	assert(p16.isServer, "isServer must be true for validateAssetCreatorsRCC")
	
	return validateAssetCreatorModule(value, p16)
end

return function(p17, p18, p19) --[[ line: 149 | named "validateDependencies" ]]
	-- upvalues: parseContentIdsModule (ref), constantsModule (ref), analyticsModule (ref), validateExistance (ref), failureReasonsAccumulatorModule (ref), noStudioOwnershipCheck (ref), runService (ref), validateAssetCreatorsRCC (ref), validateModerationRCC (ref)
	local currentTime = tick()
	local var20 = if p18 then p18.isServer else nil
	local allowEditableInstances = p18.allowEditableInstances
	local var21 = if p18 then p18.restrictedUserIds else nil
	local var22 = if p18 then p18.universeId else nil
	local var23 = if p19 then p19.skipExistenceCheck else false
	local var24 = if p19 then p19.skipOwnershipCheck else false
	
	if var23 and var24 then
		return true
	end
	local t = {}
	local var26, var27 = parseContentIdsModule.parseWithErrorCheck({}, t, p17, nil, constantsModule.CONTENT_ID_REQUIRED_FIELDS, p18)
	
	if not var26 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDependencies_ParseFailure, nil, p18)
		
		return false, var27
	elseif var20 and not allowEditableInstances and not var23 then
		validateExistance(t, p18)
	end
	local var28 = failureReasonsAccumulatorModule.new()
	
	if not var24 and (not noStudioOwnershipCheck or noStudioOwnershipCheck and not runService:IsStudio()) and var20 then
		if var22 then
			var28:updateReasons(validateAssetCreatorsRCC(t, p18))
		else
			var28:updateReasons(validateModerationRCC(var21, t, p18))
		end
	end
	if p18 then
		analyticsModule.recordScriptTime(script.Name, currentTime, p18)
	end
	return var28:getFinalResults()
end