return function(p1, p2)
	return if p1 == nil or p2 == nil then false else p1.UserInputType == Enum.UserInputType.Touch and p2 ~= p1
end