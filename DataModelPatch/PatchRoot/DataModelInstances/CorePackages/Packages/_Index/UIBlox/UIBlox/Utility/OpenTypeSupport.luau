local OpenTypeSupportModule = {}
OpenTypeSupportModule.__index = OpenTypeSupportModule

function OpenTypeSupportModule:getSupportedFeatures(): string
	return "zero, ss03"
end

function OpenTypeSupportModule:getPasswordStylisticAlternative(): string
	return "zero, ss03"
end

function OpenTypeSupportModule:getUserNameStylisticAlternative(): string
	return "zero, ss03"
end

return OpenTypeSupportModule