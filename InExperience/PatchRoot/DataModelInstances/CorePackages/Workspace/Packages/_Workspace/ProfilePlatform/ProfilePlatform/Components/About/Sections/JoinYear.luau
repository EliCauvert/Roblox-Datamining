local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local builderIconsModule = require(parent.BuilderIcons)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local text = foundationModule.Text
local view = foundationModule.View
local icon = foundationModule.Icon
local inputSize = foundationModule.Enums.InputSize
local iconVariant = foundationModule.Enums.IconVariant
local circleI = builderIconsModule.Icon.CircleI
local useLocalization = localizationModule.Hooks.useLocalization

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), text (ref), icon (ref), circleI (ref), inputSize (ref), iconVariant (ref)
	if not p0.joinDateTime or p0.joinDateTime == "" then
		return nil
	end
	local match = string.match(p0.joinDateTime, "^(%d%d%d%d)")
	
	if match then
		local var7 = useLocalization({
			statistics = textKeysModule.Statistics,
			joinedInYear = { textKeysModule.JoinedInYear, year = match }
		})
		
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-small align-x-left",
			LayoutOrder = p0.layoutOrder
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-y size-full-0 text-align-x-left text-heading-small",
				Text = var7.statistics
			}),
			Content = reactModule.createElement(view, {
				tag = "auto-xy size-0 row align-y-center gap-xsmall",
				LayoutOrder = p0.layoutOrder
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = circleI,
					size = inputSize.XSmall,
					variant = iconVariant.Filled
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy size-0 text-align-x-left text-body-medium",
					Text = var7.joinedInYear
				})
			})
		})
	end
	return nil
end