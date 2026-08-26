local parent = script.Parent.Parent
local matchAllRegexModule = require(script.Parent.matchAllRegex)
local cryoModule = require(parent.Cryo)
local regExpModule = require(parent.RegExp)
local stringTrim = require(parent.StringUtilities).StringTrim
local regexModule = require(script.Parent.Regex)
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local t = {
	protocolStrict = false,
	subdomainStrict = true,
	pathPatterns = nil,
	trimPunctuation = false,
	protocolPatterns = { "https?" },
	subdomainPatterns = { "www" },
	domainsPatterns = { constantsModule.ANY_DOMAIN_PATTERN }
}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: cryoModule (ref), t (ref), regexModule (ref), constantsModule (ref), regExpModule (ref), t_1 (ref)
	local var1 = cryoModule.Dictionary.union(t, p1 or {})
	local text = regexModule.oneOf(var1.protocolPatterns) .. regexModule.COLON .. regexModule.SLASH .. regexModule.SLASH
	local var2 = regexModule.oneOf({
		regexModule.negativeLookbehind(regexModule.ALPHANUMERIC),
		text
	})
	local var3 = regexModule.negativeLookahead(text)
	local text_1 = regexModule.oneOf(var1.subdomainPatterns) .. regexModule.DOT
	local t_2 = {
		_urlPattern = regExpModule(regexModule.capture(if var1.protocolStrict then text else var2) .. regexModule.capture(if var1.subdomainStrict then regexModule.oneOf(text_1) else regexModule.zeroOrOneOf(text_1)) .. regexModule.capture(regexModule.oneOf(var1.domainsPatterns)) .. regexModule.capture(regexModule.capture(if var1.pathPatterns ~= nil then "" else regexModule.oneOf(var1.pathPatterns)) .. (regexModule.zeroOrMore({
			regexModule.SLASH .. regexModule.oneOrMore(var3 .. constantsModule.PATH_CHAR)
		}) .. regexModule.zeroOrOneOf(regexModule.SLASH))) .. regexModule.capture(regexModule.zeroOrOneOf(regexModule.QUESTION .. regexModule.zeroOrMore(var3 .. constantsModule.QUERY_CHAR))) .. regexModule.capture(regexModule.zeroOrOneOf(regexModule.HASH .. regexModule.zeroOrMore(var3 .. constantsModule.FRAGMENT_CHAR))) .. regexModule.oneOf({
			regexModule.lookahead(text),
			regexModule.negativeLookahead(regexModule.ALPHANUMERIC),
			regexModule.STRING_END
		}), "m"),
		_trimPunctuation = var1.trimPunctuation,
		match = t_1.match
	}
	setmetatable(t_2, t_1)
	
	return t_2
end

function t_1.default()
	-- upvalues: t_1 (ref), t (ref)
	return t_1.new(t)
end

function t_1.match(p1, p2)
	-- upvalues: matchAllRegexModule (ref), stringTrim (ref)
	local t = {}
	local var1 = 0
	local ok, status = pcall(function()
		-- upvalues: matchAllRegexModule (copy), p2 (ref), p1 (ref), var1 (write), stringTrim (copy), t (ref)
		for i, v in matchAllRegexModule(p2:lower(), p1._urlPattern) do
			local v
			local var2 = var1 + v.index
			local var3 = var2 + #v.matchedText - 1
			var1 = var3
			
			if p1._trimPunctuation and not v.matchedText:match("%b()$") then
				local var4 = stringTrim(v.matchedText, "%?%.%!%,%;%:%(%)", { right = true })
				
				if var4 ~= v.matchedText then
					v = matchAllRegexModule(var4, p1._urlPattern)[1]
				end
				var3 = var2 + #var4 - 1
			end
			local var5, var6, var7, var8, var9, var10, var11 = unpack(v.capturedGroups)
			local var12 = p2:sub(var2, var3)
			local var13 = #var5 + 1 + #var6 + #var7
			local var14 = var13 + #var8
			local var15 = var14 + #var10
			local var16 = var12:sub(var13, var14 - 1)
			local var17 = var12:sub(var14, var15 - 1)
			local var18 = var12:sub(var15, var15 + #var11 - 1)
			table.insert(t, {
				startIndex = var2,
				endIndex = var3,
				matchedPath = var9,
				url = {
					fullText = var12,
					protocol = stringTrim(var5, ":/", { right = true }),
					subdomain = stringTrim(var6, ".", { right = true }),
					domain = var7,
					path = var16,
					query = if var17 ~= "" then nil else stringTrim(var17, "?", { left = true }),
					fragment = if var18 ~= "" then nil else stringTrim(var18, "#", { left = true })
				}
			})
		end
		return t
	end)
	
	if ok then
		return status or {}
	end
	warn("UrlMatcher:match failed: " .. tostring(status))
	
	return {}
end

return t_1