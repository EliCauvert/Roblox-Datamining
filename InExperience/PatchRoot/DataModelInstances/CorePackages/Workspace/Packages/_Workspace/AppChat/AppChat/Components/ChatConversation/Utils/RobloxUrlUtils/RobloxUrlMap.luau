local AppChat = script:FindFirstAncestor("AppChat")
local Regex = require(AppChat.Parent.UrlMatching).Regex
local FFlagAppChatResolveShareLinkV2Module = require(AppChat.Flags.FFlagAppChatResolveShareLinkV2)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatEarlyTestingLinksModule = require(AppChat.Flags.FFlagAppChatEarlyTestingLinks)
local list = { "ExperienceDetails" }
local List = if FFlagAppChatResolveShareLinkV2Module then {
	{ name = "code", pattern = "[a-fA-F0-9-]+" },
	{
		name = "type",
		optional = true,
		pattern = Regex.oneOf(list)
	},
	{
		name = "v",
		optional = true,
		pattern = Regex.oneOf({ "v2" })
	}
} else {
	{ name = "code", pattern = "[a-fA-F0-9]+" },
	{ name = "type", pattern = Regex.oneOf(list) }
}

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
		queryParams = if FFlagAppChatEarlyTestingLinksModule then {
			{
				name = "isEarlyTesting",
				pattern = "true",
				optional = true
			}
		} else nil,
		paramCallback = function(p1)
			-- upvalues: FFlagAppChatEarlyTestingLinksModule (copy)
			return {
				placeId = p1.id,
				isEarlyTesting = FFlagAppChatEarlyTestingLinksModule and p1.isEarlyTesting == "true" or nil
			}
		end
	},
	["/share"] = {
		queryParams = List,
		paramCallback = function(p1)
			-- upvalues: FFlagAppChatResolveShareLinkV2Module (copy)
			return if FFlagAppChatResolveShareLinkV2Module then if p1.v == "v2" then { shareLink = { version = 2, linkId = p1.code } } elseif p1.type then {
				shareLink = { version = 1, linkId = p1.code, linkType = p1.type }
			} else nil else { shareLink = { linkId = p1.code, linkType = p1.type } }
		end
	},
	["/plus-referral"] = if FFlagAppChatPlusReferralAssetCardModule then {
		queryParams = List,
		paramCallback = function(p1)
			return if p1.code and p1.code ~= "" then {
				shareLink = { linkType = "PlusReferral", version = 2, linkId = p1.code }
			} else nil
		end
	} else nil
}