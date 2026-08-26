local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local searchTypes = require(parent.RobloxAppEnums).SearchTypes
local isSearchTypeInOmniSearch = require(parent.DiscoveryUtils).isSearchTypeInOmniSearch
local _ = require(parent.SduiCoreSystem)

return {
	resolveSearchQuery = function(p1)
		local var1 = if p1 then p1.actionParams else nil
		
		if var1 == nil then
			return nil
		end
		local searchQuery = var1.searchQuery
		
		return if typeof(searchQuery) == "string" and searchQuery ~= "" then searchQuery else nil
	end,
	resolveSearchType = function(p1)
		-- upvalues: searchTypes (ref), isSearchTypeInOmniSearch (ref)
		local var1 = if p1 then p1.actionParams else nil
		local var2 = if var1 then var1.searchType else nil
		
		return if var2 == nil or var2 == "" then searchTypes.TopResults elseif not (typeof(var2) ~= "string" or searchTypes[var2] == nil) then if isSearchTypeInOmniSearch(var2) then var2 else nil else nil
	end
}