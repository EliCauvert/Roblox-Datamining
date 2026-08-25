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

local function createDefaultRootNode(p0)
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
						text = p0,
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

return function(p2)
	-- upvalues: reactModule (ref), parseXmlModule (ref), name (ref), createDefaultRootNode (ref), foundationModule (ref), cryoModule (ref), t_2 (ref), useLinkerOnActivatedModule (ref), getLinkTypeModule (ref), t (ref), processChildrenModule (ref), inlineLayout (ref)
	local ast = p2.ast
	local text = p2.text
	local var20 = reactModule.useMemo(function()
		-- upvalues: ast (ref), parseXmlModule (copy), text (ref), p2 (ref), name (copy), createDefaultRootNode (copy)
		if ast then
			return ast
		end
		local var27, var28 = parseXmlModule(text, p2.parserOptions)
		
		if var27 then
			return var28
		end
		name:warning(`Error parsing XML input into AST: {var28}`)
		
		return createDefaultRootNode(text)
	end, { text, ast })
	local var21 = foundationModule.Hooks.useTokens()
	local default = var21.Color.Content.Default
	local t_1 = {
		Font = Enum.Font.BuilderSans,
		FontSize = var21.FontSize.FontSize_400,
		LineHeight = var21.LineHeight.LineHeight_140
	}
	local var23 = cryoModule.Dictionary.union(t_2, p2.linkerOptions or {})
	local var24 = useLinkerOnActivatedModule({ errorToastTextOverride = var23.errorToastText })
	local var25 = reactModule.useCallback(function(p3)
		-- upvalues: var23 (ref), getLinkTypeModule (copy)
		return var23.evaluateLinkBehavior(p3, getLinkTypeModule(p3))
	end, { var23.evaluateLinkBehavior })
	local var26 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), t (copy), p2 (ref), processChildrenModule (copy), default (ref), t_1 (ref), var21 (ref), var24 (ref), var25 (ref)
		return {
			inlineCustomRenderers = cryoModule.Dictionary.join(t, p2.renderers or {}),
			processChildren = processChildrenModule,
			nodeProps = p2.nodeProps or {},
			styles = {
				textStyle = cryoModule.Dictionary.union(default, p2.textStyle or {}),
				fontStyle = cryoModule.Dictionary.union(t_1, p2.fontStyle or {})
			},
			tokens = var21,
			linker = { onActivated = var24, evaluateLinkBehavior = var25 }
		}
	end, {
		p2.renderers, p2.nodeProps, p2.textStyle, p2.fontStyle, var24, var25
	})
	
	return reactModule.createElement(foundationModule.View, p2.wrapperProps, {
		RichTextRoot = reactModule.createElement(inlineLayout, {
			Elements = reactModule.useMemo(function()
				-- upvalues: processChildrenModule (copy), var20 (ref), var26 (ref)
				return processChildrenModule(var20, var26)
			end, { var20 and var20.children, var26 }),
			HorizontalAlignment = p2.HorizontalAlignment,
			VerticalPadding = UDim.new(0, var26.styles.fontStyle.FontSize * (var26.styles.fontStyle.LineHeight - 1) / 2)
		})
	})
end