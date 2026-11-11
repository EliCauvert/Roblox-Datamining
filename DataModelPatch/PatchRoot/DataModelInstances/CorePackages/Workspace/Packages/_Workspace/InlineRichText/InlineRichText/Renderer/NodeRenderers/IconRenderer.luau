local InlineRichText = script:FindFirstAncestor("InlineRichText")
local NewResult = require(InlineRichText.Logger):new(script.Name)
local IsBuilderIconFunction = require(InlineRichText.Parent.Foundation).Utility.isBuilderIcon
local IconElementModule = require(InlineRichText.Renderer.InlineElements.IconElement)
local _ = require(InlineRichText.Types)

return function(p1, p2)
	-- upvalues: NewResult (copy), IsBuilderIconFunction (copy), IconElementModule (copy)
	local Name = p1.attributes.name
	
	if not Name then
		NewResult:warning("IconRenderer: No name provided for icon")
		
		return {}
	elseif IsBuilderIconFunction(Name) then
		return {
			IconElementModule.new({
				name = Name,
				size = tonumber(p1.attributes.size) or (p2.styles.fontStyle.FontSize or 18)
			})
		}
	else
		NewResult:warning(`IconRenderer: Icon {Name} is not a builder icon. You must provide a Foundation builder icon name.`)
		
		return {}
	end
end