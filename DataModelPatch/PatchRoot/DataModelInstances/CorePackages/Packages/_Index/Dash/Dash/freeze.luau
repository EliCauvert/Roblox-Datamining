local Parent = script.Parent
local ErrorModule = require(Parent.Error)
local FormatModule = require(Parent.format)
local ReadonlyKey = ErrorModule.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}")
local MissingKey = ErrorModule.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}")

return function(ObjectName, Callback, p1)
	-- upvalues: MissingKey (copy), ReadonlyKey (copy), FormatModule (copy)
	local t = {}
	assert(type(Callback) == "table", `Attempted to call Dash.freeze with argument #2 of type {type(Callback)}, but it should be table `)
	setmetatable(t, {
		__index = function(_, Key)
			-- upvalues: Callback (copy), p1 (copy), MissingKey (upval), ObjectName (copy)
			local CallbackEntry = Callback[Key]
			
			if CallbackEntry == nil and p1 then
				MissingKey:throw({ key = Key, objectName = ObjectName })
			end
			return CallbackEntry
		end,
		__newindex = function(_, Key)
			-- upvalues: ReadonlyKey (upval), ObjectName (copy)
			ReadonlyKey:throw({ key = Key, objectName = ObjectName })
		end,
		__len = function(): number
			-- upvalues: Callback (copy)
			return #Callback
		end,
		__tostring = function()
			-- upvalues: FormatModule (upval), ObjectName (copy)
			return FormatModule("Frozen({})", ObjectName)
		end,
		__call = function(_, ...)
			-- upvalues: Callback (copy)
			return Callback(...)
		end
	})
	
	return t
end