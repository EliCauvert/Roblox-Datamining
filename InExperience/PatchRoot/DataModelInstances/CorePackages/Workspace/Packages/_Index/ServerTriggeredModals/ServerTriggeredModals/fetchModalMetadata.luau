local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local DeepLinkModule = require(Parent.DeepLink)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local TModule = require(Parent.t)
local ValidateSduiComponentConfigFunction = require(Parent.ServerDrivenUi).validateSduiComponentConfig
local _ = require(ServerTriggeredModals.EntryPoint)
local LogResponseStatusModule = require(ServerTriggeredModals.logResponseStatus)
local LogResponseLatencyModule = require(ServerTriggeredModals.logResponseLatency)
local _ = require(ServerTriggeredModals.SignalStores.createModalSignalStore)
local GetModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.getModalSignalStore)
local FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals = SharedFlagsModule.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals
local FFlagEnableDeepLinkHistoryWithModalAPI = SharedFlagsModule.FFlagEnableDeepLinkHistoryWithModalAPI
local InterfaceResult = TModule.interface({
	modalId = TModule.string,
	modalType = TModule.string,
	sdui = if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then TModule.optional(TModule.table) else TModule.table,
	isCustomHandler = if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then TModule.optional(TModule.boolean) else nil
})
local Promises = {}

local function getModalMetadataUrl(EntryPoint) --[[ Line: 37 ]]
	-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLinkModule (copy), UrlBuilder (copy), UrlBase (copy)
	local v1: boolean? = nil
	
	if FFlagEnableDeepLinkHistoryWithModalAPI then
		local LastDetectedPostAuthUrl = DeepLinkModule.DeepLinkLuaReceiverStatusStore(false).getLastDetectedPostAuthUrl(false)
		v1 = LastDetectedPostAuthUrl ~= nil and LastDetectedPostAuthUrl ~= ""
	end
	return UrlBuilder.new({
		path = "modals-api/v1/modal",
		base = UrlBase.APIS,
		query = {
			entryPoint = EntryPoint,
			hasDetectedDeepLink = if FFlagEnableDeepLinkHistoryWithModalAPI then tostring(v1) else nil
		}
	})()
end

local function parseResponseToMetadata(ResponseBody) --[[ Line: 56 ]]
	-- upvalues: InterfaceResult (copy), FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (copy), ValidateSduiComponentConfigFunction (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(ResponseBody)
	
	if not InterfaceResultResult then
		return { metadata = nil, errorMessage = InterfaceResultResult2 }
	end
	local IsCustomHandler = if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then ResponseBody and ResponseBody.isCustomHandler else false
	
	if not FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals or not IsCustomHandler then
		local ValidateSduiComponentConfigResult, ValidateSduiComponentConfigResult2 = ValidateSduiComponentConfigFunction(ResponseBody.sdui)
		
		if not ValidateSduiComponentConfigResult then
			return {
				metadata = nil,
				errorMessage = if ValidateSduiComponentConfigResult2 and ValidateSduiComponentConfigResult2.message then ValidateSduiComponentConfigResult2.message else "Invalid sdui config"
			}
		end
	end
	return {
		errorMessage = nil,
		metadata = {
			modalId = ResponseBody.modalId,
			modalType = ResponseBody.modalType,
			sduiConfig = ResponseBody.sdui,
			isCustomHandler = if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then ResponseBody.isCustomHandler else nil
		}
	}
end

return function(Callback, EntryPoint) --[[ Line: 90 ]]
	-- upvalues: GetModalSignalStoreModule (copy), PromiseModule (copy), Promises (copy), getModalMetadataUrl (copy), LogResponseLatencyModule (copy), parseResponseToMetadata (copy), LogResponseStatusModule (copy)
	local ModalSignalStoreModule = GetModalSignalStoreModule(false)
	local v1 = ModalSignalStoreModule.getMetadataGetter(EntryPoint)(false)
	
	if v1 ~= nil then
		return PromiseModule.resolve(v1)
	end
	local Promis = Promises[EntryPoint]
	
	if Promis then
		return Promis
	else
		local ModalMetadataUrl = getModalMetadataUrl(EntryPoint)
		local NewPromise = nil
		NewPromise = PromiseModule.new(function(Callback3, Callback2, Callback1: (any) -> ()) --[[ Line: 105 ]]
			-- upvalues: Callback (copy), ModalMetadataUrl (copy), LogResponseLatencyModule (upval), parseResponseToMetadata (upval), ModalSignalStoreModule (copy), EntryPoint (copy), LogResponseStatusModule (upval)
			local GET = Callback(ModalMetadataUrl, "GET")
			GET:andThen(function(Result) --[[ Line: 108 ]]
				-- upvalues: LogResponseLatencyModule (upval), Callback2 (copy), parseResponseToMetadata (upval), ModalSignalStoreModule (upval), EntryPoint (upval), Callback3 (copy)
				local ResponseCode = Result and Result.responseCode or nil
				LogResponseLatencyModule("modals-api/v1/modal", Result.responseTimeMs, ResponseCode)
				
				if ResponseCode ~= 200 then
					Callback2(`Unexpected responseCode when fetching metadata: {ResponseCode}`)
					
					return
				end
				local ParseResponseToMetadataResult = parseResponseToMetadata(Result.responseBody)
				
				if ParseResponseToMetadataResult.metadata then
					ModalSignalStoreModule.setMetadata(EntryPoint, ParseResponseToMetadataResult.metadata)
					Callback3(ParseResponseToMetadataResult)
					
					return
				else
					Callback2(`Failed to parse modal metadata response: {ParseResponseToMetadataResult.errorMessage}`)
				end
			end):catch(function(Err) --[[ Line: 125 ]]
				-- upvalues: LogResponseStatusModule (upval), Callback2 (copy)
				LogResponseStatusModule("modals-api/v1/modal", Err.StatusCode)
				Callback2(`Failed to fetch modal metadata: {Err}`)
			end)
			Callback1(function() --[[ Line: 130 ]]
				-- upvalues: GET (copy)
				GET:cancel()
			end)
		end)
		Promises[EntryPoint] = NewPromise
		NewPromise:finally(function() --[[ Line: 136 ]]
			-- upvalues: Promises (upval), EntryPoint (copy), NewPromise (ref)
			assert(Promises[EntryPoint] == NewPromise, "In-flight request promise mismatch")
			Promises[EntryPoint] = nil
		end)
		
		return NewPromise
	end
end