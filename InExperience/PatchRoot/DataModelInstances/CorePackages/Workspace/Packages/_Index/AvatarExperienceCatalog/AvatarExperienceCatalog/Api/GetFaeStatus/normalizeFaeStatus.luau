return function(p0) --[[ line: 10 | named "normalizeFaeStatus" ]]
	if type(p0) ~= "table" then
		return nil, `Type table required, got {type(p0)}.`
	end
	local features = p0.features
	
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