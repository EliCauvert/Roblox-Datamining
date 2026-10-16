local CoreScriptSyncService = game:GetService("CoreScriptSyncService")

return function(Text: string, Pattern, p1) --[[ Line: 4 | Named "getFileInfo" ]]
	-- upvalues: CoreScriptSyncService (copy)
	local ModuleScript = game
	
	for _, ChildName in string.split(Text, ".") do
		if ModuleScript == nil then break end
		ModuleScript = ModuleScript:FindFirstChild(ChildName)
	end
	if typeof(ModuleScript) ~= "Instance" or not ModuleScript:IsA("ModuleScript") then
		warn("path led to non-ModuleScript:", Text, ModuleScript.ClassName)
		ModuleScript = nil
	end
	local Text1 = nil
	
	if ModuleScript then
		Text1 = CoreScriptSyncService:GetScriptFilePath(ModuleScript)
		
		if Pattern then
			local StartIndex, EndIndex = string.find(Text1, Pattern, 1, true)
			
			if StartIndex then
				Text1 = string.sub(Text1, if p1 then StartIndex else EndIndex + 1)
			end
		end
	end
	return ModuleScript, Text1
end