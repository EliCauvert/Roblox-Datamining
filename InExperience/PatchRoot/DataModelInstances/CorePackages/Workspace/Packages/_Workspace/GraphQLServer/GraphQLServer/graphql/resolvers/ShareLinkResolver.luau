local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local generatedTypesModule = require(script.Parent.Parent.generatedTypes)
local shareLinkConnectorModule = require(script.Parent.Parent.connectors.ShareLinkConnector)
local cryoModule = require(parent.Cryo)

return {
	ExperienceDetailsLink = {
		linkType = function()
			-- upvalues: generatedTypesModule (ref)
			return generatedTypesModule.ShareLinkType.ExperienceDetails
		end,
		linkId = function(p1)
			return p1.linkId
		end,
		shortUrl = function(p1)
			return p1.shortUrl
		end,
		universeId = function(_, _, _, p1)
			return p1.variableValues.universeId
		end
	},
	Query = {
		experienceDetailsLinkByUniverseId = function(_, p1, p2, _)
			-- upvalues: shareLinkConnectorModule (ref), cryoModule (ref), generatedTypesModule (ref)
			return shareLinkConnectorModule.fetchShareLink(cryoModule.Dictionary.join({
				linkType = generatedTypesModule.ShareLinkType.ExperienceDetails,
				data = p1
			}), p2.fetchImpl)
		end
	}
}