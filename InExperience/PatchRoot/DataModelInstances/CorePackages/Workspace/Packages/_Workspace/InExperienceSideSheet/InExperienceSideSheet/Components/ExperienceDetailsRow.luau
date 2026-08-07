local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local unibarListModule = require(inExperienceSideSheet.Components.UnibarList)
local useExperienceIconModule = require(inExperienceSideSheet.Hooks.useExperienceIcon)
local useExperienceNameModule = require(inExperienceSideSheet.Hooks.useExperienceName)

return reactModule.memo(function(p0) --[[ line: 23 | named "ExperienceDetailsRow" ]]
	-- upvalues: useTokens (ref), useExperienceNameModule (ref), useExperienceIconModule (ref), reactModule (ref), view (ref), image (ref), skeleton (ref), radius (ref), text (ref), unibarListModule (ref)
	local var6 = useTokens()
	local var7 = useExperienceNameModule()
	local var8 = useExperienceIconModule()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-1400 padding-right-xlarge",
		LayoutOrder = p0.layoutOrder
	}, {
		ExperienceIconContainer = reactModule.createElement(view, { tag = "size-600", LayoutOrder = 1 }, {
			ExperienceIcon = var8 and reactModule.createElement(image, { tag = "size-full radius-small", Image = var8 }),
			ExperienceIconSkeleton = not var8 and reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Small })
		}),
		ExperienceNameContainer = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = 2 }, {
			ExperienceName = var7 and reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-split content-emphasis",
				Text = var7
			}),
			ExperienceNameSkeleton = not var7 and reactModule.createElement(skeleton, {
				Size = UDim2.new(1, 0, 0, var6.Size.Size_500),
				radius = radius.Small
			})
		}),
		UnibarList = reactModule.createElement(unibarListModule, { layoutOrder = 3 })
	})
end)