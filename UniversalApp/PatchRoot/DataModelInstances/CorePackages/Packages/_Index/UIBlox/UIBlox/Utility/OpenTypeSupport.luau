local t = {}
t.__index = t

function t.getSupportedFeatures(_) --[[ line: 5 ]]
	return "zero, ss03"
end

function t.getPasswordStylisticAlternative(_) --[[ line: 9 ]]
	return "zero, ss03"
end

function t.getUserNameStylisticAlternative(_) --[[ line: 13 ]]
	return "zero, ss03"
end

return t