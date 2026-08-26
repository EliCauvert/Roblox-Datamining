local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local text = foundationModule.Text
local enums = foundationModule.Enums
local localizationService = game:GetService("LocalizationService")

local function _(p1)
	-- upvalues: localizationService (ref)
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime then dateTime:FormatLocalTime("MMM DD, LT", localizationService.RobloxLocaleId) else p1
end

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), foundationModule (ref), enums (ref), text (ref), localizationService (ref)
	local var1 = useTokens()
	local var2 = useLocalization({ itemExpires = "Feature.Durables.Label.ItemExpires" })
	local createElement = reactModule.createElement
	local t = {
		tag = "row align-y-center padding-large radius-medium flex-between size-full-0",
		backgroundStyle = var1.Color.Surface.Surface_100,
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_1 = {
		LeftContent = reactModule.createElement(view, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 1
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 1,
				name = enums.IconName.Clock,
				variant = enums.IconVariant.Regular,
				size = enums.IconSize.Small
			}),
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-label-medium content-emphasis",
				LayoutOrder = 2,
				Text = var2.itemExpires
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = { tag = "auto-xy", LayoutOrder = 2 }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = { tag = "auto-xy text-body-medium content-emphasis" }
	local expirationTime = p1.expirationTime
	local dateTime = DateTime.fromIsoDate(expirationTime)
	t_4.Text = if not dateTime then expirationTime else dateTime:FormatLocalTime("MMM DD, LT", localizationService.RobloxLocaleId)
	t_3.ExpirationText = createElement_2(text, t_4)
	t_1.RightContent = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end