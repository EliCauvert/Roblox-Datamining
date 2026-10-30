local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
local ShowFeatureRestrictionModule = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)
local GetTimeoutStatusStoreModule = require(AvatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local FFlagAXTimeoutAcknowledgementGating = require(Parent.AvatarExperienceFlags).FFlagAXTimeoutAcknowledgementGating

return function()
	-- upvalues: FFlagAXTimeoutAcknowledgementGating (copy), ShowFeatureRestrictionModule (copy), AbuseVectorModule (copy), GetTimeoutStatusStoreModule (copy)
	if FFlagAXTimeoutAcknowledgementGating then
		task.spawn(function()
			-- upvalues: ShowFeatureRestrictionModule (upval), AbuseVectorModule (upval), GetTimeoutStatusStoreModule (upval)
			ShowFeatureRestrictionModule(AbuseVectorModule.AvatarChange, {
				onAcknowledgementSuccess = function()
					-- upvalues: GetTimeoutStatusStoreModule (upval)
					local TimeoutStatusStoreModule = GetTimeoutStatusStoreModule(false)
					
					if not TimeoutStatusStoreModule.clearStatusIfServed() then
						TimeoutStatusStoreModule.refreshStatus()
					end
				end
			})
		end)
		
		return
	else
		ShowFeatureRestrictionModule(AbuseVectorModule.AvatarChange)
	end
end