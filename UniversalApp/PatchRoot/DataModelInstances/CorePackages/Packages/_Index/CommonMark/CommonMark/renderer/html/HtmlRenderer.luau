local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.renderer.html.AttributeProvider)
local _ = require(CommonMark.renderer.html.AttributeProviderContext)
local _ = require(CommonMark.renderer.html.AttributeProviderFactory)
local CoreHtmlNodeRendererModule = require(CommonMark.renderer.html.CoreHtmlNodeRenderer)
local DefaultUrlSanitizerModule = require(CommonMark.renderer.html.DefaultUrlSanitizer)
local EscapingModule = require(CommonMark.internal.util.Escaping)
local _ = require(CommonMark.Extension)
local _ = require(CommonMark.renderer.html.HtmlNodeRendererContext)
local _ = require(CommonMark.renderer.html.HtmlNodeRendererFactory)
local HtmlWriterModule = require(CommonMark.renderer.html.HtmlWriter)
local LinkedHashMapModule = require(CommonMark.internal.port.LinkedHashMap)
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.renderer.NodeRenderer)
local NodeRendererMapModule = require(CommonMark.internal.renderer.NodeRendererMap)
local _ = require(CommonMark.renderer.html.UrlSanitizer)
local HtmlRendererModule = {}
HtmlRendererModule.__index = HtmlRendererModule
local Module = {}
Module.__index = Module

function Module.new(_renderer, _htmlWriter)
	-- upvalues: NodeRendererMapModule (copy), Module (copy)
	local self = setmetatable({
		_renderer = _renderer,
		_htmlWriter = _htmlWriter,
		_attributeProviders = {},
		_nodeRendererMap = NodeRendererMapModule.new()
	}, Module)
	
	for _, attributeProviderFactory in ipairs(_renderer._attributeProviderFactories) do
		table.insert(self._attributeProviders, attributeProviderFactory:create(self))
	end
	for _, nodeRendererFactory in ipairs(_renderer._nodeRendererFactories) do
		self._nodeRendererMap:add((nodeRendererFactory:create(self)))
	end
	return self
end

function Module:shouldEscapeHtml()
	return self._renderer._escapeHtml
end

function Module:shouldOmitSingleParagraphP()
	return self._renderer._omitSingleParagraphP
end

function Module:shouldSanitizeUrls()
	return self._renderer._sanitizeUrls
end

function Module:urlSanitizer()
	return self._renderer._urlSanitizer
end

function Module.encodeUrl(p1, p2)
	-- upvalues: EscapingModule (copy)
	return if p1._renderer._percentEncodeUrls then EscapingModule.percentEncodeUrl(p2) else p2
end

function Module:extendAttributes(p1, p2, p3)
	-- upvalues: LinkedHashMapModule (copy)
	local Map = LinkedHashMapModule.newMap(p3)
	self:setCustomAttributes(p1, p2, Map)
	
	return Map
end

function Module:getWriter()
	return self._htmlWriter
end

function Module:getSoftbreak()
	return self._renderer._softbreak
end

function Module:render(p1)
	self._nodeRendererMap:render(p1)
end

function Module:beforeRoot(p1)
	self._nodeRendererMap:beforeRoot(p1)
end

function Module:afterRoot(p1)
	self._nodeRendererMap:afterRoot(p1)
end

function Module.setCustomAttributes(p1, p2, p3, Map)
	for _, attributeProvider in ipairs(p1._attributeProviders) do
		attributeProvider:setAttributes(p2, p3, Map)
	end
end

local config = {
	create = function(_, p4)
		-- upvalues: CoreHtmlNodeRendererModule (copy)
		return (CoreHtmlNodeRendererModule.new(p4))
	end
}

function HtmlRendererModule.new(p4)
	-- upvalues: config (copy), HtmlRendererModule (copy)
	local Copy = table.clone(p4._nodeRendererFactories)
	table.insert(Copy, config)
	
	return (setmetatable({
		_softbreak = p4._softbreak,
		_escapeHtml = p4._escapeHtml,
		_percentEncodeUrls = p4._percentEncodeUrls,
		_omitSingleParagraphP = p4._omitSingleParagraphP,
		_sanitizeUrls = p4._sanitizeUrls,
		_urlSanitizer = p4._urlSanitizer,
		_attributeProviderFactories = table.clone(p4._attributeProviderFactories),
		_nodeRendererFactories = Copy
	}, HtmlRendererModule))
end

local Module1 = {}
Module1.__index = Module1

function HtmlRendererModule.builder()
	-- upvalues: Module1 (copy)
	return Module1.new()
end

function HtmlRendererModule.renderAppendable(Renderer, p4, p5)
	-- upvalues: Module (copy), HtmlWriterModule (copy)
	local NewModule = Module.new(Renderer, HtmlWriterModule.new(p5))
	NewModule:beforeRoot(p4)
	NewModule:render(p4)
	NewModule:afterRoot(p4)
end

function HtmlRendererModule:render(p4): string
	local List = {}
	self:renderAppendable(p4, List)
	
	return table.concat(List)
end

function Module1.new()
	-- upvalues: DefaultUrlSanitizerModule (copy), Module1 (copy)
	return (setmetatable({
		_softbreak = "\n",
		_escapeHtml = false,
		_sanitizeUrls = false,
		_percentEncodeUrls = false,
		_omitSingleParagraphP = false,
		_urlSanitizer = DefaultUrlSanitizerModule.new(),
		_attributeProviderFactories = {},
		_nodeRendererFactories = {}
	}, Module1))
end

function Module1.build(p4)
	-- upvalues: HtmlRendererModule (copy)
	return HtmlRendererModule.new(p4)
end

function Module1:softbreak(_softbreak)
	self._softbreak = _softbreak
	
	return self
end

function Module1:escapeHtml(_escapeHtml)
	self._escapeHtml = _escapeHtml
	
	return self
end

function Module1:sanitizeUrls(_sanitizeUrls)
	self._sanitizeUrls = _sanitizeUrls
	
	return self
end

function Module1:urlSanitizer(_urlSanitizer)
	self._urlSanitizer = _urlSanitizer
	
	return self
end

function Module1:percentEncodeUrls(_percentEncodeUrls)
	self._percentEncodeUrls = _percentEncodeUrls
	
	return self
end

function Module1:omitSingleParagraphP(_omitSingleParagraphP)
	self._omitSingleParagraphP = _omitSingleParagraphP
	
	return self
end

function Module1:attributeProviderFactory(p4)
	table.insert(self._attributeProviderFactories, p4)
	
	return self
end

function Module1:nodeRendererFactory(p4)
	table.insert(self._nodeRendererFactories, p4)
	
	return self
end

function Module1.extensions(p4, List)
	for _, value in ipairs(List) do
		local ExtendHtmlRendererFunction: (any) -> () = value.extendHtmlRenderer
		
		if ExtendHtmlRendererFunction ~= nil then
			ExtendHtmlRendererFunction(p4)
		end
	end
	return p4
end

HtmlRendererModule.Builder = Module1

return HtmlRendererModule