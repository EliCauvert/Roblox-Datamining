local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local cryoModule = require(parent.Cryo)
local inlineLayoutModule = require(parent.InlineLayout)
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local linkBehaviorModule = require(inlineRichText.Enums.LinkBehavior)
local inlineCustomRendererModule = require(inlineRichText.Renderer.NodeRenderers.InlineCustomRenderer)
local _ = require(inlineRichText.Types)

return function(p0, p1)
	-- upvalues: cryoModule (ref), linkBehaviorModule (ref), inlineCustomRendererModule (ref), textElement (ref), linkElement (ref)
	local t = { showUnderline = true, textStyle = p1.styles.textStyle }
	local var6 = cryoModule.Dictionary.union(t, p1.nodeProps or {})
	local href = p0.attributes.href or ""
	local var8 = p1.linker.evaluateLinkBehavior(href)
	
	if var8 == linkBehaviorModule.Hide then
		return {}
	elseif var8 == linkBehaviorModule.Disable then
		return inlineCustomRendererModule(cryoModule.Dictionary.join(p0, { name = "TEXT_SPAN" }), p1)
	end
	local var9 = cryoModule.List.map(p1.processChildren(p0, p1), function(p2, p3)
		-- upvalues: textElement (copy), var6 (ref), cryoModule (copy), p1 (ref), t (ref)
		return textElement.new({
			LayoutOrder = p3,
			EngineTags = if var6.showUnderline then cryoModule.List.join({ { name = "u", attributes = {} } }, p2.engineTags) else p2.engineTags,
			Text = p2.text,
			fontStyle = p1.styles.fontStyle,
			textStyle = cryoModule.Dictionary.union(t.textStyle, var6.textStyle)
		})
	end)
	
	return if #var9 > 0 then {
		linkElement.new(var9, {
			onActivated = function()
				-- upvalues: p1 (ref), href (ref), var8 (ref)
				p1.linker.onActivated({ url = href, linkBehavior = var8 })
			end
		})
	} else {}
end