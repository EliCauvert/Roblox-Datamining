local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.WidgetList.Types)

return function(List1, p1, p2)
	local t = {}
	
	for i = 1, p1 do
		t[i] = {}
	end
	for i1, value in List1 do
		local List = t[math.ceil(i1 / p2)]
		
		if List then
			table.insert(List, value)
		end
	end
	return t
end