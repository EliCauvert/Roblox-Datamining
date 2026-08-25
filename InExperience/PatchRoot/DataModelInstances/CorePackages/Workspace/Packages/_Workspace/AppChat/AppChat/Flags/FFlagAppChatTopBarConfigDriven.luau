local fFlagAppChatTopBarSignalsStoreModule = require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatTopBarSignalsStore)
game:DefineFastFlag("AppChatTopBarConfigDrivenV6", false)

return function()
	-- upvalues: fFlagAppChatTopBarSignalsStoreModule (ref)
	return game:GetFastFlag("AppChatTopBarConfigDrivenV6") and fFlagAppChatTopBarSignalsStoreModule
end