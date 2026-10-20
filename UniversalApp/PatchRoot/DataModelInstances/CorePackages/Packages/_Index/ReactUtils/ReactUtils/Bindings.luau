local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local BindingsModule = {
	map = function(BindingResult, p1)
		return BindingResult:map(p1)
	end,
	binding = function(JoinBindingsResult)
		return JoinBindingsResult
	end
}

function BindingsModule.useBinding(p1)
	-- upvalues: ReactModule (copy), BindingsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1)
	
	return BindingsModule.binding(UseBindingResult), UseBindingResult2
end

function BindingsModule.createBinding(p1)
	-- upvalues: ReactModule (copy), BindingsModule (copy)
	local Binding, Binding2 = ReactModule.createBinding(p1)
	
	return BindingsModule.binding(Binding), Binding2
end

function BindingsModule.joinBindings2(First, Second)
	-- upvalues: BindingsModule (copy), ReactModule (copy)
	return BindingsModule.binding(ReactModule.joinBindings({ first = First, second = Second }))
end

function BindingsModule.mapBindings2(First, Second, Callback)
	-- upvalues: BindingsModule (copy), ReactModule (copy)
	return BindingsModule.map(BindingsModule.binding(ReactModule.joinBindings({ first = First, second = Second })), function(p1)
		-- upvalues: Callback (copy)
		return Callback(p1.first, p1.second)
	end)
end

function BindingsModule.joinBindings3(First, Second, Third)
	-- upvalues: BindingsModule (copy), ReactModule (copy)
	return BindingsModule.binding(ReactModule.joinBindings({ first = First, second = Second, third = Third }))
end

function BindingsModule.mapBindings3(First, Second, Third, Callback)
	-- upvalues: BindingsModule (copy), ReactModule (copy)
	return BindingsModule.map(BindingsModule.binding(ReactModule.joinBindings({ first = First, second = Second, third = Third })), function(p1)
		-- upvalues: Callback (copy)
		return Callback(p1.first, p1.second, p1.third)
	end)
end

function BindingsModule.mapBindings4(First, Second, Third, Fourth, Callback)
	-- upvalues: BindingsModule (copy), ReactModule (copy)
	return BindingsModule.map(BindingsModule.binding(ReactModule.joinBindings({
		first = First,
		second = Second,
		third = Third,
		fourth = Fourth
	})), function(p1)
		-- upvalues: Callback (copy)
		return Callback(p1.first, p1.second, p1.third, p1.fourth)
	end)
end

return BindingsModule