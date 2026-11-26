return function(p1): boolean
	return p1.isUnderFriendCountThreshold and (not p1.hasSearchText and not p1.isSearchBoxFocused)
end