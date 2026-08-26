local PPDebugLogging = game:DefineFastFlag("PPDebugLogging", false)

return function(p1)
	-- upvalues: PPDebugLogging (ref)
	if PPDebugLogging and p1 then
		print("[PurchasePrompt]" .. p0())
		
		return
	end
end