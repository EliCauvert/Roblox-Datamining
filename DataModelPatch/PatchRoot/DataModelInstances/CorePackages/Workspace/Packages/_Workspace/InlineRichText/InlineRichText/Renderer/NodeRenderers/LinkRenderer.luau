local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local CryoModule = require(Parent.Cryo)
local InlineLayoutModule = require(Parent.InlineLayout)
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local LinkBehaviorModule = require(InlineRichText.Enums.LinkBehavior)
local InlineCustomRendererModule = require(InlineRichText.Renderer.NodeRenderers.InlineCustomRenderer)
local _ = require(InlineRichText.Types)

return function(p1, p2)
	-- upvalues: CryoModule (copy), LinkBehaviorModule (copy), InlineCustomRendererModule (copy), TextElement (copy), LinkElement (copy)
	local config = { showUnderline = true, textStyle = p2.styles.textStyle }
	local UnionResult = CryoModule.Dictionary.union(config, p2.nodeProps or {})
	local Href = p1.attributes.href or ""
	local EvaluateLinkBehaviorResult = p2.linker.evaluateLinkBehavior(Href)
	
	if EvaluateLinkBehaviorResult == LinkBehaviorModule.Hide then
		return {}
	elseif EvaluateLinkBehaviorResult == LinkBehaviorModule.Disable then
		return InlineCustomRendererModule(CryoModule.Dictionary.join(p1, { name = "TEXT_SPAN" }), p2)
	else
		local MapResult = CryoModule.List.map(p2.processChildren(p1, p2), function(p3, LayoutOrder)
			-- upvalues: TextElement (upval), UnionResult (copy), CryoModule (upval), p2 (copy), config (copy)
			return TextElement.new({
				LayoutOrder = LayoutOrder,
				EngineTags = if UnionResult.showUnderline then CryoModule.List.join({ { name = "u", attributes = {} } }, p3.engineTags) else p3.engineTags,
				Text = p3.text,
				fontStyle = p2.styles.fontStyle,
				textStyle = CryoModule.Dictionary.union(config.textStyle, UnionResult.textStyle)
			})
		end)
		
		return if #MapResult > 0 then {
			LinkElement.new(MapResult, {
				onActivated = function()
					-- upvalues: p2 (copy), Href (copy), EvaluateLinkBehaviorResult (copy)
					p2.linker.onActivated({ url = Href, linkBehavior = EvaluateLinkBehaviorResult })
				end
			})
		} else {}
	end
end