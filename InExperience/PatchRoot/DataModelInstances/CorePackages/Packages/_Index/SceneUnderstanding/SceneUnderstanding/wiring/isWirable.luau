return function(p0) --[[ line: 1 | named "isWirable" ]]
	return pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref)
		p0:GetInputPins()
		p0:GetOutputPins()
		p0:GetConnectedWires("Foo")
	end)
end