local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local RunService = game:GetService("RunService")
local CanPublishAssetsModule = require(Parent.util.canPublishAssets)
local GetAssetCreationDetailsModule = require(Parent.util.getAssetCreationDetails)
local GetAssetCreationDetailsRCCModule = require(Parent.util.getAssetCreationDetailsRCC)
local GetFFlagUGCValidateForwardIECRestrictedUserIdsModule = require(Parent.flags.getFFlagUGCValidateForwardIECRestrictedUserIds)
local config = { MODERATION_STATE_REVIEWING = true, Reviewing = true }
local config1 = { MODERATION_STATE_APPROVED = true, Approved = true }

local function _(List)
	local List1 = {}
	
	for i, _ in List do
		table.insert(List1, i)
	end
	return List1
end

local function runStudio(p1, RootInstance, ContentIds)
	-- upvalues: GetAssetCreationDetailsModule (copy), ErrorSourceStringsModule (copy), ConstantsModule (copy)
	local List = {}
	
	for i, _ in ContentIds do
		table.insert(List, i)
	end
	if #List == 0 then return end
	local AssetCreationDetailsModule, AssetCreationDetailsModule2 = GetAssetCreationDetailsModule(List)
	
	if not AssetCreationDetailsModule or #AssetCreationDetailsModule2 ~= #List then
		p1:fail(ErrorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = RootInstance:GetFullName() })
		
		return
	end
	for _, value in AssetCreationDetailsModule2 do
		if value.status == ConstantsModule.ASSET_STATUS.UNKNOWN or (value.status == ConstantsModule.ASSET_STATUS.REVIEW_PENDING or value.status == ConstantsModule.ASSET_STATUS.MODERATED) then
			local Text = tostring(value.assetId)
			local ContentId = ContentIds[Text]
			p1:fail(ErrorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = if ContentId then string.format("%s.%s ( %s )", ContentId[1].instance:GetFullName(), ContentId[1].fieldName, Text) else Text
			})
		end
	end
end

local _ = function(List)
	local t = {}
	
	for _, value in List do
		t[tonumber(value.id)] = true
	end
	return t
end

local function runBackend(p2, ContentIds, BackendConfigs)
	-- upvalues: GetAssetCreationDetailsRCCModule (copy), ErrorSourceStringsModule (copy), config (copy), config1 (copy)
	local RestrictedUserIds = BackendConfigs.restrictedUserIds
	
	if not RestrictedUserIds or #RestrictedUserIds == 0 then return end
	local t = {}
	
	for _, restrictedUserId in RestrictedUserIds do
		t[tonumber(restrictedUserId.id)] = true
	end
	for AssetId, contentId in ContentIds do
		local v1 = contentId[1]
		local AssetCreationDetailsRCCModule, AssetCreationDetailsRCCModule2 = GetAssetCreationDetailsRCCModule(AssetId)
		
		if not AssetCreationDetailsRCCModule then
			p2:forceError("Failed to load asset")
		end
		local Creator = AssetCreationDetailsRCCModule2.creationContext.creator
		
		if not t[tonumber(if Creator.userId then Creator.userId else Creator.groupId)] then
			p2:fail(ErrorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = AssetId,
				InstanceFullName = v1.instance:GetFullName(),
				FieldName = v1.fieldName
			})
		end
		local ModerationState = AssetCreationDetailsRCCModule2.moderationResult.moderationState
		
		if config[ModerationState] then
			p2:forceError("Failed to load asset " .. v1.instance:GetFullName() .. "." .. v1.fieldName .. " ( " .. AssetId .. " ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.")
		end
		if not config1[ModerationState] then
			p2:fail(ErrorSourceStringsModule.Keys.DescendantIdNotApproved, {
				ModerationMessages = string.format("%s.%s ( %s )", v1.instance:GetFullName(), v1.fieldName, AssetId)
			})
		end
	end
end

local function runIEC(p3, Object, ContentIds, IecConfigs)
	-- upvalues: GetFFlagUGCValidateForwardIECRestrictedUserIdsModule (copy), RunService (copy), CanPublishAssetsModule (copy), ErrorSourceStringsModule (copy)
	if not IecConfigs.token or GetFFlagUGCValidateForwardIECRestrictedUserIdsModule() and RunService:IsStudio() then return end
	local CanPublishAssetsModule1 = CanPublishAssetsModule(ContentIds, if GetFFlagUGCValidateForwardIECRestrictedUserIdsModule() then IecConfigs.restrictedUserIds or {} else {}, IecConfigs.token, IecConfigs.universeId, true)
	
	if CanPublishAssetsModule1.status == "tooManyAssets" then
		p3:fail(ErrorSourceStringsModule.Keys.DescendantIdsTooMany, { InstanceFullName = Object:GetFullName() })
		
		return
	end
	if CanPublishAssetsModule1.status == "loadFailed" then
		p3:fail(ErrorSourceStringsModule.Keys.DescendantIdFetchFailed, { InstanceFullName = Object:GetFullName() })
		
		return
	end
	local Verdicts = CanPublishAssetsModule1.verdicts
	
	if not Verdicts then return end
	for _, verdict in Verdicts do
		if not verdict.allowed then
			p3:fail(ErrorSourceStringsModule.Keys.DescendantIdNotOwned, {
				AssetId = verdict.assetId,
				InstanceFullName = verdict.entry.instance:GetFullName(),
				FieldName = verdict.entry.fieldName
			})
		end
	end
end

return {
	categories = ConstantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.contentIds
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p4, p5)
		-- upvalues: ValidationEnumsModule (copy), runStudio (copy), runBackend (copy), runIEC (copy)
		local ConsumerConfig = p5.consumerConfig
		
		if ConsumerConfig.source == "AutoSetup" then return end
		local RootInstance = p5.rootInstance
		local ContentIds = p5.contentIds
		
		if ConsumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Studio then
			runStudio(p4, RootInstance, ContentIds)
			
			return
		end
		if ConsumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend then
			runBackend(p4, ContentIds, ConsumerConfig.backendConfigs)
			
			return
		end
		if ConsumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then
			runIEC(p4, RootInstance, ContentIds, ConsumerConfig.iecConfigs)
		end
	end
}