local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local generatedTypesModule = require(script.Parent.Parent.generatedTypes)
local shareLinkConnectorModule = require(script.Parent.Parent.connectors.ShareLinkConnector)
local cryoModule = require(parent.Cryo)

return {
	ExperienceDetailsLink = {
		linkType = function() --[[ line: 14 ]]
			-- upvalues: generatedTypesModule (ref)
			return generatedTypesModule.ShareLinkType.ExperienceDetails
		end,
		linkId = function(p0) --[[ line: 17 ]]
			return p0.linkId
		end,
		shortUrl = function(p1) --[[ line: 20 ]]
			return p1.shortUrl
		end,
		universeId = function(_, _, _, p2) --[[ line: 23 ]]
			return p2.variableValues.universeId
		end
	},
	Query = {
		experienceDetailsLinkByUniverseId = function(_, p3, p4, _) --[[ line: 28 ]]
			-- upvalues: shareLinkConnectorModule (ref), cryoModule (ref), generatedTypesModule (ref)
			return shareLinkConnectorModule.fetchShareLink(cryoModule.Dictionary.join({
				linkType = generatedTypesModule.ShareLinkType.ExperienceDetails,
				data = p3
			}), p4.fetchImpl)
		end
	}
}