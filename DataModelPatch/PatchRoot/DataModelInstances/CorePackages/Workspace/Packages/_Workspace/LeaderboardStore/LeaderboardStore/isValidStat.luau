return function(Object)
	return Object:IsA("StringValue") or (Object:IsA("IntValue") or (Object:IsA("BoolValue") or (Object:IsA("NumberValue") or (Object:IsA("DoubleConstrainedValue") or Object:IsA("IntConstrainedValue")))))
end