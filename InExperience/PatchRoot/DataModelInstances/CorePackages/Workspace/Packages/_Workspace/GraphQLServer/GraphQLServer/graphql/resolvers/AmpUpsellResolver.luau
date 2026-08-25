local ampUpsellConnectorModule = require(script:FindFirstAncestor("GraphQLServer").graphql.connectors.AmpUpsellConnector)

return {
	default = {
		UpsellFeatureAccessResponse = {
			featureAccess = function(p0)
				return {
					featureName = p0.featureName,
					access = p0.access,
					recourse = p0.recourse,
					recourses = p0.recourses
				}
			end
		},
		Query = {
			getFeatureAccess = function(_, p1, p2)
				-- upvalues: ampUpsellConnectorModule (ref)
				return ampUpsellConnectorModule.getFeatureAccessFromFeatureNamesList(p1.featureNames, p2.fetchImpl)
			end,
			getUpsellFeatureAccess = function(_, p3, p4)
				-- upvalues: ampUpsellConnectorModule (ref)
				return ampUpsellConnectorModule.getUpsellFeatureAccessFromFeatureName(p3.featureName, p3.successfulActions, p4.fetchImpl, p3.nameSpace, p3.extraParameters)
			end
		}
	}
}