local t = {}
t.__index = t

function t.getSupportedFeatures(_)
	return "zero, ss03"
end

function t.getPasswordStylisticAlternative(_)
	return "zero, ss03"
end

function t.getUserNameStylisticAlternative(_)
	return "zero, ss03"
end

return t