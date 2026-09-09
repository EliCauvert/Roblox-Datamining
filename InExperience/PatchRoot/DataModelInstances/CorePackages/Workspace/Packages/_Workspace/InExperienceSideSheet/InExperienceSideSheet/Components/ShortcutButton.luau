local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local view = foundationModule.View
local var1 = signalsModule.createSignal(nil)

local _ = function(p1)
	return p1 + (1 - p1) * 0.5
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), signalsReactModule (ref), var1 (ref), reactModule (ref), iconSize (ref), isBuilderIcon (ref), view (ref), icon (ref), text (ref)
	local var2 = useTokens()
	local var3 = useLocalization({ label = p1.label })
	local var4 = signalsReactModule.useSignalState(p1.getIsEnabled)
	local var5 = signalsReactModule.useSignalState(p1.getShortcutIcon or var1)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.getOnActivated()()
	end, { p1.getOnActivated })
	local medium = iconSize.Medium
	local xSmall = var2.Gap.XSmall
	
	if isBuilderIcon(var5) then
		medium = iconSize.XLarge
		xSmall = var2.Gap.Small
	end
	local var7
	local var8 = if p1.isEmphasis then var2.Color.ActionSoftEmphasis.Background else var2.Color.ActionStandard.Background
	local var9 = if p1.isEmphasis then var2.Color.ActionSoftEmphasis.Foreground else var2.Color.ActionStandard.Foreground
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
		isDisabled = not var4
	}
	local t_1 = { Color3 = var8.Color3 }
	
	if var4 then
		var7 = var8.Transparency
	else
		local transparency = var8.Transparency
		var7 = transparency + (1 - transparency) * 0.5
	end
	t_1.Transparency = var7
	t.backgroundStyle = t_1
	t.onActivated = var6
	t.LayoutOrder = p1.layoutOrder
	
	return createElement(view, t, {
		ShortcutIcon = if var5 then reactModule.createElement(icon, { LayoutOrder = 1, name = var5, size = medium }) else nil,
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = {
				["auto-x"] = true,
				["text-title-medium"] = not p1.isSmall,
				["text-title-small"] = p1.isSmall,
				["content-action-standard"] = not p1.isEmphasis,
				["content-action-soft-emphasis"] = p1.isEmphasis
			},
			Text = var3.label,
			textStyle = {
				Color3 = var9.Color3,
				Transparency = if var4 then var9.Transparency else 0.5
			}
		})
	})
end)