-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local roactModule = require(parent.Parent.Roact)
local appStyleProviderModule = require(parent.App.Style.AppStyleProvider)
local foundationProvider = require(parent.Parent.Foundation).FoundationProvider
local _ = require(parent.App.Style.StyleTypes)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: roactModule (ref), foundationProvider (ref), appStyleProviderModule (ref)
	return roactModule.createElement(foundationProvider, {
		theme = "Dark",
		preferences = if p1 then {
			reducedMotion = p1.reducedMotion,
			preferredTransparency = p1.preferredTransparency
		} else nil
	}, roactModule.createElement(appStyleProviderModule, {
		style = { themeName = "Dark", fontName = "Gotham", settings = p1 }
	}, {
		Content = roactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p0)
	}))
end