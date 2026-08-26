return function(p1)
	if type(p1) ~= "table" then
		return nil, `Type table required, got {type(p1)}.`
	end
	local features = p1.features
	
	if type(features) ~= "table" then
		return nil, `features field is required and must be a table, got {type(features)}.`
	end
	local t = {}
	
	for i, v in features do
		if type(v) == "table" and type(v.featureName) == "string" and type(v.access) == "string" then
			table.insert(t, { featureName = v.featureName, access = v.access })
		end
	end
	return { features = t }, nil
end