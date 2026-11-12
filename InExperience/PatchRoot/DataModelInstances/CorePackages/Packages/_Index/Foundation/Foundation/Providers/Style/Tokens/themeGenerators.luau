local Foundation = script:FindFirstAncestor("Foundation")
local ColorModeModule = require(Foundation.Enums.ColorMode)
local RbxDesignFoundationsModule = require(Foundation.Parent.RbxDesignFoundations)
local ThemeNameModule = require(Foundation.Enums.ThemeName)

return {
	getGenerator = function(p1, Light)
		-- upvalues: RbxDesignFoundationsModule (copy), ThemeNameModule (copy), ColorModeModule (copy)
		local Themes = RbxDesignFoundationsModule.themes
		local v1 = (Themes[p1] or Themes[ThemeNameModule.Default])()
		
		return if Light == ColorModeModule.Light then v1.Light else v1.Dark
	end
}