local whatsNew = script:FindFirstAncestor("WhatsNew")
local signalsReactModule = require(whatsNew.Parent.SignalsReact)
local _ = require(whatsNew.Types)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)

return function() --[[ line: 12 | named "useWhatsNewRuntimeState" ]]
	-- upvalues: getWhatsNewStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(getWhatsNewStoreModule().getRuntimeStateSignal)
end