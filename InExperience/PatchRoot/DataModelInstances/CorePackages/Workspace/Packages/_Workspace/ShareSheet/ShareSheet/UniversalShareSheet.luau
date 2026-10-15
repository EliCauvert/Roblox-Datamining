local _ = require(script.Parent.Stores.createUniversalShareSheetStore)
local getUniversalShareSheetStoreModule = require(script.Parent.Stores.GetUniversalShareSheetStore)

return {
	RecipientSource = require(script.Parent.Recipients.RecipientSource).RecipientSource,
	show = function(p1)
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().show(p1)
	end,
	hide = function()
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().hide()
	end
}