local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local Chip = FoundationModule.Chip
local Enums = FoundationModule.Enums
local BadgeVariant = Enums.BadgeVariant
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LuaAppIedpSwitchChipToBadge = game:DefineFastFlag("LuaAppIedpSwitchChipToBadge", false)

return function(p1) --[[ Line: 22 | Named "InExperienceDetailsPromptContent" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ScrollView (copy), Visibility (copy), LuaAppIedpSwitchChipToBadge (copy), Badge (copy), BadgeVariant (copy), Chip (copy), Enums (copy)
	return ReactModule.createElement(ScrollView, {
		tag = "size-full-0 auto-y",
		ClipsDescendants = false,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, UseTokensFunction().Gap.Small)
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			AutomaticSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = Visibility.None
		}
	}, {
		AgeRecommendation = if p1.ageRecommendation and p1.ageRecommendation.displayNameWithHeaderShort then if LuaAppIedpSwitchChipToBadge then ReactModule.createElement(Badge, {
			LayoutOrder = 1,
			text = p1.ageRecommendation.displayNameWithHeaderShort,
			variant = BadgeVariant.Neutral
		}) else ReactModule.createElement(Chip, {
			LayoutOrder = 1,
			Selectable = false,
			text = p1.ageRecommendation.displayNameWithHeaderShort,
			onActivated = function() --[[ Line: 49 ]] end
		}) else nil,
		Rating = if p1.rating then if LuaAppIedpSwitchChipToBadge then ReactModule.createElement(Badge, {
			LayoutOrder = 2,
			text = p1.rating,
			variant = BadgeVariant.Neutral,
			icon = {
				name = Enums.IconName.ThumbUp,
				variant = Enums.IconVariant.Filled,
				position = Enums.IconPosition.Left
			}
		}) else ReactModule.createElement(Chip, {
			LayoutOrder = 2,
			Selectable = false,
			text = p1.rating,
			leading = {
				iconName = Enums.IconName.ThumbUp,
				iconVariant = Enums.IconVariant.Filled
			},
			onActivated = function() --[[ Line: 72 ]] end
		}) else nil
	})
end