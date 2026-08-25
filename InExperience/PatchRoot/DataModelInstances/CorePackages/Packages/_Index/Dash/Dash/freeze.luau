local parent = script.Parent
local errorModule = require(parent.Error)
local formatModule = require(parent.format)
local readonlyKey = errorModule.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}")
local missingKey = errorModule.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}")

return function(p0, p1, p2)
	-- upvalues: missingKey (ref), readonlyKey (ref), formatModule (ref)
	local t = {}
	assert(type(p1) == "table", `Attempted to call Dash.freeze with argument #2 of type {type(p1)}, but it should be table `)
	setmetatable(t, {
		__index = function(_, p3)
			-- upvalues: p1 (ref), p2 (ref), missingKey (copy), p0 (ref)
			local var5 = p1[p3]
			
			if var5 == nil and p2 then
				missingKey:throw({ key = p3, objectName = p0 })
			end
			return var5
		end,
		__newindex = function(_, p4)
			-- upvalues: readonlyKey (copy), p0 (ref)
			readonlyKey:throw({ key = p4, objectName = p0 })
		end,
		__len = function()
			-- upvalues: p1 (ref)
			return #p1
		end,
		__tostring = function()
			-- upvalues: formatModule (copy), p0 (ref)
			return formatModule("Frozen({})", p0)
		end,
		__call = function(_, ...)
			-- upvalues: p1 (ref)
			return p1(...)
		end
	})
	
	return t
end