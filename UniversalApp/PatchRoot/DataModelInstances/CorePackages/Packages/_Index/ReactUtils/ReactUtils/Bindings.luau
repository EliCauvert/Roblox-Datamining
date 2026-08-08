local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local t = {
	map = function(p0, p1) --[[ line: 27 ]]
		return p0:map(p1)
	end,
	binding = function(p2) --[[ line: 32 ]]
		return p2
	end
}

function t.useBinding(p3) --[[ line: 36 ]]
	-- upvalues: reactModule (ref), t (ref)
	local var2, var3 = reactModule.useBinding(p3)
	
	return t.binding(var2), var3
end

function t.createBinding(p4) --[[ line: 41 ]]
	-- upvalues: reactModule (ref), t (ref)
	local var4, var5 = reactModule.createBinding(p4)
	
	return t.binding(var4), var5
end

function t.joinBindings2(p5, p6) --[[ line: 46 ]]
	-- upvalues: t (ref), reactModule (ref)
	return t.binding(reactModule.joinBindings({ first = p5, second = p6 }))
end

function t.mapBindings2(p7, p8, p9) --[[ line: 53 ]]
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p7, second = p8 })), function(p10) --[[ line: 59 ]]
		-- upvalues: p9 (ref)
		return p9(p10.first, p10.second)
	end)
end

function t.joinBindings3(p11, p12, p13) --[[ line: 65 ]]
	-- upvalues: t (ref), reactModule (ref)
	return t.binding(reactModule.joinBindings({ first = p11, second = p12, third = p13 }))
end

function t.mapBindings3(p14, p15, p16, p17) --[[ line: 77 ]]
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p14, second = p15, third = p16 })), function(p18) --[[ line: 89 ]]
		-- upvalues: p17 (ref)
		return p17(p18.first, p18.second, p18.third)
	end)
end

function t.mapBindings4(p19, p20, p21, p22, p23) --[[ line: 95 ]]
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p19, second = p20, third = p21, fourth = p22 })), function(p24) --[[ line: 109 ]]
		-- upvalues: p23 (ref)
		return p23(p24.first, p24.second, p24.third, p24.fourth)
	end)
end

return t