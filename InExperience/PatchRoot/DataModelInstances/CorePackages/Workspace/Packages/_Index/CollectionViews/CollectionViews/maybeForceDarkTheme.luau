local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local UiModeStyleProvider = StyleModule.UiModeStyleProvider
local DesignTokenProvider = StyleModule.DesignTokenProvider

return function(Content, p1) --[[ Line: 9 | Named "maybeForceDarkTheme" ]]
	-- upvalues: ReactModule (copy), UiModeStyleProvider (copy), DesignTokenProvider (copy)
	return if p1 then ReactModule.createElement(UiModeStyleProvider, { style = { themeName = "Dark", fontName = nil } }, {
		DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Content = Content })
	}) else Content
end