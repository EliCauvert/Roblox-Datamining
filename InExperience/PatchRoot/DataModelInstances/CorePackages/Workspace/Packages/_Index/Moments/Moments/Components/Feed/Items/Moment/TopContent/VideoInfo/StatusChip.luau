local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local badge = foundationModule.Badge
local chip = foundationModule.Chip
local view = foundationModule.View
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local useLocalization = localizationModule.Hooks.useLocalization
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local t = {
	partnerContent = "Feature.Moments.Label.RobloxPartnerContent"
}

local function noop() --[[ line: 45 ]] end

return reactModule.memo(function(p0) --[[ line: 51 | named "StatusChip" ]]
	-- upvalues: useLocalization (ref), t (ref), momentContextModule (ref), reactModule (ref), view (ref), chip (ref), chipSize (ref), chipVariant (ref), builderIconsModule (ref), noop (ref), badge (ref), badgeVariant (ref), badgeSize (ref), badgeShape (ref)
	local var7 = useLocalization(t)
	local data = momentContextModule.useMoment().store.getData(false)
	
	if data.kind == "ad" then
		return reactModule.createElement(view, {
			tag = "row align-x-left auto-xy",
			LayoutOrder = p0.LayoutOrder
		}, {
			Chip = reactModule.createElement(chip, {
				text = "Ad",
				size = chipSize.Small,
				variant = chipVariant.Standard,
				trailing = {
					iconName = builderIconsModule.Icon.CircleI,
					onActivated = noop
				},
				onActivated = noop
			})
		})
	elseif not data.isSponsored then
		return nil
	end
	local partnerContent = var7.partnerContent
	
	return reactModule.createElement(view, {
		tag = "row align-x-left auto-xy",
		LayoutOrder = p0.LayoutOrder
	}, {
		Badge = reactModule.createElement(badge, {
			text = if partnerContent == nil or partnerContent == "" then "Roblox Partner Content" else partnerContent,
			variant = badgeVariant.Neutral,
			size = badgeSize.Small,
			shape = badgeShape.Box
		})
	})
end)