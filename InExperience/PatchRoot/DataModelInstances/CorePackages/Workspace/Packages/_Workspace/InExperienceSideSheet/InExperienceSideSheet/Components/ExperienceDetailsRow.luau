local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local unibarListModule = require(inExperienceSideSheet.Components.UnibarList)
local useExperienceDetailsModule = require(inExperienceSideSheet.Hooks.useExperienceDetails)
local useExperienceIconModule = require(inExperienceSideSheet.Hooks.useExperienceIcon)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useExperienceDetailsModule (ref), useExperienceIconModule (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), text (ref), verifiedBadgeModule (ref), image (ref), unibarListModule (ref)
	local var1
	local var2 = useTokens()
	local var3, var4, var5 = useExperienceDetailsModule()
	local var6 = useExperienceIconModule()
	local var7 = var2.Padding.XXSmall * 2
	local var8 = var2.Typography.BodyMedium.LineHeight * var2.Typography.BodyMedium.FontSize - var7
	local var9 = if var3 or not var5 then nil else reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y padding-y-xxsmall"
	}, {
		Skeleton = reactModule.createElement(skeleton, {
			testId = "experience-name-placeholder",
			Size = UDim2.new(1, 0, 0, var2.Typography.TitleMedium.LineHeight * var2.Typography.TitleMedium.FontSize - var7),
			radius = radius.Small
		})
	})
	local var10 = if var4 then var4.name else nil
	
	if var4 then
		var1 = var4.hasVerifiedBadge == true
		var1 = nil
	else
		var1 = false
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder
	}, {
		Leading = reactModule.createElement(view, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			ExperienceIconContainer = reactModule.createElement(view, { tag = "size-1000", LayoutOrder = 1 }, {
				ExperienceIcon = var6 and reactModule.createElement(image, { tag = "size-full radius-small", Image = var6 }),
				ExperienceIconSkeleton = not var6 and reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Small })
			}),
			ExperienceNameContainer = reactModule.createElement(view, { tag = "col fill gap-none auto-y", LayoutOrder = 2 }, {
				ExperienceName = var3 and reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-split content-emphasis",
					Text = var3
				}),
				ExperienceNameSkeleton = var9,
				CreatorRow = if var10 == nil or var10 == "" then if var5 then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y padding-y-xxsmall"
				}, {
					Skeleton = reactModule.createElement(skeleton, {
						testId = "experience-publisher-placeholder",
						Size = UDim2.new(1, 0, 0, var8),
						radius = radius.Small
					})
				}) else nil else reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-xsmall size-full-0 auto-y"
				}, {
					CreatorName = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "shrink auto-xy text-body-medium text-align-x-left text-truncate-end content-default",
						Text = var10
					}),
					VerifiedBadge = if var1 then reactModule.createElement(verifiedBadgeModule, {
						LayoutOrder = 2,
						testId = "experience-creator-verified-badge"
					}) else nil
				})
			})
		}),
		UnibarList = reactModule.createElement(unibarListModule, { layoutOrder = 3 })
	})
end)