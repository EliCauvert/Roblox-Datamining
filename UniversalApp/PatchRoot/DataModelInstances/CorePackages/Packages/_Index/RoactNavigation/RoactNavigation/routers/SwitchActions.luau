local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local var1 = require(script.Parent.Parent.NavigationSymbol)("JUMP_TO")
local t = { JumpTo = var1 }
setmetatable(t, {
	__index = function(_, p1)
		error(("%q is not a valid member of SwitchActions"):format(tostring(p1)), 2)
	end
})

function t.jumpTo(p1)
	-- upvalues: var1 (ref), object (ref)
	local t = { preserveFocus = true, type = var1 }
	
	return if p1 then object.assign(t, p1) else t
end

return t