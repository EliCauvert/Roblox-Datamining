local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local SafeAppStorageService = require(AvatarExperienceSearch.Parent.AXCommon).Lib.SafeAppStorageService
local GetLocalUserIdModule = require(script.Parent.getLocalUserId)
local GetAutocompleteQueryKeyModule = require(script.Parent.getAutocompleteQueryKey)
local MarketplaceQueryNormalizerModule = require(script.Parent.MarketplaceQueryNormalizer)
local GetFIntAXMaxRecentSearchTermsModule = require(AvatarExperienceSearch.Flags.GetFIntAXMaxRecentSearchTerms)

local function _()
	-- upvalues: GetLocalUserIdModule (copy), Players (copy)
	return GetLocalUserIdModule(Players) or "defaultUserId"
end

return function(p1, p2)
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), SafeAppStorageService (copy), HttpService (copy), GetAutocompleteQueryKeyModule (copy), MarketplaceQueryNormalizerModule (copy), GetFIntAXMaxRecentSearchTermsModule (copy)
	local IsUseMemoryStorage: boolean = if p2 then p2.useMemoryStorage == true else false
	
	local function getTerms()
		-- upvalues: GetLocalUserIdModule (upval), Players (upval), SafeAppStorageService (upval), p1 (copy), IsUseMemoryStorage (copy), HttpService (upval)
		local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
		local Item = SafeAppStorageService.getItem(p1, IsUseMemoryStorage)
		
		if not Item or Item == "" then
			Item = "{}"
		end
		local Terms = {}
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Item (ref), LocalUserIdModule (copy), Terms (ref)
			local Data = HttpService:JSONDecode(Item)
			
			if Data.userId == LocalUserIdModule then
				Terms = Data.terms or {}
			end
		end)
		
		if Success == false then
			warn(`createRecentSearchTermsStorage({p1}) getTerms JSONDecode error: {Result}`)
		end
		return Terms
	end
	
	local function getTermsWithout(NormalizeQueryWhitespaceResult)
		-- upvalues: getTerms (copy), GetAutocompleteQueryKeyModule (upval)
		local Terms = getTerms()
		local AutocompleteQueryKeyModule = GetAutocompleteQueryKeyModule(NormalizeQueryWhitespaceResult)
		
		if AutocompleteQueryKeyModule == nil then
			return Terms
		end
		for i, term in Terms do
			if GetAutocompleteQueryKeyModule(term) == AutocompleteQueryKeyModule then
				table.remove(Terms, i)
				
				return Terms
			end
		end
		return Terms
	end
	
	local function _(Terms)
		-- upvalues: GetLocalUserIdModule (upval), Players (upval), HttpService (upval), SafeAppStorageService (upval), p1 (copy), IsUseMemoryStorage (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), LocalUserIdModule (copy), Terms (copy), SafeAppStorageService (upval), p1 (upval), IsUseMemoryStorage (upval)
			SafeAppStorageService.setItem(p1, HttpService:JSONEncode({ userId = LocalUserIdModule, terms = Terms }), IsUseMemoryStorage)
			SafeAppStorageService.flush()
		end)
		
		if Success == false then
			warn(`createRecentSearchTermsStorage({p1}) saveTerms JSONEncode error: {Result}`)
		end
	end
	
	return {
		getTerms = getTerms,
		addTerm = function(p3)
			-- upvalues: getTerms (copy), MarketplaceQueryNormalizerModule (upval), GetAutocompleteQueryKeyModule (upval), getTermsWithout (copy), GetFIntAXMaxRecentSearchTermsModule (upval), GetLocalUserIdModule (upval), Players (upval), HttpService (upval), SafeAppStorageService (upval), p1 (copy), IsUseMemoryStorage (copy)
			if p3 == nil or p3 == "" then
				return (getTerms())
			end
			local NormalizeQueryWhitespaceResult = MarketplaceQueryNormalizerModule.normalizeQueryWhitespace(p3)
			
			if NormalizeQueryWhitespaceResult == nil or GetAutocompleteQueryKeyModule(NormalizeQueryWhitespaceResult) == nil then
				return (getTerms())
			end
			local TermsWithout = getTermsWithout(NormalizeQueryWhitespaceResult)
			table.insert(TermsWithout, 1, NormalizeQueryWhitespaceResult)
			
			if GetFIntAXMaxRecentSearchTermsModule() < #TermsWithout then
				table.remove(TermsWithout)
			end
			local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), LocalUserIdModule (copy), TermsWithout (copy), SafeAppStorageService (upval), p1 (upval), IsUseMemoryStorage (upval)
				SafeAppStorageService.setItem(p1, HttpService:JSONEncode({ userId = LocalUserIdModule, terms = TermsWithout }), IsUseMemoryStorage)
				SafeAppStorageService.flush()
			end)
			
			if Success == false then
				warn(`createRecentSearchTermsStorage({p1}) saveTerms JSONEncode error: {Result}`)
			end
			return TermsWithout
		end,
		removeTerm = function(p3)
			-- upvalues: getTerms (copy), getTermsWithout (copy), GetLocalUserIdModule (upval), Players (upval), HttpService (upval), SafeAppStorageService (upval), p1 (copy), IsUseMemoryStorage (copy)
			if p3 == nil or p3 == "" then
				return (getTerms())
			end
			local TermsWithout = getTermsWithout(p3)
			local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), LocalUserIdModule (copy), TermsWithout (copy), SafeAppStorageService (upval), p1 (upval), IsUseMemoryStorage (upval)
				SafeAppStorageService.setItem(p1, HttpService:JSONEncode({ userId = LocalUserIdModule, terms = TermsWithout }), IsUseMemoryStorage)
				SafeAppStorageService.flush()
			end)
			
			if Success == false then
				warn(`createRecentSearchTermsStorage({p1}) saveTerms JSONEncode error: {Result}`)
			end
			return TermsWithout
		end,
		findTermsForQuery = function(p3)
			-- upvalues: getTerms (copy), GetAutocompleteQueryKeyModule (upval)
			local Terms = getTerms()
			
			if p3 == nil or p3 == "" then
				return Terms
			end
			local AutocompleteQueryKeyModule = GetAutocompleteQueryKeyModule(p3)
			
			if AutocompleteQueryKeyModule == nil then
				return Terms
			end
			local List = {}
			
			for _, term in Terms do
				local AutocompleteQueryKeyModule1: string = GetAutocompleteQueryKeyModule(term)
				
				if AutocompleteQueryKeyModule1 and string.sub(AutocompleteQueryKeyModule1, 1, #AutocompleteQueryKeyModule) == AutocompleteQueryKeyModule then
					table.insert(List, term)
				end
			end
			return List
		end,
		clearTerms = function()
			-- upvalues: SafeAppStorageService (upval), p1 (copy), IsUseMemoryStorage (copy)
			SafeAppStorageService.setItem(p1, "{}", IsUseMemoryStorage)
			SafeAppStorageService.flush()
		end
	}
end