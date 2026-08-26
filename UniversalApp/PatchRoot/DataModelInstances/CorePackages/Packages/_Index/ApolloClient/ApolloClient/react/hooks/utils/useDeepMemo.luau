local t = {}
local parent = script.Parent.Parent.Parent.Parent
local useRef = require(parent.Parent.React).useRef
local equalModule = require(parent.jsutils.equal)

function t.useDeepMemo(p1, p2)
	-- upvalues: useRef (ref), equalModule (ref)
	local var1 = useRef(nil)
	
	if not var1.current or not equalModule(p2, var1.current.key) then
		var1.current = { key = p2, value = p1() }
	end
	return var1.current.value
end

return t