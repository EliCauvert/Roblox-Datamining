local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p1, p2)
	-- upvalues: collectionService (ref), analyticsModule (ref)
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	local t = {}
	
	for i, v in ipairs(descendants) do
		if #collectionService:GetTags(v) > 0 then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTags, nil, p2)
		
		return false, {}
	end
	return true
end