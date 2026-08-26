local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local reactSymbols = require(parent.Shared).ReactSymbols
local _ = require(parent.Shared)
local REACT_FORWARD_REF_TYPE = reactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE

return {
	forwardRef = function(p1)
		-- upvalues: reactGlobalsModule (ref), REACT_MEMO_TYPE (ref), console (ref), REACT_FORWARD_REF_TYPE (ref)
		if reactGlobalsModule.__DEV__ then
			if typeof(p1) == "table" and p1["$$typeof"] == REACT_MEMO_TYPE then
				console.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
			elseif typeof(p1) == "function" then
				local debugInfo, _ = debug.info(p1, "a")
				
				if debugInfo ~= 0 and debugInfo ~= 2 then
					console.error("forwardRef render functions accept exactly two parameters: props and ref. %s", if debugInfo == 1 then "Did you forget to use the ref parameter?" else "Any additional parameter will be undefined.")
				end
			else
				console.error("forwardRef requires a render function but was given %s.", typeof(p1))
			end
		end
		local t = { ["$$typeof"] = REACT_FORWARD_REF_TYPE, render = p1 }
		
		if reactGlobalsModule.__DEV__ then
			local var1 = nil
			setmetatable(t, {
				__index = function(p2, p3)
					-- upvalues: var1 (write)
					return if p3 == "displayName" then var1 else rawget(p2, p3)
				end,
				__newindex = function(p2, p3, p4)
					-- upvalues: var1 (write)
					if p3 == "displayName" then
						var1 = p4
						
						return
					end
					rawset(p2, p3, p4)
				end
			})
		end
		return t
	end
}