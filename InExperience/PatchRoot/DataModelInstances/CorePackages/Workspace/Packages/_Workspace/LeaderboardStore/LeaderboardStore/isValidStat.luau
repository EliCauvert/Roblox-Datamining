return function(p1)
	return p1:IsA("StringValue") or (p1:IsA("IntValue") or (p1:IsA("BoolValue") or (p1:IsA("NumberValue") or (p1:IsA("DoubleConstrainedValue") or p1:IsA("IntConstrainedValue")))))
end