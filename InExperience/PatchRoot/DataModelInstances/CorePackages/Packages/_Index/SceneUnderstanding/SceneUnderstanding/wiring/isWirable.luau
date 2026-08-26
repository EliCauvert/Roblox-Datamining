return function(p1)
	return pcall(function()
		-- upvalues: p1 (ref)
		p1:GetInputPins()
		p1:GetOutputPins()
		p1:GetConnectedWires("Foo")
	end)
end