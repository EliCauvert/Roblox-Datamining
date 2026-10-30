local v1 = script
local ApiOptionsModule = require(v1.internal.port.ApiOptions)
local _ = require(v1.parser.block.BlockParser)
local _ = require(v1.parser.block.BlockParserFactory)
local _ = require(v1.text.CharMatcher)
local _ = require(v1.parser.delimiter.DelimiterProcessor)
local _ = require(v1.parser.delimiter.DelimiterRun)
local _ = require(v1.Extension)
local _ = require(v1.parser.IncludeSourceSpans)
local _ = require(v1.parser.beta.InlineContentParser)
local _ = require(v1.parser.beta.InlineContentParserFactory)
local _ = require(v1.parser.InlineParser)
local _ = require(v1.parser.InlineParserContext)
local _ = require(v1.parser.beta.InlineParserState)
local _ = require(v1.parser.beta.LinkInfo)
local _ = require(v1.parser.beta.LinkProcessor)
local _ = require(v1.parser.block.MatchedBlockParser)
local _ = require(v1.parser.block.ParserState)
local _ = require(v1.parser.beta.Position)
local _ = require(v1.node.Visitor)

return {
	Node = table.freeze({
		AbstractVisitor = require(v1.node.AbstractVisitor),
		CustomBlock = require(v1.node.CustomBlock),
		CustomNode = require(v1.node.CustomNode),
		Nodes = require(v1.node.Nodes),
		SourceSpan = require(v1.node.SourceSpan),
		SourceSpans = require(v1.node.SourceSpans)
	}),
	Parser = table.freeze({
		SourceLine = require(v1.parser.SourceLine),
		SourceLines = require(v1.parser.SourceLines),
		Beta = table.freeze({
			LinkResult = require(v1.parser.beta.LinkResult),
			ParsedInline = require(v1.parser.beta.ParsedInline),
			Scanner = require(v1.parser.beta.Scanner)
		}),
		Block = table.freeze({
			AbstractBlockParser = require(v1.parser.block.AbstractBlockParser),
			BlockContinue = require(v1.parser.block.BlockContinue),
			BlockStart = require(v1.parser.block.BlockStart)
		}),
		Delimiter = table.freeze({
			EmphasisLikeDelimiterProcessor = require(v1.internal.inline.EmphasisDelimiterProcessor)
		})
	}),
	Renderer = table.freeze({
		Html = (function(Tbl, p1)
			local Copy = table.clone(Tbl)
			
			local function _(Key)
				-- upvalues: Copy (copy), p1 (copy)
				local Entry = Copy[Key]
				
				if Entry == nil and p1[Key] ~= nil then
					Entry = p1[Key]()
					Copy[Key] = Entry
				end
				return Entry
			end
			
			setmetatable(Tbl, table.freeze({
				__index = function(_, Key)
					-- upvalues: Copy (copy), p1 (copy)
					local Entry = Copy[Key]
					
					if Entry == nil and p1[Key] ~= nil then
						Entry = p1[Key]()
						Copy[Key] = Entry
					end
					return Entry
				end,
				__iter = function()
					-- upvalues: p1 (copy), Copy (copy)
					for i in p1 do
						if Copy[i] == nil and p1[i] ~= nil then
							Copy[i] = p1[i]()
						end
					end
					return next, Copy
				end
			}))
			table.freeze(Tbl)
			
			return Tbl
		end)({
			DefaultUrlSanitizer = nil,
			LinkedHashMap = require(v1.internal.port.LinkedHashMap)
		}, {
			DefaultUrlSanitizer = function()
				-- upvalues: v1 (copy)
				return require(v1.renderer.html.DefaultUrlSanitizer)
			end
		})
	}),
	Text = table.freeze({
		AsciiMatcher = require(v1.text.AsciiMatcher),
		Characters = require(v1.text.Characters)
	}),
	Ext = table.freeze({
		Gfm = table.freeze({
			Strikethrough = table.freeze({
				StrikethroughExtension = require(v1.ext.gfm.strikethrough.StrikethroughExtension)
			})
		})
	}),
	Internal = table.freeze({
		AutolinkInlineParser = require(v1.internal.inline.AutolinkInlineParser),
		BlockQuoteParser = require(v1.internal.BlockQuoteParser)
	}),
	parse = function(p2, p3)
		-- upvalues: ApiOptionsModule (copy)
		return ApiOptionsModule.getParser(p3):parse(p2)
	end,
	renderHtml = function(p2, p3)
		-- upvalues: ApiOptionsModule (copy)
		return ApiOptionsModule.getHtmlRenderer(p3):render(p2)
	end
}