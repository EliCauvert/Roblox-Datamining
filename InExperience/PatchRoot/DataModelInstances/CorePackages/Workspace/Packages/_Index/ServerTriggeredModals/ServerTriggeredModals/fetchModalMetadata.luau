local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local deepLinkModule = require(parent.DeepLink)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local tModule = require(parent.t)
local validateSduiComponentConfig = require(parent.ServerDrivenUi).validateSduiComponentConfig
local _ = require(serverTriggeredModals.EntryPoint)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local _ = require(serverTriggeredModals.SignalStores.createModalSignalStore)
local getModalSignalStoreModule = require(serverTriggeredModals.SignalStores.getModalSignalStore)
local fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals = sharedFlagsModule.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals
local fFlagEnableDeepLinkHistoryWithModalAPI = sharedFlagsModule.FFlagEnableDeepLinkHistoryWithModalAPI
local var8 = tModule.interface({
	modalId = tModule.string,
	modalType = tModule.string,
	sdui = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then tModule.optional(tModule.table) else tModule.table,
	isCustomHandler = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then tModule.optional(tModule.boolean) else nil
})
local t = {}

local function getModalMetadataUrl(p0)
	-- upvalues: fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), urlBuilder (ref), urlBase (ref)
	local var12 = nil
	
	if fFlagEnableDeepLinkHistoryWithModalAPI then
		local lastDetectedPostAuthUrl = deepLinkModule.DeepLinkLuaReceiverStatusStore(false).getLastDetectedPostAuthUrl(false)
		var12 = lastDetectedPostAuthUrl ~= nil and lastDetectedPostAuthUrl ~= ""
	end
	return urlBuilder.new({
		path = "modals-api/v1/modal",
		base = urlBase.APIS,
		query = {
			entryPoint = p0,
			hasDetectedDeepLink = if fFlagEnableDeepLinkHistoryWithModalAPI then tostring(var12) else nil
		}
	})()
end

local function parseResponseToMetadata(value)
	-- upvalues: var8 (ref), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (ref), validateSduiComponentConfig (ref)
	local var14, var15 = var8(value)
	
	if not var14 then
		return { metadata = nil, errorMessage = var15 }
	elseif not fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals or not (if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then value and value.isCustomHandler else false) then
		local var16, var17 = validateSduiComponentConfig(value.sdui)
		
		return if var16 then {
			errorMessage = nil,
			metadata = {
				modalId = value.modalId,
				modalType = value.modalType,
				sduiConfig = value.sdui,
				isCustomHandler = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then value.isCustomHandler else nil
			}
		} else {
			metadata = nil,
			errorMessage = if var17 and var17.message then var17.message else "Invalid sdui config"
		}
	end
end

return function(p1, p2)
	-- upvalues: getModalSignalStoreModule (ref), promiseModule (ref), t (ref), getModalMetadataUrl (ref), logResponseLatencyModule (ref), parseResponseToMetadata (ref), logResponseStatusModule (ref)
	local var18 = getModalSignalStoreModule(false)
	local var19 = var18.getMetadataGetter(p2)(false)
	
	if var19 ~= nil then
		return promiseModule.resolve(var19)
	end
	local var20 = t[p2]
	
	if var20 then
		return var20
	end
	local var21 = getModalMetadataUrl(p2)
	local _ = nil
	local var22 = promiseModule.new(function(p3, p4, p5)
		-- upvalues: p1 (ref), var21 (ref), logResponseLatencyModule (copy), parseResponseToMetadata (copy), var18 (ref), p2 (ref), logResponseStatusModule (copy)
		local var23 = p1(var21, "GET")
		var23:andThen(function(p7)
			-- upvalues: logResponseLatencyModule (copy), p4 (ref), parseResponseToMetadata (copy), var18 (copy), p2 (copy), p3 (ref)
			local var24 = if p7 then p7.responseCode else nil
			logResponseLatencyModule("modals-api/v1/modal", p7.responseTimeMs, var24)
			
			if var24 ~= 200 then
				p4(`Unexpected responseCode when fetching metadata: {var24}`)
				
				return
			end
			local var25 = parseResponseToMetadata(p7.responseBody)
			
			if var25.metadata then
				var18.setMetadata(p2, var25.metadata)
				p3(var25)
				
				return
			end
			p4(`Failed to parse modal metadata response: {var25.errorMessage}`)
		end):catch(function(p6)
			-- upvalues: logResponseStatusModule (copy), p4 (ref)
			logResponseStatusModule("modals-api/v1/modal", p6.StatusCode)
			p4(`Failed to fetch modal metadata: {p6}`)
		end)
		p5(function()
			-- upvalues: var23 (ref)
			var23:cancel()
		end)
	end)
	t[p2] = var22
	var22:finally(function()
		-- upvalues: t (copy), p2 (ref), var22 (write)
		assert(t[p2] == var22, "In-flight request promise mismatch")
		t[p2] = nil
	end)
	
	return var22
end