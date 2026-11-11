return function(Input, Input1): boolean
	return Input ~= nil and Input1 ~= nil and (Input.UserInputType == Enum.UserInputType.Touch and Input1 ~= Input)
end