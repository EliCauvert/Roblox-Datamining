local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SearchTypes = require(Parent.RobloxAppEnums).SearchTypes
local IsSearchTypeInOmniSearchFunction = require(Parent.DiscoveryUtils).isSearchTypeInOmniSearch
local _ = require(Parent.SduiCoreSystem)

return {
	resolveSearchQuery = function(p1)
		local ActionParams = if p1 then p1.actionParams else nil
		
		if ActionParams == nil then
			return nil
		else
			local SearchQuery = ActionParams.searchQuery
			
			return if typeof(SearchQuery) == "string" and SearchQuery ~= "" then SearchQuery else nil
		end
	end,
	resolveSearchType = function(p1)
		-- upvalues: SearchTypes (copy), IsSearchTypeInOmniSearchFunction (copy)
		local ActionParams = if p1 then p1.actionParams else nil
		local SearchType = if ActionParams then ActionParams.searchType else nil
		
		return if SearchType == nil or SearchType == "" then SearchTypes.TopResults elseif typeof(SearchType) == "string" and SearchTypes[SearchType] ~= nil and IsSearchTypeInOmniSearchFunction(SearchType) then SearchType else nil
	end
}