local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.RoduxGames).config({ keyPath = `{require(AddFriendsState.RODUX_KEY)}.Games` })