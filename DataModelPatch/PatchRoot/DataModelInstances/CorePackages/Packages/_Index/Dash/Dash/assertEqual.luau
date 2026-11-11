local Parent = script.Parent

return function(Left, Right, p1)
	-- upvalues: Parent (copy)
	if Left ~= Right then
		require(Parent.Error).new("AssertError", p1 or `Left "{Left}" does not equal right "{Right}"`):throw({ left = Left, right = Right })
	end
end