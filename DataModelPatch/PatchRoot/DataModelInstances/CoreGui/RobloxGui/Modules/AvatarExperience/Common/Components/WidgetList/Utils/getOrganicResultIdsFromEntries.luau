local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.WidgetList.Types)

return function(List)
	local List1 = {}
	
	for _, value in List do
		if value.id and value.type then
			table.insert(List1, value.type .. value.id)
		end
	end
	return List1
end