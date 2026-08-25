local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local colorModeModule = require(foundation.Enums.ColorMode)
local themeNameModule = require(foundation.Enums.ThemeName)

return {
	getGenerator = function(p0, p1)
		-- upvalues: parent (ref), themeNameModule (ref), colorModeModule (ref)
		local themes = require(parent.RbxDesignFoundations).themes
		local var3 = (themes[p0] or themes[themeNameModule.Default])()
		
		return if p1 == colorModeModule.Light then var3.Light else var3.Dark
	end,
	getLegacyGenerator = function(p2)
		-- upvalues: parent (ref), colorModeModule (ref)
		local tokens = require(parent.RbxDesignFoundationsV3).Tokens
		
		return if p2 == colorModeModule.Light then tokens.Light else tokens.Dark
	end
}