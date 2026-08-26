local inlineRichText = script:FindFirstAncestor("InlineRichText")
local name = require(inlineRichText.Logger):new(script.Name)
local isBuilderIcon = require(inlineRichText.Parent.Foundation).Utility.isBuilderIcon
local iconElementModule = require(inlineRichText.Renderer.InlineElements.IconElement)
local _ = require(inlineRichText.Types)

return function(p1, p2)
	-- upvalues: name (ref), isBuilderIcon (ref), iconElementModule (ref)
	local name_1 = p1.attributes.name
	
	if not name_1 then
		name:warning("IconRenderer: No name provided for icon")
		
		return {}
	elseif isBuilderIcon(name_1) then
		return {
			iconElementModule.new({
				name = name_1,
				size = tonumber(p1.attributes.size) or (p2.styles.fontStyle.FontSize or 18)
			})
		}
	end
	name:warning(`IconRenderer: Icon {name_1} is not a builder icon. You must provide a Foundation builder icon name.`)
	
	return {}
end