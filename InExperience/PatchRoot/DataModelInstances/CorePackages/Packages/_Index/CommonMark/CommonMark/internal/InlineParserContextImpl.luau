local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.internal.Definitions)
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.InlineParserContext)
local _ = require(CommonMark.parser.beta.LinkProcessor)
local _ = require(CommonMark.node.LinkReferenceDefinition)
local InlineParserContextImplModule = {}
InlineParserContextImplModule.__index = InlineParserContextImplModule

function InlineParserContextImplModule.new(_inlineContentParserFactories, _delimiterProcessors, _linkProcessors, _linkMarkers, _maxInlineNesting, _definitions, _enabledInlineTypes)
	-- upvalues: InlineParserContextImplModule (copy)
	return (setmetatable({
		_inlineContentParserFactories = _inlineContentParserFactories,
		_delimiterProcessors = _delimiterProcessors,
		_linkProcessors = _linkProcessors,
		_linkMarkers = _linkMarkers,
		_maxInlineNesting = _maxInlineNesting,
		_definitions = _definitions,
		_enabledInlineTypes = _enabledInlineTypes
	}, InlineParserContextImplModule))
end

function InlineParserContextImplModule:getCustomInlineContentParserFactories()
	return self._inlineContentParserFactories
end

function InlineParserContextImplModule:getCustomDelimiterProcessors()
	return self._delimiterProcessors
end

function InlineParserContextImplModule:getCustomLinkProcessors()
	return self._linkProcessors
end

function InlineParserContextImplModule:getCustomLinkMarkers()
	return self._linkMarkers
end

function InlineParserContextImplModule:getMaxInlineNesting()
	return self._maxInlineNesting
end

function InlineParserContextImplModule:getEnabledInlineTypes()
	return self._enabledInlineTypes
end

function InlineParserContextImplModule:getLinkReferenceDefinition(p1)
	return self._definitions:getDefinition("LinkReferenceDefinition", p1)
end

function InlineParserContextImplModule:getDefinition(p1, p2)
	return self._definitions:getDefinition(p1, p2)
end

return InlineParserContextImplModule