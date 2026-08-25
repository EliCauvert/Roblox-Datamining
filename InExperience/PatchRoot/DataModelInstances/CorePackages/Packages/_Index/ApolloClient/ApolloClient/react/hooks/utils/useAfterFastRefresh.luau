local t = {}
local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef

function t.useAfterFastRefresh(p0)
	-- upvalues: useRef (ref), useEffect (ref)
	if _G.__DEV__ then
		local var2 = useRef(false)
		useEffect(function()
			-- upvalues: var2 (ref)
			return function()
				-- upvalues: var2 (copy)
				var2.current = true
			end
		end, {})
		useEffect(function()
			-- upvalues: var2 (ref), p0 (ref)
			if var2.current == true then
				var2.current = false
				p0()
			end
		end, {})
	end
end

return t