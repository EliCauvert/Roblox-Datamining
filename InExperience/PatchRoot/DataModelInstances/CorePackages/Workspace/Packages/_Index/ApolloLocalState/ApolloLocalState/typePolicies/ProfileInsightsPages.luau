local mergeListsModule = require(script.Parent.utils.mergeLists)

return {
	fields = {
		profileInsights = {
			merge = function(_, p0, p1)
				-- upvalues: mergeListsModule (ref)
				return mergeListsModule(p0, p1)
			end
		}
	}
}