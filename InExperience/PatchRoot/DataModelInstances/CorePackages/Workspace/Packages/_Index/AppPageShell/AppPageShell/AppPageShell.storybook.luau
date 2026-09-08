local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider

return {
	name = appPageShell.Name,
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), p1 (ref)
			return reactModule.createElement(foundationProvider, { theme = p2.theme, device = p2.platform }, reactModule.createElement(p1, p2))
		end
	end,
	storyRoots = { appPageShell }
}