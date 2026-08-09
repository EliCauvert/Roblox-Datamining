return {
	["/games"] = {
		pathParams = {
			{ name = "path", pattern = "games" },
			{ name = "id", pattern = "[0-9]+" },
			{
				name = "name",
				pattern = "[a-zA-Z0-9_-]+",
				optional = true
			}
		},
		paramCallback = function(p0) --[[ line: 10 ]]
			return { placeId = p0.id }
		end
	},
	["/share"] = {
		queryParams = {
			{ name = "code", pattern = "[a-fA-F0-9]+" },
			{
				name = "type",
				pattern = require(script:FindFirstAncestor("AppChat").Parent.UrlMatching).Regex.oneOf({ "ExperienceDetails" })
			}
		},
		paramCallback = function(p1) --[[ line: 16 ]]
			return { shareLink = { linkId = p1.code, linkType = p1.type } }
		end
	}
}