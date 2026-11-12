local TransientUIOverlay = script:FindFirstAncestor("TransientUIOverlay")
local Parent = TransientUIOverlay.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTransientUIOverlayStoreModule = require(TransientUIOverlay.Stores.GetTransientUIOverlayStore)
local TransientDialogModule = require(TransientUIOverlay.Components.TransientDialog)
local TransientSnackbarModule = require(TransientUIOverlay.Components.TransientSnackbar)

return function(p1)
	-- upvalues: GetTransientUIOverlayStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), TransientSnackbarModule (copy), TransientDialogModule (copy)
	local TransientUIOverlayStoreModule = GetTransientUIOverlayStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(TransientUIOverlayStoreModule.currentSnackbar)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(TransientUIOverlayStoreModule.currentDialog)
	local DialogName: string = `Dialog-{SignalsReactModule.useSignalState(TransientUIOverlayStoreModule.dialogPresentationId)}`
	local v1 = nil
	
	if UseSignalStateResult ~= nil then
		local Copy = table.clone(UseSignalStateResult)
		Copy.device = p1.device
		v1 = Copy
	end
	local v2 = nil
	
	if UseSignalStateResult1 ~= nil then
		local Copy = table.clone(UseSignalStateResult1)
		Copy.device = p1.device
		v2 = Copy
	end
	ReactModule.useEffect(function()
		-- upvalues: TransientUIOverlayStoreModule (copy)
		return function()
			-- upvalues: TransientUIOverlayStoreModule (upval)
			TransientUIOverlayStoreModule.clearSnackbar()
			TransientUIOverlayStoreModule.clearDialog()
		end
	end, { TransientUIOverlayStoreModule })
	
	return ReactModule.createElement("ScreenGui", {
		[ReactModule.Tag] = "data-testid=transient-ui-overlay",
		DisplayOrder = p1.displayOrder or 202,
		IgnoreGuiInset = true,
		Name = "TransientUIOverlay",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Snackbar = if v1 == nil then nil else ReactModule.createElement(TransientSnackbarModule, v1),
		[DialogName] = if v2 == nil then nil else ReactModule.createElement(TransientDialogModule, v2)
	})
end