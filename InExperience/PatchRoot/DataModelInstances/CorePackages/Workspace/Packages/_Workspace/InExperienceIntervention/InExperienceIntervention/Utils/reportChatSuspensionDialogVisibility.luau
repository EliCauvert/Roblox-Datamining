local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")

return function(p1)
	-- upvalues: SSUIMetaLuaEngineFeature (ref)
	if SSUIMetaLuaEngineFeature then
		pcall(function()
			-- upvalues: p1 (ref)
			local safetyService = game:GetService("SafetyService")
			
			if p1 then
				safetyService:ReportChatSuspensionDialogOpen()
				
				return
			end
			safetyService:ReportChatSuspensionDialogClose()
		end)
	end
end