local FFlagAppChatTopBarSignalsStoreModule = require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatTopBarSignalsStore)
game:DefineFastFlag("AppChatTopBarConfigDrivenV6", false)

return function()
	-- upvalues: FFlagAppChatTopBarSignalsStoreModule (copy)
	return game:GetFastFlag("AppChatTopBarConfigDrivenV6") and FFlagAppChatTopBarSignalsStoreModule
end