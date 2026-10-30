local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.renderer.html.AttributeProvider)
local _ = require(CommonMark.renderer.html.AttributeProviderContext)
local _ = require(CommonMark.renderer.html.AttributeProviderFactory)
local _ = require(CommonMark.renderer.html.DefaultUrlSanitizer)
local _ = require(CommonMark.renderer.html.HtmlNodeRendererContext)
local _ = require(CommonMark.renderer.html.HtmlNodeRendererFactory)
local _ = require(CommonMark.renderer.html.HtmlWriter)
local _ = require(CommonMark.renderer.NodeRenderer)
local _ = require(CommonMark.renderer.html.UrlSanitizer)

return {
	AttributeProvider = nil,
	AttributeProviderContext = nil,
	AttributeProviderFactory = nil,
	DefaultUrlSanitizer = nil,
	HtmlNodeRendererContext = nil,
	HtmlNodeRendererFactory = nil,
	HtmlWriter = nil,
	NodeRenderer = nil,
	UrlSanitizer = nil
}