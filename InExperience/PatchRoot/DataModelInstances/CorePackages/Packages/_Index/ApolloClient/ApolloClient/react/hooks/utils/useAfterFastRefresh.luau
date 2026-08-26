local t = {}
local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef

function t.useAfterFastRefresh(p1)
	-- upvalues: useRef (ref), useEffect (ref)
	if _G.__DEV__ then
		local var1 = useRef(false)
		useEffect(function()
			-- upvalues: var1 (ref)
			return function()
				-- upvalues: var1 (copy)
				var1.current = true
			end
		end, {})
		useEffect(function()
			-- upvalues: var1 (ref), p1 (ref)
			if var1.current == true then
				var1.current = false
				p1()
			end
		end, {})
	end
end

return t