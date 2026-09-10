local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
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
local buttonWidth = require(inExperienceSideSheet.Common.Enums).ButtonWidth
local var1 = signalsModule.createSignal(nil)

local _ = function(p1)
	return p1 + (1 - p1) * 0.5
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), signalsReactModule (ref), var1 (ref), reactModule (ref), iconSize (ref), isBuilderIcon (ref), buttonWidth (ref), view (ref), icon (ref), text (ref)
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
	local background = var2.Color.ActionStandard.Background
	local foreground = var2.Color.ActionStandard.Foreground
	local var8 = (p1.width or buttonWidth.Full) == buttonWidth.Full
	local createElement = reactModule.createElement
	local t = {
		tag = {
			["row align-x-center align-y-center gap-small radius-medium bg-action-standard"] = true,
			["size-full-1000"] = var8,
			["fill size-0-1000"] = not var8
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, xSmall)
		},
		isDisabled = not var4
	}
	local t_1 = { Color3 = background.Color3 }
	
	if var4 then
		var7 = background.Transparency
	else
		local transparency = background.Transparency
		var7 = transparency + (1 - transparency) * 0.5
	end
	t_1.Transparency = var7
	t.backgroundStyle = t_1
	t.onActivated = var6
	t.LayoutOrder = p1.layoutOrder
	
	return createElement(view, t, {
		ShortcutIcon = if var5 then reactModule.createElement(icon, { LayoutOrder = 1, name = var5, size = medium }) else nil,
		Text = reactModule.createElement(text, {
			tag = "auto-x text-label-medium content-action-standard",
			LayoutOrder = 2,
			Text = var3.label,
			textStyle = {
				Color3 = foreground.Color3,
				Transparency = if var4 then foreground.Transparency else 0.5
			}
		})
	})
end)