local Parent = script.Parent.Parent
local MessageBusService = game:GetService("MessageBusService")
local _ = require(Parent.MessageBus)
local PromiseModule = require(Parent.Promise)
local GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua)
local GetFFlagEnableAdConsentAttributionModule = require(script.Parent.Flags.getFFlagEnableAdConsentAttribution)
local _ = require(script.Parent.LinkingProtocolTypes)
local _ = require(script.Parent.Enums.SettingsRoute)
local LinkingService = require(Parent.MockableProxyServices).LinkingService
local LinkingProtocolModule = {}
LinkingProtocolModule.__index = LinkingProtocolModule
LinkingProtocolModule.DeepLinkSource = require(script.Parent.Enums.DeepLinkSource)

local function getEngineFeature(Name) --[[ Line: 35 ]]
	return game:GetEngineFeature(Name)
end

function LinkingProtocolModule.new(p1) --[[ Line: 39 ]]
	-- upvalues: getEngineFeature (copy), LinkingProtocolModule (copy)
	return (setmetatable({
		isListeningForURLs = false,
		urlConnection = nil,
		_getEngineFeature = p1 or getEngineFeature
	}, LinkingProtocolModule))
end

function LinkingProtocolModule:registerURL(Url) --[[ Line: 55 ]]
	-- upvalues: LinkingService (copy)
	LinkingService:RegisterLuaUrl(Url)
end

function LinkingProtocolModule:getUID() --[[ Line: 70 ]]
	-- upvalues: PromiseModule (copy), MessageBusService (copy)
	return if game:GetEngineFeature("EnableAppflyerUIDReporting") then PromiseModule.new(function(Callback, _) --[[ Line: 75 ]]
		-- upvalues: MessageBusService (upval)
		MessageBusService:MakeRequest("Linking", "getUID", {}, function(p1) --[[ Line: 76 ]]
			-- upvalues: Callback (copy)
			Callback(p1.uid)
		end, {})
	end) else PromiseModule.resolve("")
end

function LinkingProtocolModule:detectURL(Url) --[[ Line: 90 ]]
	-- upvalues: LinkingService (copy)
	LinkingService:DetectUrl(Url)
end

function LinkingProtocolModule:isInternalDlicEnabled() --[[ Line: 97 ]]
	return self._getEngineFeature("EnableDLICInternalIngressSeeding")
end

function LinkingProtocolModule:createInternalDlic(p1, p2) --[[ Line: 108 ]]
	-- upvalues: LinkingService (copy)
	return LinkingService:CreateInternalDlic(p1, p2)
end

function LinkingProtocolModule:detectDeeplinkIntent(p1) --[[ Line: 118 ]]
	-- upvalues: LinkingService (copy)
	LinkingService:DetectDlic(p1)
end

function LinkingProtocolModule:adConsentResolved(p1) --[[ Line: 136 ]]
	-- upvalues: GetFFlagEnableAdConsentAttributionModule (copy), MessageBusService (copy)
	if GetFFlagEnableAdConsentAttributionModule() then
		MessageBusService:Publish("Linking.adConsentResolved", p1)
		
		return
	end
end

function LinkingProtocolModule:getLastLuaURL() --[[ Line: 152 ]]
	-- upvalues: LinkingService (copy)
	return LinkingService:GetLastLuaUrl()
end

function LinkingProtocolModule:listenForLuaURLs(Callback: (any, any) -> (), _) --[[ Line: 164 ]]
	-- upvalues: LinkingService (copy)
	self:stopListeningForLuaURLs()
	self.urlConnection = LinkingService.OnLuaUrl:Connect(function(Url, _, AttributionUrl) --[[ Line: 166 ]]
		-- upvalues: Callback (copy)
		Callback(Url, AttributionUrl)
	end)
	self.isListeningForURLs = true
	local StartLuaUrlDeliveryResult = LinkingService:StartLuaUrlDelivery()
	
	if StartLuaUrlDeliveryResult and StartLuaUrlDeliveryResult.url then
		Callback(StartLuaUrlDeliveryResult.url, StartLuaUrlDeliveryResult.attributionUrl)
	end
end

function LinkingProtocolModule:stopListeningForLuaURLs() --[[ Line: 181 ]]
	-- upvalues: LinkingService (copy)
	if self.isListeningForURLs then
		self.urlConnection:Disconnect()
		LinkingService:StopLuaUrlDelivery()
		self.isListeningForURLs = false
	end
end

function LinkingProtocolModule:openURL(Url) --[[ Line: 205 ]]
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 206 ]]
		-- upvalues: LinkingService (upval), Url (copy)
		Callback(LinkingService:OpenUrl(Url))
	end)
end

function LinkingProtocolModule:isURLRegistered(Url) --[[ Line: 234 ]]
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 235 ]]
		-- upvalues: LinkingService (upval), Url (copy)
		Callback(LinkingService:IsUrlRegistered(Url))
	end)
end

function LinkingProtocolModule:getAndClearLastPendingURL() --[[ Line: 249 ]]
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 256 ]]
		-- upvalues: LinkingService (upval)
		Callback(LinkingService:GetAndClearLastPendingUrl())
	end) else PromiseModule.resolve({ hasPendingUrl = false })
end

function LinkingProtocolModule:switchToSettingsApp(p1) --[[ Line: 267 ]]
	-- upvalues: GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule (copy), PromiseModule (copy), LinkingService (copy)
	local Route = if GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule() then p1 else nil
	
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 269 ]]
		-- upvalues: LinkingService (upval), Route (copy)
		Callback(LinkingService:SwitchToSettingsApp(Route))
	end)
end

function LinkingProtocolModule:supportsSwitchToSettingsApp(_) --[[ Line: 281 ]]
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 282 ]]
		-- upvalues: LinkingService (upval)
		Callback(LinkingService:SupportsSwitchToSettingsApp())
	end)
end

LinkingProtocolModule.default = LinkingProtocolModule.new()

return LinkingProtocolModule