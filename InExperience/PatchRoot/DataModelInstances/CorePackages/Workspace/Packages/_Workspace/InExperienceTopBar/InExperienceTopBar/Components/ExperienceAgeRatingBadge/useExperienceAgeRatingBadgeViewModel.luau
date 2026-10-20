local Parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.ExperienceAgeRatingBadgeView)
local DataStatus = DataHydrationModule.DataStatus

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), DataHydrationModule (copy), DataStatus (copy), SignalsReactModule (copy)
	local UniverseId = p1.universeId
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), DataHydrationModule (upval), UniverseId (copy), DataStatus (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: DataHydrationModule (upval), UniverseId (upval), DataStatus (upval)
			local AndFetchAgeRecommendation = DataHydrationModule.Game.getAgeRecommendationStore(p2).getAndFetchAgeRecommendation(UniverseId)
			local StatusResult = AndFetchAgeRecommendation.status(p2)
			
			if StatusResult == DataStatus.Failed then
				return "12+"
			elseif StatusResult == DataStatus.NotReady then
				return nil
			else
				local DataResult = AndFetchAgeRecommendation.data(p2)
				
				return DataResult and DataResult.minimumAgeDisplay or "12+"
			end
		end)
	end, { UniverseId })))
	
	return if UseSignalStateResult == nil then nil else {
		text = UseSignalStateResult,
		layoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged
	}
end