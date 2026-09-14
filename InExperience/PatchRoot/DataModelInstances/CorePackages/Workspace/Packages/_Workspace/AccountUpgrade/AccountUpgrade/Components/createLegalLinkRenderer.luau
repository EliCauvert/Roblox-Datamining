local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local cryoModule = require(parent.Cryo)
local inlineLayoutModule = require(parent.InlineLayout)
local _ = require(parent.InlineRichText)
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local t = { name = "u", attributes = {} }

return function(p1)
	-- upvalues: cryoModule (ref), textElement (ref), t (ref), linkElement (ref)
	return function(p2, p3)
		-- upvalues: cryoModule (copy), textElement (copy), t (copy), linkElement (copy), p1 (ref)
		local href = p2.attributes.href or ""
		local var1 = cryoModule.List.map(p3.processChildren(p2, p3), function(p4, p5)
			-- upvalues: textElement (copy), cryoModule (copy), t (copy), p3 (ref)
			return textElement.new({
				LayoutOrder = p5,
				EngineTags = cryoModule.List.join({ t }, p4.engineTags),
				Text = p4.text,
				fontStyle = p3.styles.fontStyle,
				textStyle = p3.styles.textStyle
			})
		end)
		
		return if #var1 == 0 then {} else {
			linkElement.new(var1, {
				onActivated = function()
					-- upvalues: p1 (copy), href (ref)
					p1(href)
				end
			})
		}
	end
end