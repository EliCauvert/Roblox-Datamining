local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local sharedModule = require(parent.Shared)
local console = sharedModule.console
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = luauPolyfillModule.util.inspect
local reactSymbols = sharedModule.ReactSymbols
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local isValidElementType = sharedModule.isValidElementType
local getComponentName = sharedModule.getComponentName

return {
	memo = function(p1, p2)
		-- upvalues: reactGlobalsModule (ref), isValidElementType (ref), object (ref), array (ref), REACT_ELEMENT_TYPE (ref), getComponentName (ref), inspect (ref), console (ref), REACT_MEMO_TYPE (ref)
		if reactGlobalsModule.__DEV__ and not isValidElementType(p1) then
			local var1 = ""
			
			if p1 == nil or typeof(p1) == "table" and #object.keys(p1) == 0 then
				var1 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
			end
			local var2
			local _ = nil
			
			if p1 == nil then
				var2 = "nil"
			elseif array.isArray(p1) then
				var2 = "array"
			elseif p1 == nil or typeof(p1) ~= "table" or p1["$$typeof"] ~= REACT_ELEMENT_TYPE then
				var2 = typeof(p1)
				
				if p1 ~= nil then
					var1 = "\n" .. inspect(p1)
				end
			else
				var2 = string.format("<%s />", getComponentName(p1.type) or "UNKNOWN")
				var1 = " Did you accidentally export a JSX literal or Element instead of a component?"
			end
			console.error("memo: The first argument must be a component. Instead received: `%s`.%s", var2, var1)
		end
		local t = {
			["$$typeof"] = REACT_MEMO_TYPE,
			type = p1,
			compare = p2 or nil
		}
		
		if reactGlobalsModule.__DEV__ then
			local var3 = nil
			setmetatable(t, {
				__index = function(p3, p4)
					-- upvalues: var3 (write)
					return if p4 == "displayName" then var3 else rawget(p3, p4)
				end,
				__newindex = function(p3, p4, p5)
					-- upvalues: var3 (write), p1 (ref)
					if p4 == "displayName" then
						var3 = p5
						
						if typeof(p1) == "table" and p1.displayName == nil then
							p1.displayName = var3
							
							return
						end
					else
						rawset(p3, p4, p5)
					end
				end
			})
		end
		return t
	end
}