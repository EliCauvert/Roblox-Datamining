return function(p1) --[[ Line: 1 | Named "isWirable" ]]
	return (pcall(function() --[[ Line: 2 ]]
		-- upvalues: p1 (copy)
		p1:GetInputPins()
		p1:GetOutputPins()
		p1:GetConnectedWires("Foo")
	end))
end