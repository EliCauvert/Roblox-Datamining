local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)
local unknownModule = require(script.Parent["ReactBinding.roblox"])

return {
	createRef = function()
		-- upvalues: unknownModule (ref), reactGlobalsModule (ref)
		local var1, _ = unknownModule.create(nil)
		local t = {}
		
		if reactGlobalsModule.__DEV__ then
			var1._source = debug.traceback("Ref created at:", 1)
		end
		setmetatable(t, {
			__index = function(_, p1)
				-- upvalues: var1 (ref)
				return if p1 == "current" then var1:getValue() else var1[p1]
			end,
			__newindex = function(_, p1, p2)
				-- upvalues: unknownModule (copy), var1 (ref)
				if p1 == "current" then
					unknownModule.update(var1, p2)
				end
				var1[p1] = p2
			end,
			__tostring = function(_)
				-- upvalues: var1 (ref)
				return string.format("Ref(%s)", tostring(var1:getValue()))
			end
		})
		
		return t
	end
}