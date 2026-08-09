local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local avatarModule = require(foundation.Components.Avatar)
local badgeModule = require(foundation.Components.Badge)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local _ = require(foundation.Providers.Style.Tokens)
local accessoryTypeModule = require(foundation.Enums.AccessoryType)
local colorModeModule = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.InputSize)

return function(p0) --[[ line: 46 | named "Accessory" ]]
	-- upvalues: accessoryTypeModule (ref), reactModule (ref), viewModule (ref), presentationContextModule (ref), colorModeModule (ref), avatarModule (ref), textModule (ref), badgeModule (ref), iconModule (ref)
	local accessory = p0.accessory
	
	if accessory == nil then
		return nil
	end
	local tag = `align-x-center align-y-center {p0.iconVariant.tag}`
	
	return if accessory.type == accessoryTypeModule.Avatar then reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		tag = tag,
		testId = p0.testId
	}, {
		Avatar = reactModule.createElement(presentationContextModule.Provider, {
			value = { isIconSize = true, colorMode = colorModeModule.Color }
		}, {
			Avatar = reactModule.createElement(avatarModule, {
				userId = accessory.userId,
				backplateStyle = p0.tokens.Color.Shift.Shift_200,
				size = p0.size
			})
		})
	}) elseif accessory.type == "Hint" then reactModule.createElement(viewModule, {
		tag = "row align-y-center auto-xy padding-x-xsmall radius-small bg-shift-200",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId
	}, {
		Text = reactModule.createElement(textModule, {
			tag = "auto-xy text-caption-medium content-muted",
			Text = accessory.text
		})
	}) elseif accessory.type == "Badge" then reactModule.createElement(badgeModule, {
		LayoutOrder = p0.LayoutOrder,
		text = accessory.text,
		icon = accessory.icon,
		variant = accessory.variant,
		testId = p0.testId
	}) else reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		tag = tag,
		testId = p0.testId
	}, {
		Icon = reactModule.createElement(iconModule, {
			name = accessory.iconName,
			variant = accessory.iconVariant,
			style = p0.iconVariant.style,
			size = p0.iconVariant.size
		})
	})
end