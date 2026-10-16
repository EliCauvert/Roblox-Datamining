local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseNetworkingFunction = require(Parent.AvatarExperienceCommon).Hooks.useNetworking
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local _ = require(script.Parent.createFaeFeatureAccessStore)

return function(p1) --[[ Line: 25 ]]
	-- upvalues: UseNetworkingFunction (copy), ReactModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), UseSignalStateFunction (copy)
	local UseNetworkingResult = UseNetworkingFunction()
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), UseNetworkingResult (copy), SendAXCounterV2Function (upval), ConstantsModule (upval)
		if p1.getFetchStatus(false) == "idle" then
			p1.fetch(UseNetworkingResult):catch(function(Err) --[[ Line: 32 ]]
				-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval)
				if Err then
					SendAXCounterV2Function(ConstantsModule.COUNTERS.FetchFaeFeatureAccessError)
				end
			end)
			
			return
		end
	end, { p1, UseNetworkingResult })
	
	return {
		canClaimFaeItem = UseSignalStateFunction(p1.getCanClaimFaeItem),
		showFaeUpsell = UseSignalStateFunction(p1.getShowFaeUpsell),
		fetchStatus = UseSignalStateFunction(p1.getFetchStatus)
	}
end