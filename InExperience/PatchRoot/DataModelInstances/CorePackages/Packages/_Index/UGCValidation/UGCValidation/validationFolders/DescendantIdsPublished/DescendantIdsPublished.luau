local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)
local unpublishedDependenciesModule = require(parent.util.UnpublishedDependencies)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagUGCValidateDescendantIdsPublishedModule = require(parent.flags.getFFlagUGCValidateDescendantIdsPublished)
local getFFlagUGCValidateDescendantIdsPublishedShadowModule = require(parent.flags.getFFlagUGCValidateDescendantIdsPublishedShadow)
local t = {
	AnimationId = true,
	TexturePack = true,
	HSRAssetId = true
}
local t_1 = { MODERATION_STATE_REJECTED = true, Rejected = true }

return {
	categories = constantsModule.AllUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.contentIds
	},
	fflag = getFFlagUGCValidateDescendantIdsPublishedModule,
	shadowFlag = getFFlagUGCValidateDescendantIdsPublishedShadowModule,
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), parseContentIdsModule (ref), t (ref), unpublishedDependenciesModule (ref), t_1 (ref), errorSourceStringsModule (ref)
		if p2.consumerConfig.validationEnv ~= validationEnumsModule.ValidationEnv.Backend then return end
		for i, v in parseContentIdsModule.getDistinctReferences(p2.contentIds) do
			local entry = v.entry
			
			if not t[entry.fieldName] then
				local ok, status = pcall(unpublishedDependenciesModule.getVersion, v.assetId, entry.version)
				
				if not ok then
					p1:fetchError(`Failed to read asset {v.key}: {status}`)
				end
				if not status.published then
					local fullName = entry.instance:GetFullName()
					local var1 = if status.moderationResult then status.moderationResult.moderationState else nil
					
					if var1 == nil or not t_1[var1] then
						p1:fail(errorSourceStringsModule.Keys.DescendantIdNotPublished, {
							AssetId = v.key,
							InstanceFullName = fullName,
							FieldName = entry.fieldName
						}, entry.instance)
					else
						p1:fail(errorSourceStringsModule.Keys.DescendantIdNotApproved, {
							ModerationMessages = `{fullName}.{entry.fieldName} ( {v.key} )`
						}, entry.instance)
					end
				end
			end
		end
	end
}