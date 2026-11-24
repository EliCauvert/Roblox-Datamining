local Parent = script:FindFirstAncestor("SearchResults").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local PromiseModule = require(Parent.Promise)
local SearchAutocompleteSurfaceModule = require(script.Parent.SearchAutocompleteSurface)
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiErrors = SduiCoreSystemModule.SduiErrors
local Flag = false

local function hasAutocompleteTemplates(): boolean
	-- upvalues: SduiSharedUtilitiesModule (copy), SearchAutocompleteSurfaceModule (copy)
	local SduiTemplateStore = SduiSharedUtilitiesModule.getSduiTemplateStore()
	local CachedRobloxComponentToTemplateId = SduiTemplateStore.getCachedRobloxComponentToTemplateId(SearchAutocompleteSurfaceModule)
	local SearchAutocompleteList = CachedRobloxComponentToTemplateId.SearchAutocompleteList
	local SearchAutocompleteSuggestion = CachedRobloxComponentToTemplateId.SearchAutocompleteSuggestion
	
	return SearchAutocompleteList ~= nil and (SearchAutocompleteSuggestion ~= nil and (SduiTemplateStore.getTemplate(SearchAutocompleteList) ~= nil and SduiTemplateStore.getTemplate(SearchAutocompleteSuggestion) ~= nil))
end

return function()
	-- upvalues: SduiSharedUtilitiesModule (copy), PromiseModule (copy), SduiLoadTimer (copy), SearchAutocompleteSurfaceModule (copy), Flag (ref), hasAutocompleteTemplates (copy), SduiLogger (copy), SduiErrors (copy)
	local FetchSduiTemplatesFunction = SduiSharedUtilitiesModule.fetchSduiTemplates
	
	if FetchSduiTemplatesFunction == nil then
		return PromiseModule.reject("Autocomplete requires client-driven templates")
	else
		local LoadTimer = SduiLoadTimer.createLoadTimer(`{SearchAutocompleteSurfaceModule}Prewarm`)
		LoadTimer.start("preload")
		
		return FetchSduiTemplatesFunction({
			surfaceKeys = { SearchAutocompleteSurfaceModule },
			loadTimer = LoadTimer
		}, Flag):andThen(function()
			-- upvalues: hasAutocompleteTemplates (upval), PromiseModule (upval), Flag (upval)
			if hasAutocompleteTemplates() then
				Flag = false
				
				return
			else
				return PromiseModule.reject("Autocomplete templates or mapping are missing")
			end
		end):catch(function(Err)
			-- upvalues: Flag (upval), SduiLogger (upval), SduiErrors (upval), SearchAutocompleteSurfaceModule (upval), PromiseModule (upval)
			Flag = true
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPrewarmTemplates, {
				message = tostring(Err),
				name = SearchAutocompleteSurfaceModule
			}, SearchAutocompleteSurfaceModule)
			
			return PromiseModule.reject(Err)
		end)
	end
end