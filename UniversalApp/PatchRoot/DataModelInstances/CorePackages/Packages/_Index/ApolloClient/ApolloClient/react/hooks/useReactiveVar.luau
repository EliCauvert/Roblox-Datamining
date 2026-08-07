local t = {}
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local _ = require(parent.cache)
local t_1 = { __value = "nil placeholder" }

function t.useReactiveVar(p0) --[[ line: 25 ]]
	-- upvalues: useState (ref), useEffect (ref), t_1 (ref)
	local var3 = p0()
	local _, var4 = useState(var3)
	useEffect(function() --[[ line: 34 ]]
		-- upvalues: p0 (ref), var3 (ref), var4 (ref)
		local var5 = p0()
		
		if var3 == var5 then
			return p0:onNextChange(var4)
		end
		var4(var5)
	end, { var3 or t_1 })
	
	return var3
end

return t