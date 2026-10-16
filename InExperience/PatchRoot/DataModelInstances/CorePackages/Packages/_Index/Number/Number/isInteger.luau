return function(Value: number): boolean --[[ Line: 17 ]]
	return type(Value) == "number" and (Value ~= 1e999 and Value == math.floor(Value))
end