local PPDebugLogging = game:DefineFastFlag("PPDebugLogging", false)

return function(Callback) --[[ Line: 3 ]]
	-- upvalues: PPDebugLogging (copy)
	if PPDebugLogging and Callback then
		print("[PurchasePrompt]" .. Callback())
		
		return
	end
end