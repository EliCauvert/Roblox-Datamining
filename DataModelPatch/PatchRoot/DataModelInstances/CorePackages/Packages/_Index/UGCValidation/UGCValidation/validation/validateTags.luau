local CollectionService = game:GetService("CollectionService")
local Parent = script.Parent.Parent
local GetFFlagUGCValidationEnableFolderStructureModule = require(Parent.flags.getFFlagUGCValidationEnableFolderStructure)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

return function(Object, p1)
	-- upvalues: CollectionService (copy), AnalyticsModule (copy), GetFFlagUGCValidationEnableFolderStructureModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local List = {}
	
	for _, descendant in ipairs(Descendants) do
		if #CollectionService:GetTags(descendant) > 0 then
			table.insert(List, descendant)
		end
	end
	if #List <= 0 then
		return true
	end
	local FullNames = {
		"Found the following instance tags which are not allowed:"
	}
	
	for _, value in ipairs(List) do
		table.insert(FullNames, value:GetFullName())
	end
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTags, nil, p1)
	
	if GetFFlagUGCValidationEnableFolderStructureModule() and GetFFlagUGCValidationCombineEntrypointResultsModule() then
		return false, {}
	else
		return false, FullNames
	end
end