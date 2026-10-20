local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local _ = require(Foundation.Providers.Preferences.PreferencesProvider)
local _ = require(Foundation.Enums.ThemeName)

return {
	toDeveloperStorybookStoryProps = function(p1)
		return if rawget(p1, "focus") then p1 else nil
	end,
	toFlipbookStoryProps = function(p1)
		return if rawget(p1, "widget") then p1 else nil
	end
}