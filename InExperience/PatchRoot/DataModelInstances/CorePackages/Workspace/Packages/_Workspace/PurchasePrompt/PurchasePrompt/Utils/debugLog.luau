local PPDebugLogging = game:DefineFastFlag("PPDebugLogging", false)

return function(Callback)
	-- upvalues: PPDebugLogging (copy)
	if PPDebugLogging and Callback then
		print("[PurchasePrompt]" .. Callback())
		
		return
	end
end