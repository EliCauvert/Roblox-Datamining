local GroupPeekSdui = script:FindFirstAncestor("GroupPeekSdui")
local HttpClientModule = require(GroupPeekSdui.Parent.HttpClient)
local GetAnnouncementReactionUrlModule = require(GroupPeekSdui.Reactions.getAnnouncementReactionUrl)

local function requestAnnouncementReaction(p1, Text: string, Network)
	-- upvalues: HttpClientModule (copy), GetAnnouncementReactionUrlModule (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		retry = false,
		method = Text,
		url = GetAnnouncementReactionUrlModule(p1),
		body = {},
		analyticsKey = "groups.announcement-reaction." .. string.lower(Text),
		network = Network,
		decode = function(_)
			return nil
		end
	}))
end

return {
	addAnnouncementReaction = function(p1, Network)
		-- upvalues: requestAnnouncementReaction (copy)
		return requestAnnouncementReaction(p1, "POST", Network)
	end,
	removeAnnouncementReaction = function(p1, Network)
		-- upvalues: requestAnnouncementReaction (copy)
		return requestAnnouncementReaction(p1, "DELETE", Network)
	end
}