local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local t = {
	map = function(p1, p2)
		return p1:map(p2)
	end,
	binding = function(p1)
		return p1
	end
}

function t.useBinding(p1)
	-- upvalues: reactModule (ref), t (ref)
	local var1, var2 = reactModule.useBinding(p1)
	
	return t.binding(var1), var2
end

function t.createBinding(p1)
	-- upvalues: reactModule (ref), t (ref)
	local var1, var2 = reactModule.createBinding(p1)
	
	return t.binding(var1), var2
end

function t.joinBindings2(p1, p2)
	-- upvalues: t (ref), reactModule (ref)
	return t.binding(reactModule.joinBindings({ first = p1, second = p2 }))
end

function t.mapBindings2(p1, p2, p3)
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p1, second = p2 })), function(p4)
		-- upvalues: p3 (ref)
		return p3(p4.first, p4.second)
	end)
end

function t.joinBindings3(p1, p2, p3)
	-- upvalues: t (ref), reactModule (ref)
	return t.binding(reactModule.joinBindings({ first = p1, second = p2, third = p3 }))
end

function t.mapBindings3(p1, p2, p3, p4)
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p1, second = p2, third = p3 })), function(p5)
		-- upvalues: p4 (ref)
		return p4(p5.first, p5.second, p5.third)
	end)
end

function t.mapBindings4(p1, p2, p3, p4, p5)
	-- upvalues: t (ref), reactModule (ref)
	return t.map(t.binding(reactModule.joinBindings({ first = p1, second = p2, third = p3, fourth = p4 })), function(p6)
		-- upvalues: p5 (ref)
		return p5(p6.first, p6.second, p6.third, p6.fourth)
	end)
end

return t