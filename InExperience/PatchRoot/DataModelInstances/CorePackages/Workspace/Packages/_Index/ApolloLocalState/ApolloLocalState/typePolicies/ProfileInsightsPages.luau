local mergeListsModule = require(script.Parent.utils.mergeLists)

return {
	fields = {
		profileInsights = {
			merge = function(_, p1, p2)
				-- upvalues: mergeListsModule (ref)
				return mergeListsModule(p1, p2)
			end
		}
	}
}