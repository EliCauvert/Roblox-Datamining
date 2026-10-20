local PromptTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.PromptType)

return function(p1)
	-- upvalues: PromptTypeModule (copy)
	if typeof(p1) ~= "table" or #p1 == 0 then
		return p1
	end
	local List = {}
	
	for i = 1, #p1 do
		local v1 = p1[i]
		
		if v1 and PromptTypeModule.fromRawValue(v1.promptType) ~= PromptTypeModule.PasskeyUpsell then
			table.insert(List, v1)
		end
	end
	return List
end