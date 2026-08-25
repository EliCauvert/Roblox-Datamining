local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p0, p1)
	-- upvalues: collectionService (ref), analyticsModule (ref)
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local t = {}
	
	for i, v in ipairs(descendants) do
		if #collectionService:GetTags(v) > 0 then
			table.insert(t, v)
		end
	end
	if #t > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTags, nil, p1)
		
		return false, {}
	end
	return true
end