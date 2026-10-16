local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local RoduxModule = require(ExperienceLoadingScript.Parent.Rodux)

return RoduxModule.combineReducers({
	isSubjectToChinaPolicies = RoduxModule.createReducer(nil, {
		[require(ExperienceLoadingScript.Actions.SetIsSubjectToChinaPolicies).name] = function(_, p1) --[[ Line: 25 ]]
			return p1.isSubjectToChinaPolicies
		end
	}),
	productInfo = RoduxModule.createReducer(nil, {
		[require(ExperienceLoadingScript.Actions.SetGameProductInfo).name] = function(_, p1) --[[ Line: 10 ]]
			return p1.productInfo
		end
	}),
	gameIds = RoduxModule.createReducer(nil, {
		[require(ExperienceLoadingScript.Actions.SetUniverseId).name] = function(_, p1) --[[ Line: 16 ]]
			return { universeId = p1.universeId, placeId = p1.placeId }
		end
	})
})