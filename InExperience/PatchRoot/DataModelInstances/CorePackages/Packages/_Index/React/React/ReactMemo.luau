local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local SharedModule = require(Parent.Shared)
local Console = SharedModule.console
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InspectFunction = LuauPolyfillModule.util.inspect
local ReactSymbols = SharedModule.ReactSymbols
local REACTMEMOTYPE = ReactSymbols.REACT_MEMO_TYPE
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local IsValidElementTypeFunction = SharedModule.isValidElementType
local GetComponentNameFunction = SharedModule.getComponentName

return {
	memo = function(p1, p2) --[[ Line: 47 ]]
		-- upvalues: ReactGlobalsModule (copy), IsValidElementTypeFunction (copy), Object (copy), Array (copy), REACTELEMENTTYPE (copy), GetComponentNameFunction (copy), InspectFunction (copy), Console (copy), REACTMEMOTYPE (copy)
		if ReactGlobalsModule.__DEV__ and not IsValidElementTypeFunction(p1) then
			local Text = ""
			
			if p1 == nil or typeof(p1) == "table" and #Object.keys(p1) == 0 then
				Text ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
			end
			local Formatted = nil
			if p1 == nil then
				Formatted = "nil"
			elseif Array.isArray(p1) then
				Formatted = "array"
			elseif p1 == nil or typeof(p1) ~= "table" or p1["$$typeof"] ~= REACTELEMENTTYPE then
				Formatted = typeof(p1)
				
				if p1 ~= nil then
					Text = "\n" .. InspectFunction(p1)
				end
			else
				Formatted = string.format("<%s />", GetComponentNameFunction(p1.type) or "UNKNOWN")
				Text = " Did you accidentally export a JSX literal or Element instead of a component?"
			end
			Console.error("memo: The first argument must be a component. Instead received: `%s`.%s", Formatted, Text)
		end
		local config = {
			["$$typeof"] = REACTMEMOTYPE,
			type = p1,
			compare = p2 or nil
		}
		
		if ReactGlobalsModule.__DEV__ then
			local DisplayName = nil
			setmetatable(config, {
				__index = function(p3, p4) --[[ Line: 113 ]]
					-- upvalues: DisplayName (ref)
					return if p4 == "displayName" then DisplayName else rawget(p3, p4)
				end,
				__newindex = function(p3, p4, p5) --[[ Line: 119 ]]
					-- upvalues: DisplayName (ref), p1 (copy)
					if p4 == "displayName" then
						DisplayName = p5
						
						if typeof(p1) == "table" and p1.displayName == nil then
							p1.displayName = DisplayName
							
							return
						end
					else
						rawset(p3, p4, p5)
					end
				end
			})
		end
		return config
	end
}