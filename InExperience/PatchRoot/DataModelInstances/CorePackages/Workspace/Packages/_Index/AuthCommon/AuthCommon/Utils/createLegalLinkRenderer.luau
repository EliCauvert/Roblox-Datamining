local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CryoModule = require(Parent.Cryo)
local InlineLayoutModule = require(Parent.InlineLayout)
local _ = require(Parent.InlineRichText)
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local config = { name = "u", attributes = {} }

return function(Callback) --[[ Line: 21 | Named "createLegalLinkRenderer" ]]
	-- upvalues: CryoModule (copy), TextElement (copy), config (copy), LinkElement (copy)
	return function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: CryoModule (upval), TextElement (upval), config (upval), LinkElement (upval), Callback (copy)
		local Href = p1.attributes.href or ""
		local MapResult = CryoModule.List.map(p2.processChildren(p1, p2), function(p3, LayoutOrder) --[[ Line: 25 ]]
			-- upvalues: TextElement (upval), CryoModule (upval), config (upval), p2 (copy)
			return TextElement.new({
				LayoutOrder = LayoutOrder,
				EngineTags = CryoModule.List.join({ config }, p3.engineTags),
				Text = p3.text,
				fontStyle = p2.styles.fontStyle,
				textStyle = p2.styles.textStyle
			})
		end)
		
		return if #MapResult == 0 then {} else {
			LinkElement.new(MapResult, {
				onActivated = function() --[[ Line: 41 ]]
					-- upvalues: Callback (upval), Href (copy)
					Callback(Href)
				end
			})
		}
	end
end