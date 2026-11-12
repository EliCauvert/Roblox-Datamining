local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IsBuilderIconFunction = FoundationModule.Utility.isBuilderIcon
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonWidth = require(InExperienceSideSheet.Common.Enums).ButtonWidth
local Signal = require(Parent.Signals).createSignal(nil)

local function _(p1: number): number
	return p1 + (1 - p1) * 0.5
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), SignalsReactModule (copy), Signal (copy), ReactModule (copy), IconSize (copy), IsBuilderIconFunction (copy), ButtonWidth (copy), View (copy), Icon (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ label = p1.label })
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.getIsEnabled)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.getShortcutIcon or Signal)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.getOnActivated()()
	end, { p1.getOnActivated })
	local Medium = IconSize.Medium
	local XSmall = UseTokensResult.Gap.XSmall
	
	if IsBuilderIconFunction(UseSignalStateResult1) then
		Medium = IconSize.XLarge
		XSmall = UseTokensResult.Gap.Small
	end
	local Background = UseTokensResult.Color.ActionStandard.Background
	local Foreground = UseTokensResult.Color.ActionStandard.Foreground
	local IsFullMatch = (p1.width or ButtonWidth.Full) == ButtonWidth.Full
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = {
			["row align-x-center align-y-center gap-small radius-medium bg-action-standard"] = true,
			["size-full-1000"] = IsFullMatch,
			["fill size-0-1000"] = not IsFullMatch
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, XSmall)
		},
		isDisabled = not UseSignalStateResult
	}
	local BackgroundStyle = { Color3 = Background.Color3 }
	local Transparency = nil
	
	if UseSignalStateResult then
		Transparency = Background.Transparency
	else
		local Transparency1: number = Background.Transparency
		Transparency = Transparency1 + (1 - Transparency1) * 0.5
	end
	BackgroundStyle.Transparency = Transparency
	config.backgroundStyle = BackgroundStyle
	config.onActivated = UseResult
	config.LayoutOrder = p1.layoutOrder
	
	return CreateElementFunction(View, config, {
		ShortcutIcon = if UseSignalStateResult1 then ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = UseSignalStateResult1,
			size = Medium
		}) else nil,
		Text = ReactModule.createElement(Text, {
			tag = "auto-x text-label-medium content-action-standard",
			LayoutOrder = 2,
			Text = UseLocalizationResult.label,
			textStyle = {
				Color3 = Foreground.Color3,
				Transparency = if UseSignalStateResult then Foreground.Transparency else 0.5
			}
		})
	})
end)