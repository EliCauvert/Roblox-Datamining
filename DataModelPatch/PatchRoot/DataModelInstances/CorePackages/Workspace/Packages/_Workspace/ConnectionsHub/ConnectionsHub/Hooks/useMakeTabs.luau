local UseLocalizationFunction = require(script:FindFirstAncestor("ConnectionsHub").Parent.Localization).Hooks.useLocalization

return function(List)
	-- upvalues: UseLocalizationFunction (copy)
	local TextKeys = {}
	
	for _, value in List do
		TextKeys[value.id] = value.textKey
	end
	local UseLocalizationResult = UseLocalizationFunction(TextKeys)
	local List1 = {}
	
	for _, value1 in List do
		table.insert(List1, { id = value1.id, text = UseLocalizationResult[value1.id] })
	end
	return List1
end