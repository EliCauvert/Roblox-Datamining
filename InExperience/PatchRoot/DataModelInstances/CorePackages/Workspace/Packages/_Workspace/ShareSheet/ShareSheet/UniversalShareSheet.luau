local _ = require(script.Parent.Stores.createUniversalShareSheetStore)
local GetUniversalShareSheetStoreModule = require(script.Parent.Stores.GetUniversalShareSheetStore)

return {
	RecipientSource = require(script.Parent.Recipients.RecipientSource).RecipientSource,
	show = function(p1)
		-- upvalues: GetUniversalShareSheetStoreModule (copy)
		GetUniversalShareSheetStoreModule().show(p1)
	end,
	hide = function()
		-- upvalues: GetUniversalShareSheetStoreModule (copy)
		GetUniversalShareSheetStoreModule().hide()
	end
}