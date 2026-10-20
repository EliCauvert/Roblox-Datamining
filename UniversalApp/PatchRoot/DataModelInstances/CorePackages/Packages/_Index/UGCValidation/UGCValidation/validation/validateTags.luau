local CollectionService = game:GetService("CollectionService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

return function(Object, p1)
	-- upvalues: CollectionService (copy), AnalyticsModule (copy)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local List = {}
	
	for _, descendant in ipairs(Descendants) do
		if #CollectionService:GetTags(descendant) > 0 then
			table.insert(List, descendant)
		end
	end
	if #List > 0 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTags, nil, p1)
		
		return false, {}
	else
		return true
	end
end