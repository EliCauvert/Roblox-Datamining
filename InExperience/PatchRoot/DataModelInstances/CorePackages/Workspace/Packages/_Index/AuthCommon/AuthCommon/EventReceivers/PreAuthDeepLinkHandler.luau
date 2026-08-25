local authCommon = script:FindFirstAncestor("AuthCommon")
local userModule = require(authCommon.Thunks.User)
local default = require(authCommon.Parent.LinkingProtocol).LinkingProtocol.default
local preAuthDeepLinkMapModule = require(script.Parent.PreAuthDeepLinkMap)
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

local function parseQueryParams(p0)
	local t = {}
	local _, matchIndex = string.find(p0, "?")
	
	if not matchIndex then
		return t
	end
	for i in string.gmatch(string.sub(p0, matchIndex + 1), "[^&]+") do
		local match, match_1 = string.match(i, "([^=]+)=?(.*)")
		
		if match then
			t[string.lower(match)] = match_1 or ""
		end
	end
	return t
end

local function _(p1, p2)
	return string.match(p2, p1) ~= nil
end

local _ = function()
	-- upvalues: userModule (ref)
	return userModule.fromLocalStorage().userId ~= -1
end

local function isPreauthDeeplink(p3)
	-- upvalues: preAuthDeepLinkMapModule (ref)
	if not p3 or p3 == "" then
		return false
	end
	local lowerText = string.lower(p3)
	
	for i, v in ipairs(preAuthDeepLinkMapModule) do
		if string.match(lowerText, v.regexPattern) ~= nil then
			return true
		end
	end
	return false
end

local function firePreauthDeeplink(p4, p5)
	-- upvalues: userModule (ref), preAuthDeepLinkMapModule (ref), parseQueryParams (ref)
	if not p4 or p4 == "" then
		return nil
	end
	local lowerText = string.lower(p4)
	local var14 = userModule.fromLocalStorage().userId ~= -1
	
	for i, v in ipairs(preAuthDeepLinkMapModule) do
		if string.match(lowerText, v.regexPattern) ~= nil then
			return if v.preauthOnly and var14 then nil else v.handler(parseQueryParams(p4), p5)
		end
	end
	return nil
end

local function registerPatterns()
	-- upvalues: preAuthDeepLinkMapModule (ref), default (ref)
	for i, v in ipairs(preAuthDeepLinkMapModule) do
		default:registerURL(v.regexPattern:gsub("%%", "\\"))
	end
end

if fFlagEnablePreAuthDeepLinkHandlerModule then
	registerPatterns()
end
return {
	isPreauthDeeplink = isPreauthDeeplink,
	firePreauthDeeplink = firePreauthDeeplink
}