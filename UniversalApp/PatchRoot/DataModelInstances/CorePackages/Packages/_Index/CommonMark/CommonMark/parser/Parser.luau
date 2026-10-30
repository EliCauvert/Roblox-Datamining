local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.block.BlockParserFactory)
local DefinitionsModule = require(CommonMark.internal.Definitions)
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local DocumentParserModule = require(CommonMark.internal.DocumentParser)
local _ = require(CommonMark.Extension)
local IncludeSourceSpansModule = require(CommonMark.parser.IncludeSourceSpans)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.InlineParser)
local _ = require(CommonMark.parser.InlineParserContext)
local InlineParserContextImplModule = require(CommonMark.internal.InlineParserContextImpl)
local _ = require(CommonMark.parser.InlineParserFactory)
local InlineParserImplModule = require(CommonMark.internal.InlineParserImpl)
local _ = require(CommonMark.parser.beta.LinkProcessor)
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.parser.PostProcessor)
local ParserModule = {}
ParserModule.__index = ParserModule

function ParserModule.new(p1)
	-- upvalues: DocumentParserModule (copy), ParserModule (copy), InlineParserContextImplModule (copy), DefinitionsModule (copy)
	local self = setmetatable({
		_blockParserFactories = DocumentParserModule.calculateBlockParserFactories(p1._blockParserFactories, p1._enabledBlockTypes),
		_inlineParserFactory = p1:getInlineParserFactory(),
		_postProcessors = p1._postProcessors,
		_inlineContentParserFactories = p1._inlineContentParserFactories,
		_delimiterProcessors = p1._delimiterProcessors,
		_linkProcessors = p1._linkProcessors,
		_linkMarkers = p1._linkMarkers,
		_includeSourceSpans = p1._includeSourceSpans,
		_maxOpenBlockParsers = p1._maxOpenBlockParsers,
		_maxInlineNesting = p1._maxInlineNesting,
		_enabledInlineTypes = p1._enabledInlineTypes,
		_linkReferenceDefinitions = p1._linkReferenceDefinitions
	}, ParserModule)
	self._inlineParserFactory:create((InlineParserContextImplModule.new(self._inlineContentParserFactories, self._delimiterProcessors, self._linkProcessors, self._linkMarkers, self._maxInlineNesting, DefinitionsModule.new(), self._enabledInlineTypes)))
	
	return self
end

local Module = {}
Module.__index = Module

function ParserModule.builder()
	-- upvalues: Module (copy)
	return Module.new()
end

function ParserModule:parse(p1)
	return self:postProcess((self:createDocumentParser():parse(p1)))
end

function ParserModule:parseReader(p1)
	return self:postProcess((self:createDocumentParser():parseReader(p1)))
end

function ParserModule:createDocumentParser()
	-- upvalues: DocumentParserModule (copy)
	return DocumentParserModule.new(self._blockParserFactories, self._inlineParserFactory, self._inlineContentParserFactories, self._delimiterProcessors, self._linkProcessors, self._linkMarkers, self._includeSourceSpans, self._maxOpenBlockParsers, self._maxInlineNesting, self._enabledInlineTypes, self._linkReferenceDefinitions)
end

function ParserModule.postProcess(p1, ParseReaderResult)
	for _, postProcessor in ipairs(p1._postProcessors) do
		ParseReaderResult = postProcessor:process(ParseReaderResult)
	end
	return ParseReaderResult
end

function Module.new()
	-- upvalues: DocumentParserModule (copy), IncludeSourceSpansModule (copy), Module (copy)
	return (setmetatable({
		_enabledInlineTypes = nil,
		_linkReferenceDefinitions = true,
		_inlineParserFactory = nil,
		_maxOpenBlockParsers = 100,
		_maxInlineNesting = 100,
		_blockParserFactories = {},
		_inlineContentParserFactories = {},
		_delimiterProcessors = {},
		_linkProcessors = {},
		_postProcessors = {},
		_linkMarkers = {},
		_enabledBlockTypes = DocumentParserModule.getDefaultBlockParserTypes(),
		_includeSourceSpans = IncludeSourceSpansModule.NONE
	}, Module))
end

function Module.build(p2)
	-- upvalues: ParserModule (copy)
	return ParserModule.new(p2)
end

function Module.extensions(p2, List)
	for _, value in ipairs(List) do
		local ExtendParserFunction: (any) -> () = value.extendParser
		
		if ExtendParserFunction ~= nil then
			ExtendParserFunction(p2)
		end
	end
	return p2
end

function Module:enabledBlockTypes(_enabledBlockTypes)
	-- upvalues: DocumentParserModule (copy)
	DocumentParserModule.checkEnabledBlockTypes(_enabledBlockTypes)
	self._enabledBlockTypes = _enabledBlockTypes
	
	return self
end

function Module:enabledInlineTypes(_enabledInlineTypes)
	-- upvalues: InlineParserImplModule (copy)
	if _enabledInlineTypes ~= nil then
		InlineParserImplModule.checkEnabledInlineTypes(_enabledInlineTypes)
	end
	self._enabledInlineTypes = _enabledInlineTypes
	
	return self
end

function Module:linkReferenceDefinitions(_linkReferenceDefinitions)
	self._linkReferenceDefinitions = _linkReferenceDefinitions
	
	return self
end

function Module:includeSourceSpans(_includeSourceSpans)
	self._includeSourceSpans = _includeSourceSpans
	
	return self
end

function Module:maxOpenBlockParsers(_maxOpenBlockParsers: number)
	if _maxOpenBlockParsers < 0 then
		error("maxOpenBlockParsers must be >= 0")
	end
	self._maxOpenBlockParsers = _maxOpenBlockParsers
	
	return self
end

function Module:maxInlineNesting(_maxInlineNesting: number)
	if _maxInlineNesting < 0 then
		error("maxInlineNesting must be >= 0")
	end
	self._maxInlineNesting = _maxInlineNesting
	
	return self
end

function Module:customBlockParserFactory(p3)
	table.insert(self._blockParserFactories, p3)
	
	return self
end

function Module:customInlineContentParserFactory(p3)
	table.insert(self._inlineContentParserFactories, p3)
	
	return self
end

function Module:customDelimiterProcessor(p3)
	table.insert(self._delimiterProcessors, p3)
	
	return self
end

function Module:linkProcessor(p3)
	table.insert(self._linkProcessors, p3)
	
	return self
end

function Module:linkMarker(p3)
	self._linkMarkers[p3] = true
	
	return self
end

function Module:postProcessor(p3)
	table.insert(self._postProcessors, p3)
	
	return self
end

function Module:inlineParserFactory(_inlineParserFactory)
	self._inlineParserFactory = _inlineParserFactory
	
	return self
end

local config = {
	create = function(_, p3)
		-- upvalues: InlineParserImplModule (copy)
		return (InlineParserImplModule.new(p3))
	end
}

function Module:getInlineParserFactory()
	-- upvalues: config (copy)
	local InlineParserFactory = self._inlineParserFactory
	
	return if InlineParserFactory == nil then config else InlineParserFactory
end

ParserModule.Builder = Module

return ParserModule