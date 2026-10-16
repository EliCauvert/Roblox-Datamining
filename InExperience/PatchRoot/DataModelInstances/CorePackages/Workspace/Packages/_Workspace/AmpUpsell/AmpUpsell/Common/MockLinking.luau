local PromiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local MockLinkingModule = {}
MockLinkingModule.__index = MockLinkingModule

function MockLinkingModule.new() --[[ Line: 12 ]]
	-- upvalues: MockLinkingModule (copy)
	return (setmetatable({}, MockLinkingModule))
end

function MockLinkingModule:registerURL(_) --[[ Line: 16 ]] end

function MockLinkingModule:detectURL(_) --[[ Line: 20 ]] end

function MockLinkingModule:isInternalDlicEnabled(): boolean --[[ Line: 24 ]]
	return false
end

function MockLinkingModule:createInternalDlic(_, _): string --[[ Line: 28 ]]
	return "mock-deeplink-id"
end

function MockLinkingModule:detectDeeplinkIntent(_) --[[ Line: 32 ]] end

function MockLinkingModule:listenForLuaURLs(_) --[[ Line: 34 ]] end

function MockLinkingModule:stopListeningForLuaURLs() --[[ Line: 38 ]] end

function MockLinkingModule:openURL(LastOpenedURL) --[[ Line: 42 ]]
	-- upvalues: PromiseModule (copy)
	self.lastOpenedURL = LastOpenedURL
	
	return PromiseModule.resolve(true)
end

function MockLinkingModule:isURLRegistered(_) --[[ Line: 47 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(true)
end

return MockLinkingModule