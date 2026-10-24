local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local TiltKeyartModule = require(TiltLoadingScreen.Components.TiltKeyart)
local VerifiedBadgeModule = require(TiltLoadingScreen.Components.VerifiedBadge)
local VerifiedBadgeModule1 = require(Parent.VerifiedBadges.VerifiedBadge)
local FFlagUnifyVerifiedBadgeComponent = require(Parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones
local _ = require(TiltLoadingScreen.Types)
local TILTDEGREES = require(TiltLoadingScreen.Constants).KEYART.TILT_DEGREES
local config = {
	keyart = {
		rotation = ReactModule.createBinding(TILTDEGREES),
		sizeScale = ReactModule.createBinding(1),
		coverTransparency = ReactModule.createBinding(1)
	},
	frame = {
		rotation = ReactModule.createBinding(-TILTDEGREES),
		sizeScale = ReactModule.createBinding(1),
		groupTransparency = ReactModule.createBinding(0)
	},
	title = {
		reveal = ReactModule.createBinding(1),
		slide = ReactModule.createBinding(UDim.new(0, 0))
	},
	creator = {
		reveal = ReactModule.createBinding(1),
		slide = ReactModule.createBinding(UDim.new(0, 0))
	},
	verified = { reveal = ReactModule.createBinding(1) }
}

local function _(Value: number): number
	return (math.clamp(Value, 0, 1))
end

local _ = function(p1): number
	return (math.ceil(p1.FontSize * p1.LineHeight))
end

local _ = function(p1)
	return p1:map(function(p2: number): boolean
		return p2 < 0.999
	end)
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), config (copy), FFlagLoadingScreenMilestones (copy), ReactModule (copy), View (copy), TiltKeyartModule (copy), Text (copy), FFlagUnifyVerifiedBadgeComponent (copy), VerifiedBadgeModule1 (copy), VerifiedBadgeModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Animation = p1.animation or config
	local EmphasisColor3 = UseTokensResult.Color.Content.Emphasis.Color3
	local DefaultColor3 = UseTokensResult.Color.Content.Default.Color3
	local EmphasisColor3_1 = UseTokensResult.Color.System.Emphasis.Color3
	local HeadingLarge = UseTokensResult.Typography.HeadingLarge
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local MapResult = Animation.verified.reveal:map(function(Value: number)
		-- upvalues: EmphasisColor3_1 (copy)
		return {
			Color3 = EmphasisColor3_1,
			Transparency = 1 - math.clamp(Value, 0, 1)
		}
	end)
	local MapResult1 = Animation.verified.reveal:map(function(Value: number)
		-- upvalues: UseTokensResult (copy)
		return {
			Color3 = UseTokensResult.Color.Content.Emphasis.Color3,
			Transparency = 1 - math.clamp(Value, 0, 1)
		}
	end)
	local ThumbnailUrl = p1.thumbnailUrl or ""
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-large size-full-0 auto-y",
		testId = "tilt-lockup"
	}, {
		ArtTitle = ReactModule.createElement(View, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Card = ReactModule.createElement(TiltKeyartModule, {
				key = if FFlagLoadingScreenMilestones then "Card_" .. ThumbnailUrl else "Card",
				thumbnailUrl = ThumbnailUrl,
				onThumbnailLoaded = p1.onThumbnailLoaded,
				keyart = Animation.keyart,
				frame = Animation.frame
			}),
			TitleCreator = ReactModule.createElement(View, {
				tag = "col align-x-center gap-xsmall auto-y padding-y-xsmall",
				LayoutOrder = 2,
				Size = UDim2.new(p1.textWidthScale or 0.8, 0, 0, 0)
			}, {
				TitleWrap = ReactModule.createElement(View, {
					LayoutOrder = 1,
					ClipsDescendants = Animation.title.reveal:map(function(p2: number): boolean
						return p2 < 0.999
					end),
					Size = UDim2.new(1, 0, 0, (math.ceil(HeadingLarge.FontSize * HeadingLarge.LineHeight))),
					padding = { top = Animation.title.slide }
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "size-full text-heading-large text-no-wrap text-align-x-center text-align-y-center text-truncate-end",
						Text = p1.gameName or "",
						textStyle = Animation.title.reveal:map(function(Value: number)
							-- upvalues: EmphasisColor3 (copy)
							return {
								Color3 = EmphasisColor3,
								Transparency = 1 - math.clamp(Value, 0, 1)
							}
						end)
					})
				}),
				SubWrap = ReactModule.createElement(View, {
					tag = "col align-x-center align-y-center",
					LayoutOrder = 2,
					ClipsDescendants = Animation.creator.reveal:map(function(p2: number): boolean
						return p2 < 0.999
					end),
					Size = UDim2.new(1, 0, 0, (math.ceil(BodyMedium.FontSize * BodyMedium.LineHeight))),
					padding = { top = Animation.creator.slide }
				}, {
					Row = ReactModule.createElement(View, {
						tag = "row align-x-center align-y-center gap-xsmall size-full-0 auto-y"
					}, {
						Author = ReactModule.createElement(Text, {
							tag = "shrink auto-xy text-body-medium text-no-wrap text-truncate-end",
							LayoutOrder = 1,
							Text = p1.creatorName or "",
							textStyle = Animation.creator.reveal:map(function(Value: number)
								-- upvalues: DefaultColor3 (copy)
								return {
									Color3 = DefaultColor3,
									Transparency = 1 - math.clamp(Value, 0, 1) * 0.6
								}
							end)
						}),
						Verified = if p1.isCreatorVerified then if FFlagUnifyVerifiedBadgeComponent then ReactModule.createElement(VerifiedBadgeModule1, {
							LayoutOrder = 2,
							testId = "tilt-verified-badge",
							backplateStyle = MapResult,
							checkStyle = MapResult1
						}) else ReactModule.createElement(VerifiedBadgeModule, {
							LayoutOrder = 2,
							backplateStyle = MapResult,
							checkStyle = MapResult1
						}) else nil
					})
				})
			})
		})
	})
end)