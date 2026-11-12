local GetTransientUIOverlayStoreModule = require(script.Stores.GetTransientUIOverlayStore)
local _ = require(script.Types)

return {
	["jest.config"] = script["jest.config"],
	GetTransientUIOverlayStore = GetTransientUIOverlayStoreModule,
	OverlayScreen = require(script.OverlayScreen),
	displayDialog = function(p1)
		-- upvalues: GetTransientUIOverlayStoreModule (copy)
		GetTransientUIOverlayStoreModule(false).displayDialog(p1)
	end,
	displaySnackbar = function(p1, p2)
		-- upvalues: GetTransientUIOverlayStoreModule (copy)
		GetTransientUIOverlayStoreModule(false).displaySnackbar(p1, p2)
	end,
	clearDialog = function()
		-- upvalues: GetTransientUIOverlayStoreModule (copy)
		GetTransientUIOverlayStoreModule(false).clearDialog()
	end,
	clearSnackbar = function()
		-- upvalues: GetTransientUIOverlayStoreModule (copy)
		GetTransientUIOverlayStoreModule(false).clearSnackbar()
	end
}