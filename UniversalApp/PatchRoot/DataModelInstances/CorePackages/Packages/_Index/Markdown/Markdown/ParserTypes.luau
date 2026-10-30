local Parent = script.Parent
local _ = require(Parent.Adapter)
local _ = require(Parent.Parent.CommonMark)
local _ = require(Parent.Parsers.RobloxMarkdown.Mention.Mention)
local _ = require(Parent.Parsers.RobloxMarkdown.Underline.Underline)
local _ = require(Parent.Adapter.createParser)

return {
	ParserDocument = nil,
	ParserNode = nil,
	Mention = nil,
	Underline = nil,
	Parser = nil,
	ParserConfig = nil,
	Extension = nil,
	AdapterAsName = nil,
	AdapterAttributes = nil,
	AdapterBlockName = nil,
	AdapterBlockRule = nil,
	AdapterBuilder = nil,
	AdapterContext = nil,
	AdapterEntryOptions = nil,
	AdapterExtension = nil,
	AdapterFallback = nil,
	AdapterFlattenOptions = nil,
	AdapterGap = nil,
	AdapterGapKind = nil,
	AdapterHandler = nil,
	AdapterInlineName = nil,
	AdapterInlineRule = nil,
	AdapterListOptions = nil,
	AdapterPassName = nil,
	AdapterQuoteOptions = nil,
	AdapterRendererName = nil,
	AdapterStyle = nil
}