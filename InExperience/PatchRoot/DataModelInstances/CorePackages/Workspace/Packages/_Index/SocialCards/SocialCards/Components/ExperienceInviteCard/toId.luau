return function(Value)
	return if typeof(Value) == "number" then if Value > 0 and Value == math.floor(Value) and Value < 9007199254740992 then string.format("%d", Value) else nil elseif typeof(Value) == "string" and string.match(Value, "^[1-9]%d*$") then Value else nil
end