local AuthCommon = script:FindFirstAncestor("AuthCommon")
local UserModule = require(AuthCommon.Thunks.User)
local Default = require(AuthCommon.Parent.LinkingProtocol).LinkingProtocol.default
local PreAuthDeepLinkMapModule = require(script.Parent.PreAuthDeepLinkMap)

local function parseQueryParams(Text: string) --[[ Line: 50 ]]
	local t = {}
	local _, EndIndex = string.find(Text, "?")
	
	if not EndIndex then
		return t
	end
	for i in string.gmatch(string.sub(Text, EndIndex + 1), "[^&]+") do
		local Match, Match2 = string.match(i, "([^=]+)=?(.*)")
		
		if Match then
			t[string.lower(Match)] = Match2 or ""
		end
	end
	return t
end

local function _(Pattern, Text: string): boolean --[[ Line: 70 | Named "matchesPattern" ]]
	return string.match(Text, Pattern) ~= nil
end

local _ = function(): boolean --[[ Line: 74 | Named "userIsAuthenticated" ]]
	-- upvalues: UserModule (copy)
	return UserModule.fromLocalStorage().userId ~= -1
end

local function isPreauthDeeplink(Text: string): boolean --[[ Line: 78 ]]
	-- upvalues: PreAuthDeepLinkMapModule (copy)
	if not Text or Text == "" then
		return false
	end
	local Lowered = string.lower(Text)
	
	for _, value in ipairs(PreAuthDeepLinkMapModule) do
		if string.match(Lowered, value.regexPattern) ~= nil then
			return true
		end
	end
	return false
end

local function firePreauthDeeplink(Text: string, p1) --[[ Line: 94 ]]
	-- upvalues: UserModule (copy), PreAuthDeepLinkMapModule (copy), parseQueryParams (copy)
	if not Text or Text == "" then
		return nil
	end
	local Lowered = string.lower(Text)
	local IsNotUserIdMatch = UserModule.fromLocalStorage().userId ~= -1
	for _, value in ipairs(PreAuthDeepLinkMapModule) do
		if string.match(Lowered, value.regexPattern) ~= nil then
			return if value.preauthOnly and IsNotUserIdMatch then nil else value.handler(parseQueryParams(Text), p1)
		end
	end
	return nil
end

local function registerPatterns() --[[ Line: 117 ]]
	-- upvalues: PreAuthDeepLinkMapModule (copy), Default (copy)
	for _, value in ipairs(PreAuthDeepLinkMapModule) do
		Default:registerURL((value.regexPattern:gsub("%%", "\\")))
	end
end

if require(AuthCommon.Flags.FFlagEnablePreAuthDeepLinkHandler) then
	registerPatterns()
end
return {
	isPreauthDeeplink = isPreauthDeeplink,
	firePreauthDeeplink = firePreauthDeeplink
}