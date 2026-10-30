return {
	AppPage = "GroupProfile",
	CUSTOM_FORM_VERTICAL = "fe02680f247961a1369a66f681f990ec1e4a8708a2e84871019a93a7287ae7dd",
	CONTENT_REACTION_VERTICAL = "group_announcement",
	Identifiers = {
		Announcement = "groupAnnouncement",
		ForumsDiscovery = "groupForumsDiscovery"
	},
	getConfigKey = function(p1): string
		return `GroupPeek-{p1}`
	end
}