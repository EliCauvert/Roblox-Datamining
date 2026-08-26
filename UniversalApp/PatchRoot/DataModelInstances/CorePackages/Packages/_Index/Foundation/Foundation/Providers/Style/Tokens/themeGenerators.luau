local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local colorModeModule = require(foundation.Enums.ColorMode)
local themeNameModule = require(foundation.Enums.ThemeName)

return {
	getGenerator = function(p1, p2)
		-- upvalues: parent (ref), themeNameModule (ref), colorModeModule (ref)
		local themes = require(parent.RbxDesignFoundations).themes
		local var1 = (themes[p1] or themes[themeNameModule.Default])()
		
		return if p2 == colorModeModule.Light then var1.Light else var1.Dark
	end,
	getLegacyGenerator = function(p1)
		-- upvalues: parent (ref), colorModeModule (ref)
		local tokens = require(parent.RbxDesignFoundationsV3).Tokens
		
		return if p1 == colorModeModule.Light then tokens.Light else tokens.Dark
	end
}