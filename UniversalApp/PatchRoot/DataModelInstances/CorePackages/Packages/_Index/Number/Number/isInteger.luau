return function(Value: number): boolean
	return type(Value) == "number" and (Value ~= 1e999 and Value == math.floor(Value))
end