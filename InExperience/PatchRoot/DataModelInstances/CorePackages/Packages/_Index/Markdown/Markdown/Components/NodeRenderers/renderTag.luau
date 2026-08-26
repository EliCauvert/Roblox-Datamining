local markdown = script:FindFirstAncestor("Markdown")
local parent = markdown.Parent
local _ = require(markdown.Types)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local imageElement = require(parent.InlineLayout).Components.InlineLayoutElements.ImageElement
local joinTagsModule = require(markdown.Utils.joinTags)
local mergeContextsModule = require(markdown.Utils.mergeContexts)

return function(p1, p2)
	-- upvalues: imageElement (ref), reactModule (ref), joinTagsModule (ref), foundationModule (ref), mergeContextsModule (ref)
	if p1.text == "img" then
		local size = p2.imageStyles.size
		local var1 = if p1.attributes and p1.attributes.width then p1.attributes.width else size.Width.Offset
		local var2 = if p1.attributes and p1.attributes.height then p1.attributes.height else size.Height.Offset
		
		return if p2.isInline then imageElement.new({
			LayoutOrder = p1.index,
			Image = if p1.attributes and p1.attributes.src then p1.attributes.src else "",
			Size = UDim2.fromOffset(var1, var2),
			backgroundStyle = {
				Transparency = p2.imageStyles.backgroundTransparency,
				Color3 = p2.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p2.imageStyles.transparency },
			ScaleType = p2.imageStyles.scaleType,
			ResampleMode = p2.imageStyles.resampleMode,
			tag = p2.imageStyles.tags
		}) else reactModule.createElement("ImageLabel", {
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			Image = if p1.attributes and p1.attributes.src then p1.attributes.src else "",
			Size = UDim2.fromOffset(var1, var2),
			BackgroundColor3 = p2.imageStyles.backgroundColor3,
			BackgroundTransparency = p2.imageStyles.backgroundTransparency,
			ImageTransparency = p2.imageStyles.transparency,
			ScaleType = p2.imageStyles.scaleType,
			ResampleMode = p2.imageStyles.resampleMode,
			[reactModule.Tag] = joinTagsModule("X-PadS X-Middle", p2.imageStyles.tags)
		})
	elseif p1.text == "Button" then
		if p1.attributes and p1.attributes.text and p1.attributes.url then
			return reactModule.createElement(foundationModule.Button, {
				tag = "auto-xy",
				key = tostring(p1.index),
				LayoutOrder = p1.index,
				text = p1.attributes.text,
				icon = p1.attributes.icon,
				onActivated = function()
					-- upvalues: p2 (ref), p1 (ref)
					p2.linkCallback(p1.attributes.url)
				end
			})
		end
		warn("Button tag misses required text and url attributes")
		
		return nil
	else
		return if p1.text == "font" then p2.processChildren(p1, mergeContextsModule(p2, {
			textStyles = {
				color = if p1.attributes and p1.attributes.color then p1.attributes.color else nil
			}
		})) else nil
	end
end