local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local _ = require(Markdown.Types)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ImageElement = require(Parent.InlineLayout).Components.InlineLayoutElements.ImageElement
local JoinTagsModule = require(Markdown.Utils.joinTags)
local MergeContextsModule = require(Markdown.Utils.mergeContexts)

return function(p1, p2)
	-- upvalues: ImageElement (copy), ReactModule (copy), JoinTagsModule (copy), FoundationModule (copy), MergeContextsModule (copy)
	if p1.text == "img" then
		local Size = p2.imageStyles.size
		local Width = if p1.attributes and p1.attributes.width then p1.attributes.width else Size.Width.Offset
		local Height = if p1.attributes and p1.attributes.height then p1.attributes.height else Size.Height.Offset
		
		return if p2.isInline then ImageElement.new({
			LayoutOrder = p1.index,
			Image = if p1.attributes and p1.attributes.src then p1.attributes.src else "",
			Size = UDim2.fromOffset(Width, Height),
			backgroundStyle = {
				Transparency = p2.imageStyles.backgroundTransparency,
				Color3 = p2.imageStyles.backgroundColor3
			},
			imageStyle = { Transparency = p2.imageStyles.transparency },
			ScaleType = p2.imageStyles.scaleType,
			ResampleMode = p2.imageStyles.resampleMode,
			tag = p2.imageStyles.tags
		}) else ReactModule.createElement("ImageLabel", {
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			Image = if p1.attributes and p1.attributes.src then p1.attributes.src else "",
			Size = UDim2.fromOffset(Width, Height),
			BackgroundColor3 = p2.imageStyles.backgroundColor3,
			BackgroundTransparency = p2.imageStyles.backgroundTransparency,
			ImageTransparency = p2.imageStyles.transparency,
			ScaleType = p2.imageStyles.scaleType,
			ResampleMode = p2.imageStyles.resampleMode,
			[ReactModule.Tag] = JoinTagsModule("X-PadS X-Middle", p2.imageStyles.tags)
		})
	elseif p1.text ~= "Button" then
		return if p1.text == "font" then p2.processChildren(p1, MergeContextsModule(p2, {
			textStyles = {
				color = if p1.attributes and p1.attributes.color then p1.attributes.color else nil
			}
		})) else nil
	elseif p1.attributes and p1.attributes.text and p1.attributes.url then
		return ReactModule.createElement(FoundationModule.Button, {
			tag = "auto-xy",
			key = tostring(p1.index),
			LayoutOrder = p1.index,
			text = p1.attributes.text,
			icon = p1.attributes.icon,
			onActivated = function()
				-- upvalues: p2 (copy), p1 (copy)
				p2.linkCallback(p1.attributes.url)
			end
		})
	else
		warn("Button tag misses required text and url attributes")
		
		return nil
	end
end