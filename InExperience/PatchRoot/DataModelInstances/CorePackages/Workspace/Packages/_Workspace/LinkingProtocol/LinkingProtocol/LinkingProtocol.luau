local parent = script.Parent.Parent
local messageBusService = game:GetService("MessageBusService")
local _ = require(parent.MessageBus)
local promiseModule = require(parent.Promise)
local getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua)
local getFFlagEnableAdConsentAttributionModule = require(script.Parent.Flags.getFFlagEnableAdConsentAttribution)
local _ = require(script.Parent.LinkingProtocolTypes)
local _ = require(script.Parent.Enums.SettingsRoute)
local linkingService = require(parent.MockableProxyServices).LinkingService
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ isListeningForURLs = false, urlConnection = nil }, t)
end

function t.registerURL(_, p1)
	-- upvalues: linkingService (ref)
	linkingService:RegisterLuaUrl(p1)
end

function t.getUID(_)
	-- upvalues: promiseModule (ref), messageBusService (ref)
	return if game:GetEngineFeature("EnableAppflyerUIDReporting") then promiseModule.new(function(p1, _)
		-- upvalues: messageBusService (copy)
		messageBusService:MakeRequest("Linking", "getUID", {}, function(p2)
			-- upvalues: p1 (ref)
			p1(p2.uid)
		end, {})
	end) else promiseModule.resolve("")
end

function t.detectURL(_, p1)
	-- upvalues: linkingService (ref)
	linkingService:DetectUrl(p1)
end

function t.adConsentResolved(_, p1)
	-- upvalues: getFFlagEnableAdConsentAttributionModule (ref), messageBusService (ref)
	if getFFlagEnableAdConsentAttributionModule() then
		messageBusService:Publish("Linking.adConsentResolved", p1)
		
		return
	end
end

function t.getLastLuaURL(_)
	-- upvalues: linkingService (ref)
	return linkingService:GetLastLuaUrl()
end

function t:listenForLuaURLs(p1, _)
	-- upvalues: linkingService (ref)
	self:stopListeningForLuaURLs()
	self.urlConnection = linkingService.OnLuaUrl:Connect(function(p2, _, p3)
		-- upvalues: p1 (ref)
		p1(p2, p3)
	end)
	self.isListeningForURLs = true
	local var1 = linkingService:StartLuaUrlDelivery()
	
	if var1 and var1.url then
		p1(var1.url, var1.attributionUrl)
	end
end

function t:stopListeningForLuaURLs()
	-- upvalues: linkingService (ref)
	if self.isListeningForURLs then
		self.urlConnection:Disconnect()
		linkingService:StopLuaUrlDelivery()
		self.isListeningForURLs = false
	end
end

function t.openURL(_, p1)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p2, _)
		-- upvalues: linkingService (copy), p1 (ref)
		p2(linkingService:OpenUrl(p1))
	end)
end

function t.isURLRegistered(_, p1)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p2, _)
		-- upvalues: linkingService (copy), p1 (ref)
		p2(linkingService:IsUrlRegistered(p1))
	end)
end

function t.getAndClearLastPendingURL(_)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then promiseModule.new(function(p1, _)
		-- upvalues: linkingService (copy)
		p1(linkingService:GetAndClearLastPendingUrl())
	end) else promiseModule.resolve({ hasPendingUrl = false })
end

function t.switchToSettingsApp(_, p1)
	-- upvalues: getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule (ref), promiseModule (ref), linkingService (ref)
	local var1 = if getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule() then p1 else nil
	
	return promiseModule.new(function(p2, _)
		-- upvalues: linkingService (copy), var1 (ref)
		p2(linkingService:SwitchToSettingsApp(var1))
	end)
end

function t.supportsSwitchToSettingsApp(_, _)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p1, _)
		-- upvalues: linkingService (copy)
		p1(linkingService:SupportsSwitchToSettingsApp())
	end)
end

t.default = t.new()

return t