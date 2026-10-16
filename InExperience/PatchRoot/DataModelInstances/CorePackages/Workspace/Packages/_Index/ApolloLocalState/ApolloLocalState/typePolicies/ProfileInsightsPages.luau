local MergeListsModule = require(script.Parent.utils.mergeLists)

return {
	fields = {
		profileInsights = {
			merge = function(_, p1, p2) --[[ Line: 6 ]]
				-- upvalues: MergeListsModule (copy)
				return MergeListsModule(p1, p2)
			end
		}
	}
}