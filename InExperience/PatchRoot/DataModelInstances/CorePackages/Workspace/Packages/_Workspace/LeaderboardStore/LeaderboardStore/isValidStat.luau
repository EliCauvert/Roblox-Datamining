return function(p0) --[[ line: 1 | named "isValidStat" ]]
	return p0:IsA("StringValue") or (p0:IsA("IntValue") or (p0:IsA("BoolValue") or (p0:IsA("NumberValue") or (p0:IsA("DoubleConstrainedValue") or p0:IsA("IntConstrainedValue")))))
end