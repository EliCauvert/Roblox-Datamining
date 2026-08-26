local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local cryoModule = require(parent.Cryo)
local inlineLayoutModule = require(parent.InlineLayout)
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local linkBehaviorModule = require(inlineRichText.Enums.LinkBehavior)
local inlineCustomRendererModule = require(inlineRichText.Renderer.NodeRenderers.InlineCustomRenderer)
local _ = require(inlineRichText.Types)

return function(p1, p2)
	-- upvalues: cryoModule (ref), linkBehaviorModule (ref), inlineCustomRendererModule (ref), textElement (ref), linkElement (ref)
	local t = { showUnderline = true, textStyle = p2.styles.textStyle }
	local var1 = cryoModule.Dictionary.union(t, p2.nodeProps or {})
	local href = p1.attributes.href or ""
	local var2 = p2.linker.evaluateLinkBehavior(href)
	
	if var2 == linkBehaviorModule.Hide then
		return {}
	elseif var2 == linkBehaviorModule.Disable then
		return inlineCustomRendererModule(cryoModule.Dictionary.join(p1, { name = "TEXT_SPAN" }), p2)
	end
	local var3 = cryoModule.List.map(p2.processChildren(p1, p2), function(p3, p4)
		-- upvalues: textElement (copy), var1 (ref), cryoModule (copy), p2 (ref), t (ref)
		return textElement.new({
			LayoutOrder = p4,
			EngineTags = if var1.showUnderline then cryoModule.List.join({ { name = "u", attributes = {} } }, p3.engineTags) else p3.engineTags,
			Text = p3.text,
			fontStyle = p2.styles.fontStyle,
			textStyle = cryoModule.Dictionary.union(t.textStyle, var1.textStyle)
		})
	end)
	
	return if #var3 > 0 then {
		linkElement.new(var3, {
			onActivated = function()
				-- upvalues: p2 (ref), href (ref), var2 (ref)
				p2.linker.onActivated({ url = href, linkBehavior = var2 })
			end
		})
	} else {}
end