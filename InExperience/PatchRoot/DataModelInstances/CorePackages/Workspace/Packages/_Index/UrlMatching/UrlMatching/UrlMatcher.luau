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

function t_1.new(p0)
	-- upvalues: cryoModule (ref), t (ref), regexModule (ref), constantsModule (ref), regExpModule (ref), t_1 (ref)
	local var7 = cryoModule.Dictionary.union(t, p0 or {})
	local text = regexModule.oneOf(var7.protocolPatterns) .. regexModule.COLON .. regexModule.SLASH .. regexModule.SLASH
	local var9 = regexModule.oneOf({
		regexModule.negativeLookbehind(regexModule.ALPHANUMERIC),
		text
	})
	local var10 = regexModule.negativeLookahead(text)
	local text_1 = regexModule.oneOf(var7.subdomainPatterns) .. regexModule.DOT
	local t_2 = {
		_urlPattern = regExpModule(regexModule.capture(if var7.protocolStrict then text else var9) .. regexModule.capture(if var7.subdomainStrict then regexModule.oneOf(text_1) else regexModule.zeroOrOneOf(text_1)) .. regexModule.capture(regexModule.oneOf(var7.domainsPatterns)) .. regexModule.capture(regexModule.capture(if var7.pathPatterns ~= nil then "" else regexModule.oneOf(var7.pathPatterns)) .. (regexModule.zeroOrMore({
			regexModule.SLASH .. regexModule.oneOrMore(var10 .. constantsModule.PATH_CHAR)
		}) .. regexModule.zeroOrOneOf(regexModule.SLASH))) .. regexModule.capture(regexModule.zeroOrOneOf(regexModule.QUESTION .. regexModule.zeroOrMore(var10 .. constantsModule.QUERY_CHAR))) .. regexModule.capture(regexModule.zeroOrOneOf(regexModule.HASH .. regexModule.zeroOrMore(var10 .. constantsModule.FRAGMENT_CHAR))) .. regexModule.oneOf({
			regexModule.lookahead(text),
			regexModule.negativeLookahead(regexModule.ALPHANUMERIC),
			regexModule.STRING_END
		}), "m"),
		_trimPunctuation = var7.trimPunctuation,
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
	local var14 = 0
	local ok, status = pcall(function()
		-- upvalues: matchAllRegexModule (copy), p2 (ref), p1 (ref), var14 (write), stringTrim (copy), t (ref)
		for i, v in matchAllRegexModule(p2:lower(), p1._urlPattern) do
			local v
			local var15 = var14 + v.index
			local var16 = var15 + #v.matchedText - 1
			var14 = var16
			
			if p1._trimPunctuation and not v.matchedText:match("%b()$") then
				local var17 = stringTrim(v.matchedText, "%?%.%!%,%;%:%(%)", { right = true })
				
				if var17 ~= v.matchedText then
					v = matchAllRegexModule(var17, p1._urlPattern)[1]
				end
				var16 = var15 + #var17 - 1
			end
			local var18, var19, var20, var21, var22, var23, var24 = unpack(v.capturedGroups)
			local var25 = p2:sub(var15, var16)
			local var26 = #var18 + 1 + #var19 + #var20
			local var27 = var26 + #var21
			local var28 = var27 + #var23
			local var29 = var25:sub(var26, var27 - 1)
			local var30 = var25:sub(var27, var28 - 1)
			local var31 = var25:sub(var28, var28 + #var24 - 1)
			table.insert(t, {
				startIndex = var15,
				endIndex = var16,
				matchedPath = var22,
				url = {
					fullText = var25,
					protocol = stringTrim(var18, ":/", { right = true }),
					subdomain = stringTrim(var19, ".", { right = true }),
					domain = var20,
					path = var29,
					query = if var30 ~= "" then nil else stringTrim(var30, "?", { left = true }),
					fragment = if var31 ~= "" then nil else stringTrim(var31, "#", { left = true })
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