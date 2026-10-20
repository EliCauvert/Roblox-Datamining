local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local WatermarkComponentModule = require(script.WatermarkComponent)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), RoactModule (copy), WatermarkComponentModule (copy), CoreGui (copy)
	local self = setmetatable({}, Module)
	self.root = RoactModule.createElement(WatermarkComponentModule)
	self.element = RoactModule.mount(self.root, CoreGui, "Watermark")
	
	return self
end

return Module.new()