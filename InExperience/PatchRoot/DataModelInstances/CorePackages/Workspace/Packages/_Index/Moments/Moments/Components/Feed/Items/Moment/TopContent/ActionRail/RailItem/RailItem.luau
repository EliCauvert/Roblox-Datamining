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

local function formatCount(p1, p2)
	if p1 == nil then
		return ""
	end
	local var1 = if p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)
	
	return if p2 then `{var1}+` else var1
end

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), useTokens (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), formatCount (ref)
	local count = p1.count
	local var1 = reactUtilsModule.createNextOrder()
	local var2 = useTokens()
	local var3 = p1.animationRatio:map(function(p2)
		-- upvalues: getColorStyleWithTransparencyModule (copy), var2 (ref)
		return getColorStyleWithTransparencyModule(var2.Color.Content.Emphasis, p2)
	end)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-xsmall size-1200-1200 radius-medium",
		LayoutOrder = p1.LayoutOrder,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		ref = p1.nativeRef,
		testId = p1.testId
	}, {
		Slot = if type(p1.slot) == "string" then reactModule.createElement(icon, {
			LayoutOrder = var1(),
			name = p1.slot,
			size = iconSize.Large,
			style = var3
		}) else reactModule.createElement(view, {
			tag = "auto-xy",
			Active = p1.isDisabled ~= false,
			LayoutOrder = var1()
		}, p1.slot),
		Count = if count then reactModule.createElement(text, {
			tag = "auto-xy text-caption-large text-align-x-center content-emphasis",
			LayoutOrder = var1(),
			Text = count:map(function(p2)
				-- upvalues: formatCount (copy), p1 (ref)
				return formatCount(p2, p1.countIsCapped == true)
			end),
			Visible = count:map(function(p2)
				return p2 ~= nil
			end),
			textStyle = var3
		}) else nil
	})
end)