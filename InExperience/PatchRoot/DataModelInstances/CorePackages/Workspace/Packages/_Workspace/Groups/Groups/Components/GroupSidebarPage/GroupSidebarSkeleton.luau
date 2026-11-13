local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Groups.Common.TextKeys)
local Radius = FoundationModule.Enums.Radius

local function SkeletonRow(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), Radius (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center size-full-1000 padding-left-xsmall",
		LayoutOrder = p1.layoutOrder
	}, {
		Leading = ReactModule.createElement(FoundationModule.View, {
			tag = "col align-x-center align-y-center size-1000-1000",
			LayoutOrder = 1
		}, {
			LeadingSkeleton = ReactModule.createElement(FoundationModule.Skeleton, {
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600),
				radius = Radius.Small
			})
		}),
		Name = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center fill size-0-full padding-x-small",
			LayoutOrder = 2
		}, {
			NameSkeleton = ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_350) }, {
				MaxWidth = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(200, 1e999) }),
				Bar = ReactModule.createElement(FoundationModule.Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
			})
		})
	})
end

local function rows(p1)
	-- upvalues: ReactModule (copy), SkeletonRow (copy)
	local Elements = {}
	
	for i = 1, p1 do
		Elements[`Row_{i}`] = ReactModule.createElement(SkeletonRow, { layoutOrder = i })
	end
	return Elements
end

return function()
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), rows (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xxsmall size-full clip",
		testId = "GroupSidebar.Skeleton",
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseTokensResult.Padding.Medium),
			right = UDim.new(0, UseTokensResult.Padding.Medium)
		}
	}, {
		Header = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-xxsmall size-full-0 auto-y",
			LayoutOrder = 1
		}, (rows(2))),
		Heading = ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			Divider = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y padding-y-small",
				LayoutOrder = 1
			}, {
				Line = ReactModule.createElement(FoundationModule.Divider, {})
			}),
			Title = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center size-full-1000",
				LayoutOrder = 2,
				padding = {
					left = UDim.new(0, UseTokensResult.Padding.XSmall + UseTokensResult.Padding.Small),
					right = UDim.new(0, UseTokensResult.Padding.Small)
				}
			}, {
				Text = ReactModule.createElement(FoundationModule.Text, {
					tag = "fill size-0-full text-caption-large text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = UseLocalizationFunction({ heading = TextKeysModule.HeaderUppercaseMyGroups }).heading
				}),
				Search = ReactModule.createElement(FoundationModule.View, {
					tag = "col align-x-center align-y-center size-600-600",
					LayoutOrder = 2
				}, {
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						name = FoundationModule.Enums.IconName.MagnifyingGlass,
						size = FoundationModule.Enums.IconSize.Small
					})
				})
			})
		}),
		Communities = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-xxsmall size-full-0 auto-y",
			LayoutOrder = 3
		}, (rows(6)))
	})
end