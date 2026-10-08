local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local _ = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiUsageRecorder = sduiCoreSystemModule.SduiUsageRecorder
local recordTemplateUsage = sduiCoreSystemModule.recordTemplateUsage
local getSduiTemplateStoreModule = require(sduiSharedUtilities.getSduiTemplateStore)
local sduiProtobufResponseHelpersModule = require(sduiSharedUtilities.SduiProtobufResponseHelpers)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiRequestStatus = require(sduiSharedUtilities.SduiIntegrationTypes).SduiRequestStatus
local sduiInputDataMergeModule = require(sduiSharedUtilities.SduiInputDataMerge)
local processClientHintsModule = require(sduiSharedUtilities.processClientHints)
local getSduiClientBindingBuilder = sduiCoreSystemModule.getSduiClientBindingBuilder
local createBuilderConfig = sduiCoreSystemModule.createBuilderConfig
local getSduiDataBinder = sduiCoreSystemModule.getSduiDataBinder
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagEnableSduiV2HomepagePrompts = require(parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local fFlagEnableHomepagePromptsForModalsAndBanners = require(parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = require(parent.SharedFlags).FFlagPromptsHandlerEnabled
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local fFlagSduiStreamingRefreshReplacesInputData = require(parent.SharedFlags).FFlagSduiStreamingRefreshReplacesInputData
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiUseHttpClientModule = require(sduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local fFlagLuaAppSduiHomePageSupport = require(parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local cryoModule = require(parent.Cryo)

local function mergeTables(p1, p2)
	-- upvalues: mergeTables (ref)
	for i, v in p2 do
		if typeof(v) ~= "table" then
			p1[i] = v
			continue
		end
		if p1[i] == nil then
			p1[i] = {}
		end
		if #v > 0 then
			for i_1, v_1 in v do
				table.insert(p1[i], v_1)
			end
		else
			mergeTables(p1[i], v)
		end
	end
end

return function(_)
	-- upvalues: fFlagSduiClientDrivenTemplates (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagLuaAppEnableSduiHomePage (ref), fFlagSduiStreamingRefreshReplacesInputData (ref), fFlagSduiUseHttpClientModule (ref), sduiRequestStatus (ref), sduiLogger (ref), sduiErrors (ref), getSduiDataBinder (ref), getSduiTemplateStoreModule (ref), recordTemplateUsage (ref), sduiUsageRecorder (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), sduiInputDataMergeModule (ref), createBuilderConfig (ref), getSduiClientBindingBuilder (ref), fFlagLuaAppSduiHomePageSupport (ref), fFlagEnableSduiV2HomepagePrompts (ref), fFlagPromptsHandlerEnabled (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), cryoModule (ref), processClientHintsModule (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref)
-- FATAL: Failed to generate AST for `handleSduiApiResponse` function:
runtime : [KeyError] :11990: 112
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end