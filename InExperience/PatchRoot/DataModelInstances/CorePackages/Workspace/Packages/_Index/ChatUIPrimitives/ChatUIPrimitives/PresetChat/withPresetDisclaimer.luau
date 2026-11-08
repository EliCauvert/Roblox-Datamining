local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)

local function hasPreset(p1): boolean
	for _, category in p1.categories do
		for _, item in category.items do
			if item.content.kind == "preset" then
				return true
			end
		end
	end
	return false
end

return function(List, Callback)
	-- upvalues: hasPreset (copy)
	local List1 = {}
	
	for _, value in List do
		if value.footerText == nil and hasPreset(value) then
			value = table.clone(value)
			value.footerText = Callback("Feature.Chat.PresetChat.Disclaimer")
		end
		table.insert(List1, value)
	end
	return List1
end