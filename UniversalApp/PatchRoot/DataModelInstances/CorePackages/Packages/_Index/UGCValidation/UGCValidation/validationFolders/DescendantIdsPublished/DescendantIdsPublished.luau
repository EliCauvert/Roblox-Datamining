local Parent = script.Parent.Parent.Parent
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)
local UnpublishedDependenciesModule = require(Parent.util.UnpublishedDependencies)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local config = {
	AnimationId = true,
	TexturePack = true,
	HSRAssetId = true
}
local config1 = { MODERATION_STATE_REJECTED = true, Rejected = true }

return {
	categories = require(Parent.Constants).AllUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.contentIds
	},
	fflag = require(Parent.flags.getFFlagUGCValidateDescendantIdsPublished),
	shadowFlag = require(Parent.flags.getFFlagUGCValidateDescendantIdsPublishedShadow),
	run = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: ValidationEnumsModule (copy), ParseContentIdsModule (copy), config (copy), UnpublishedDependenciesModule (copy), config1 (copy), ErrorSourceStringsModule (copy)
		if p2.consumerConfig.validationEnv ~= ValidationEnumsModule.ValidationEnv.Backend then return end
		for _, value in ParseContentIdsModule.getDistinctReferences(p2.contentIds) do
			local Entry = value.entry
			
			if not config[Entry.fieldName] then
				local Success, Result = pcall(UnpublishedDependenciesModule.getVersion, value.assetId, Entry.version)
				
				if not Success then
					p1:fetchError(`Failed to read asset {value.key}: {Result}`)
				end
				if not Result.published then
					local FullName = Entry.instance:GetFullName()
					local ModerationState = if Result.moderationResult then Result.moderationResult.moderationState else nil
					
					if ModerationState == nil or not config1[ModerationState] then
						p1:fail(ErrorSourceStringsModule.Keys.DescendantIdNotPublished, {
							AssetId = value.key,
							InstanceFullName = FullName,
							FieldName = Entry.fieldName
						}, Entry.instance)
					else
						p1:fail(ErrorSourceStringsModule.Keys.DescendantIdNotApproved, {
							ModerationMessages = `{FullName}.{Entry.fieldName} ( {value.key} )`
						}, Entry.instance)
					end
				end
			end
		end
	end
}