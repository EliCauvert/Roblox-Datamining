local _ = require(script.Parent.Stores.createUniversalShareSheetStore)
local getUniversalShareSheetStoreModule = require(script.Parent.Stores.GetUniversalShareSheetStore)

return {
	show = function(p0) --[[ line: 10 ]]
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().show(p0)
	end,
	hide = function() --[[ line: 14 ]]
		-- upvalues: getUniversalShareSheetStoreModule (ref)
		getUniversalShareSheetStoreModule().hide()
	end
}