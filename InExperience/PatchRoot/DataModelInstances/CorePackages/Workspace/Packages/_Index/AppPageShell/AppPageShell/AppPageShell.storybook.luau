local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return {
	name = AppPageShell.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, { theme = p2.theme, device = p2.platform }, ReactModule.createElement(p1, p2))
		end
	end,
	storyRoots = { AppPageShell }
}