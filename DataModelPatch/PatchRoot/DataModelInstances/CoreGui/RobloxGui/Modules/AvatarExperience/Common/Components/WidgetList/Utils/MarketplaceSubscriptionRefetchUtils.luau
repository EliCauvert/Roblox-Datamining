return {
	getSearchKeywordFromSearchesParameters = function(p1, p2)
		if p2 then
			local State = p1:getState()
			local SearchesParameter = State.SearchesParameters and State.SearchesParameters[p2]
			
			return if SearchesParameter and SearchesParameter.searchKeyword then SearchesParameter.searchKeyword else nil
		else
			return nil
		end
	end,
	getShouldFetchCatalogOrganicAfterWidgets = function(p1, p2): boolean
		local v1: boolean = typeof(p2) == "string" and p2 ~= ""
		
		return not p1 or v1
	end
}