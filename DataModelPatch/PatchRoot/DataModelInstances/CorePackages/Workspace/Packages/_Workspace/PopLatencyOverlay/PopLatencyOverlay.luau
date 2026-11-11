local ReactModule = require(script.Parent.React)
local OverlayModule = require(script.Overlay)

return {
	["jest.config"] = script["jest.config"],
	default = function(_)
		-- upvalues: ReactModule (copy), OverlayModule (copy)
		return ReactModule.createElement("ScreenGui", {
			Name = "PopLatencyOverlay",
			IgnoreGuiInset = true,
			ResetOnSpawn = false,
			DisplayOrder = 1000
		}, ReactModule.createElement(OverlayModule))
	end
}