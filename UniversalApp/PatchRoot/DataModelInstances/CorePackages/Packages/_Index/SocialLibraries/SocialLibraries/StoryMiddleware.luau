local DependenciesModule = require(script.Parent.dependencies)
local Roact = DependenciesModule.Roact
local AppStyleProvider = DependenciesModule.UIBlox.App.Style.AppStyleProvider
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return function(p1) --[[ Line: 21 | Named "StoryMiddleware" ]]
	-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy)
	return function(p2) --[[ Line: 22 ]]
		-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), p1 (copy)
		return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = Roact.createElement(p1, p2) })
	end
end