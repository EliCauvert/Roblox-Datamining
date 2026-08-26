local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local view = foundationModule.View

local _ = function(p1)
	return p1 + (1 - p1) * 0.5
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), signalsReactModule (ref), reactModule (ref), iconSize (ref), isBuilderIcon (ref), view (ref), icon (ref), text (ref)
	local var1 = useTokens()
	local var2 = useLocalization({ label = p1.label })
	local var3 = signalsReactModule.useSignalState(p1.getIsEnabled)
	local var4 = signalsReactModule.useSignalState(p1.getShortcutIcon)
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.getOnActivated()()
	end, { p1.getOnActivated })
	local medium = iconSize.Medium
	local xSmall = var1.Gap.XSmall
	
	if isBuilderIcon(var4) then
		medium = iconSize.XLarge
		xSmall = var1.Gap.Small
	end
	local var6
	local var7 = if p1.isEmphasis then var1.Color.ActionSoftEmphasis.Background else var1.Color.ActionStandard.Background
	local var8 = if p1.isEmphasis then var1.Color.ActionSoftEmphasis.Foreground else var1.Color.ActionStandard.Foreground
	local createElement = reactModule.createElement
	local t = {
		tag = {
			["fill row gap-small align-y-center align-x-center radius-medium"] = true,
			["size-0-1000"] = not p1.isSmall,
			["size-0-800"] = p1.isSmall,
			["bg-action-standard"] = not p1.isEmphasis,
			["bg-action-soft-emphasis"] = p1.isEmphasis
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, xSmall)
		},
		isDisabled = not var3
	}
	local t_1 = { Color3 = var7.Color3 }
	
	if var3 then
		var6 = var7.Transparency
	else
		local transparency = var7.Transparency
		var6 = transparency + (1 - transparency) * 0.5
	end
	t_1.Transparency = var6
	t.backgroundStyle = t_1
	t.onActivated = var5
	t.LayoutOrder = p1.layoutOrder
	
	return createElement(view, t, {
		ShortcutIcon = if var4 then reactModule.createElement(icon, { LayoutOrder = 1, name = var4, size = medium }) else nil,
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = {
				["auto-x"] = true,
				["text-title-medium"] = not p1.isSmall,
				["text-title-small"] = p1.isSmall,
				["content-action-standard"] = not p1.isEmphasis,
				["content-action-soft-emphasis"] = p1.isEmphasis
			},
			Text = var2.label,
			textStyle = {
				Color3 = var8.Color3,
				Transparency = if var3 then var8.Transparency else 0.5
			}
		})
	})
end)