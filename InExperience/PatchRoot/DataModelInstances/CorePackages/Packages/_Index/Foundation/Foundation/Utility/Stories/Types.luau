local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Providers.Preferences.PreferencesProvider)

return {
	toDeveloperStorybookStoryProps = function(p0)
		return if rawget(p0, "focus") then p0 else nil
	end,
	toFlipbookStoryProps = function(p1)
		return if rawget(p1, "widget") then p1 else nil
	end
}