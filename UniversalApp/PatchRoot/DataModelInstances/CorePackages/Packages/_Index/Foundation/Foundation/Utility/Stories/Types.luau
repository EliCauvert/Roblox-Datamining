local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Providers.Preferences.PreferencesProvider)
local _ = require(foundation.Enums.Theme)

return {
	toDeveloperStorybookStoryProps = function(p0) --[[ line: 22 ]]
		return if rawget(p0, "focus") then p0 else nil
	end,
	toFlipbookStoryProps = function(p1) --[[ line: 38 ]]
		return if rawget(p1, "widget") then p1 else nil
	end
}