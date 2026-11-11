local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local Icon = FoundationModule.Icon
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseSafeZoneOffsetsModule = require(Parent.Hooks.useSafeZoneOffsets)
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize

return function(p1)
	-- upvalues: UseSafeZoneOffsetsModule (copy), UseScreenSizeFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), Icon (copy)
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, UseScreenSizeFunction().Y)
	}, {
		ContentFeedImage = ReactModule.createElement(Skeleton, { ZIndex = 1, Size = UDim2.fromScale(1, 1) }),
		FeedPlayerActions = ReactModule.createElement(View, {
			tag = "auto-y anchor-bottom-center position-bottom-center bg-action-subtle size-full-0 col align-x-left align-y-bottom",
			ZIndex = 2
		}, {
			InfoFrame = ReactModule.createElement(View, {
				tag = "align-x-left align-y-bottom padding-xlarge row position-bottom-center size-full-0 items-end bg-action-subtle anchor-bottom-center auto-y gap-medium items-center",
				LayoutOrder = 1
			}, {
				CreatorThumbnail = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					radius = Radius.Circle,
					Size = UDim2.fromOffset(30, 30)
				}),
				CreatorName = ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 16) })
			}),
			ExperienceInfo = ReactModule.createElement(View, {
				tag = "bg-surface-100 auto-y size-full-0 row align-x-left align-y-center gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20),
					PaddingTop = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 20 + UseSafeZoneOffsetsModule().bottom)
				}),
				ExperienceThumbnail = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					radius = Radius.Medium,
					Size = UDim2.fromOffset(40, 40)
				}),
				ExperienceMetadata = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "auto-y bg-action-subtle grow col align-x-left align-y-center gap-xsmall"
				}, {
					ExperienceNameShimmerPanel = ReactModule.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.fromOffset(160, 16) }),
					ExperienceRatingShimmerPanel = ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 16) })
				}),
				JoinCTAContainer = ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "bg-action-emphasis size-2000-1000 radius-medium",
					isDisabled = true
				}, {
					PlayIcon = ReactModule.createElement(Icon, {
						name = "icons/common/play",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					})
				})
			})
		})
	})
end