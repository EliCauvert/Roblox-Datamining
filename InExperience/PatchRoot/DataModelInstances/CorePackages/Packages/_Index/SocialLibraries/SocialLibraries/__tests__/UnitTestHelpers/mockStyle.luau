local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local UIBlox = DependenciesModule.UIBlox
local Roact = DependenciesModule.Roact

return function(TestElement) --[[ Line: 5 ]]
	-- upvalues: Roact (copy), UIBlox (copy)
	return Roact.createElement(UIBlox.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { TestElement = TestElement })
end