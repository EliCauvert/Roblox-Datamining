local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ReactModule = require(AvatarExperienceCommon.Parent.React)
local GetTimeoutStatusStoreModule = require(AvatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local ShowAvatarChangeFeatureRestrictionModule = require(AvatarExperienceCommon.Utils.showAvatarChangeFeatureRestriction)

return function(p1)
	-- upvalues: GetTimeoutStatusStoreModule (copy), ReactModule (copy), ShowAvatarChangeFeatureRestrictionModule (copy)
	local TimeoutStatusStoreModule = GetTimeoutStatusStoreModule()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), TimeoutStatusStoreModule (copy), ShowAvatarChangeFeatureRestrictionModule (upval)
		if p1 then
			local Flag = false
			TimeoutStatusStoreModule.fetchStatusAsync():andThen(function(Result)
				-- upvalues: Flag (ref), ShowAvatarChangeFeatureRestrictionModule (upval)
				if not Flag and Result.requiresAcknowledgement then
					ShowAvatarChangeFeatureRestrictionModule()
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		else
			return nil
		end
	end, { p1, TimeoutStatusStoreModule })
end