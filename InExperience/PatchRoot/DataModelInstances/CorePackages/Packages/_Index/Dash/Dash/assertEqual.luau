local parent = script.Parent

return function(p1, p2, p3)
	-- upvalues: parent (ref)
	if p1 ~= p2 then
		require(parent.Error).new("AssertError", p3 or `Left "{p0}" does not equal right "{p1}"`):throw({ left = p1, right = p2 })
	end
end