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
local FFlagSideSheetEmphasizeLeave = require(InExperienceSideSheet.Flags).FFlagSideSheetEmphasizeLeave
local ButtonWidth = require(InExperienceSideSheet.Common.Enums).ButtonWidth
local Signal = require(Parent.Signals).createSignal(nil)

local function _(p1: number): number
	return p1 + (1 - p1) * 0.5
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), SignalsReactModule (copy), Signal (copy), ReactModule (copy), IconSize (copy), IsBuilderIconFunction (copy), FFlagSideSheetEmphasizeLeave (copy), ButtonWidth (copy), View (copy), Icon (copy), Text (copy)
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
	local IsIsEmphasized: boolean = FFlagSideSheetEmphasizeLeave and p1.isEmphasized == true
	local Background = if IsIsEmphasized then UseTokensResult.Color.ActionSoftEmphasis.Background else UseTokensResult.Color.ActionStandard.Background
	local Foreground = if IsIsEmphasized then UseTokensResult.Color.ActionSoftEmphasis.Foreground else UseTokensResult.Color.ActionStandard.Foreground
	local IsFullMatch = (p1.width or ButtonWidth.Full) == ButtonWidth.Full
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = {
			["row align-x-center align-y-center gap-small radius-medium"] = true,
			["bg-action-standard"] = not IsIsEmphasized,
			["size-full-1000"] = IsFullMatch,
			["fill size-0-1000"] = not IsFullMatch
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, XSmall)
		},
		isDisabled = not UseSignalStateResult
	}
	local BackgroundStyle = nil
	
	if UseSignalStateResult then
		BackgroundStyle = Background
	else
		local Transparency: number = Background.Transparency
		BackgroundStyle = {
			Color3 = Background.Color3,
			Transparency = Transparency + (1 - Transparency) * 0.5
		}
	end
	config.backgroundStyle = BackgroundStyle
	config.onActivated = UseResult
	config.testId = if FFlagSideSheetEmphasizeLeave then p1.testId else nil
	config.LayoutOrder = p1.layoutOrder
	
	return CreateElementFunction(View, config, {
		ShortcutIcon = if UseSignalStateResult1 then ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = UseSignalStateResult1,
			size = Medium
		}) else nil,
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = {
				["auto-x text-label-medium"] = true,
				["content-action-standard"] = not IsIsEmphasized
			},
			Text = UseLocalizationResult.label,
			textStyle = if UseSignalStateResult then Foreground else { Transparency = 0.5, Color3 = Foreground.Color3 }
		})
	})
end)