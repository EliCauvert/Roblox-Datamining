local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local colorModeModule = require(foundation.Enums.ColorMode)
local flagsModule = require(foundation.Utility.Flags)
local rbxDesignFoundationsModule = require(parent.RbxDesignFoundations)
local themeNameModule = require(foundation.Enums.ThemeName)

return {
	getGenerator = function(p1, p2)
		-- upvalues: flagsModule (ref), rbxDesignFoundationsModule (ref), parent (ref), themeNameModule (ref), colorModeModule (ref)
		local var1 = if flagsModule.FoundationFontFaceMigration then rbxDesignFoundationsModule.themes else require(parent.RbxDesignFoundationsV4).themes
		local var2 = (var1[p1] or var1[themeNameModule.Default])()
		
		return if p2 == colorModeModule.Light then var2.Light else var2.Dark
	end
}