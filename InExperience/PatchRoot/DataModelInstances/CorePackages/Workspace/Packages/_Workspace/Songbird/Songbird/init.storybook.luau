local songbird = script:FindFirstAncestor("Songbird")
local roactCompatModule = require(songbird.Parent.Dev.RoactCompat)
local musicTestingUtilsModule = require(songbird.Parent.Dev.MusicTestingUtils)

return {
	name = songbird.Name,
	roact = roactCompatModule,
	storyRoots = { songbird.Components },
	mapStory = function(p1)
		-- upvalues: roactCompatModule (ref), musicTestingUtilsModule (ref)
		return function(p2)
			-- upvalues: roactCompatModule (copy), musicTestingUtilsModule (copy), p1 (ref)
			return roactCompatModule.createElement(musicTestingUtilsModule.ContextProviders, { theme = p2.theme, overlayGui = p2.focus, host = p2.host }, roactCompatModule.createElement(p1, p2))
		end
	end
}