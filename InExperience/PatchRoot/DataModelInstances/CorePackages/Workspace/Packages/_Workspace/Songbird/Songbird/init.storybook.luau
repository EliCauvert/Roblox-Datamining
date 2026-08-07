local songbird = script:FindFirstAncestor("Songbird")
local roactCompatModule = require(songbird.Parent.Dev.RoactCompat)
local musicTestingUtilsModule = require(songbird.Parent.Dev.MusicTestingUtils)

return {
	name = songbird.Name,
	roact = roactCompatModule,
	storyRoots = { songbird.Components },
	mapStory = function(p0) --[[ line: 12 ]]
		-- upvalues: roactCompatModule (ref), musicTestingUtilsModule (ref)
		return function(p1) --[[ line: 13 ]]
			-- upvalues: roactCompatModule (copy), musicTestingUtilsModule (copy), p0 (ref)
			return roactCompatModule.createElement(musicTestingUtilsModule.ContextProviders, { theme = p1.theme, overlayGui = p1.focus, host = p1.host }, roactCompatModule.createElement(p0, p1))
		end
	end
}