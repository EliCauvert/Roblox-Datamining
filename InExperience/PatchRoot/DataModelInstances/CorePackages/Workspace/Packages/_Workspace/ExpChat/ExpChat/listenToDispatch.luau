return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		p1.Event:Connect(p2)
	end
end