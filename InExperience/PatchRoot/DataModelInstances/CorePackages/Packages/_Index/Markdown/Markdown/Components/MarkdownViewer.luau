local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local _ = require(parent_1.MarkdownCore)
local commonMarkComplianceParserModule = require(parent.Parsers.CommonMarkComplianceParser)
local _ = require(parent.Types)
local markdownRendererModule = require(script.MarkdownRenderer)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), dashModule (ref), markdownRendererModule (ref), commonMarkComplianceParserModule (ref), view (ref), text (ref)
	local var5 = useTokens()
	
	if not p0.Markdown and not p0.Ast then
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), markdownRendererModule (copy), p0 (ref)
		return dashModule.join(markdownRendererModule.defaultRenderers, p0.Renderers or {}, p0.AdditionalFeatureRenderers or {})
	end, { p0.Renderers })
	local var7, var8 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), commonMarkComplianceParserModule (copy)
		if p0.Ast then
			return true, p0.Ast
		elseif not p0.Markdown then
			return true, nil
		end
		local var9, var10 = commonMarkComplianceParserModule.safeParse(p0.Markdown)
		
		if not var9 then
			if p0.OnError then
				p0.OnError(var10)
				
				return var9, var10
			end
			warn("MarkdownViewer: Error parsing markdown.", var10)
		end
		return var9, var10
	end, { p0.Markdown, p0.Ast })
	
	return if var7 then reactModule.createElement(view, dashModule.join({
		tag = "col size-full-0 auto-y",
		BorderSizePixel = 0,
		backgroundStyle = { Transparency = 1 }
	}, p0.WrapperProps or {}), reactModule.useMemo(function()
		-- upvalues: var7 (ref), markdownRendererModule (copy), var8 (ref), var6 (ref), p0 (ref), var5 (ref)
		return if var7 then markdownRendererModule.render(var8, {
			userRenderers = var6,
			linkCallback = p0.LinkCallback,
			markdownRendererProps = p0.MarkdownRendererProps,
			colorScheme = p0.ColorScheme,
			tokens = var5
		}) else nil
	end, {
		var7, var8, p0.LinkCallback, p0.MarkdownRendererProps, p0.ColorScheme, var6
	})) else p0.Fallback or reactModule.createElement(view, dashModule.join({
		tag = "size-full-0 auto-y",
		backgroundStyle = { Transparency = 1 }
	}, p0.WrapperProps or {}), reactModule.createElement(text, { Text = "Failed to parse the provided markdown" }))
end