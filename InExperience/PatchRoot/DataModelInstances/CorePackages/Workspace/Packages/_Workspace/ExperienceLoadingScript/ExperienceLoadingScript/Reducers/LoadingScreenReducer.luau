local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local roduxModule = require(experienceLoadingScript.Parent.Rodux)

return roduxModule.combineReducers({
	isSubjectToChinaPolicies = roduxModule.createReducer(nil, {
		[require(experienceLoadingScript.Actions.SetIsSubjectToChinaPolicies).name] = function(_, p1)
			return p1.isSubjectToChinaPolicies
		end
	}),
	productInfo = roduxModule.createReducer(nil, {
		[require(experienceLoadingScript.Actions.SetGameProductInfo).name] = function(_, p1)
			return p1.productInfo
		end
	}),
	gameIds = roduxModule.createReducer(nil, {
		[require(experienceLoadingScript.Actions.SetUniverseId).name] = function(_, p1)
			return { universeId = p1.universeId, placeId = p1.placeId }
		end
	})
})