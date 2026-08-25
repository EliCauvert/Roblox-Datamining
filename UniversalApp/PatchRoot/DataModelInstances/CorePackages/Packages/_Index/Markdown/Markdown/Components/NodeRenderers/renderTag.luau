local markdown = script:FindFirstAncestor("Markdown")
local parent = markdown.Parent
local _ = require(markdown.Types)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local imageElement = require(parent.InlineLayout).Components.InlineLayoutElements.ImageElement
local joinTagsModule = require(markdown.Utils.joinTags)
local mergeContextsModule = require(markdown.Utils.mergeContexts)

return function(p0, p1)
	-- upvalues: imageElement (ref), reactModule (ref), joinTagsModule (ref), foundationModule (ref), mergeContextsModule (ref)
	if p0.text == "img" then
		local size = p1.imageStyles.size
		local var5 = if p0.attributes and p0.attributes.width then p0.attributes.width else size.Width.Offset
		local var6 = if p0.attributes and p0.attributes.height then p0.attributes.height else size.Height.Offset
		
		return if p1.isInline then imageElement.new({
			LayoutOrder = p0.index,
			Image = if p0.attributes and p0.attributes.src then p0.attributes.src else "",
			Size = UDim2.fromOffset(var5, var6),
			backgroundStyle = {
				Transparency = p1.imageStyles.backgroundTransparency,
				Color3 = p1.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p1.imageStyles.transparency },
			ScaleType = p1.imageStyles.scaleType,
			ResampleMode = p1.imageStyles.resampleMode,
			tag = p1.imageStyles.tags
		}) else reactModule.createElement("ImageLabel", {
			key = tostring(p0.index),
			LayoutOrder = p0.index,
			Image = if p0.attributes and p0.attributes.src then p0.attributes.src else "",
			Size = UDim2.fromOffset(var5, var6),
			BackgroundColor3 = p1.imageStyles.backgroundColor3,
			BackgroundTransparency = p1.imageStyles.backgroundTransparency,
			ImageTransparency = p1.imageStyles.transparency,
			ScaleType = p1.imageStyles.scaleType,
			ResampleMode = p1.imageStyles.resampleMode,
			[reactModule.Tag] = joinTagsModule("X-PadS X-Middle", p1.imageStyles.tags)
		})
	elseif p0.text == "Button" then
		if p0.attributes and p0.attributes.text and p0.attributes.url then
			return reactModule.createElement(foundationModule.Button, {
				tag = "auto-xy",
				key = tostring(p0.index),
				LayoutOrder = p0.index,
				text = p0.attributes.text,
				icon = p0.attributes.icon,
				onActivated = function()
					-- upvalues: p1 (ref), p0 (ref)
					p1.linkCallback(p0.attributes.url)
				end
			})
		end
		warn("Button tag misses required text and url attributes")
		
		return nil
	else
		return if p0.text == "font" then p1.processChildren(p0, mergeContextsModule(p1, {
			textStyles = {
				color = if p0.attributes and p0.attributes.color then p0.attributes.color else nil
			}
		})) else nil
	end
end