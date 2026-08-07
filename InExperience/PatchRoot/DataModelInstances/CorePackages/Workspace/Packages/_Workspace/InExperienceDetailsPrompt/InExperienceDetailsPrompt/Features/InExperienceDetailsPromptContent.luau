local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local badge = foundationModule.Badge
local chip = foundationModule.Chip
local enums = foundationModule.Enums
local badgeVariant = enums.BadgeVariant
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local useTokens = foundationModule.Hooks.useTokens
local luaAppIedpSwitchChipToBadge = game:DefineFastFlag("LuaAppIedpSwitchChipToBadge", false)

return function(p0) --[[ line: 22 | named "InExperienceDetailsPromptContent" ]]
	-- upvalues: useTokens (ref), reactModule (ref), scrollView (ref), visibility (ref), luaAppIedpSwitchChipToBadge (ref), badge (ref), badgeVariant (ref), chip (ref), enums (ref)
	return reactModule.createElement(scrollView, {
		tag = "size-full-0 auto-y",
		ClipsDescendants = false,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, useTokens().Gap.Small)
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			AutomaticSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = visibility.None
		}
	}, {
		AgeRecommendation = if p0.ageRecommendation and p0.ageRecommendation.displayNameWithHeaderShort then if luaAppIedpSwitchChipToBadge then reactModule.createElement(badge, {
			LayoutOrder = 1,
			text = p0.ageRecommendation.displayNameWithHeaderShort,
			variant = badgeVariant.Neutral
		}) else reactModule.createElement(chip, {
			LayoutOrder = 1,
			Selectable = false,
			text = p0.ageRecommendation.displayNameWithHeaderShort,
			onActivated = function() --[[ line: 49 ]] end
		}) else nil,
		Rating = if p0.rating then if luaAppIedpSwitchChipToBadge then reactModule.createElement(badge, {
			LayoutOrder = 2,
			text = p0.rating,
			variant = badgeVariant.Neutral,
			icon = {
				name = enums.IconName.ThumbUp,
				variant = enums.IconVariant.Filled,
				position = enums.IconPosition.Left
			}
		}) else reactModule.createElement(chip, {
			LayoutOrder = 2,
			Selectable = false,
			text = p0.rating,
			leading = {
				iconName = enums.IconName.ThumbUp,
				iconVariant = enums.IconVariant.Filled
			},
			onActivated = function() --[[ line: 72 ]] end
		}) else nil
	})
end