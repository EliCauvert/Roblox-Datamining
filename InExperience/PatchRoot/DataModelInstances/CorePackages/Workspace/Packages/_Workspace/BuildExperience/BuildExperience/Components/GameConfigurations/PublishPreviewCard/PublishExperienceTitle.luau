local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)
local fFlagUnifyVerifiedBadgeComponent = require(parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local _ = require(buildExperience.Chat.chatTypes)
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant

local function _(p1)
	return p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150`
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), image (ref), text (ref), fFlagUnifyVerifiedBadgeComponent (ref), verifiedBadgeModule (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local testId = p1.testId or "publish-experience-title"
	local target = p1.target
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		GameIcon = reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = "size-1200-1200 radius-medium clip bg-surface-200",
			Image = target.gameIcon or `rbxthumb://type=GameIcon&id={target.universeId}&w=150&h=150`,
			ScaleType = Enum.ScaleType.Crop,
			testId = `{testId}-game-icon`
		}),
		Details = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill size-full-0 auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = target.experienceName
			}),
			CreatorRow = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall size-full-0 auto-y"
			}, {
				CreatorName = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = target.creatorName or "",
					tag = {
						["text-body-medium text-align-x-left content-default"] = true,
						["shrink auto-xy text-wrap"] = fFlagUnifyVerifiedBadgeComponent,
						["fill auto-y text-wrap"] = not fFlagUnifyVerifiedBadgeComponent
					}
				}),
				VerifiedBadge = if p1.isCreatorVerified == true then if fFlagUnifyVerifiedBadgeComponent then reactModule.createElement(verifiedBadgeModule, { LayoutOrder = 2, testId = `{testId}-verified-badge` }) else reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "size-400-400",
					testId = `{testId}-verified-badge`
				}, {
					Backplate = reactModule.createElement(icon, {
						tag = "content-system-emphasis",
						ZIndex = 1,
						name = iconName.VerifiedBackplate,
						size = iconSize.Small
					}),
					Check = reactModule.createElement(icon, {
						ZIndex = 2,
						name = iconName.VerifiedCheck,
						size = iconSize.Small,
						variant = iconVariant.Regular
					})
				}) else nil
			})
		})
	})
end