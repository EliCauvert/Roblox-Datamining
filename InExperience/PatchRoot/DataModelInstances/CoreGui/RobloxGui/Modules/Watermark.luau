local coreGuiService = game:GetService("CoreGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local watermarkComponentModule = require(script.WatermarkComponent)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), roactModule (ref), watermarkComponentModule (ref), coreGuiService (ref)
	local tbl = setmetatable({}, t)
	tbl.root = roactModule.createElement(watermarkComponentModule)
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "Watermark")
	
	return tbl
end

return t.new()