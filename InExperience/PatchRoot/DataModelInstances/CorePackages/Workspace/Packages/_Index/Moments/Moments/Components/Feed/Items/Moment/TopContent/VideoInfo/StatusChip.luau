local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local Chip = FoundationModule.Chip
local View = FoundationModule.View
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local config = {
	partnerContent = "Feature.Moments.Label.RobloxPartnerContent"
}

local function noop() --[[ Line: 45 ]] end

return ReactModule.memo(function(Frame: Frame) --[[ Line: 51 | Named "StatusChip" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), MomentContextModule (copy), ReactModule (copy), View (copy), Chip (copy), ChipSize (copy), ChipVariant (copy), BuilderIconsModule (copy), noop (copy), Badge (copy), BadgeVariant (copy), BadgeSize (copy), BadgeShape (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Data = MomentContextModule.useMoment().store.getData(false)
	
	if Data.kind == "ad" then
		return ReactModule.createElement(View, {
			tag = "row align-x-left auto-xy",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Chip = ReactModule.createElement(Chip, {
				text = "Ad",
				size = ChipSize.Small,
				variant = ChipVariant.Standard,
				trailing = {
					iconName = BuilderIconsModule.Icon.CircleI,
					onActivated = noop
				},
				onActivated = noop
			})
		})
	elseif Data.isSponsored then
		local PartnerContent = UseLocalizationResult.partnerContent
		
		return ReactModule.createElement(View, {
			tag = "row align-x-left auto-xy",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Badge = ReactModule.createElement(Badge, {
				text = if PartnerContent == nil or PartnerContent == "" then "Roblox Partner Content" else PartnerContent,
				variant = BadgeVariant.Neutral,
				size = BadgeSize.Small,
				shape = BadgeShape.Box
			})
		})
	else
		return nil
	end
end)