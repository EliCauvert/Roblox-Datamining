local ampUpsellConnectorModule = require(script:FindFirstAncestor("GraphQLServer").graphql.connectors.AmpUpsellConnector)

return {
	default = {
		UpsellFeatureAccessResponse = {
			featureAccess = function(p1)
				return {
					featureName = p1.featureName,
					access = p1.access,
					recourse = p1.recourse,
					recourses = p1.recourses
				}
			end
		},
		Query = {
			getFeatureAccess = function(_, p1, p2)
				-- upvalues: ampUpsellConnectorModule (ref)
				return ampUpsellConnectorModule.getFeatureAccessFromFeatureNamesList(p1.featureNames, p2.fetchImpl)
			end,
			getUpsellFeatureAccess = function(_, p1, p2)
				-- upvalues: ampUpsellConnectorModule (ref)
				return ampUpsellConnectorModule.getUpsellFeatureAccessFromFeatureName(p1.featureName, p1.successfulActions, p2.fetchImpl, p1.nameSpace, p1.extraParameters)
			end
		}
	}
}