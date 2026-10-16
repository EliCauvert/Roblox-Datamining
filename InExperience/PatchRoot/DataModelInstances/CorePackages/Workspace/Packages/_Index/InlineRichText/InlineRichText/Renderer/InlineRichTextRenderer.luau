local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local NewResult = require(InlineRichText.Logger):new(script.Name)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(InlineRichText.Types)
local InlineLayout = require(Parent.InlineLayout).Components.InlineLayout
local NodeTypeModule = require(InlineRichText.Enums.NodeType)
local ParseXmlModule = require(InlineRichText.Parser.parseXml)
local ProcessChildrenModule = require(InlineRichText.Renderer.processChildren)
local UseLinkerOnActivatedModule = require(InlineRichText.Linker.useLinkerOnActivated)
local LinkTypeModule = require(InlineRichText.Enums.LinkType)
local LinkBehaviorModule = require(InlineRichText.Enums.LinkBehavior)
local GetLinkTypeModule = require(InlineRichText.Linker.getLinkType)

local function createDefaultRootNode(Text) --[[ Line: 56 ]]
	-- upvalues: NodeTypeModule (copy)
	return {
		name = "ROOT",
		text = "",
		index = 0,
		type = NodeTypeModule.Root,
		children = {
			{
				name = "TEXT",
				text = "",
				index = 1,
				type = NodeTypeModule.InlineCustom,
				children = {
					{
						name = "PLAINTEXT",
						index = 2,
						text = Text,
						type = NodeTypeModule.Plaintext,
						children = {},
						attributes = {}
					}
				},
				attributes = {}
			}
		},
		attributes = {}
	}
end

local config = {
	TEXT_SPAN = require(InlineRichText.Renderer.NodeRenderers.TextSpanRenderer),
	LINK = require(InlineRichText.Renderer.NodeRenderers.LinkRenderer),
	ICON = require(InlineRichText.Renderer.NodeRenderers.IconRenderer),
	BREAK = require(InlineRichText.Renderer.NodeRenderers.HardbreakRenderer)
}
local config1 = {
	[LinkTypeModule.Http] = LinkBehaviorModule.Webview,
	[LinkTypeModule.LinkingProtocolRegistered] = LinkBehaviorModule.LinkingProtocol,
	[LinkTypeModule.Default] = LinkBehaviorModule.ErrorToast
}
local config2 = {
	errorToastText = nil,
	onActivatedSubscriber = nil,
	evaluateLinkBehavior = function(_, p1) --[[ Line: 97 ]]
		-- upvalues: config1 (copy), LinkBehaviorModule (copy)
		return config1[p1] or LinkBehaviorModule.ErrorToast
	end
}

return function(p1) --[[ Line: 104 | Named "InlineRichTextRenderer" ]]
	-- upvalues: ReactModule (copy), ParseXmlModule (copy), NewResult (copy), createDefaultRootNode (copy), FoundationModule (copy), CryoModule (copy), config2 (copy), UseLinkerOnActivatedModule (copy), GetLinkTypeModule (copy), config (copy), ProcessChildrenModule (copy), InlineLayout (copy)
	local Ast = p1.ast
	local Text = p1.text
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 107 ]]
		-- upvalues: Ast (copy), ParseXmlModule (upval), Text (copy), p1 (copy), NewResult (upval), createDefaultRootNode (upval)
		if Ast then
			return Ast
		end
		local ParseXmlModuleResult, ParseXmlModuleResult2 = ParseXmlModule(Text, p1.parserOptions)
		
		if ParseXmlModuleResult then
			return ParseXmlModuleResult2
		else
			NewResult:warning(`Error parsing XML input into AST: {ParseXmlModuleResult2}`)
			
			return (createDefaultRootNode(Text))
		end
	end, { Text, Ast })
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Default = UseTokensResult.Color.Content.Default
	local config1 = {
		Font = Enum.Font.BuilderSans,
		FontSize = UseTokensResult.FontSize.FontSize_400,
		LineHeight = UseTokensResult.LineHeight.LineHeight_140
	}
	local UnionResult = CryoModule.Dictionary.union(config2, p1.linkerOptions or {})
	local UseLinkerOnActivatedModuleResult = UseLinkerOnActivatedModule({ errorToastTextOverride = UnionResult.errorToastText })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 132 ]]
		-- upvalues: UseLinkerOnActivatedModuleResult (copy), UnionResult (copy), NewResult (upval)
		UseLinkerOnActivatedModuleResult(p2)
		
		if UnionResult.onActivatedSubscriber then
			local Success, Result = pcall(function(): boolean --[[ Line: 135 ]]
				-- upvalues: UnionResult (upval), p2 (copy)
				UnionResult.onActivatedSubscriber(p2)
				
				return true
			end)
			
			if not Success then
				NewResult:warning(`Error notifying link activation subscriber: {tostring(Result)}`)
			end
		end
	end, {
		UnionResult.onActivatedSubscriber,
		UseLinkerOnActivatedModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 144 ]]
		-- upvalues: UnionResult (copy), GetLinkTypeModule (upval)
		return UnionResult.evaluateLinkBehavior(p2, GetLinkTypeModule(p2))
	end, { UnionResult.evaluateLinkBehavior })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 149 ]]
		-- upvalues: CryoModule (upval), config (upval), p1 (copy), ProcessChildrenModule (upval), Default (copy), config1 (copy), UseTokensResult (copy), UseResult (copy), UseResult1 (copy)
		return {
			inlineCustomRenderers = CryoModule.Dictionary.join(config, p1.renderers or {}),
			processChildren = ProcessChildrenModule,
			nodeProps = p1.nodeProps or {},
			styles = {
				textStyle = CryoModule.Dictionary.union(Default, p1.textStyle or {}),
				fontStyle = CryoModule.Dictionary.union(config1, p1.fontStyle or {})
			},
			tokens = UseTokensResult,
			linker = {
				onActivated = UseResult,
				evaluateLinkBehavior = UseResult1
			}
		}
	end, {
		p1.renderers, p1.nodeProps, p1.textStyle, p1.fontStyle, UseResult, UseResult1
	})
	
	return ReactModule.createElement(FoundationModule.View, p1.wrapperProps, {
		RichTextRoot = ReactModule.createElement(InlineLayout, {
			Elements = ReactModule.useMemo(function() --[[ Line: 174 ]]
				-- upvalues: ProcessChildrenModule (upval), UseMemoResult (copy), UseMemoResult1 (copy)
				return ProcessChildrenModule(UseMemoResult, UseMemoResult1)
			end, { UseMemoResult and UseMemoResult.children, UseMemoResult1 }),
			HorizontalAlignment = p1.HorizontalAlignment,
			VerticalPadding = UDim.new(0, UseMemoResult1.styles.fontStyle.FontSize * (UseMemoResult1.styles.fontStyle.LineHeight - 1) / 2)
		})
	})
end