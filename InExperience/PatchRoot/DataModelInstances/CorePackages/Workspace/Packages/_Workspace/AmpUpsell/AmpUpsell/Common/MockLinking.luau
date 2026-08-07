local promiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local t = {}
t.__index = t

function t.new() --[[ line: 12 ]]
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.registerURL(_, _) --[[ line: 16 ]] end

function t.detectURL(_, _) --[[ line: 20 ]] end

function t.listenForLuaURLs(_, _) --[[ line: 24 ]] end

function t.stopListeningForLuaURLs(_) --[[ line: 28 ]] end

function t:openURL(p0) --[[ line: 32 ]]
	-- upvalues: promiseModule (ref)
	self.lastOpenedURL = p0
	
	return promiseModule.resolve(true)
end

function t.isURLRegistered(_, _) --[[ line: 37 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(true)
end

return t