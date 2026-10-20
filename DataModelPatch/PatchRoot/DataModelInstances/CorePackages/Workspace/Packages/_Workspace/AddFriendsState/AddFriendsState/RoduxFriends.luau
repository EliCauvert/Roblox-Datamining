local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.FriendsRodux).config({ keyPath = `{require(AddFriendsState.RODUX_KEY)}.Friends` })