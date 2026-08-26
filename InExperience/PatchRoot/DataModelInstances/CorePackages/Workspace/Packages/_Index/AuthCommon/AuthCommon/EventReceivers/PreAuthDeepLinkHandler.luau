local authCommon = script:FindFirstAncestor("AuthCommon")
local userModule = require(authCommon.Thunks.User)
local default = require(authCommon.Parent.LinkingProtocol).LinkingProtocol.default
local preAuthDeepLinkMapModule = require(script.Parent.PreAuthDeepLinkMap)
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

local function parseQueryParams(p1)
	local t = {}
	local _, matchIndex = string.find(p1, "?")
	
	if not matchIndex then
		return t
	end
	for i in string.gmatch(string.sub(p1, matchIndex + 1), "[^&]+") do
		local match, match_1 = string.match(i, "([^=]+)=?(.*)")
		
		if match then
			t[string.lower(match)] = match_1 or ""
		end
	end
	return t
end

local function _(p2, p3)
	return string.match(p3, p2) ~= nil
end

local _ = function()
	-- upvalues: userModule (ref)
	return userModule.fromLocalStorage().userId ~= -1
end

local function isPreauthDeeplink(p2)
	-- upvalues: preAuthDeepLinkMapModule (ref)
	if not p2 or p2 == "" then
		return false
	end
	local lowerText = string.lower(p2)
	
	for i, v in ipairs(preAuthDeepLinkMapModule) do
		if string.match(lowerText, v.regexPattern) ~= nil then
			return true
		end
	end
	return false
end

local function firePreauthDeeplink(p3, p4)
	-- upvalues: userModule (ref), preAuthDeepLinkMapModule (ref), parseQueryParams (ref)
	if not p3 or p3 == "" then
		return nil
	end
	local lowerText = string.lower(p3)
	local var1 = userModule.fromLocalStorage().userId ~= -1
	
	for i, v in ipairs(preAuthDeepLinkMapModule) do
		if string.match(lowerText, v.regexPattern) ~= nil then
			return if v.preauthOnly and var1 then nil else v.handler(parseQueryParams(p3), p4)
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