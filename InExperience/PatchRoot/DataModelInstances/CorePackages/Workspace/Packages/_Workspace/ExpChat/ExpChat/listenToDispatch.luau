return function(p0) --[[ line: 1 ]]
	return function(p1) --[[ line: 2 ]]
		-- upvalues: p0 (ref)
		p0.Event:Connect(p1)
	end
end