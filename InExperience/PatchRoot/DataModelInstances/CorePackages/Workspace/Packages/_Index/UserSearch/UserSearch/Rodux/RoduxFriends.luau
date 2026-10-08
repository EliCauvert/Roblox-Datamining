local userSearch = script:FindFirstAncestor("UserSearch")

return require(userSearch.Parent.RoduxFriends).config({
	keyPath = require(userSearch.Common.Constants).RODUX_KEY .. ".Friends"
})