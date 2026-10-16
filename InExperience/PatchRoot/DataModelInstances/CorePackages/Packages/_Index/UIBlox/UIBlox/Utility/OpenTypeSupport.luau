local OpenTypeSupportModule = {}
OpenTypeSupportModule.__index = OpenTypeSupportModule

function OpenTypeSupportModule:getSupportedFeatures(): string --[[ Line: 5 ]]
	return "zero, ss03"
end

function OpenTypeSupportModule:getPasswordStylisticAlternative(): string --[[ Line: 9 ]]
	return "zero, ss03"
end

function OpenTypeSupportModule:getUserNameStylisticAlternative(): string --[[ Line: 13 ]]
	return "zero, ss03"
end

return OpenTypeSupportModule