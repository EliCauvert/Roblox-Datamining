local Parent = script.Parent.Parent
local MessageBusService = game:GetService("MessageBusService")
local _ = require(Parent.MessageBus)
local PromiseModule = require(Parent.Promise)
local GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua)
local _ = require(script.Parent.LinkingProtocolTypes)
local _ = require(script.Parent.Enums.SettingsRoute)
local LinkingService = require(Parent.MockableProxyServices).LinkingService
local LinkingProtocolModule = {}
LinkingProtocolModule.__index = LinkingProtocolModule

function LinkingProtocolModule.new()
	-- upvalues: LinkingProtocolModule (copy)
	return (setmetatable({ isListeningForURLs = false, urlConnection = nil }, LinkingProtocolModule))
end

function LinkingProtocolModule:registerURL(Url)
	-- upvalues: LinkingService (copy)
	LinkingService:RegisterLuaUrl(Url)
end

function LinkingProtocolModule:getUID()
	-- upvalues: PromiseModule (copy), MessageBusService (copy)
	return if game:GetEngineFeature("EnableAppflyerUIDReporting") then PromiseModule.new(function(Callback, _)
		-- upvalues: MessageBusService (upval)
		MessageBusService:MakeRequest("Linking", "getUID", {}, function(p1)
			-- upvalues: Callback (copy)
			Callback(p1.uid)
		end, {})
	end) else PromiseModule.resolve("")
end

function LinkingProtocolModule:detectURL(Url)
	-- upvalues: LinkingService (copy)
	LinkingService:DetectUrl(Url)
end

function LinkingProtocolModule:getLastLuaURL()
	-- upvalues: LinkingService (copy)
	return LinkingService:GetLastLuaUrl()
end

function LinkingProtocolModule:listenForLuaURLs(Callback: (any, any) -> (), _)
	-- upvalues: LinkingService (copy)
	self:stopListeningForLuaURLs()
	self.urlConnection = LinkingService.OnLuaUrl:Connect(function(Url, _, AttributionUrl)
		-- upvalues: Callback (copy)
		Callback(Url, AttributionUrl)
	end)
	self.isListeningForURLs = true
	local StartLuaUrlDeliveryResult = LinkingService:StartLuaUrlDelivery()
	
	if StartLuaUrlDeliveryResult and StartLuaUrlDeliveryResult.url then
		Callback(StartLuaUrlDeliveryResult.url, StartLuaUrlDeliveryResult.attributionUrl)
	end
end

function LinkingProtocolModule:stopListeningForLuaURLs()
	-- upvalues: LinkingService (copy)
	if self.isListeningForURLs then
		self.urlConnection:Disconnect()
		LinkingService:StopLuaUrlDelivery()
		self.isListeningForURLs = false
	end
end

function LinkingProtocolModule:openURL(Url)
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: LinkingService (upval), Url (copy)
		Callback(LinkingService:OpenUrl(Url))
	end)
end

function LinkingProtocolModule:isURLRegistered(Url)
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: LinkingService (upval), Url (copy)
		Callback(LinkingService:IsUrlRegistered(Url))
	end)
end

function LinkingProtocolModule:getAndClearLastPendingURL()
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: LinkingService (upval)
		Callback(LinkingService:GetAndClearLastPendingUrl())
	end) else PromiseModule.resolve({ hasPendingUrl = false })
end

function LinkingProtocolModule:switchToSettingsApp(p1)
	-- upvalues: GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule (copy), PromiseModule (copy), LinkingService (copy)
	local Route = if GetFFlagEnableToSwitchToSettingsAppWithRouteLuaModule() then p1 else nil
	
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: LinkingService (upval), Route (copy)
		Callback(LinkingService:SwitchToSettingsApp(Route))
	end)
end

function LinkingProtocolModule:supportsSwitchToSettingsApp(_)
	-- upvalues: PromiseModule (copy), LinkingService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: LinkingService (upval)
		Callback(LinkingService:SupportsSwitchToSettingsApp())
	end)
end

LinkingProtocolModule.default = LinkingProtocolModule.new()

return LinkingProtocolModule