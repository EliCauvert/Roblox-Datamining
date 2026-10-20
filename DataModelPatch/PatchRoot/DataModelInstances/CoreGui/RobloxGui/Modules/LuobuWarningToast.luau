local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LuobuWarningToastComponentModule = require(script.LuobuWarningToastComponent)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), RoactModule (copy), LuobuWarningToastComponentModule (copy), CoreGui (copy)
	local self = setmetatable({}, Module)
	self.element = RoactModule.createElement(LuobuWarningToastComponentModule)
	self.root = RoactModule.mount(self.element, CoreGui, "LuobuWarningToast")
	task.delay(10, function()
		-- upvalues: RoactModule (upval), self (copy)
		RoactModule.unmount(self.root)
	end)
	
	return self
end

return Module.new()