return function(p0, p1) --[[ line: 3 ]]
	return if p0 == nil or p1 == nil then false else p0.UserInputType == Enum.UserInputType.Touch and p1 ~= p0
end