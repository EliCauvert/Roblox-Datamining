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

function t.registerURL(_, p0)
	-- upvalues: linkingService (ref)
	linkingService:RegisterLuaUrl(p0)
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

function t.detectURL(_, p3)
	-- upvalues: linkingService (ref)
	linkingService:DetectUrl(p3)
end

function t.adConsentResolved(_, p4)
	-- upvalues: getFFlagEnableAdConsentAttributionModule (ref), messageBusService (ref)
	if getFFlagEnableAdConsentAttributionModule() then
		messageBusService:Publish("Linking.adConsentResolved", p4)
		
		return
	end
end

function t.getLastLuaURL(_)
	-- upvalues: linkingService (ref)
	return linkingService:GetLastLuaUrl()
end

function t:listenForLuaURLs(p5, _)
	-- upvalues: linkingService (ref)
	self:stopListeningForLuaURLs()
	self.urlConnection = linkingService.OnLuaUrl:Connect(function(p6, _, p7)
		-- upvalues: p5 (ref)
		p5(p6, p7)
	end)
	self.isListeningForURLs = true
	local var5 = linkingService:StartLuaUrlDelivery()
	
	if var5 and var5.url then
		p5(var5.url, var5.attributionUrl)
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

function t.openURL(_, p8)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p9, _)
		-- upvalues: linkingService (copy), p8 (ref)
		p9(linkingService:OpenUrl(p8))
	end)
end

function t.isURLRegistered(_, p10)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p11, _)
		-- upvalues: linkingService (copy), p10 (ref)
		p11(linkingService:IsUrlRegistered(p10))
	end)
end

function t.getAndClearLastPendingURL(_)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then promiseModule.new(function(p12, _)
		-- upvalues: linkingService (copy)
		p12(linkingService:GetAndClearLastPendingUrl())
	end) else promiseModule.resolve({ hasPendingUrl = false })
end

function t.switchToSettingsApp(_, p13)
	-- upvalues: getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule (ref), promiseModule (ref), linkingService (ref)
	local var6 = if getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule() then p13 else nil
	
	return promiseModule.new(function(p14, _)
		-- upvalues: linkingService (copy), var6 (ref)
		p14(linkingService:SwitchToSettingsApp(var6))
	end)
end

function t.supportsSwitchToSettingsApp(_, _)
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p15, _)
		-- upvalues: linkingService (copy)
		p15(linkingService:SupportsSwitchToSettingsApp())
	end)
end

t.default = t.new()

return t