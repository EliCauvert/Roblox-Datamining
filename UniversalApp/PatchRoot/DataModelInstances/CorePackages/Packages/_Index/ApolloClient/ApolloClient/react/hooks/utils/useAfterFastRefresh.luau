local t = {}
local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef

function t.useAfterFastRefresh(p0) --[[ line: 16 ]]
	-- upvalues: useRef (ref), useEffect (ref)
	if _G.__DEV__ then
		local var2 = useRef(false)
		useEffect(function() --[[ line: 19 ]]
			-- upvalues: var2 (ref)
			return function() --[[ line: 20 ]]
				-- upvalues: var2 (copy)
				var2.current = true
			end
		end, {})
		useEffect(function() --[[ line: 24 ]]
			-- upvalues: var2 (ref), p0 (ref)
			if var2.current == true then
				var2.current = false
				p0()
			end
		end, {})
	end
end

return t