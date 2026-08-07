local parent = script.Parent

return function(p0, p1, p2) --[[ line: 12 | named "assertEqual" ]]
	-- upvalues: parent (ref)
	if p0 ~= p1 then
		require(parent.Error).new("AssertError", p2 or `Left "{p0}" does not equal right "{p1}"`):throw({ left = p0, right = p1 })
	end
end