local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local config = {
	candidates = {
		section = require(FriendsLanding.Friends.pageSections).TrustedFriendCandidates,
		filter = require(FriendsLanding.Friends.filterStates).Trusted
	}
}

return function(Text: string, Filter)
	-- upvalues: config (copy)
	if Text == nil then
		return nil
	else
		local Entry = config[string.lower(Text)]
		
		return if Entry == nil or Entry.filter ~= Filter then nil else Entry.section
	end
end