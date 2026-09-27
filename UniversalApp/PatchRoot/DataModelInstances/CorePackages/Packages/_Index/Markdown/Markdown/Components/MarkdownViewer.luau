local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local markdownCoreModule = require(parent_1.MarkdownCore)
local commonMarkComplianceParserModule = require(parent.Parsers.CommonMarkComplianceParser)
local _ = require(parent.Types)
local markdownRendererModule = require(script.MarkdownRenderer)
local flags = markdownCoreModule.Flags

return function(p1)
	-- upvalues: useTokens (ref), flags (ref), reactModule (ref), dashModule (ref), markdownRendererModule (ref), commonMarkComplianceParserModule (ref), view (ref), text (ref)
	local var1 = useTokens()
	
	if not flags.FFlagMarkdownAssistantParity and not p1.Markdown and not p1.Ast then
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	end
	local var2 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), markdownRendererModule (copy), p1 (ref)
		return dashModule.join(markdownRendererModule.defaultRenderers, p1.Renderers or {}, p1.AdditionalFeatureRenderers or {})
	end, if flags.FFlagMarkdownAssistantParity then { p1.Renderers, p1.AdditionalFeatureRenderers } else { p1.Renderers })
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), commonMarkComplianceParserModule (copy)
		if p1.Ast then
			return true, p1.Ast
		elseif not p1.Markdown then
			return true, nil
		end
		local var5, var6 = commonMarkComplianceParserModule.safeParse(p1.Markdown)
		
		if not var5 then
			if p1.OnError then
				p1.OnError(var6)
				
				return var5, var6
			end
			warn("MarkdownViewer: Error parsing markdown.", var6)
		end
		return var5, var6
	end, { p1.Markdown, p1.Ast })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), markdownRendererModule (copy), var4 (ref), var2 (ref), p1 (ref), var1 (ref)
		return if var3 then markdownRendererModule.render(var4, {
			userRenderers = var2,
			linkCallback = p1.LinkCallback,
			markdownRendererProps = p1.MarkdownRendererProps,
			colorScheme = p1.ColorScheme,
			tokens = var1
		}) else nil
	end, if flags.FFlagMarkdownAssistantParity then {
		var3, var4, p1.LinkCallback, p1.MarkdownRendererProps, p1.ColorScheme, var2,
		var1
	} else {
		var3, var4, p1.LinkCallback, p1.MarkdownRendererProps, p1.ColorScheme, var2
	})
	
	if flags.FFlagMarkdownAssistantParity and not p1.Markdown and not p1.Ast then
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	end
	return if var3 then reactModule.createElement(view, dashModule.join({
		tag = "col size-full-0 auto-y",
		BorderSizePixel = 0,
		backgroundStyle = { Transparency = 1 }
	}, p1.WrapperProps or {}), var5) else p1.Fallback or reactModule.createElement(view, dashModule.join({
		tag = "size-full-0 auto-y",
		backgroundStyle = { Transparency = 1 }
	}, p1.WrapperProps or {}), reactModule.createElement(text, { Text = "Failed to parse the provided markdown" }))
end