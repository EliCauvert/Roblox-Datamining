local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local GetLocalUserIdModule = require(script.Parent.getLocalUserId)
local GetFIntAXMaxRecentSearchTermsModule = require(script:FindFirstAncestor("AvatarExperienceSearch").Flags.GetFIntAXMaxRecentSearchTerms)
local AppStorageService = game:GetService("AppStorageService")

local function getMockAppStorageService()
	return {
		storage = {},
		GetItem = function(p1, p2)
			return p1.storage[p2]
		end,
		SetItem = function(p1, p2, Json)
			p1.storage[p2] = Json
		end,
		Flush = function(_) end
	}
end

if not game:GetEngineFeature("AXMarketplaceRecentSearchesStorageKey") then
	AppStorageService = getMockAppStorageService()
end
local function _()
	-- upvalues: GetLocalUserIdModule (copy), Players (copy)
	return GetLocalUserIdModule(Players) or "defaultUserId"
end

local function getTerms()
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), AppStorageService (ref), HttpService (copy)
	local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
	local AXMarketplaceRecentSearchesItem = AppStorageService:GetItem("AXMarketplaceRecentSearches") or "{}"
	local Terms = {}
	pcall(function()
		-- upvalues: HttpService (upval), AXMarketplaceRecentSearchesItem (copy), LocalUserIdModule (copy), Terms (ref)
		local Data = HttpService:JSONDecode(AXMarketplaceRecentSearchesItem)
		
		if Data.userId == LocalUserIdModule then
			Terms = Data.terms or {}
		end
	end)
	
	return Terms
end

local function removeTerm(Text: string)
	-- upvalues: getTerms (copy)
	local Terms = getTerms()
	
	for i, term in Terms do
		if string.lower(term) == string.lower(Text) then
			table.remove(Terms, i)
			
			return Terms
		end
	end
	return Terms
end

local _ = function(List)
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), HttpService (copy), AppStorageService (ref)
	local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
	pcall(function()
		-- upvalues: HttpService (upval), LocalUserIdModule (copy), List (copy), AppStorageService (upval)
		AppStorageService:SetItem("AXMarketplaceRecentSearches", (HttpService:JSONEncode({ userId = LocalUserIdModule, terms = List })))
		AppStorageService:Flush()
	end)
end

return {
	__mockAppStorageService = function(p1)
		-- upvalues: AppStorageService (ref), getMockAppStorageService (copy)
		AppStorageService = if p1 then p1 else getMockAppStorageService()
	end,
	clearTerms = function()
		-- upvalues: AppStorageService (ref)
		AppStorageService:SetItem("AXMarketplaceRecentSearches", "{}")
		AppStorageService:Flush()
	end,
	getTerms = function()
		-- upvalues: getTerms (copy)
		return (getTerms())
	end,
	removeTerm = function(p1)
		-- upvalues: getTerms (copy), removeTerm (copy), GetLocalUserIdModule (copy), Players (copy), HttpService (copy), AppStorageService (ref)
		if p1 == nil or p1 == "" then
			return (getTerms())
		else
			local RemoveTermResult = removeTerm(p1)
			local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
			pcall(function()
				-- upvalues: HttpService (upval), LocalUserIdModule (copy), RemoveTermResult (copy), AppStorageService (upval)
				AppStorageService:SetItem("AXMarketplaceRecentSearches", (HttpService:JSONEncode({ userId = LocalUserIdModule, terms = RemoveTermResult })))
				AppStorageService:Flush()
			end)
			
			return RemoveTermResult
		end
	end,
	addTerm = function(p1)
		-- upvalues: getTerms (copy), removeTerm (copy), GetFIntAXMaxRecentSearchTermsModule (copy), GetLocalUserIdModule (copy), Players (copy), HttpService (copy), AppStorageService (ref)
		if p1 == nil or p1 == "" then
			return (getTerms())
		end
		local RemoveTermResult = removeTerm(p1)
		table.insert(RemoveTermResult, 1, p1)
		
		if GetFIntAXMaxRecentSearchTermsModule() < #RemoveTermResult then
			table.remove(RemoveTermResult)
		end
		local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
		pcall(function()
			-- upvalues: HttpService (upval), LocalUserIdModule (copy), RemoveTermResult (copy), AppStorageService (upval)
			AppStorageService:SetItem("AXMarketplaceRecentSearches", (HttpService:JSONEncode({ userId = LocalUserIdModule, terms = RemoveTermResult })))
			AppStorageService:Flush()
		end)
		
		return RemoveTermResult
	end,
	findTermsForQuery = function(Text: string)
		-- upvalues: getTerms (copy)
		local Terms = getTerms()
		
		if Text == nil or Text == "" then
			return Terms
		end
		local List = {}
		
		for _, term in Terms do
			if string.lower((string.sub(term, 1, (string.len(Text))))) == string.lower(Text) then
				table.insert(List, term)
			end
		end
		return List
	end
}