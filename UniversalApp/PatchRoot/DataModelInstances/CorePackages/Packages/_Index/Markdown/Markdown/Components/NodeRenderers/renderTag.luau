local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local _ = require(Markdown.Types)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DashModule = require(Parent.Dash)
local Flags = require(Parent.MarkdownCore).Flags
local ImageElement = require(Parent.InlineLayout).Components.InlineLayoutElements.ImageElement
local JoinTagsModule = require(Markdown.Utils.joinTags)
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local NodeTypeModule = require(Markdown.Enums.NodeType)

local function bold()
	return { bold = true }
end

local function italic()
	return { italic = true }
end

local function strike()
	return { strike = true }
end

local function code(p1)
	-- upvalues: DashModule (copy)
	return DashModule.joinDeep(p1.codeStyles, { selectable = true })
end

local config = {
	b = bold,
	strong = bold,
	i = italic,
	em = italic,
	s = strike,
	del = strike,
	strike = strike,
	code = code,
	kbd = code
}

return function(p1, p2)
	-- upvalues: ImageElement (copy), ReactModule (copy), JoinTagsModule (copy), FoundationModule (copy), MergeContextsModule (copy), Flags (copy), DashModule (copy), NodeTypeModule (copy), config (copy)
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
	elseif p1.text == "Button" then
		if p1.attributes and p1.attributes.text and p1.attributes.url then
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
	elseif p1.text == "font" then
		return p2.processChildren(p1, MergeContextsModule(p2, {
			textStyles = {
				color = if p1.attributes and p1.attributes.color then p1.attributes.color else nil
			}
		}))
	elseif not Flags.FFlagMarkdownTagFallbacks then
		return nil
	else
		local Href = p1.attributes and p1.attributes.href
		
		if p1.text == "a" and (Href and p2.renderers and p2.renderers.LINK) then
			return p2.renderers.LINK(DashModule.join(p1, {
				attributes = DashModule.join(p1.attributes, { url = Href })
			}), p2)
		elseif p1.type == NodeTypeModule.InlineSpan then
			local Entry = config[p1.text]
			
			return p2.processChildren(p1, MergeContextsModule(p2, { textStyles = if Entry then Entry(p2) else {} }))
		else
			return ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y col",
				key = tostring(p1.index),
				LayoutOrder = p1.index
			}, (p2.processChildren(p1, p2)))
		end
	end
end