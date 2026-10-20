local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")

return function(p1)
	-- upvalues: SSUIMetaLuaEngineFeature (copy)
	if SSUIMetaLuaEngineFeature then
		pcall(function()
			-- upvalues: p1 (copy)
			local SafetyService = game:GetService("SafetyService")
			
			if p1 then
				SafetyService:ReportChatSuspensionDialogOpen()
				
				return
			else
				SafetyService:ReportChatSuspensionDialogClose()
			end
		end)
	end
end