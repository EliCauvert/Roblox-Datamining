local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(Parent.LuauPolyfill)
local GeneratedTypesModule = require(script.Parent.Parent.generatedTypes)
local ShareLinkConnectorModule = require(script.Parent.Parent.connectors.ShareLinkConnector)
local CryoModule = require(Parent.Cryo)

return {
	ExperienceDetailsLink = {
		linkType = function() --[[ Line: 14 ]]
			-- upvalues: GeneratedTypesModule (copy)
			return GeneratedTypesModule.ShareLinkType.ExperienceDetails
		end,
		linkId = function(p1) --[[ Line: 17 ]]
			return p1.linkId
		end,
		shortUrl = function(p1) --[[ Line: 20 ]]
			return p1.shortUrl
		end,
		universeId = function(_, _, _, p1) --[[ Line: 23 ]]
			return p1.variableValues.universeId
		end
	},
	Query = {
		experienceDetailsLinkByUniverseId = function(_, Data, p1, _) --[[ Line: 28 ]]
			-- upvalues: ShareLinkConnectorModule (copy), CryoModule (copy), GeneratedTypesModule (copy)
			return ShareLinkConnectorModule.fetchShareLink(CryoModule.Dictionary.join({
				linkType = GeneratedTypesModule.ShareLinkType.ExperienceDetails,
				data = Data
			}), p1.fetchImpl)
		end
	}
}