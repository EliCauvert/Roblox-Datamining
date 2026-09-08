local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local root = require(foundation.Components.Accordion).Root
local itemModule = require(script.Parent.Item)
local storyIconsModule = require(foundation.Utility.Stories.Shared.StoryIcons)
local textModule = require(foundation.Components.Text)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconVariant = builderIconsModule.IconVariant
local uDim = UDim.new(0, 400)

local function itemContent(p1)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		tag = "auto-xy padding-y-small text-body-medium text-wrap text-align-x-left",
		Text = p1
	})
end

local function _(p1)
	-- upvalues: storyIconsModule (ref)
	local var1 = storyIconsModule.parseIconControl(p1.icon)
	
	return if var1 then { name = var1, variant = p1.iconVariant } else nil
end

local function staticItems(p1)
	-- upvalues: reactModule (ref), itemModule (ref), itemContent (ref)
	return {
		reactModule.createElement(itemModule, {
			text = "First accordion item",
			LayoutOrder = 1,
			id = 1,
			isExpanded = true,
			leadingIcon = p1
		}, itemContent("Content for the first item.")),
		reactModule.createElement(itemModule, {
			text = "Second accordion item",
			LayoutOrder = 2,
			id = 2,
			leadingIcon = p1
		}, itemContent("Content for the second item.")),
		reactModule.createElement(itemModule, {
			text = "Third accordion item",
			LayoutOrder = 3,
			id = 3,
			leadingIcon = p1
		}, itemContent("Content for the third item."))
	}
end

return {
	RootStory = function(p1)
		-- upvalues: reactModule (ref), storyIconsModule (ref), root (ref), uDim (ref), itemModule (ref), itemContent (ref), staticItems (ref)
		local controls = p1.controls
		local var1, var2 = reactModule.useState(1)
		local var3 = storyIconsModule.parseIconControl(controls.icon)
		local var4 = if var3 then { name = var3, variant = controls.iconVariant } else nil
		
		return if controls.controlled then reactModule.createElement(root, {
			width = uDim,
			size = controls.size,
			onActivated = function(p2, p3)
				-- upvalues: var2 (ref)
				return function()
					-- upvalues: p3 (ref), var2 (copy), p2 (ref)
					if p3 then
						var2(-1)
						
						return
					end
					var2(p2)
				end
			end
		}, {
			AccordionItem1 = reactModule.createElement(itemModule, {
				text = "Controlled item 1",
				LayoutOrder = 1,
				id = 1,
				isExpanded = var1 == 1,
				leadingIcon = var4
			}, itemContent("Only one item expands at a time when Root.onActivated is wired.")),
			AccordionItem2 = reactModule.createElement(itemModule, {
				text = "Controlled item 2",
				LayoutOrder = 2,
				id = 2,
				isExpanded = var1 == 2,
				leadingIcon = var4
			}, itemContent("Root.onActivated coordinates expansion across items.")),
			AccordionItem3 = reactModule.createElement(itemModule, {
				text = "Controlled item 3",
				LayoutOrder = 3,
				id = 3,
				isExpanded = var1 == 3,
				leadingIcon = var4
			}, itemContent("Toggle controlled mode off to let items manage their own state."))
		}) else reactModule.createElement(root, { width = uDim, size = controls.size }, staticItems(var4))
	end,
	rootControls = {
		controlled = false,
		size = dashModule.values(inputSizeModule),
		icon = storyIconsModule.buildIconControlOptions(),
		iconVariant = dashModule.values(iconVariant)
	},
	ACCORDION_WIDTH = uDim
}