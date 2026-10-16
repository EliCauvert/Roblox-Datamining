local _ = require(script.Parent.Stores.createUniversalShareSheetStore)
local getUniversalShareSheetStoreModule = require(script.Parent.Stores.GetUniversalShareSheetStore)

return {
	show = function(p1)
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().show(p1)
	end,
	hide = function()
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().hide()
	end
}