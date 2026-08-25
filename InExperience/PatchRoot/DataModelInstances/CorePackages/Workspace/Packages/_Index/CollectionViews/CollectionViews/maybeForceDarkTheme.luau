local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local uiModeStyleProvider = styleModule.UiModeStyleProvider
local designTokenProvider = styleModule.DesignTokenProvider

return function(p0, p1)
	-- upvalues: reactModule (ref), uiModeStyleProvider (ref), designTokenProvider (ref)
	return if p1 then reactModule.createElement(uiModeStyleProvider, { style = { themeName = "Dark", fontName = nil } }, {
		DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Content = p0 })
	}) else p0
end