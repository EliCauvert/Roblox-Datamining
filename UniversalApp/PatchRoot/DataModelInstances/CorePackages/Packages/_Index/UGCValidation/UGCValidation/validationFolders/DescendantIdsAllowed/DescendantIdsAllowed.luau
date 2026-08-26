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
local getFFlagUGCValidateMakeupCategoryParityModule = require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)
local t = { MODERATION_STATE_REVIEWING = true, Reviewing = true }
local t_1 = { MODERATION_STATE_APPROVED = true, Approved = true }

local function _(p1)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, i)
	end
	return t
end

local function runStudio(p2, p3, p4)
	-- upvalues: getAssetCreationDetailsModule (ref), errorSourceStringsModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in p4 do
		table.insert(t, i)
	end
	if #t == 0 then return end
	t, var18 = getAssetCreationDetailsModule(t)
	
	if not t or #var18 ~= #t then
		p2:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p3:GetFullName() })
		
		return
	end
	for v, v_1 in var18 do
		if if v_1.status ~= constantsModule.ASSET_STATUS.UNKNOWN then if v_1.status ~= constantsModule.ASSET_STATUS.REVIEW_PENDING then v_1.status == constantsModule.ASSET_STATUS.MODERATED else true else true then
			local var1 = tostring(v_1.assetId)
			local var2 = p4[var1]
			p2:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = if var2 then string.format("%s.%s ( %s )", var2[1].instance:GetFullName(), var2[1].fieldName, var1) else var1
			})
		end
	end
end

local _ = function(p5)
	local t = {}
	
	for i, v in p5 do
		t[tonumber(v.id)] = true
	end
	return t
end

local function runBackend(p6, p7, p8)
	-- upvalues: getAssetCreationDetailsRCCModule (ref), errorSourceStringsModule (ref), t (ref), t_1 (ref)
	local restrictedUserIds = p8.restrictedUserIds
	
	if not restrictedUserIds or #restrictedUserIds == 0 then return end
	local t_2 = {}
	
	for i, v in restrictedUserIds do
		t_2[tonumber(v.id)] = true
	end
	for i_1, v_1 in p7 do
		local var3 = v_1[1]
		local var4, var5 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var4 then
			p6:forceError("Failed to load asset")
		end
		local creator = var5.creationContext.creator
		
		if not t_2[tonumber(if creator.userId then creator.userId else creator.groupId)] then
			p6:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = i_1,
				InstanceFullName = var3.instance:GetFullName(),
				FieldName = var3.fieldName
			})
		end
		local moderationState = var5.moderationResult.moderationState
		
		if t[moderationState] then
			p6:forceError("Failed to load asset " .. var23.instance:GetFullName() .. "." .. var23.fieldName .. " ( " .. i_1 .. " ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
		end
		if not t_1[moderationState] then
			p6:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = string.format("%s.%s ( %s )", var3.instance:GetFullName(), var3.fieldName, i_1)
			})
		end
	end
end

local function runCanPublishOwnershipCheck(p9, p10, p11, p12)
	-- upvalues: getFFlagUGCValidateBackendInExperienceViaCanPublishModule (ref), getFFlagUGCValidateForwardIECRestrictedUserIdsModule (ref), runService (ref), canPublishAssetsModule (ref), errorSourceStringsModule (ref)
	local var6 = getFFlagUGCValidateBackendInExperienceViaCanPublishModule() and (p12.token == nil and p12.universeId ~= nil)
	
	if not p12.token and not var6 or getFFlagUGCValidateForwardIECRestrictedUserIdsModule() and runService:IsStudio() then return end
	local var7 = canPublishAssetsModule(p11, if getFFlagUGCValidateForwardIECRestrictedUserIdsModule() or var6 then p12.restrictedUserIds or {} else {}, p12.token, p12.universeId, true)
	
	if var7.status == "tooManyAssets" then
		p9:fail(errorSourceStringsModule.Keys.DescendantIdsTooMany, { InstanceFullName = p10:GetFullName() })
		
		return
	elseif var7.status == "loadFailed" then
		p9:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p10:GetFullName() })
		
		return
	end
	local verdicts = var7.verdicts
	
	if not verdicts then return end
	for i, v in verdicts do
		if not v.allowed then
			p9:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = v.assetId,
				InstanceFullName = v.entry.instance:GetFullName(),
				FieldName = v.entry.fieldName
			})
		end
	end
end

return {
	categories = if getFFlagUGCValidateMakeupCategoryParityModule() then constantsModule.AllAssetUploadCategories else constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.contentIds
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {},
	run = function(p13, p14)
		-- upvalues: validationEnumsModule (ref), runStudio (ref), getFFlagUGCValidateBackendInExperienceViaCanPublishModule (ref), runCanPublishOwnershipCheck (ref), runBackend (ref)
		local consumerConfig = p14.consumerConfig
		
		if consumerConfig.source == "AutoSetup" then return end
		local rootInstance = p14.rootInstance
		local contentIds = p14.contentIds
		
		if consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Studio then
			runStudio(p13, rootInstance, contentIds)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
			local backendConfigs = consumerConfig.backendConfigs
			
			if getFFlagUGCValidateBackendInExperienceViaCanPublishModule() and backendConfigs.universeId then
				runCanPublishOwnershipCheck(p13, rootInstance, contentIds, {
					universeId = backendConfigs.universeId,
					restrictedUserIds = backendConfigs.restrictedUserIds
				})
				
				return
			end
			runBackend(p13, contentIds, backendConfigs)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			runCanPublishOwnershipCheck(p13, rootInstance, contentIds, consumerConfig.iecConfigs)
		end
	end
}