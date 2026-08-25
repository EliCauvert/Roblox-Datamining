local promiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.registerURL(_, _) end

function t.detectURL(_, _) end

function t.listenForLuaURLs(_, _) end

function t.stopListeningForLuaURLs(_) end

function t:openURL(p0)
	-- upvalues: promiseModule (ref)
	self.lastOpenedURL = p0
	
	return promiseModule.resolve(true)
end

function t.isURLRegistered(_, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(true)
end

return t