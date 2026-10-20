local PromiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local MockLinkingModule = {}
MockLinkingModule.__index = MockLinkingModule

function MockLinkingModule.new()
	-- upvalues: MockLinkingModule (copy)
	return (setmetatable({}, MockLinkingModule))
end

function MockLinkingModule:registerURL(_) end

function MockLinkingModule:detectURL(_) end

function MockLinkingModule:isInternalDlicEnabled(): boolean
	return false
end

function MockLinkingModule:createInternalDlic(_, _): string
	return "mock-deeplink-id"
end

function MockLinkingModule:detectDeeplinkIntent(_) end

function MockLinkingModule:listenForLuaURLs(_) end

function MockLinkingModule:stopListeningForLuaURLs() end

function MockLinkingModule:openURL(LastOpenedURL)
	-- upvalues: PromiseModule (copy)
	self.lastOpenedURL = LastOpenedURL
	
	return PromiseModule.resolve(true)
end

function MockLinkingModule:isURLRegistered(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(true)
end

return MockLinkingModule