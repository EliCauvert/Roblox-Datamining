return function(p0)
	return pcall(function()
		-- upvalues: p0 (ref)
		p0:GetInputPins()
		p0:GetOutputPins()
		p0:GetConnectedWires("Foo")
	end)
end