local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(Parent1.MarkdownCore)
local CommonMarkComplianceParserModule = require(Parent.Parsers.CommonMarkComplianceParser)
local _ = require(Parent.Types)
local MarkdownRendererModule = require(script.MarkdownRenderer)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), DashModule (copy), MarkdownRendererModule (copy), CommonMarkComplianceParserModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1.Markdown or p1.Ast then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: DashModule (upval), MarkdownRendererModule (upval), p1 (copy)
			return DashModule.join(MarkdownRendererModule.defaultRenderers, p1.Renderers or {}, p1.AdditionalFeatureRenderers or {})
		end, { p1.Renderers })
		local UseMemoResult1, UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), CommonMarkComplianceParserModule (upval)
			if p1.Ast then
				return true, p1.Ast
			end
			if not p1.Markdown then
				return true, nil
			end
			local SafeParseResult, SafeParseResult2 = CommonMarkComplianceParserModule.safeParse(p1.Markdown)
			
			if not SafeParseResult then
				if p1.OnError then
					p1.OnError(SafeParseResult2)
					
					return SafeParseResult, SafeParseResult2
				end
				warn("MarkdownViewer: Error parsing markdown.", SafeParseResult2)
			end
			return SafeParseResult, SafeParseResult2
		end, { p1.Markdown, p1.Ast })
		local UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy), MarkdownRendererModule (upval), UseMemoResult2 (copy), UseMemoResult (copy), p1 (copy), UseTokensResult (copy)
			return if UseMemoResult1 then MarkdownRendererModule.render(UseMemoResult2, {
				userRenderers = UseMemoResult,
				linkCallback = p1.LinkCallback,
				markdownRendererProps = p1.MarkdownRendererProps,
				colorScheme = p1.ColorScheme,
				tokens = UseTokensResult
			}) else nil
		end, {
			UseMemoResult1, UseMemoResult2, p1.LinkCallback, p1.MarkdownRendererProps,
			p1.ColorScheme, UseMemoResult
		})
		
		return if UseMemoResult1 then ReactModule.createElement(View, DashModule.join({
			tag = "col size-full-0 auto-y",
			BorderSizePixel = 0,
			backgroundStyle = { Transparency = 1 }
		}, p1.WrapperProps or {}), UseMemoResult3) else p1.Fallback or ReactModule.createElement(View, DashModule.join({
			tag = "size-full-0 auto-y",
			backgroundStyle = { Transparency = 1 }
		}, p1.WrapperProps or {}), ReactModule.createElement(Text, { Text = "Failed to parse the provided markdown" }))
	else
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	end
end