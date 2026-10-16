local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnibarListModule = require(InExperienceSideSheet.Components.UnibarList)
local UseExperienceDetailsModule = require(InExperienceSideSheet.Hooks.useExperienceDetails)
local UseExperienceIconModule = require(InExperienceSideSheet.Hooks.useExperienceIcon)

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "ExperienceDetailsRow" ]]
	-- upvalues: UseTokensFunction (copy), UseExperienceDetailsModule (copy), UseExperienceIconModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), Text (copy), VerifiedBadgeModule (copy), Image (copy), UnibarListModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseExperienceDetailsModuleResult, UseExperienceDetailsModuleResult2, UseExperienceDetailsModuleResult3 = UseExperienceDetailsModule()
	local UseExperienceIconModuleResult = UseExperienceIconModule()
	local ScaledXXSmall = UseTokensResult.Padding.XXSmall * 2
	local LineHeightDelta = UseTokensResult.Typography.TitleMedium.LineHeight * UseTokensResult.Typography.TitleMedium.FontSize - ScaledXXSmall
	local LineHeightDelta1 = UseTokensResult.Typography.BodyMedium.LineHeight * UseTokensResult.Typography.BodyMedium.FontSize - ScaledXXSmall
	local Name = if UseExperienceDetailsModuleResult2 then UseExperienceDetailsModuleResult2.name else nil
	local IsHasVerifiedBadge: boolean = if UseExperienceDetailsModuleResult2 then UseExperienceDetailsModuleResult2.hasVerifiedBadge == true else false
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder
	}, {
		Leading = ReactModule.createElement(View, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			ExperienceIconContainer = ReactModule.createElement(View, { tag = "size-1000", LayoutOrder = 1 }, {
				ExperienceIcon = UseExperienceIconModuleResult and ReactModule.createElement(Image, {
					tag = "size-full radius-small",
					Image = UseExperienceIconModuleResult
				}),
				ExperienceIconSkeleton = not UseExperienceIconModuleResult and ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
			}),
			ExperienceNameContainer = ReactModule.createElement(View, { tag = "col fill gap-none auto-y", LayoutOrder = 2 }, {
				ExperienceName = UseExperienceDetailsModuleResult and ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-split content-emphasis",
					Text = UseExperienceDetailsModuleResult
				}),
				ExperienceNameSkeleton = if UseExperienceDetailsModuleResult or not UseExperienceDetailsModuleResult3 then nil else ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-y-xxsmall"
				}, {
					Skeleton = ReactModule.createElement(Skeleton, {
						testId = "experience-name-placeholder",
						Size = UDim2.new(1, 0, 0, LineHeightDelta),
						radius = Radius.Small
					})
				}),
				CreatorRow = if Name == nil or Name == "" then if UseExperienceDetailsModuleResult3 then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y padding-y-xxsmall"
				}, {
					Skeleton = ReactModule.createElement(Skeleton, {
						testId = "experience-publisher-placeholder",
						Size = UDim2.new(1, 0, 0, LineHeightDelta1),
						radius = Radius.Small
					})
				}) else nil else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-xsmall size-full-0 auto-y"
				}, {
					CreatorName = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "shrink auto-xy text-body-medium text-align-x-left text-truncate-end content-default",
						Text = Name
					}),
					VerifiedBadge = if IsHasVerifiedBadge then ReactModule.createElement(VerifiedBadgeModule, {
						LayoutOrder = 2,
						testId = "experience-creator-verified-badge"
					}) else nil
				})
			})
		}),
		UnibarList = ReactModule.createElement(UnibarListModule, { layoutOrder = 3 })
	})
end)