local Songbird = script:FindFirstAncestor("Songbird")
local RoactCompatModule = require(Songbird.Parent.Dev.RoactCompat)
local MusicTestingUtilsModule = require(Songbird.Parent.Dev.MusicTestingUtils)

return {
	name = Songbird.Name,
	roact = RoactCompatModule,
	storyRoots = { Songbird.Components },
	mapStory = function(p1)
		-- upvalues: RoactCompatModule (copy), MusicTestingUtilsModule (copy)
		return function(p2)
			-- upvalues: RoactCompatModule (upval), MusicTestingUtilsModule (upval), p1 (copy)
			return RoactCompatModule.createElement(MusicTestingUtilsModule.ContextProviders, { theme = p2.theme, overlayGui = p2.focus, host = p2.host }, RoactCompatModule.createElement(p1, p2))
		end
	end
}