local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local AutoScrollModule = require(script.AutoScroll)
local InitialScrollPositionModule = require(script.InitialScrollPosition)
local ScrollPolicyModule = require(script.ScrollPolicy)

return {
	ChatPreset = require(script.ChatPreset),
	PaginationEdges = require(script.PaginationEdges),
	ReachedThreshold = require(script.ReachedThreshold),
	AutoScroll = if FFlagViewRecyclerReact08 then nil else AutoScrollModule,
	createInitialScrollPosition = if FFlagViewRecyclerReact08 then nil else InitialScrollPositionModule,
	createScrollPolicy = if FFlagViewRecyclerReact08 then nil else ScrollPolicyModule
}