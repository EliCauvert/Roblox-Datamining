return function(p1, p2)
	p2:connect(function(p3)
		-- upvalues: p1 (ref)
		p1:SetMenuIsOpen(p3, "in_experience_shop")
	end)
end