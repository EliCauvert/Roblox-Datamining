local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local FoundationModule = require(Parent.Foundation)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local FFlagMomentsActionRailSpacingModule = require(Moments.Flags.FFlagMomentsActionRailSpacing)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function formatCount(p1: number, IsCountIsCapped): string
	if p1 == nil then
		return ""
	else
		local Formatted: string = if p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)
		
		return if IsCountIsCapped then `{Formatted}+` else Formatted
	end
end

return ReactModule.memo(function(Frame)
	-- upvalues: ReactUtilsModule (copy), UseTokensFunction (copy), GetColorStyleWithTransparencyModule (copy), FFlagMomentsActionRailSpacingModule (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), formatCount (copy)
	local Count = Frame.count
	local NextOrder = ReactUtilsModule.createNextOrder()
	local UseTokensResult = UseTokensFunction()
	local MapResult = Frame.animationRatio:map(function(p1)
		-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
		return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1)
	end)
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = if FFlagMomentsActionRailSpacingModule then "col align-x-center align-y-center gap-small size-1200-1200 auto-xy radius-medium" else "col align-x-center align-y-center gap-xsmall size-1200-1200 radius-medium",
		isDisabled = Frame.isDisabled,
		onActivated = Frame.onActivated,
		ref = Frame.nativeRef,
		testId = Frame.testId
	}, {
		Slot = if type(Frame.slot) == "string" then ReactModule.createElement(Icon, {
			LayoutOrder = NextOrder(),
			name = Frame.slot,
			size = IconSize.Large,
			style = MapResult
		}) else ReactModule.createElement(View, {
			tag = "auto-xy",
			Active = Frame.isDisabled ~= false,
			LayoutOrder = NextOrder()
		}, Frame.slot),
		Count = if Count then ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-large text-align-x-center content-emphasis",
			LayoutOrder = NextOrder(),
			Text = Count:map(function(p1)
				-- upvalues: formatCount (upval), Frame (copy)
				return (formatCount(p1, Frame.countIsCapped == true))
			end),
			Visible = Count:map(function(p1): boolean
				return p1 ~= nil
			end),
			textStyle = MapResult
		}) else nil
	})
end)