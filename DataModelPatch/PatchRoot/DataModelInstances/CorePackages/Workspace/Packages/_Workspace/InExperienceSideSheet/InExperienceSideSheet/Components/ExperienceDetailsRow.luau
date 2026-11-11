local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnibarListModule = require(InExperienceSideSheet.Components.UnibarList)
local UseExperienceIconModule = require(InExperienceSideSheet.Hooks.useExperienceIcon)
local UseExperienceNameModule = require(InExperienceSideSheet.Hooks.useExperienceName)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseExperienceNameModule (copy), UseExperienceIconModule (copy), ReactModule (copy), View (copy), Image (copy), Skeleton (copy), Radius (copy), Text (copy), UnibarListModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseExperienceNameModuleResult = UseExperienceNameModule()
	local UseExperienceIconModuleResult = UseExperienceIconModule()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-1400 padding-right-xlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		ExperienceIconContainer = ReactModule.createElement(View, { tag = "size-600", LayoutOrder = 1 }, {
			ExperienceIcon = UseExperienceIconModuleResult and ReactModule.createElement(Image, {
				tag = "size-full radius-small",
				Image = UseExperienceIconModuleResult
			}),
			ExperienceIconSkeleton = not UseExperienceIconModuleResult and ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
		}),
		ExperienceNameContainer = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = 2 }, {
			ExperienceName = UseExperienceNameModuleResult and ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-split content-emphasis",
				Text = UseExperienceNameModuleResult
			}),
			ExperienceNameSkeleton = not UseExperienceNameModuleResult and ReactModule.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500),
				radius = Radius.Small
			})
		}),
		UnibarList = ReactModule.createElement(UnibarListModule, { layoutOrder = 3 })
	})
end)