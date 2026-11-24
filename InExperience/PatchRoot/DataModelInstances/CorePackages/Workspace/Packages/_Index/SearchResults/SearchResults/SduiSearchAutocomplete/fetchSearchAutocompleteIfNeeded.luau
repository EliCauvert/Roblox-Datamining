local Parent = script:FindFirstAncestor("SearchResults").Parent
local HttpService = game:GetService("HttpService")
local DataStatus = require(Parent.DataHydration).DataStatus
local Url = require(Parent.Http).Url
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local GetSearchAutocompleteConfigKeyModule = require(script.Parent.getSearchAutocompleteConfigKey)
local PrewarmSearchAutocompleteTemplatesModule = require(script.Parent.prewarmSearchAutocompleteTemplates)
local SearchAutocompleteInputDataIdentifierModule = require(script.Parent.SearchAutocompleteInputDataIdentifier)
local SearchAutocompleteSurfaceModule = require(script.Parent.SearchAutocompleteSurface)

local function _(Input): string
	-- upvalues: Url (copy), HttpService (copy)
	return string.format("%sgames-autocomplete/v2/get-suggestion/%s", Url.APIS_URL, HttpService:UrlEncode(Input))
end

return function(Input, LoadTimer, Callback)
	-- upvalues: GetSearchAutocompleteConfigKeyModule (copy), PrewarmSearchAutocompleteTemplatesModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), DataStatus (copy), SearchAutocompleteInputDataIdentifierModule (copy), SduiResponseType (copy), Url (copy), HttpService (copy), SearchAutocompleteSurfaceModule (copy), GetSduiTemplateStoreFunction (copy)
	local SearchAutocompleteConfigKeyModule = GetSearchAutocompleteConfigKeyModule(Input)
	
	return PrewarmSearchAutocompleteTemplatesModule():andThen(function()
		-- upvalues: Callback (copy), Parent (upval), GetSduiApiStoreFunction (upval), SearchAutocompleteConfigKeyModule (copy), DataStatus (upval), SearchAutocompleteInputDataIdentifierModule (upval), SduiResponseType (upval), Input (copy), Url (upval), HttpService (upval), SearchAutocompleteSurfaceModule (upval), LoadTimer (copy), GetSduiTemplateStoreFunction (upval), GetSearchAutocompleteConfigKeyModule (upval)
		if Callback and not Callback() then
			return nil
		else
			local SearchAutocomplete = require(Parent.ServiceContractsProto).apppageplatform.search.search_autocomplete
			local SduiApiStore = GetSduiApiStoreFunction()
			local Data, Data2 = SduiApiStore.getData(SearchAutocompleteConfigKeyModule)
			local IsStatusResultMatch = Data.status(false) == DataStatus.Failed
			local HasInputData: boolean = not IsStatusResultMatch and (not Data2 and (not SduiApiStore.isInFlight(SearchAutocompleteConfigKeyModule) and SduiApiStore.getInputData(SearchAutocompleteConfigKeyModule, SearchAutocompleteInputDataIdentifierModule) ~= nil))
			
			return SduiApiStore.fetchIfNeeded({
				enableTemplateCache = true,
				responseType = SduiResponseType.Protobuf,
				url = string.format("%sgames-autocomplete/v2/get-suggestion/%s", Url.APIS_URL, HttpService:UrlEncode(Input)),
				surfaceKey = SearchAutocompleteSurfaceModule,
				configKey = SearchAutocompleteConfigKeyModule,
				loadTimer = LoadTimer,
				apiProto = SearchAutocomplete.GetSearchAutocompleteResponse,
				parseTemplateEntriesFromResponse = function()
					return {}, {}, {}
				end,
				parseLocalizedLiteralsFromResponse = function()
					-- upvalues: GetSduiTemplateStoreFunction (upval)
					return GetSduiTemplateStoreFunction().getLocalizedLiterals()
				end,
				isResponseCurrent = function(): boolean
					-- upvalues: GetSearchAutocompleteConfigKeyModule (upval), Input (upval), SearchAutocompleteConfigKeyModule (upval)
					return GetSearchAutocompleteConfigKeyModule(Input) == SearchAutocompleteConfigKeyModule
				end
			}, IsStatusResultMatch):andThen(function()
				-- upvalues: HasInputData (copy)
				return HasInputData
			end)
		end
	end)
end