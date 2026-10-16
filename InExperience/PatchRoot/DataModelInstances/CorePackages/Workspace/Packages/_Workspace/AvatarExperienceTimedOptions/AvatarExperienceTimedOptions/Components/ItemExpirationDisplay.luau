local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local LocalizationService = game:GetService("LocalizationService")

local function _(p1) --[[ Line: 23 | Named "formatExpirationDateTime" ]]
	-- upvalues: LocalizationService (copy)
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return if _DateTime then _DateTime:FormatLocalTime("MMM DD, LT", LocalizationService.RobloxLocaleId) else p1
end

return function(Frame) --[[ Line: 34 | Named "ItemExpirationDisplay" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Enums (copy), Text (copy), LocalizationService (copy)
	local ExpirationTime = Frame.expirationTime
	local _DateTime = DateTime.fromIsoDate(ExpirationTime)
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center padding-large radius-medium flex-between size-full-0",
		backgroundStyle = UseTokensFunction().Color.Surface.Surface_100,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftContent = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 1
		}, {
			Icon = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 1,
				name = Enums.IconName.Clock,
				variant = Enums.IconVariant.Regular,
				size = Enums.IconSize.Small
			}),
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-medium content-emphasis",
				LayoutOrder = 2,
				Text = UseLocalizationFunction({ itemExpires = "Feature.Durables.Label.ItemExpires" }).itemExpires
			})
		}),
		RightContent = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
			ExpirationText = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium content-emphasis",
				Text = if _DateTime then _DateTime:FormatLocalTime("MMM DD, LT", LocalizationService.RobloxLocaleId) else ExpirationTime
			})
		})
	})
end