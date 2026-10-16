local appChat = script:FindFirstAncestor("AppChat")
local regex = require(appChat.Parent.UrlMatching).Regex
local fFlagAppChatResolveShareLinkV2Module = require(appChat.Flags.FFlagAppChatResolveShareLinkV2)
local list = { "ExperienceDetails" }

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
		paramCallback = function(p1)
			return { placeId = p1.id }
		end
	},
	["/share"] = {
		queryParams = if fFlagAppChatResolveShareLinkV2Module then {
			{ name = "code", pattern = "[a-fA-F0-9-]+" },
			{
				name = "type",
				optional = true,
				pattern = regex.oneOf(list)
			},
			{
				name = "v",
				optional = true,
				pattern = regex.oneOf({ "v2" })
			}
		} else {
			{ name = "code", pattern = "[a-fA-F0-9]+" },
			{ name = "type", pattern = regex.oneOf(list) }
		},
		paramCallback = function(p1)
			-- upvalues: fFlagAppChatResolveShareLinkV2Module (ref)
			return if fFlagAppChatResolveShareLinkV2Module then if p1.v == "v2" then { shareLink = { version = 2, linkId = p1.code } } elseif p1.type then {
				shareLink = { version = 1, linkId = p1.code, linkType = p1.type }
			} else nil else { shareLink = { linkId = p1.code, linkType = p1.type } }
		end
	}
}