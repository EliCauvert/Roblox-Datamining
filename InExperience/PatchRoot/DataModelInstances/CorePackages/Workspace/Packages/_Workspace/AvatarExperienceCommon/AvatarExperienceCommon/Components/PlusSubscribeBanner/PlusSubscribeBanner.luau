local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagAXPlusSubscribeBannerRestyleModule = require(script.Parent.FFlagAXPlusSubscribeBannerRestyle)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(Frame) --[[ Line: 29 | Named "PlusSubscribeBanner" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FFlagAXPlusSubscribeBannerRestyleModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = Frame.testId or "PlusSubscribeBanner"
	
	return ReactModule.createElement(View, {
		tag = {
			["size-full-0 auto-y padding-medium radius-medium bg-action-standard"] = FFlagAXPlusSubscribeBannerRestyleModule,
			["size-full-0 auto-y padding-medium stroke-standard stroke-position-inner stroke-default radius-medium"] = not FFlagAXPlusSubscribeBannerRestyleModule
		},
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, {
		Content = ReactModule.createElement(View, {
			tag = "row flex-between align-y-center gap-small size-full-0 auto-y"
		}, {
			Leading = ReactModule.createElement(View, {
				tag = "row align-y-center fill gap-small auto-xy",
				LayoutOrder = 1
			}, {
				PlusIcon = if Frame.showPlusIcon then ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = IconName.RobloxPlus,
					size = IconSize.Medium,
					style = UseTokensResult.Color.Content.Emphasis,
					testId = `{TestId}PlusIcon`
				}) else nil,
				Message = ReactModule.createElement(Text, {
					tag = "fill text-body-small text-align-x-left content-emphasis",
					LayoutOrder = 2,
					Text = Frame.message
				})
			}),
			Subscribe = ReactModule.createElement(View, {
				tag = "auto-xy",
				LayoutOrder = 2,
				onActivated = Frame.onActivated,
				testId = `{TestId}Action`
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-small content-default",
					RichText = true,
					Text = `<u>{Frame.actionText}</u>`
				})
			})
		})
	})
end)