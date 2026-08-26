local t = {}
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local _ = require(parent.cache)
local t_1 = { __value = "nil placeholder" }

function t.useReactiveVar(p1)
	-- upvalues: useState (ref), useEffect (ref), t_1 (ref)
	local var1 = p1()
	local _, var2 = useState(var1)
	useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var2 (ref)
		local var3 = p1()
		
		if var1 == var3 then
			return p1:onNextChange(var2)
		end
		var2(var3)
	end, { var1 or t_1 })
	
	return var1
end

return t