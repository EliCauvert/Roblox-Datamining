local Parent = script:FindFirstAncestor("ScreenTime").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local Logging = require(Parent.AppCommonLib).Logging

return {
	globalGetter = nil,
	globalSetter = nil,
	new = function(Module, p1) --[[ Line: 30 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(p1.globalGetter, "function", "globalGetter")
		ArgCheckModule.isType(p1.globalSetter, "function", "globalSetter")
		local config = {
			globalGetter = p1.globalGetter,
			globalSetter = p1.globalSetter
		}
		setmetatable(config, Module)
		Module.__index = Module
		
		return config
	end,
	isLockedOut = function(p1): boolean --[[ Line: 45 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(p1.globalGetter, "function", "globalGetter")
		
		return p1.globalGetter("ScreenTime.lockedOut") == "true"
	end,
	setLockedOut = function(p1) --[[ Line: 54 ]]
		-- upvalues: Logging (copy), ArgCheckModule (copy)
		Logging.warn("Utils setLockedOut")
		ArgCheckModule.isType(p1.globalSetter, "function", "globalSetter")
		p1.globalSetter("ScreenTime.lockedOut", "true")
	end
}