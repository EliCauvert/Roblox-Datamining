local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)
local FFlagUnifyVerifiedBadgeComponent = require(Parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local _ = require(BuildExperience.Chat.chatTypes)
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant

local function _(p1)
	return p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150`
end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), Text (copy), FFlagUnifyVerifiedBadgeComponent (copy), VerifiedBadgeModule (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy)
	local TestId = p1.testId or "publish-experience-title"
	local Target = p1.target
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		GameIcon = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = "size-1200-1200 radius-medium clip bg-surface-200",
			Image = Target.gameIcon or `rbxthumb://type=GameIcon&id={Target.universeId}&w=150&h=150`,
			ScaleType = Enum.ScaleType.Crop,
			testId = `{TestId}-game-icon`
		}),
		Details = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill size-full-0 auto-y" }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = Target.experienceName
			}),
			CreatorRow = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall size-full-0 auto-y"
			}, {
				CreatorName = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = Target.creatorName or "",
					tag = {
						["text-body-medium text-align-x-left content-default"] = true,
						["shrink auto-xy text-wrap"] = FFlagUnifyVerifiedBadgeComponent,
						["fill auto-y text-wrap"] = not FFlagUnifyVerifiedBadgeComponent
					}
				}),
				VerifiedBadge = if p1.isCreatorVerified == true then if FFlagUnifyVerifiedBadgeComponent then ReactModule.createElement(VerifiedBadgeModule, { LayoutOrder = 2, testId = `{TestId}-verified-badge` }) else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "size-400-400",
					testId = `{TestId}-verified-badge`
				}, {
					Backplate = ReactModule.createElement(Icon, {
						tag = "content-system-emphasis",
						ZIndex = 1,
						name = IconName.VerifiedBackplate,
						size = IconSize.Small
					}),
					Check = ReactModule.createElement(Icon, {
						ZIndex = 2,
						name = IconName.VerifiedCheck,
						size = IconSize.Small,
						variant = IconVariant.Regular
					})
				}) else nil
			})
		})
	})
end