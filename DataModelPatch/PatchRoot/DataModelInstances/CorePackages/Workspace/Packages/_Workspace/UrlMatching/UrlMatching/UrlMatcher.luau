local Parent = script.Parent.Parent
local MatchAllRegexModule = require(script.Parent.matchAllRegex)
local CryoModule = require(Parent.Cryo)
local RegExpModule = require(Parent.RegExp)
local StringTrimFunction = require(Parent.StringUtilities).StringTrim
local RegexModule = require(script.Parent.Regex)
local _ = require(script.Parent.Types)
local ConstantsModule = require(script.Parent.Constants)
local config = {
	protocolStrict = false,
	subdomainStrict = true,
	pathPatterns = nil,
	trimPunctuation = false,
	protocolPatterns = { "https?" },
	subdomainPatterns = { "www" },
	domainsPatterns = { ConstantsModule.ANY_DOMAIN_PATTERN }
}
local UrlMatcherModule = {}
UrlMatcherModule.__index = UrlMatcherModule

function UrlMatcherModule.new(p1)
	-- upvalues: CryoModule (copy), config (copy), RegexModule (copy), ConstantsModule (copy), RegExpModule (copy), UrlMatcherModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1 or {})
	local Text = RegexModule.oneOf(UnionResult.protocolPatterns) .. RegexModule.COLON .. RegexModule.SLASH .. RegexModule.SLASH
	local OneOfResult = RegexModule.oneOf({
		RegexModule.negativeLookbehind(RegexModule.ALPHANUMERIC),
		Text
	})
	local NegativeLookaheadResult = RegexModule.negativeLookahead(Text)
	local Text1 = RegexModule.oneOf(UnionResult.subdomainPatterns) .. RegexModule.DOT
	local config1 = {
		_urlPattern = RegExpModule(RegexModule.capture(if UnionResult.protocolStrict then Text else OneOfResult) .. RegexModule.capture(if UnionResult.subdomainStrict then RegexModule.oneOf(Text1) else RegexModule.zeroOrOneOf(Text1)) .. RegexModule.capture((RegexModule.oneOf(UnionResult.domainsPatterns))) .. RegexModule.capture(RegexModule.capture(if UnionResult.pathPatterns == nil then "" else RegexModule.oneOf(UnionResult.pathPatterns)) .. (RegexModule.zeroOrMore({
			RegexModule.SLASH .. RegexModule.oneOrMore(NegativeLookaheadResult .. ConstantsModule.PATH_CHAR)
		}) .. RegexModule.zeroOrOneOf(RegexModule.SLASH))) .. RegexModule.capture((RegexModule.zeroOrOneOf(RegexModule.QUESTION .. RegexModule.zeroOrMore(NegativeLookaheadResult .. ConstantsModule.QUERY_CHAR)))) .. RegexModule.capture((RegexModule.zeroOrOneOf(RegexModule.HASH .. RegexModule.zeroOrMore(NegativeLookaheadResult .. ConstantsModule.FRAGMENT_CHAR)))) .. RegexModule.oneOf({
			RegexModule.lookahead(Text),
			RegexModule.negativeLookahead(RegexModule.ALPHANUMERIC),
			RegexModule.STRING_END
		}), "m"),
		_trimPunctuation = UnionResult.trimPunctuation,
		match = UrlMatcherModule.match
	}
	setmetatable(config1, UrlMatcherModule)
	
	return config1
end

function UrlMatcherModule.default()
	-- upvalues: UrlMatcherModule (copy), config (copy)
	return UrlMatcherModule.new(config)
end

function UrlMatcherModule.match(p1, Text)
	-- upvalues: MatchAllRegexModule (copy), StringTrimFunction (copy)
	local List = {}
	local v1 = 0
	local Success, Result = pcall(function()
		-- upvalues: MatchAllRegexModule (upval), Text (copy), p1 (copy), v1 (ref), StringTrimFunction (upval), List (copy)
		for _, value in MatchAllRegexModule(Text:lower(), p1._urlPattern) do
			local NewIndex = v1 + value.index
			local NewIndexDelta = NewIndex + #value.matchedText - 1
			v1 = NewIndexDelta
			
			if p1._trimPunctuation and not value.matchedText:match("%b()$") then
				local MatchedText = StringTrimFunction(value.matchedText, "%?%.%!%,%;%:%(%)", { right = true })
				
				if MatchedText ~= value.matchedText then
					value = MatchAllRegexModule(MatchedText, p1._urlPattern)[1]
				end
				NewIndexDelta = NewIndex + #MatchedText - 1
			end
			local Unpacked, Unpacked2, Unpacked3, Unpacked4, Unpacked5, Unpacked6, Unpacked7 = unpack(value.capturedGroups)
			local Segment: string = Text:sub(NewIndex, NewIndexDelta)
			local v2 = #Unpacked + 1 + #Unpacked2 + #Unpacked3
			local v3 = v2 + #Unpacked4
			local v4 = v3 + #Unpacked6
			local Segment1: string = Segment:sub(v3, v4 - 1)
			local Segment2: string = Segment:sub(v4, v4 + #Unpacked7 - 1)
			table.insert(List, {
				startIndex = NewIndex,
				endIndex = NewIndexDelta,
				matchedPath = Unpacked5,
				url = {
					fullText = Segment,
					protocol = StringTrimFunction(Unpacked, ":/", { right = true }),
					subdomain = StringTrimFunction(Unpacked2, ".", { right = true }),
					domain = Unpacked3,
					path = Segment:sub(v2, v3 - 1),
					query = if Segment1 == "" then nil else StringTrimFunction(Segment1, "?", { left = true }),
					fragment = if Segment2 == "" then nil else StringTrimFunction(Segment2, "#", { left = true })
				}
			})
		end
		return List
	end)
	
	if Success then
		return Result or {}
	else
		warn("UrlMatcher:match failed: " .. tostring(Result))
		
		return {}
	end
end

return UrlMatcherModule