local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.RoduxUsers).config({ keyPath = `{require(AddFriendsState.RODUX_KEY)}.Users` })