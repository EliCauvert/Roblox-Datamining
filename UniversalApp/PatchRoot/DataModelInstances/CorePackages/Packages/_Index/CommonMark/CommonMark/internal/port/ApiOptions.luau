local CommonMark = script:FindFirstAncestor("CommonMark")
local DocumentParserModule = require(CommonMark.internal.DocumentParser)
local _ = require(CommonMark.Extension)
local _ = require(CommonMark.parser.IncludeSourceSpans)
local ParserModule = require(CommonMark.parser.Parser)
local ApiOptionsModule = {
	inCanonicalOrder = function(List)
		-- upvalues: DocumentParserModule (copy)
		local t = {}
		
		for _, value in ipairs(List) do
			t[value] = true
		end
		local List1 = {}
		
		for _, value1 in ipairs(DocumentParserModule.getDefaultBlockParserTypes()) do
			if t[value1] then
				table.insert(List1, value1)
				t[value1] = nil
			end
		end
		for _, value2 in ipairs(List) do
			if t[value2] then
				table.insert(List1, value2)
				t[value2] = nil
			end
		end
		return List1
	end
}

local function buildParser(p1)
	-- upvalues: ParserModule (copy), ApiOptionsModule (copy)
	local Er = ParserModule.builder()
	
	if p1.extensions ~= nil then
		Er:extensions(p1.extensions)
	end
	if p1.enabledBlockTypes ~= nil then
		Er:enabledBlockTypes(ApiOptionsModule.inCanonicalOrder(p1.enabledBlockTypes))
	end
	if p1.enabledInlineTypes ~= nil then
		Er:enabledInlineTypes(p1.enabledInlineTypes)
	end
	if p1.linkReferenceDefinitions ~= nil then
		Er:linkReferenceDefinitions(p1.linkReferenceDefinitions)
	end
	if p1.includeSourceSpans ~= nil then
		Er:includeSourceSpans(p1.includeSourceSpans)
	end
	if p1.maxOpenBlockParsers ~= nil then
		Er:maxOpenBlockParsers(p1.maxOpenBlockParsers)
	end
	if p1.maxInlineNesting ~= nil then
		Er:maxInlineNesting(p1.maxInlineNesting)
	end
	return Er:build()
end

local function buildHtmlRenderer(p1)
	-- upvalues: CommonMark (copy)
	local Er = require(CommonMark.renderer.html.HtmlRenderer).builder()
	
	if p1.extensions ~= nil then
		Er:extensions(p1.extensions)
	end
	if p1.softbreak ~= nil then
		Er:softbreak(p1.softbreak)
	end
	if p1.escapeHtml ~= nil then
		Er:escapeHtml(p1.escapeHtml)
	end
	if p1.sanitizeUrls ~= nil then
		Er:sanitizeUrls(p1.sanitizeUrls)
	end
	if p1.percentEncodeUrls ~= nil then
		Er:percentEncodeUrls(p1.percentEncodeUrls)
	end
	return Er:build()
end

local Frozen = table.freeze({ __mode = "k" })
local Frozen1 = table.freeze({})
local self = setmetatable({}, Frozen)
local self1 = setmetatable({}, Frozen)

function ApiOptionsModule.getParser(p1)
	-- upvalues: Frozen1 (copy), self (copy), buildParser (copy)
	local Frozen = if p1 == nil then Frozen1 else p1
	local SelfEntry = self[Frozen]
	
	if SelfEntry == nil then
		SelfEntry = buildParser(Frozen)
		self[Frozen] = SelfEntry
	end
	return SelfEntry
end

function ApiOptionsModule.getHtmlRenderer(p1)
	-- upvalues: Frozen1 (copy), self1 (copy), buildHtmlRenderer (copy)
	local Frozen = if p1 == nil then Frozen1 else p1
	local SelfEntry = self1[Frozen]
	
	if SelfEntry == nil then
		SelfEntry = buildHtmlRenderer(Frozen)
		self1[Frozen] = SelfEntry
	end
	return SelfEntry
end

return ApiOptionsModule