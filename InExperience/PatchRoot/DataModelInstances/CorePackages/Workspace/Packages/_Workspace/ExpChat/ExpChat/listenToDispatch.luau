return function(p0)
	return function(p1)
		-- upvalues: p0 (ref)
		p0.Event:Connect(p1)
	end
end