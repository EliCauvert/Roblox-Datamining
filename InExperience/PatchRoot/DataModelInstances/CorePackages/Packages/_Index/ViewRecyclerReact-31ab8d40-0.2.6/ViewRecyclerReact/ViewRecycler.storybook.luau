local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "ViewRecycler Storybook must be mounted under view-recycler-react")
local Parent = ViewRecyclerReact.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local Stories = ViewRecyclerReact:FindFirstChild("Stories")
assert(Stories ~= nil, "ViewRecycler Storybook requires a local Stories folder")

return {
	name = "ViewRecycler",
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 11 ]]
		-- upvalues: ReactModule (copy)
		return function(p2) --[[ Line: 12 ]]
			-- upvalues: ReactModule (upval), p1 (copy)
			return ReactModule.createElement(p1, p2)
		end
	end,
	storyRoot = Stories
}