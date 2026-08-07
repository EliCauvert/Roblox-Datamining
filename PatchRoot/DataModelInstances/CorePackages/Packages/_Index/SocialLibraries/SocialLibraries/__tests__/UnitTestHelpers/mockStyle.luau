-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local UIBlox = dependenciesModule.UIBlox
local roact = dependenciesModule.Roact

return function(p0) --[[ line: 5 ]]
	-- upvalues: roact (ref), UIBlox (ref)
	return roact.createElement(UIBlox.App.Style.AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { TestElement = p0 })
end