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
local t = { MODERATION_STATE_REVIEWING = true, Reviewing = true }
local t_1 = { MODERATION_STATE_APPROVED = true, Approved = true }

local function _(p0) --[[ line: 20 | named "collectContentIdsArray" ]]
	local t = {}
	
	for i, v in p0 do
		table.insert(t, i)
	end
	return t
end

local function runStudio(p1, p2, p3) --[[ line: 28 ]]
	-- upvalues: getAssetCreationDetailsModule (ref), errorSourceStringsModule (ref), constantsModule (ref)
	local t = {}
	
	for i, v in p3 do
		table.insert(t, i)
	end
	if #t == 0 then return end
	t, var16 = getAssetCreationDetailsModule(t)
	
	if not t or #var16 ~= #t then
		p1:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p2:GetFullName() })
		
		return
	end
	for v, v_1 in var16 do
		if if v_1.status ~= constantsModule.ASSET_STATUS.UNKNOWN then if v_1.status ~= constantsModule.ASSET_STATUS.REVIEW_PENDING then v_1.status == constantsModule.ASSET_STATUS.MODERATED else true else true then
			local var17 = tostring(v_1.assetId)
			local var18 = p3[var17]
			p1:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = if var18 then string.format("%s.%s ( %s )", var18[1].instance:GetFullName(), var18[1].fieldName, var17) else var17
			})
		end
	end
end

local _ = function(p4) --[[ line: 66 | named "buildOwnerLookup" ]]
	local t = {}
	
	for i, v in p4 do
		t[tonumber(v.id)] = true
	end
	return t
end

local function runBackend(p5, p6, p7) --[[ line: 74 ]]
	-- upvalues: getAssetCreationDetailsRCCModule (ref), errorSourceStringsModule (ref), t (ref), t_1 (ref)
	local restrictedUserIds = p7.restrictedUserIds
	
	if not restrictedUserIds or #restrictedUserIds == 0 then return end
	local t_2 = {}
	
	for i, v in restrictedUserIds do
		t_2[tonumber(v.id)] = true
	end
	for i_1, v_1 in p6 do
		local var21 = v_1[1]
		local var22, var23 = getAssetCreationDetailsRCCModule(i_1)
		
		if not var22 then
			p5:forceError("Failed to load asset")
		end
		local creator = var23.creationContext.creator
		
		if not t_2[tonumber(if creator.userId then creator.userId else creator.groupId)] then
			p5:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = i_1,
				InstanceFullName = var21.instance:GetFullName(),
				FieldName = var21.fieldName
			})
		end
		local moderationState = var23.moderationResult.moderationState
		
		if t[moderationState] then
			p5:forceError("Failed to load asset " .. var21.instance:GetFullName() .. "." .. var21.fieldName .. " ( " .. i_1 .. " ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
		end
		if not t_1[moderationState] then
			p5:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = string.format("%s.%s ( %s )", var21.instance:GetFullName(), var21.fieldName, i_1)
			})
		end
	end
end

local function runIEC(p8, p9, p10, p11) --[[ line: 132 ]]
	-- upvalues: getFFlagUGCValidateForwardIECRestrictedUserIdsModule (ref), runService (ref), canPublishAssetsModule (ref), errorSourceStringsModule (ref)
	if not p11.token or getFFlagUGCValidateForwardIECRestrictedUserIdsModule() and runService:IsStudio() then return end
	local var24 = canPublishAssetsModule(p10, if getFFlagUGCValidateForwardIECRestrictedUserIdsModule() then p11.restrictedUserIds or {} else {}, p11.token, p11.universeId, true)
	
	if var24.status == "tooManyAssets" then
		p8:fail(errorSourceStringsModule.Keys.DescendantIdsTooMany, { InstanceFullName = p9:GetFullName() })
		
		return
	elseif var24.status == "loadFailed" then
		p8:fail(errorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = p9:GetFullName() })
		
		return
	end
	local verdicts = var24.verdicts
	
	if not verdicts then return end
	for i, v in verdicts do
		if not v.allowed then
			p8:fail(errorSourceStringsModule.Keys.DescendantIdNotOwned, {
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
	run = function(p12, p13) --[[ line: 192 ]]
		-- upvalues: validationEnumsModule (ref), runStudio (ref), runBackend (ref), runIEC (ref)
		local consumerConfig = p13.consumerConfig
		
		if consumerConfig.source == "AutoSetup" then return end
		local rootInstance = p13.rootInstance
		local contentIds = p13.contentIds
		
		if consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Studio then
			runStudio(p12, rootInstance, contentIds)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
			runBackend(p12, contentIds, consumerConfig.backendConfigs)
			
			return
		elseif consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
			runIEC(p12, rootInstance, contentIds, consumerConfig.iecConfigs)
		end
	end
}