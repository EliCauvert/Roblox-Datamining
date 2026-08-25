local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local runService = game:GetService("RunService")
local canPublishAssetsModule = require(parent.util.canPublishAssets)
local getAssetCreationDetailsModule = require(parent.util.getAssetCreationDetails)
local getAssetCreationDetailsRCCModule = require(parent.util.getAssetCreationDetailsRCC)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateForwardIECRestrictedUserIdsModule = require(parent.flags.getFFlagUGCValidateForwardIECRestrictedUserIds)
local getFFlagUGCValidateBackendInExperienceViaCanPublishModule = require(parent.flags.getFFlagUGCValidateBackendInExperienceViaCanPublish)
local t = { MODERATION_STATE_REVIEWING = true, Reviewing = true }
local t_1 = { MODERATION_STATE_APPROVED = true, Approved = true }

local function _(p1)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, i)
	end
	return t
end

local function runStudio(p1, p2, p3)
	-- upvalues: getAssetCreationDetailsModule (ref), errorSourceStringsModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in p3 do
		table.insert(t, i)
	end
	if #t == 0 then return end
	t, var17 = getAssetCreationDetailsModule(t)
	
	if not t or #var17 ~= #t then
		p1:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p2:GetFullName() })
		
		return
	end
	for v, v_1 in var17 do
		if if v_1.status ~= constantsModule.ASSET_STATUS.UNKNOWN then if v_1.status ~= constantsModule.ASSET_STATUS.REVIEW_PENDING then v_1.status == constantsModule.ASSET_STATUS.MODERATED else true else true then
			local var1 = tostring(v_1.assetId)
			local var2 = p3[var1]
			p1:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = if var2 then string.format("%s.%s ( %s )", var2[1].instance:GetFullName(), var2[1].fieldName, var1) else var1
			})
		end
	end
end

local _ = function(p1)
	local t = {}
	
	for i, v in p1 do
		t[tonumber(v.id)] = true
	end
	return t
end

local function runBackend(p1, p2, p3)
	-- upvalues: getAssetCreationDetailsRCCModule (ref), errorSourceStringsModule (ref), t (ref), t_1 (ref)
	local restrictedUserIds = p3.restrictedUserIds
	
	if not restrictedUserIds or #restrictedUserIds == 0 then return end
	local t_2 = {}
	
	for i, v in restrictedUserIds do
		t_2[tonumber(v.id)] = true
	end
	for i_1, v_1 in p2 do
		local var1 = v_1[1]
		local var2, var3 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var2 then
			p1:forceError("Failed to load asset")
		end
		local creator = var3.creationContext.creator
		
		if not t_2[tonumber(if creator.userId then creator.userId else creator.groupId)] then
			p1:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = i_1,
				InstanceFullName = var1.instance:GetFullName(),
				FieldName = var1.fieldName
			})
		end
		local moderationState = var3.moderationResult.moderationState
		
		if t[moderationState] then
			p1:forceError("Failed to load asset " .. var22.instance:GetFullName() .. "." .. var22.fieldName .. " ( " .. i_1 .. " ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
		end
		if not t_1[moderationState] then
			p1:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = string.format("%s.%s ( %s )", var1.instance:GetFullName(), var1.fieldName, i_1)
			})
		end
	end
end

local function runCanPublishOwnershipCheck(p1, p2, p3, p4)
	-- upvalues: getFFlagUGCValidateBackendInExperienceViaCanPublishModule (ref), getFFlagUGCValidateForwardIECRestrictedUserIdsModule (ref), runService (ref), canPublishAssetsModule (ref), errorSourceStringsModule (ref)
	local var1 = getFFlagUGCValidateBackendInExperienceViaCanPublishModule() and (p4.token == nil and p4.universeId ~= nil)
	
	if not p4.token and not var1 or getFFlagUGCValidateForwardIECRestrictedUserIdsModule() and runService:IsStudio() then return end
	local var2 = canPublishAssetsModule(p3, if getFFlagUGCValidateForwardIECRestrictedUserIdsModule() or var1 then p4.restrictedUserIds or {} else {}, p4.token, p4.universeId, true)
	
	if var2.status == "tooManyAssets" then
		p1:fail(errorSourceStringsModule.Keys.DescendantIdsTooMany, { InstanceFullName = p2:GetFullName() })
		
		return
	elseif var2.status == "loadFailed" then
		p1:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p2:GetFullName() })
		
		return
	end
	local verdicts = var2.verdicts
	
	if not verdicts then return end
	for i, v in verdicts do
		if not v.allowed then
			p1:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = v.assetId,
				InstanceFullName = v.entry.instance:GetFullName(),
				FieldName = v.entry.fieldName
			})
		end
	end
end

return {
	categories = constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.contentIds
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), runStudio (ref), getFFlagUGCValidateBackendInExperienceViaCanPublishModule (ref), runCanPublishOwnershipCheck (ref), runBackend (ref)
		local consumerConfig = p2.consumerConfig
		
		if consumerConfig.source == "AutoSetup" then return end
		local rootInstance = p2.rootInstance
		local contentIds = p2.contentIds
		
		if consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Studio then
			runStudio(p1, rootInstance, contentIds)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
			local backendConfigs = consumerConfig.backendConfigs
			
			if getFFlagUGCValidateBackendInExperienceViaCanPublishModule() and backendConfigs.universeId then
				runCanPublishOwnershipCheck(p1, rootInstance, contentIds, {
					universeId = backendConfigs.universeId,
					restrictedUserIds = backendConfigs.restrictedUserIds
				})
				
				return
			end
			runBackend(p1, contentIds, backendConfigs)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			runCanPublishOwnershipCheck(p1, rootInstance, contentIds, consumerConfig.iecConfigs)
		end
	end
}