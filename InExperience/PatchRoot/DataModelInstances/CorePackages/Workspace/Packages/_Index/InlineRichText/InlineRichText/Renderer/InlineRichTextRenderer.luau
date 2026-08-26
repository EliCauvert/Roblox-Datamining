local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(inlineRichText.Types)
local inlineLayout = require(parent.InlineLayout).Components.InlineLayout
local nodeTypeModule = require(inlineRichText.Enums.NodeType)
local parseXmlModule = require(inlineRichText.Parser.parseXml)
local processChildrenModule = require(inlineRichText.Renderer.processChildren)
local textSpanRendererModule = require(inlineRichText.Renderer.NodeRenderers.TextSpanRenderer)
local linkRendererModule = require(inlineRichText.Renderer.NodeRenderers.LinkRenderer)
local iconRendererModule = require(inlineRichText.Renderer.NodeRenderers.IconRenderer)
local hardbreakRendererModule = require(inlineRichText.Renderer.NodeRenderers.HardbreakRenderer)
local useLinkerOnActivatedModule = require(inlineRichText.Linker.useLinkerOnActivated)
local linkTypeModule = require(inlineRichText.Enums.LinkType)
local linkBehaviorModule = require(inlineRichText.Enums.LinkBehavior)
local getLinkTypeModule = require(inlineRichText.Linker.getLinkType)

local function createDefaultRootNode(p1)
	-- upvalues: nodeTypeModule (ref)
	return {
		name = "ROOT",
		text = "",
		index = 0,
		type = nodeTypeModule.Root,
		children = {
			{
				name = "TEXT",
				text = "",
				index = 1,
				type = nodeTypeModule.InlineCustom,
				children = {
					{
						name = "PLAINTEXT",
						index = 2,
						text = p1,
						type = nodeTypeModule.Plaintext,
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

local t = {
	TEXT_SPAN = textSpanRendererModule,
	LINK = linkRendererModule,
	ICON = iconRendererModule,
	BREAK = hardbreakRendererModule
}
local t_1 = {
	[linkTypeModule.Http] = linkBehaviorModule.Webview,
	[linkTypeModule.LinkingProtocolRegistered] = linkBehaviorModule.LinkingProtocol,
	[linkTypeModule.Default] = linkBehaviorModule.ErrorToast
}
local t_2 = {
	errorToastText = nil,
	evaluateLinkBehavior = function(_, p1)
		-- upvalues: t_1 (ref), linkBehaviorModule (ref)
		return t_1[p1] or linkBehaviorModule.ErrorToast
	end
}

return function(p1)
	-- upvalues: reactModule (ref), parseXmlModule (ref), name (ref), createDefaultRootNode (ref), foundationModule (ref), cryoModule (ref), t_2 (ref), useLinkerOnActivatedModule (ref), getLinkTypeModule (ref), t (ref), processChildrenModule (ref), inlineLayout (ref)
	local ast = p1.ast
	local text = p1.text
	local var1 = reactModule.useMemo(function()
		-- upvalues: ast (ref), parseXmlModule (copy), text (ref), p1 (ref), name (copy), createDefaultRootNode (copy)
		if ast then
			return ast
		end
		local var2, var3 = parseXmlModule(text, p1.parserOptions)
		
		if var2 then
			return var3
		end
		name:warning(`Error parsing XML input into AST: {var3}`)
		
		return createDefaultRootNode(text)
	end, { text, ast })
	local var2 = foundationModule.Hooks.useTokens()
	local default = var2.Color.Content.Default
	local t_1 = {
		Font = Enum.Font.BuilderSans,
		FontSize = var2.FontSize.FontSize_400,
		LineHeight = var2.LineHeight.LineHeight_140
	}
	local var3 = cryoModule.Dictionary.union(t_2, p1.linkerOptions or {})
	local var4 = useLinkerOnActivatedModule({ errorToastTextOverride = var3.errorToastText })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), getLinkTypeModule (copy)
		return var3.evaluateLinkBehavior(p2, getLinkTypeModule(p2))
	end, { var3.evaluateLinkBehavior })
	local var6 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), t (copy), p1 (ref), processChildrenModule (copy), default (ref), t_1 (ref), var2 (ref), var4 (ref), var5 (ref)
		return {
			inlineCustomRenderers = cryoModule.Dictionary.join(t, p1.renderers or {}),
			processChildren = processChildrenModule,
			nodeProps = p1.nodeProps or {},
			styles = {
				textStyle = cryoModule.Dictionary.union(default, p1.textStyle or {}),
				fontStyle = cryoModule.Dictionary.union(t_1, p1.fontStyle or {})
			},
			tokens = var2,
			linker = { onActivated = var4, evaluateLinkBehavior = var5 }
		}
	end, {
		p1.renderers, p1.nodeProps, p1.textStyle, p1.fontStyle, var4, var5
	})
	
	return reactModule.createElement(foundationModule.View, p1.wrapperProps, {
		RichTextRoot = reactModule.createElement(inlineLayout, {
			Elements = reactModule.useMemo(function()
				-- upvalues: processChildrenModule (copy), var1 (ref), var6 (ref)
				return processChildrenModule(var1, var6)
			end, { var1 and var1.children, var6 }),
			HorizontalAlignment = p1.HorizontalAlignment,
			VerticalPadding = UDim.new(0, var6.styles.fontStyle.FontSize * (var6.styles.fontStyle.LineHeight - 1) / 2)
		})
	})
end