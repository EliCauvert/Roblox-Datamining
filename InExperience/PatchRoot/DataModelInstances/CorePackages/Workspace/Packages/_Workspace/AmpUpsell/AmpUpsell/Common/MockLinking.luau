local PromiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local MockLinkingModule = {}
MockLinkingModule.__index = MockLinkingModule

function MockLinkingModule.new() --[[ Line: 12 ]]
	-- upvalues: MockLinkingModule (copy)
	return (setmetatable({}, MockLinkingModule))
end

function MockLinkingModule:registerURL(_) --[[ Line: 16 ]] end

function MockLinkingModule:detectURL(_) --[[ Line: 20 ]] end

function MockLinkingModule:listenForLuaURLs(_) --[[ Line: 24 ]] end

function MockLinkingModule:stopListeningForLuaURLs() --[[ Line: 28 ]] end

function MockLinkingModule:openURL(LastOpenedURL) --[[ Line: 32 ]]
	-- upvalues: PromiseModule (copy)
	self.lastOpenedURL = LastOpenedURL
	
	return PromiseModule.resolve(true)
end

function MockLinkingModule:isURLRegistered(_) --[[ Line: 37 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(true)
end

return MockLinkingModule