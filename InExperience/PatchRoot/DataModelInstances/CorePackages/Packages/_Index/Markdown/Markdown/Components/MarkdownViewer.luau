local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CommonMarkComplianceParserModule = require(Parent.Parsers.CommonMarkComplianceParser)
local FlagsModule = require(Parent.Flags)
local _ = require(Parent.Types)
local MarkdownRendererModule = require(script.MarkdownRenderer)
local Flags = require(Parent1.MarkdownCore).Flags

local function _(p1)
	-- upvalues: Parent (copy)
	return if p1 == "RobloxMarkdown" then require(Parent.Parsers.RobloxMarkdown.RendererParser) elseif p1 == "CommonMark" then require(Parent.Parsers.CommonMark.RendererParser) else nil
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), Flags (copy), ReactModule (copy), DashModule (copy), MarkdownRendererModule (copy), FlagsModule (copy), Parent (copy), CommonMarkComplianceParserModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	if not Flags.FFlagMarkdownAssistantParity and not p1.Markdown and not p1.Ast then
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), MarkdownRendererModule (upval), p1 (copy)
		return DashModule.join(MarkdownRendererModule.defaultRenderers, p1.Renderers or {}, p1.AdditionalFeatureRenderers or {})
	end, if Flags.FFlagMarkdownAssistantParity then { p1.Renderers, p1.AdditionalFeatureRenderers } else { p1.Renderers })
	local Config = if (Flags.FFlagMarkdownTables or Flags.FFlagMarkdownTagFallbacks) and p1.IsStreaming then { isStreaming = true } else nil
	local UseMemoResult1, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FlagsModule (upval), Parent (upval), Config (copy), CommonMarkComplianceParserModule (upval)
		if p1.Ast then
			return true, p1.Ast
		end
		if not p1.Markdown then
			return true, nil
		end
		local FFlagMarkdownDefaultRobloxProfile = FlagsModule.FFlagMarkdownDefaultRobloxProfile
		local RendererParserModule = nil
		
		if FlagsModule.FFlagMarkdownUseRobloxProfileParser or FFlagMarkdownDefaultRobloxProfile then
			local ParserProfile = p1.ParserProfile or (if FFlagMarkdownDefaultRobloxProfile then "RobloxMarkdown" else nil)
			RendererParserModule = if ParserProfile == "RobloxMarkdown" then require(Parent.Parsers.RobloxMarkdown.RendererParser) elseif ParserProfile == "CommonMark" then require(Parent.Parsers.CommonMark.RendererParser) else nil
		else
			RendererParserModule = nil
		end
		local SafeParseResult2 = nil
		local SafeParseResult = nil
		if RendererParserModule == nil then
			SafeParseResult, SafeParseResult2 = CommonMarkComplianceParserModule.safeParse(p1.Markdown, Config)
		else
			SafeParseResult, SafeParseResult2 = RendererParserModule.safeParse(p1.Markdown, Config)
		end
		if not SafeParseResult then
			if p1.OnError then
				p1.OnError(SafeParseResult2)
				
				return SafeParseResult, SafeParseResult2
			end
			warn("MarkdownViewer: Error parsing markdown.", SafeParseResult2)
		end
		return SafeParseResult, SafeParseResult2
	end, if Flags.FFlagMarkdownTables or Flags.FFlagMarkdownTagFallbacks then { p1.Markdown, p1.Ast, p1.IsStreaming, p1.ParserProfile } else { p1.Markdown, p1.Ast, p1.ParserProfile })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), MarkdownRendererModule (upval), UseMemoResult2 (copy), UseMemoResult (copy), p1 (copy), UseTokensResult (copy)
		return if UseMemoResult1 then MarkdownRendererModule.render(UseMemoResult2, {
			userRenderers = UseMemoResult,
			linkCallback = p1.LinkCallback,
			markdownRendererProps = p1.MarkdownRendererProps,
			colorScheme = p1.ColorScheme,
			tokens = UseTokensResult
		}) else nil
	end, if Flags.FFlagMarkdownAssistantParity then {
		UseMemoResult1, UseMemoResult2, p1.LinkCallback, p1.MarkdownRendererProps,
		p1.ColorScheme, UseMemoResult, UseTokensResult
	} else {
		UseMemoResult1, UseMemoResult2, p1.LinkCallback, p1.MarkdownRendererProps,
		p1.ColorScheme, UseMemoResult
	})
	
	if Flags.FFlagMarkdownAssistantParity and not p1.Markdown and not p1.Ast then
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		
		return nil
	else
		return if UseMemoResult1 then ReactModule.createElement(View, DashModule.join({
			tag = "col size-full-0 auto-y",
			BorderSizePixel = 0,
			backgroundStyle = { Transparency = 1 }
		}, p1.WrapperProps or {}), UseMemoResult3) else p1.Fallback or ReactModule.createElement(View, DashModule.join({
			tag = "size-full-0 auto-y",
			backgroundStyle = { Transparency = 1 }
		}, p1.WrapperProps or {}), ReactModule.createElement(Text, { Text = "Failed to parse the provided markdown" }))
	end
end