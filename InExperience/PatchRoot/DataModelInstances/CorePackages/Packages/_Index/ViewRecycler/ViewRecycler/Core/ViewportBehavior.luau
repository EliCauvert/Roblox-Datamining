local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local AutoScrollModule = require(script.AutoScroll)
local InitialScrollPositionModule = require(script.InitialScrollPosition)
local ScrollPolicyModule = require(script.ScrollPolicy)

return {
	ChatPreset = require(script.ChatPreset),
	PaginationEdges = require(script.PaginationEdges),
	ReachedThreshold = require(script.ReachedThreshold),
	AutoScroll = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else AutoScrollModule,
	createInitialScrollPosition = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else InitialScrollPositionModule,
	createScrollPolicy = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else ScrollPolicyModule
}