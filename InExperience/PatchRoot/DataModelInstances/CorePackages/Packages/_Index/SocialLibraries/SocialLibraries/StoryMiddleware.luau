local dependenciesModule = require(script.Parent.dependencies)
local roact = dependenciesModule.Roact
local appStyleProvider = dependenciesModule.UIBlox.App.Style.AppStyleProvider
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return function(p1)
	-- upvalues: roact (ref), appStyleProvider (ref), t (ref)
	return function(p2)
		-- upvalues: roact (copy), appStyleProvider (copy), t (copy), p1 (ref)
		return roact.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = roact.createElement(p1, p2) })
	end
end