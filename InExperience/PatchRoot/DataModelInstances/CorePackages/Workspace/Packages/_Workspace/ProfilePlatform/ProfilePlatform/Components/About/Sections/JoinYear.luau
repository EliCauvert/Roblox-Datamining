local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local InputSize = FoundationModule.Enums.InputSize
local IconVariant = FoundationModule.Enums.IconVariant
local CircleI = require(Parent.BuilderIcons).Icon.CircleI
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 24 | Named "JoinYear" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), Text (copy), Icon (copy), CircleI (copy), InputSize (copy), IconVariant (copy)
	if not p1.joinDateTime or p1.joinDateTime == "" then
		return nil
	end
	local Match: string? = string.match(p1.joinDateTime, "^(%d%d%d%d)")
	
	if Match then
		local UseLocalizationResult = UseLocalizationFunction({
			statistics = TextKeysModule.Statistics,
			joinedInYear = { TextKeysModule.JoinedInYear, year = Match }
		})
		
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-small align-x-left",
			LayoutOrder = p1.layoutOrder
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-y size-full-0 text-align-x-left text-heading-small",
				Text = UseLocalizationResult.statistics
			}),
			Content = ReactModule.createElement(View, {
				tag = "auto-xy size-0 row align-y-center gap-xsmall",
				LayoutOrder = p1.layoutOrder
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = CircleI,
					size = InputSize.XSmall,
					variant = IconVariant.Filled
				}),
				Text = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy size-0 text-align-x-left text-body-medium",
					Text = UseLocalizationResult.joinedInYear
				})
			})
		})
	else
		return nil
	end
end