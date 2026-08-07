local parent = script:FindFirstAncestor("ScreenTime").Parent
local argCheckModule = require(parent.ArgCheck)
local logging = require(parent.AppCommonLib).Logging

return {
	globalGetter = nil,
	globalSetter = nil,
	new = function(p0, p1) --[[ line: 30 ]]
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1.globalGetter, "function", "globalGetter")
		argCheckModule.isType(p1.globalSetter, "function", "globalSetter")
		local t = {
			globalGetter = p1.globalGetter,
			globalSetter = p1.globalSetter
		}
		setmetatable(t, p0)
		p0.__index = p0
		
		return t
	end,
	isLockedOut = function(p2) --[[ line: 45 ]]
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p2.globalGetter, "function", "globalGetter")
		
		return p2.globalGetter("ScreenTime.lockedOut") == "true"
	end,
	setLockedOut = function(value) --[[ line: 54 ]]
		-- upvalues: logging (ref), argCheckModule (ref)
		logging.warn("Utils setLockedOut")
		argCheckModule.isType(value.globalSetter, "function", "globalSetter")
		value.globalSetter("ScreenTime.lockedOut", "true")
	end
}