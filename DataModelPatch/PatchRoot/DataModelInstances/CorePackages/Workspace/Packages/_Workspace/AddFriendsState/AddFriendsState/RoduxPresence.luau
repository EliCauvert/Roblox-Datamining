local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = `{require(AddFriendsState.RODUX_KEY)}.Presence`
})