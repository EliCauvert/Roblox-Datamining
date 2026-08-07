local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)
local unknownModule = require(script.Parent["ReactBinding.roblox"])

return {
	createRef = function() --[[ line: 26 ]]
		-- upvalues: unknownModule (ref), reactGlobalsModule (ref)
		local var2, _ = unknownModule.create(nil)
		local t = {}
		
		if reactGlobalsModule.__DEV__ then
			var2._source = debug.traceback("Ref created at:", 1)
		end
		setmetatable(t, {
			__index = function(_, p0) --[[ line: 44 ]]
				-- upvalues: var2 (ref)
				return if p0 == "current" then var2:getValue() else var2[p0]
			end,
			__newindex = function(_, p1, p2) --[[ line: 51 ]]
				-- upvalues: unknownModule (copy), var2 (ref)
				if p1 == "current" then
					unknownModule.update(var2, p2)
				end
				var2[p1] = p2
			end,
			__tostring = function(_) --[[ line: 62 ]]
				-- upvalues: var2 (ref)
				return string.format("Ref(%s)", tostring(var2:getValue()))
			end
		})
		
		return t
	end
}