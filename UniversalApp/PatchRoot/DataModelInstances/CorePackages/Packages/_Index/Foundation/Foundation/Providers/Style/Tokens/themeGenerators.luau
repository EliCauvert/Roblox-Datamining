local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ColorModeModule = require(Foundation.Enums.ColorMode)
local FlagsModule = require(Foundation.Utility.Flags)
local RbxDesignFoundationsModule = require(Parent.RbxDesignFoundations)
local ThemeNameModule = require(Foundation.Enums.ThemeName)

return {
	getGenerator = function(p1, Light) --[[ Line: 12 ]]
		-- upvalues: FlagsModule (copy), RbxDesignFoundationsModule (copy), Parent (copy), ThemeNameModule (copy), ColorModeModule (copy)
		local Themes = if FlagsModule.FoundationFontFaceMigration then RbxDesignFoundationsModule.themes else require(Parent.RbxDesignFoundationsV4).themes
		local v1 = (Themes[p1] or Themes[ThemeNameModule.Default])()
		
		return if Light == ColorModeModule.Light then v1.Light else v1.Dark
	end
}