local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "ViewRecycler Storybook must be mounted under view-recycler-react")
local parent = viewRecyclerReact.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local stories = viewRecyclerReact:FindFirstChild("Stories")
assert(stories ~= nil, "ViewRecycler Storybook requires a local Stories folder")

return {
	name = "ViewRecycler",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0)
		-- upvalues: reactModule (ref)
		return function(p1)
			-- upvalues: reactModule (copy), p0 (ref)
			return reactModule.createElement(p0, p1)
		end
	end,
	storyRoot = stories
}