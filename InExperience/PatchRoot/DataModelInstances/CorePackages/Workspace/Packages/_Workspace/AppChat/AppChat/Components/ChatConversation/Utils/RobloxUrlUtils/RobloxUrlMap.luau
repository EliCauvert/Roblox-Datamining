local AppChat = script:FindFirstAncestor("AppChat")
local Regex = require(AppChat.Parent.UrlMatching).Regex
local FFlagAppChatResolveShareLinkV2Module = require(AppChat.Flags.FFlagAppChatResolveShareLinkV2)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatEarlyTestingLinksModule = require(AppChat.Flags.FFlagAppChatEarlyTestingLinks)
local FFlagAppChatGenericShareLinkCardModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkCard)
local list = { "ExperienceDetails" }
local AZAZ: string = if FFlagAppChatGenericShareLinkCardModule then "[a-zA-Z0-9-]+" else "[a-fA-F0-9-]+"

local function _(Text: string): boolean
	return string.match(Text, "^[a-fA-F0-9-]+$") ~= nil
end

local List = if FFlagAppChatResolveShareLinkV2Module then {
	{ name = "code", pattern = AZAZ },
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
			-- upvalues: FFlagAppChatResolveShareLinkV2Module (copy), FFlagAppChatGenericShareLinkCardModule (copy)
			if not FFlagAppChatResolveShareLinkV2Module then
				return { shareLink = { linkId = p1.code, linkType = p1.type } }
			elseif p1.v == "v2" then
				return { shareLink = { version = 2, linkId = p1.code } }
			elseif not p1.type then
				return nil
			elseif FFlagAppChatGenericShareLinkCardModule and string.match(p1.code, "^[a-fA-F0-9-]+$") == nil then
				return nil
			else
				return {
					shareLink = { version = 1, linkId = p1.code, linkType = p1.type }
				}
			end
		end
	},
	["/plus-referral"] = if FFlagAppChatPlusReferralAssetCardModule then {
		queryParams = List,
		paramCallback = function(p1)
			-- upvalues: FFlagAppChatGenericShareLinkCardModule (copy)
			if not p1.code or p1.code == "" then
				return nil
			elseif FFlagAppChatGenericShareLinkCardModule and string.match(p1.code, "^[a-fA-F0-9-]+$") == nil then
				return nil
			else
				return {
					shareLink = { linkType = "PlusReferral", version = 2, linkId = p1.code }
				}
			end
		end
	} else nil
}