local UserSearch = script:FindFirstAncestor("UserSearch")

return require(UserSearch.Parent.RoduxFriends).config({
	keyPath = require(UserSearch.Common.Constants).RODUX_KEY .. ".Friends"
})