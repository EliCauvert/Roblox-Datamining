local parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.ExperienceAgeRatingBadgeView)
local dataStatus = dataHydrationModule.DataStatus

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), dataStatus (ref), signalsReactModule (ref)
	local universeId = p1.universeId
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), dataHydrationModule (copy), universeId (ref), dataStatus (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: dataHydrationModule (copy), universeId (copy), dataStatus (copy)
			local andFetchAgeRecommendation = dataHydrationModule.Game.getAgeRecommendationStore(p2).getAndFetchAgeRecommendation(universeId)
			local var2 = andFetchAgeRecommendation.status(p2)
			
			if var2 == dataStatus.Failed then
				return "12+"
			elseif var2 == dataStatus.NotReady then
				return nil
			end
			local var3 = andFetchAgeRecommendation.data(p2)
			
			return if var3 then var3.minimumAgeDisplay else "12+"
		end)
	end, { universeId }))
	
	return if var1 == nil then nil else {
		text = var1,
		layoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged
	}
end