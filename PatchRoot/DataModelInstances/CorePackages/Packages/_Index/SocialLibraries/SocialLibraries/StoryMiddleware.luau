-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local dependenciesModule = require(script.Parent.dependencies)
local roact = dependenciesModule.Roact
local appStyleProvider = dependenciesModule.UIBlox.App.Style.AppStyleProvider
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return function(p0) --[[ line: 21 | named "StoryMiddleware" ]]
	-- upvalues: roact (ref), appStyleProvider (ref), t (ref)
	return function(p1) --[[ line: 22 ]]
		-- upvalues: roact (copy), appStyleProvider (copy), t (copy), p0 (ref)
		return roact.createElement(appStyleProvider, { style = if p1 then t[p1.theme] else t.Default }, { Child = roact.createElement(p0, p1) })
	end
end