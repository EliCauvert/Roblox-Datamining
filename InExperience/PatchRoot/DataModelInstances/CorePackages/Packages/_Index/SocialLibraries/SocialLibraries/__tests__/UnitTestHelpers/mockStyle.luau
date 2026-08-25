local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local UIBlox = dependenciesModule.UIBlox
local roact = dependenciesModule.Roact

return function(p0)
	-- upvalues: roact (ref), UIBlox (ref)
	return roact.createElement(UIBlox.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { TestElement = p0 })
end