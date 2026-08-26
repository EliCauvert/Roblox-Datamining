local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local UIBlox = dependenciesModule.UIBlox
local roact = dependenciesModule.Roact

return function(p1)
	-- upvalues: roact (ref), UIBlox (ref)
	return roact.createElement(UIBlox.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { TestElement = p1 })
end