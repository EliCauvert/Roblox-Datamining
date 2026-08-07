-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local reactSymbols = require(parent.Shared).ReactSymbols
local _ = require(parent.Shared)
local REACT_FORWARD_REF_TYPE = reactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE

return {
	forwardRef = function(p0) --[[ line: 33 ]]
		-- upvalues: reactGlobalsModule (ref), REACT_MEMO_TYPE (ref), console (ref), REACT_FORWARD_REF_TYPE (ref)
		if reactGlobalsModule.__DEV__ then
			if typeof(p0) == "table" and p0["$$typeof"] == REACT_MEMO_TYPE then
				console.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
			elseif typeof(p0) == "function" then
				local debugInfo, _ = debug.info(p0, "a")
				
				if debugInfo ~= 0 and debugInfo ~= 2 then
					console.error("forwardRef render functions accept exactly two parameters: props and ref. %s", if debugInfo == 1 then "Did you forget to use the ref parameter?" else "Any additional parameter will be undefined.")
				end
			else
				console.error("forwardRef requires a render function but was given %s.", typeof(p0))
			end
		end
		local t = { ["$$typeof"] = REACT_FORWARD_REF_TYPE, render = p0 }
		
		if reactGlobalsModule.__DEV__ then
			local var3 = nil
			setmetatable(t, {
				__index = function(p1, p2) --[[ line: 96 ]]
					-- upvalues: var3 (write)
					return if p2 == "displayName" then var3 else rawget(p1, p2)
				end,
				__newindex = function(p3, p4, p5) --[[ line: 102 ]]
					-- upvalues: var3 (write)
					if p4 == "displayName" then
						var3 = p5
						
						return
					end
					rawset(p3, p4, p5)
				end
			})
		end
		return t
	end
}