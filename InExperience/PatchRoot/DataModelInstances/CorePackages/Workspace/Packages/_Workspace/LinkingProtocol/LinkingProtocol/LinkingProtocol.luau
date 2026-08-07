local parent = script.Parent.Parent
local messageBusService = game:GetService("MessageBusService")
local _ = require(parent.MessageBus)
local promiseModule = require(parent.Promise)
local getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua)
local _ = require(script.Parent.LinkingProtocolTypes)
local _ = require(script.Parent.Enums.SettingsRoute)
local linkingService = require(parent.MockableProxyServices).LinkingService
local t = {}
t.__index = t

function t.new() --[[ line: 30 ]]
	-- upvalues: t (ref)
	return setmetatable({ isListeningForURLs = false, urlConnection = nil }, t)
end

function t.registerURL(_, p0) --[[ line: 45 ]]
	-- upvalues: linkingService (ref)
	linkingService:RegisterLuaUrl(p0)
end

function t.getUID(_) --[[ line: 60 ]]
	-- upvalues: promiseModule (ref), messageBusService (ref)
	return if game:GetEngineFeature("EnableAppflyerUIDReporting") then promiseModule.new(function(p1, _) --[[ line: 65 ]]
		-- upvalues: messageBusService (copy)
		messageBusService:MakeRequest("Linking", "getUID", {}, function(p2) --[[ line: 66 ]]
			-- upvalues: p1 (ref)
			p1(p2.uid)
		end, {})
	end) else promiseModule.resolve("")
end

function t.detectURL(_, p3) --[[ line: 79 ]]
	-- upvalues: linkingService (ref)
	linkingService:DetectUrl(p3)
end

function t.getLastLuaURL(_) --[[ line: 89 ]]
	-- upvalues: linkingService (ref)
	return linkingService:GetLastLuaUrl()
end

function t:listenForLuaURLs(p4, _) --[[ line: 101 ]]
	-- upvalues: linkingService (ref)
	self:stopListeningForLuaURLs()
	self.urlConnection = linkingService.OnLuaUrl:Connect(function(p5, _, p6) --[[ line: 103 ]]
		-- upvalues: p4 (ref)
		p4(p5, p6)
	end)
	self.isListeningForURLs = true
	local var4 = linkingService:StartLuaUrlDelivery()
	
	if var4 and var4.url then
		p4(var4.url, var4.attributionUrl)
	end
end

function t:stopListeningForLuaURLs() --[[ line: 118 ]]
	-- upvalues: linkingService (ref)
	if self.isListeningForURLs then
		self.urlConnection:Disconnect()
		linkingService:StopLuaUrlDelivery()
		self.isListeningForURLs = false
	end
end

function t.openURL(_, p7) --[[ line: 142 ]]
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p8, _) --[[ line: 143 ]]
		-- upvalues: linkingService (copy), p7 (ref)
		p8(linkingService:OpenUrl(p7))
	end)
end

function t.isURLRegistered(_, p9) --[[ line: 166 ]]
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p10, _) --[[ line: 167 ]]
		-- upvalues: linkingService (copy), p9 (ref)
		p10(linkingService:IsUrlRegistered(p9))
	end)
end

function t.getAndClearLastPendingURL(_) --[[ line: 181 ]]
	-- upvalues: promiseModule (ref), linkingService (ref)
	return if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then promiseModule.new(function(p11, _) --[[ line: 188 ]]
		-- upvalues: linkingService (copy)
		p11(linkingService:GetAndClearLastPendingUrl())
	end) else promiseModule.resolve({ hasPendingUrl = false })
end

function t.switchToSettingsApp(_, p12) --[[ line: 199 ]]
	-- upvalues: getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule (ref), promiseModule (ref), linkingService (ref)
	local var5 = if getFFlagEnableToSwitchToSettingsAppWithRouteLuaModule() then p12 else nil
	
	return promiseModule.new(function(p13, _) --[[ line: 201 ]]
		-- upvalues: linkingService (copy), var5 (ref)
		p13(linkingService:SwitchToSettingsApp(var5))
	end)
end

function t.supportsSwitchToSettingsApp(_, _) --[[ line: 213 ]]
	-- upvalues: promiseModule (ref), linkingService (ref)
	return promiseModule.new(function(p14, _) --[[ line: 214 ]]
		-- upvalues: linkingService (copy)
		p14(linkingService:SupportsSwitchToSettingsApp())
	end)
end

t.default = t.new()

return t