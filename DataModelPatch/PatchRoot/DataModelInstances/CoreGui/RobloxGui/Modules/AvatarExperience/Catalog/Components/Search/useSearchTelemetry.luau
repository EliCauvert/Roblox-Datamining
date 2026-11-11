local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SearchAutocompleteEventNewModule = require(Modules.LuaApp.Analytics.Events.searchAutocompleteEventNew)
local SearchTextTrimModule = require(Modules.LuaApp.Analytics.Events.searchTextTrim)
local SearchClearModule = require(Modules.LuaApp.Analytics.Events.searchClear)
local SearchSuggestionClickedModule = require(Modules.LuaApp.Analytics.Events.searchSuggestionClicked)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local NormalizeKeywordFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSearch).Utils.normalizeKeyword
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)

local function _()
	return { query = nil, time = tick() }
end

return function()
	-- upvalues: ReactModule (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetCurrentPageModule (copy), GetUseSelectorDeepEqualsFunction (copy), SearchAutocompleteEventNewModule (copy), RobloxAppEnumsModule (copy), SearchClearModule (copy), NormalizeKeywordFunction (copy), SearchSuggestionClickedModule (copy), SearchTextTrimModule (copy)
	local UseRefResult = ReactModule.useRef({ query = nil, time = tick() })
	local UseRefResult1 = ReactModule.useRef("")
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local Name = nil
	Name = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage).name else UseSelectorFunction(GetCurrentPageModule)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.AvatarExperience.AvatarAutocompleteSuggestions or {}
	end, GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function(Current, p1, p2)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), SearchAutocompleteEventNewModule (upval), UseRoactServiceModuleResult (copy), Name (ref), RobloxAppEnumsModule (upval)
		if not UseRefResult.current or not UseRefResult1.current then return end
		local Current1 = UseRefResult.current or {}
		
		if Current and Current == Current1.query and p1 then
			SearchAutocompleteEventNewModule(UseRoactServiceModuleResult, "AvatarShopSearch", Current, UseRefResult1.current, p1, Name, tick() - Current1.time, p2, RobloxAppEnumsModule.SearchTypes.Catalog)
			UseRefResult1.current = Current
			UseRefResult.current = { query = nil, time = tick() }
			
			return
		end
	end, {})
	
	local function SendClearEvent(p1)
		-- upvalues: SearchClearModule (upval), UseRoactServiceModuleResult (copy), RobloxAppEnumsModule (upval)
		SearchClearModule(UseRoactServiceModuleResult, "AvatarShopSearch", p1, RobloxAppEnumsModule.SearchTypes.Catalog)
	end
	
	local function SendAutocompleteTermClickedEvent(p1, Text: string)
		-- upvalues: UseSelectorResult (copy), NormalizeKeywordFunction (upval), SearchSuggestionClickedModule (upval), UseRoactServiceModuleResult (copy), RobloxAppEnumsModule (upval)
		local UseSelectorResultEntry = UseSelectorResult[NormalizeKeywordFunction(p1)]
		
		if not UseSelectorResultEntry or not UseSelectorResultEntry.entries or not Text then return end
		local Entries = UseSelectorResultEntry.entries
		local v1 = nil
		local v2 = nil
		
		for i, entry in Entries do
			if string.lower(entry.searchQuery) == string.lower(Text) then
				v1 = i
				v2 = entry
				break
			end
		end
		if v2 and v1 then
			SearchSuggestionClickedModule(UseRoactServiceModuleResult, "AvatarShopSearch", p1, RobloxAppEnumsModule.SearchTypes.Catalog, Entries, v1, v2)
		end
	end
	
	local function UpdateQuery(Text: string)
		-- upvalues: UseRefResult (copy), SearchTextTrimModule (upval), UseRoactServiceModuleResult (copy), RobloxAppEnumsModule (upval), NormalizeKeywordFunction (upval), UseSelectorResult (copy), UseResult (copy)
		local Query = UseRefResult.current and UseRefResult.current.query
		UseRefResult.current = { query = Text, time = tick() }
		
		if Text and Query and string.len(Text) < string.len(Query) then
			SearchTextTrimModule(UseRoactServiceModuleResult, "AvatarShopSearch", Query, Text, RobloxAppEnumsModule.SearchTypes.Catalog)
		end
		local UseSelectorResultEntry = UseSelectorResult[NormalizeKeywordFunction(Text)]
		
		if UseSelectorResultEntry then
			UseResult(Text, UseSelectorResultEntry, true)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), NormalizeKeywordFunction (upval), UseSelectorResult (copy), UseResult (copy)
		local Query = UseRefResult.current and UseRefResult.current.query
		
		if Query then
			local UseSelectorResultEntry = UseSelectorResult[NormalizeKeywordFunction(Query)]
			
			if UseSelectorResultEntry then
				UseResult(Query, UseSelectorResultEntry, false)
			end
		end
	end, { UseSelectorResult, UseResult })
	
	return {
		updateQuery = UpdateQuery,
		sendClearEvent = SendClearEvent,
		sendAutocompleteTermClickedEvent = SendAutocompleteTermClickedEvent
	}
end