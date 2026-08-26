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
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.InputSize)
local t = {
	isIconSize = true,
	colorNamespace = colorNamespaceModule.Color
}

return function(p1)
	-- upvalues: accessoryTypeModule (ref), reactModule (ref), viewModule (ref), presentationContextModule (ref), flagsModule (ref), t (ref), colorNamespaceModule (ref), avatarModule (ref), textModule (ref), badgeModule (ref), iconModule (ref)
	local accessory = p1.accessory
	
	if accessory == nil then
		return nil
	end
	local tag = `align-x-center align-y-center {p1.iconVariant.tag}`
	
	return if accessory.type == accessoryTypeModule.Avatar then reactModule.createElement(viewModule, {
		LayoutOrder = p1.LayoutOrder,
		tag = tag,
		testId = p1.testId
	}, {
		Avatar = reactModule.createElement(presentationContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then t else {
				isIconSize = true,
				colorNamespace = colorNamespaceModule.Color
			}
		}, {
			Avatar = reactModule.createElement(avatarModule, {
				userId = accessory.userId,
				backplateStyle = p1.tokens.Color.Shift.Shift_200,
				size = p1.size
			})
		})
	}) elseif accessory.type == "Hint" then reactModule.createElement(viewModule, {
		tag = "row align-y-center auto-xy padding-x-xsmall radius-small bg-shift-200",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Text = reactModule.createElement(textModule, {
			tag = "auto-xy text-caption-medium content-muted",
			Text = accessory.text
		})
	}) elseif accessory.type == "Badge" then reactModule.createElement(badgeModule, {
		LayoutOrder = p1.LayoutOrder,
		text = accessory.text,
		icon = accessory.icon,
		variant = accessory.variant,
		testId = p1.testId
	}) else reactModule.createElement(viewModule, {
		LayoutOrder = p1.LayoutOrder,
		tag = tag,
		testId = p1.testId
	}, {
		Icon = reactModule.createElement(iconModule, {
			name = accessory.iconName,
			variant = accessory.iconVariant,
			style = p1.iconVariant.style,
			size = p1.iconVariant.size
		})
	})
end