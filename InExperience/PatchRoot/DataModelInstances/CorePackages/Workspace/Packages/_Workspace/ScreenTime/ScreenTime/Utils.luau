local parent = script:FindFirstAncestor("ScreenTime").Parent
local argCheckModule = require(parent.ArgCheck)
local logging = require(parent.AppCommonLib).Logging

return {
	globalGetter = nil,
	globalSetter = nil,
	new = function(p1, p2)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p2.globalGetter, "function", "globalGetter")
		argCheckModule.isType(p2.globalSetter, "function", "globalSetter")
		local t = {
			globalGetter = p2.globalGetter,
			globalSetter = p2.globalSetter
		}
		setmetatable(t, p1)
		p1.__index = p1
		
		return t
	end,
	isLockedOut = function(p1)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1.globalGetter, "function", "globalGetter")
		
		return p1.globalGetter("ScreenTime.lockedOut") == "true"
	end,
	setLockedOut = function(value)
		-- upvalues: logging (ref), argCheckModule (ref)
		logging.warn("Utils setLockedOut")
		argCheckModule.isType(value.globalSetter, "function", "globalSetter")
		value.globalSetter("ScreenTime.lockedOut", "true")
	end
}