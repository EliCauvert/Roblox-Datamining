local PPDebugLogging = game:DefineFastFlag("PPDebugLogging", false)

return function(p0) --[[ line: 3 ]]
	-- upvalues: PPDebugLogging (ref)
	if PPDebugLogging and p0 then
		print("[PurchasePrompt]" .. p0())
		
		return
	end
end