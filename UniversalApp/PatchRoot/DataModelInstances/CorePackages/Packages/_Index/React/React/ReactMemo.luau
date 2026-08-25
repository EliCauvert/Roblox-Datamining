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
	memo = function(p0, p1)
		-- upvalues: reactGlobalsModule (ref), isValidElementType (ref), object (ref), array (ref), REACT_ELEMENT_TYPE (ref), getComponentName (ref), inspect (ref), console (ref), REACT_MEMO_TYPE (ref)
		if reactGlobalsModule.__DEV__ and not isValidElementType(p0) then
			local var3 = ""
			
			if p0 == nil or typeof(p0) == "table" and #object.keys(p0) == 0 then
				var3 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
			end
			local var4
			local _ = nil
			
			if p0 == nil then
				var4 = "nil"
			elseif array.isArray(p0) then
				var4 = "array"
			elseif p0 == nil or typeof(p0) ~= "table" or p0["$$typeof"] ~= REACT_ELEMENT_TYPE then
				var4 = typeof(p0)
				
				if p0 ~= nil then
					var3 = "\n" .. inspect(p0)
				end
			else
				var4 = string.format("<%s />", getComponentName(p0.type) or "UNKNOWN")
				var3 = " Did you accidentally export a JSX literal or Element instead of a component?"
			end
			console.error("memo: The first argument must be a component. Instead received: `%s`.%s", var4, var3)
		end
		local t = {
			["$$typeof"] = REACT_MEMO_TYPE,
			type = p0,
			compare = p1 or nil
		}
		
		if reactGlobalsModule.__DEV__ then
			local var6 = nil
			setmetatable(t, {
				__index = function(p2, p3)
					-- upvalues: var6 (write)
					return if p3 == "displayName" then var6 else rawget(p2, p3)
				end,
				__newindex = function(p4, p5, p6)
					-- upvalues: var6 (write), p0 (ref)
					if p5 == "displayName" then
						var6 = p6
						
						if typeof(p0) == "table" and p0.displayName == nil then
							p0.displayName = var6
							
							return
						end
					else
						rawset(p4, p5, p6)
					end
				end
			})
		end
		return t
	end
}