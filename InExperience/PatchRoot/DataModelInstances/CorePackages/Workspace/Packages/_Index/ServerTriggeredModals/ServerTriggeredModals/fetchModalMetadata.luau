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
local var1 = tModule.interface({
	modalId = tModule.string,
	modalType = tModule.string,
	sdui = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then tModule.optional(tModule.table) else tModule.table,
	isCustomHandler = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then tModule.optional(tModule.boolean) else nil
})
local t = {}

local function getModalMetadataUrl(p1)
	-- upvalues: fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), urlBuilder (ref), urlBase (ref)
	local var2 = nil
	
	if fFlagEnableDeepLinkHistoryWithModalAPI then
		local lastDetectedPostAuthUrl = deepLinkModule.DeepLinkLuaReceiverStatusStore(false).getLastDetectedPostAuthUrl(false)
		var2 = lastDetectedPostAuthUrl ~= nil and lastDetectedPostAuthUrl ~= ""
	end
	return urlBuilder.new({
		path = "modals-api/v1/modal",
		base = urlBase.APIS,
		query = {
			entryPoint = p1,
			hasDetectedDeepLink = if fFlagEnableDeepLinkHistoryWithModalAPI then tostring(var2) else nil
		}
	})()
end

local function parseResponseToMetadata(value)
	-- upvalues: var1 (ref), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (ref), validateSduiComponentConfig (ref)
	local var2, var3 = var1(value)
	
	if not var2 then
		return { metadata = nil, errorMessage = var3 }
	elseif not fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals or not (if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then value and value.isCustomHandler else false) then
		local var4, var5 = validateSduiComponentConfig(value.sdui)
		
		return if var4 then {
			errorMessage = nil,
			metadata = {
				modalId = value.modalId,
				modalType = value.modalType,
				sduiConfig = value.sdui,
				isCustomHandler = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then value.isCustomHandler else nil
			}
		} else {
			metadata = nil,
			errorMessage = if var5 and var5.message then var5.message else "Invalid sdui config"
		}
	end
end

return function(p1, p2)
	-- upvalues: getModalSignalStoreModule (ref), promiseModule (ref), t (ref), getModalMetadataUrl (ref), logResponseLatencyModule (ref), parseResponseToMetadata (ref), logResponseStatusModule (ref)
	local var2 = getModalSignalStoreModule(false)
	local var3 = var2.getMetadataGetter(p2)(false)
	
	if var3 ~= nil then
		return promiseModule.resolve(var3)
	end
	local var4 = t[p2]
	
	if var4 then
		return var4
	end
	local var5 = getModalMetadataUrl(p2)
	local _ = nil
	local var6 = promiseModule.new(function(p3, p4, p5)
		-- upvalues: p1 (ref), var5 (ref), logResponseLatencyModule (copy), parseResponseToMetadata (copy), var2 (ref), p2 (ref), logResponseStatusModule (copy)
		local var7 = p1(var5, "GET")
		var7:andThen(function(p6)
			-- upvalues: logResponseLatencyModule (copy), p4 (ref), parseResponseToMetadata (copy), var2 (copy), p2 (copy), p3 (ref)
			local var8 = if p6 then p6.responseCode else nil
			logResponseLatencyModule("modals-api/v1/modal", p6.responseTimeMs, var8)
			
			if var8 ~= 200 then
				p4(`Unexpected responseCode when fetching metadata: {var8}`)
				
				return
			end
			local var9 = parseResponseToMetadata(p6.responseBody)
			
			if var9.metadata then
				var2.setMetadata(p2, var9.metadata)
				p3(var9)
				
				return
			end
			p4(`Failed to parse modal metadata response: {var9.errorMessage}`)
		end):catch(function(p6)
			-- upvalues: logResponseStatusModule (copy), p4 (ref)
			logResponseStatusModule("modals-api/v1/modal", p6.StatusCode)
			p4(`Failed to fetch modal metadata: {p6}`)
		end)
		p5(function()
			-- upvalues: var7 (ref)
			var7:cancel()
		end)
	end)
	t[p2] = var6
	var6:finally(function()
		-- upvalues: t (copy), p2 (ref), var6 (write)
		assert(t[p2] == var6, "In-flight request promise mismatch")
		t[p2] = nil
	end)
	
	return var6
end