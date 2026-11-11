local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Schools.Common.Enums)
local WaitlistVariantsModule = require(script.Parent.waitlistVariants)
local WaitlistTimelineModule = require(script.Parent.WaitlistTimeline)
local WaitlistShareBannerModule = require(script.Parent.WaitlistShareBanner)

return function(p1)
	-- upvalues: WaitlistVariantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ScrollView (copy), FoundationModule (copy), View (copy), Text (copy), WaitlistTimelineModule (copy), WaitlistShareBannerModule (copy)
	local ByVariantEntry = WaitlistVariantsModule.byVariant[p1.variant]
	
	return ReactModule.createElement(ScrollView, {
		Size = UDim2.fromScale(1, 1),
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = FoundationModule.Enums.Visibility.Auto
		}
	}, {
		Inner = ReactModule.createElement(View, {
			tag = "col gap-large size-full-0 auto-y padding-bottom-xlarge"
		}, {
			Header = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col align-x-left gap-xxsmall size-full-0 auto-y"
			}, {
				Heading = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-default",
					Text = p1.schoolName
				}),
				Body = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = UseLocalizationFunction({ body = ByVariantEntry.bodyKey }).body
				})
			}),
			Timeline = ReactModule.createElement(WaitlistTimelineModule, {
				LayoutOrder = 2,
				stages = ByVariantEntry.stages,
				remainingCount = p1.remainingCount
			}),
			ShareBanner = ReactModule.createElement(WaitlistShareBannerModule, {
				LayoutOrder = 3,
				titleKey = ByVariantEntry.shareTitleKey,
				bodyKey = ByVariantEntry.shareBodyKey,
				hasMedia = ByVariantEntry.hasShareMedia,
				mediaImage = p1.shareMedia,
				onShare = p1.onShare
			})
		})
	})
end