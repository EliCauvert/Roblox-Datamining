local _ = require(script.Parent.Stores.createUniversalShareSheetStore)
local getUniversalShareSheetStoreModule = require(script.Parent.Stores.GetUniversalShareSheetStore)

return {
	show = function(p0)
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().show(p0)
	end,
	hide = function()
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().hide()
	end
}