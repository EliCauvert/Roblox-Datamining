local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local constantsModule = require(avatarExperienceCatalog.Constants)
local _ = require(script.Parent.createFaeFeatureAccessStore)

return function(p0) --[[ line: 25 ]]
	-- upvalues: useNetworking (ref), reactModule (ref), sendAXCounterV2 (ref), constantsModule (ref), useSignalState (ref)
	local var3 = useNetworking()
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), var3 (ref), sendAXCounterV2 (copy), constantsModule (copy)
		if p0.getFetchStatus(false) == "idle" then
			p0.fetch(var3):catch(function(p1) --[[ line: 32 ]]
				-- upvalues: sendAXCounterV2 (copy), constantsModule (copy)
				if p1 then
					sendAXCounterV2(constantsModule.COUNTERS.FetchFaeFeatureAccessError)
				end
			end)
			
			return
		end
	end, { p0, var3 })
	
	return {
		canClaimFaeItem = useSignalState(p0.getCanClaimFaeItem),
		showFaeUpsell = useSignalState(p0.getShowFaeUpsell),
		fetchStatus = useSignalState(p0.getFetchStatus)
	}
end