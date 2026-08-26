local parent = script.Parent
local errorModule = require(parent.Error)
local formatModule = require(parent.format)
local readonlyKey = errorModule.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}")
local missingKey = errorModule.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}")

return function(p1, p2, p3)
	-- upvalues: missingKey (ref), readonlyKey (ref), formatModule (ref)
	local t = {}
	assert(type(p2) == "table", `Attempted to call Dash.freeze with argument #2 of type {type(p2)}, but it should be table `)
	setmetatable(t, {
		__index = function(_, p4)
			-- upvalues: p2 (ref), p3 (ref), missingKey (copy), p4 (ref)
			local var1 = p2[p4]
			
			if var1 == nil and p3 then
				missingKey:throw({ key = p4, objectName = p4 })
			end
			return var1
		end,
		__newindex = function(_, p4)
			-- upvalues: readonlyKey (copy), p4 (ref)
			readonlyKey:throw({ key = p4, objectName = p4 })
		end,
		__len = function()
			-- upvalues: p2 (ref)
			return #p2
		end,
		__tostring = function()
			-- upvalues: formatModule (copy), p1 (ref)
			return formatModule("Frozen({})", p1)
		end,
		__call = function(_, ...)
			-- upvalues: p2 (ref)
			return p2(...)
		end
	})
	
	return t
end