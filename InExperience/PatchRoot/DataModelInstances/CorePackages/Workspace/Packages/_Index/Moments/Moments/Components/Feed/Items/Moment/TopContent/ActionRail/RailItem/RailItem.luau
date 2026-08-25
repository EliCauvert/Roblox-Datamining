local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local foundationModule = require(parent.Foundation)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens

local function formatCount(p0)
	return if p0 == nil then "" elseif p0 >= 1000000 then string.format("%.1fM", p0 / 1000000) elseif p0 >= 1000 then string.format("%.1fK", p0 / 1000) else tostring(p0)
end

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), useTokens (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), formatCount (ref)
	local count = p1.count
	local var6 = reactUtilsModule.createNextOrder()
	local var7 = useTokens()
	local var8 = p1.animationRatio:map(function(p2)
		-- upvalues: getColorStyleWithTransparencyModule (copy), var7 (ref)
		return getColorStyleWithTransparencyModule(var7.Color.Content.Emphasis, p2)
	end)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-xsmall size-1200-1200 radius-medium",
		LayoutOrder = p1.LayoutOrder,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		ref = p1.nativeRef
	}, {
		Slot = if type(p1.slot) == "string" then reactModule.createElement(icon, {
			LayoutOrder = var6(),
			name = p1.slot,
			size = iconSize.Large,
			style = var8
		}) else reactModule.createElement(view, {
			tag = "auto-xy",
			Active = p1.isDisabled ~= false,
			LayoutOrder = var6()
		}, p1.slot),
		Count = if count then reactModule.createElement(text, {
			tag = "auto-xy text-caption-large text-align-x-center content-emphasis",
			LayoutOrder = var6(),
			Text = count:map(formatCount),
			Visible = count:map(function(p3)
				return p3 ~= nil
			end),
			textStyle = var8
		}) else nil
	})
end)