local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local ReactSymbols = require(Parent.Shared).ReactSymbols
local _ = require(Parent.Shared)
local REACTFORWARDREFTYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACTMEMOTYPE = ReactSymbols.REACT_MEMO_TYPE

return {
	forwardRef = function(Render)
		-- upvalues: ReactGlobalsModule (copy), REACTMEMOTYPE (copy), Console (copy), REACTFORWARDREFTYPE (copy)
		if ReactGlobalsModule.__DEV__ then
			if typeof(Render) == "table" and Render["$$typeof"] == REACTMEMOTYPE then
				Console.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
			elseif typeof(Render) == "function" then
				local DebugInfo, _ = debug.info(Render, "a")
				
				if DebugInfo ~= 0 and DebugInfo ~= 2 then
					Console.error("forwardRef render functions accept exactly two parameters: props and ref. %s", if DebugInfo == 1 then "Did you forget to use the ref parameter?" else "Any additional parameter will be undefined.")
				end
			else
				Console.error("forwardRef requires a render function but was given %s.", (typeof(Render)))
			end
		end
		local config = { ["$$typeof"] = REACTFORWARDREFTYPE, render = Render }
		
		if ReactGlobalsModule.__DEV__ then
			local v1 = nil
			setmetatable(config, {
				__index = function(p1, p2)
					-- upvalues: v1 (ref)
					return if p2 == "displayName" then v1 else rawget(p1, p2)
				end,
				__newindex = function(p1, p2, p3)
					-- upvalues: v1 (ref)
					if p2 == "displayName" then
						v1 = p3
						
						return
					else
						rawset(p1, p2, p3)
					end
				end
			})
		end
		return config
	end
}