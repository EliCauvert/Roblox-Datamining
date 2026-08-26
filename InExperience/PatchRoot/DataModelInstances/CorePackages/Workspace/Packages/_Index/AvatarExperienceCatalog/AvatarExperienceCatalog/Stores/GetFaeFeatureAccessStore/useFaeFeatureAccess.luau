local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local constantsModule = require(avatarExperienceCatalog.Constants)
local _ = require(script.Parent.createFaeFeatureAccessStore)

return function(p1)
	-- upvalues: useNetworking (ref), reactModule (ref), sendAXCounterV2 (ref), constantsModule (ref), useSignalState (ref)
	local var1 = useNetworking()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), sendAXCounterV2 (copy), constantsModule (copy)
		if p1.getFetchStatus(false) == "idle" then
			p1.fetch(var1):catch(function(p2)
				-- upvalues: sendAXCounterV2 (copy), constantsModule (copy)
				if p2 then
					sendAXCounterV2(constantsModule.COUNTERS.FetchFaeFeatureAccessError)
				end
			end)
			
			return
		end
	end, { p1, var1 })
	
	return {
		canClaimFaeItem = useSignalState(p1.getCanClaimFaeItem),
		showFaeUpsell = useSignalState(p1.getShowFaeUpsell),
		fetchStatus = useSignalState(p1.getFetchStatus)
	}
end