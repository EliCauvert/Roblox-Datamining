return function(p1)
	if type(p1) ~= "table" then
		return nil, `Type table required, got {type(p1)}.`
	end
	local Features = p1.features
	
	if type(Features) ~= "table" then
		return nil, `features field is required and must be a table, got {type(Features)}.`
	end
	local Features1 = {}
	
	for _, feature in Features do
		if type(feature) == "table" and type(feature.featureName) == "string" and type(feature.access) == "string" then
			table.insert(Features1, {
				featureName = feature.featureName,
				access = feature.access
			})
		end
	end
	return { features = Features1 }, nil
end