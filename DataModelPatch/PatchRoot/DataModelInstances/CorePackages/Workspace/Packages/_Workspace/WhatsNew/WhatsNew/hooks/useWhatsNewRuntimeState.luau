local WhatsNew = script:FindFirstAncestor("WhatsNew")
local SignalsReactModule = require(WhatsNew.Parent.SignalsReact)
local _ = require(WhatsNew.Types)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)

return function()
	-- upvalues: GetWhatsNewStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState(GetWhatsNewStoreModule().getRuntimeStateSignal)
end