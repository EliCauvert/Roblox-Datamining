local AppChat = script:FindFirstAncestor("AppChat")
local ActionHandlers = require(AppChat.Parent.SignalsMiddleware).ActionHandlers
local FFlagAppChatUseSignalsForLastEntryPointModule = require(AppChat.Flags.FFlagAppChatUseSignalsForLastEntryPoint)
local FFlagAppChatUseSignalsForExternalNavigationRequestModule = require(AppChat.Flags.FFlagAppChatUseSignalsForExternalNavigationRequest)

return function(p1)
	-- upvalues: FFlagAppChatUseSignalsForLastEntryPointModule (copy), ActionHandlers (copy), AppChat (copy), FFlagAppChatUseSignalsForExternalNavigationRequestModule (copy)
	if FFlagAppChatUseSignalsForLastEntryPointModule then
		ActionHandlers.register(p1, "EnteredChatFromEntryPoint", function(p2): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetLastEntryPointStore)(false).enteredChatFromEntryPoint(p2.entryPoint)
			
			return false
		end)
	end
	if FFlagAppChatUseSignalsForExternalNavigationRequestModule then
		ActionHandlers.register(p1, "NavigateIntoChat", function(p2): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetExternalNavigationRequestStore)(false).navigateIntoChat(p2.screen, p2.params)
			
			return false
		end)
	end
end