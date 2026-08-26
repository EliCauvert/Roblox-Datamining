local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local tiltKeyartModule = require(tiltLoadingScreen.Components.TiltKeyart)
local verifiedBadgeModule = require(tiltLoadingScreen.Components.VerifiedBadge)
local verifiedBadgeModule_1 = require(parent.VerifiedBadges.VerifiedBadge)
local fFlagUnifyVerifiedBadgeComponent = require(parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local _ = require(tiltLoadingScreen.Types)
local TILT_DEGREES = require(tiltLoadingScreen.Constants).KEYART.TILT_DEGREES
local t = {
	keyart = {
		rotation = reactModule.createBinding(TILT_DEGREES),
		sizeScale = reactModule.createBinding(1),
		coverTransparency = reactModule.createBinding(1)
	},
	frame = {
		rotation = reactModule.createBinding(-TILT_DEGREES),
		sizeScale = reactModule.createBinding(1),
		groupTransparency = reactModule.createBinding(0)
	},
	title = {
		reveal = reactModule.createBinding(1),
		slide = reactModule.createBinding(UDim.new(0, 0))
	},
	creator = {
		reveal = reactModule.createBinding(1),
		slide = reactModule.createBinding(UDim.new(0, 0))
	},
	verified = { reveal = reactModule.createBinding(1) }
}

local function _(value)
	return math.clamp(value, 0, 1)
end

local _ = function(p1)
	return math.ceil(p1.FontSize * p1.LineHeight)
end

local _ = function(p1)
	return p1:map(function(p2)
		return p2 < 0.999
	end)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), t (ref), reactModule (ref), view (ref), tiltKeyartModule (ref), text (ref), fFlagUnifyVerifiedBadgeComponent (ref), verifiedBadgeModule_1 (ref), verifiedBadgeModule (ref)
	local var1 = useTokens()
	local animation = p1.animation or t
	local color3 = var1.Color.Content.Emphasis.Color3
	local color3_1 = var1.Color.Content.Default.Color3
	local color3_2 = var1.Color.System.Emphasis.Color3
	local headingLarge = var1.Typography.HeadingLarge
	local ceiled = math.ceil(headingLarge.FontSize * headingLarge.LineHeight)
	local bodyMedium = var1.Typography.BodyMedium
	local ceiled_1 = math.ceil(bodyMedium.FontSize * bodyMedium.LineHeight)
	local var2 = animation.title.reveal:map(function(p2)
		return p2 < 0.999
	end)
	local var3 = animation.creator.reveal:map(function(p2)
		return p2 < 0.999
	end)
	local var4 = animation.title.reveal:map(function(p2)
		-- upvalues: color3 (ref)
		return { Color3 = color3, Transparency = 1 - math.clamp(p2, 0, 1) }
	end)
	local var5 = animation.creator.reveal:map(function(p2)
		-- upvalues: color3_1 (ref)
		return {
			Color3 = color3_1,
			Transparency = 1 - math.clamp(p2, 0, 1) * 0.6
		}
	end)
	local var6 = animation.verified.reveal:map(function(p2)
		-- upvalues: color3_2 (ref)
		return {
			Color3 = color3_2,
			Transparency = 1 - math.clamp(p2, 0, 1)
		}
	end)
	local var7 = animation.verified.reveal:map(function(p2)
		-- upvalues: var1 (ref)
		return {
			Color3 = var1.Color.Content.Emphasis.Color3,
			Transparency = 1 - math.clamp(p2, 0, 1)
		}
	end)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-large size-full-0 auto-y",
		testId = "tilt-lockup"
	}, {
		ArtTitle = reactModule.createElement(view, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Card = reactModule.createElement(tiltKeyartModule, {
				thumbnailUrl = p1.thumbnailUrl or "",
				keyart = animation.keyart,
				frame = animation.frame
			}),
			TitleCreator = reactModule.createElement(view, {
				tag = "col align-x-center gap-xsmall auto-y padding-y-xsmall",
				LayoutOrder = 2,
				Size = UDim2.new(0.8, 0, 0, 0)
			}, {
				TitleWrap = reactModule.createElement(view, {
					LayoutOrder = 1,
					ClipsDescendants = var2,
					Size = UDim2.new(1, 0, 0, ceiled),
					padding = { top = animation.title.slide }
				}, {
					Title = reactModule.createElement(text, {
						tag = "size-full text-heading-large text-no-wrap text-align-x-center text-align-y-center text-truncate-end",
						Text = p1.gameName or "",
						textStyle = var4
					})
				}),
				SubWrap = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center",
					LayoutOrder = 2,
					ClipsDescendants = var3,
					Size = UDim2.new(1, 0, 0, ceiled_1),
					padding = { top = animation.creator.slide }
				}, {
					Row = reactModule.createElement(view, {
						tag = "row align-x-center align-y-center gap-xsmall size-full-0 auto-y"
					}, {
						Author = reactModule.createElement(text, {
							tag = "shrink auto-xy text-body-medium text-no-wrap text-truncate-end",
							LayoutOrder = 1,
							Text = p1.creatorName or "",
							textStyle = var5
						}),
						Verified = if p1.isCreatorVerified then if fFlagUnifyVerifiedBadgeComponent then reactModule.createElement(verifiedBadgeModule_1, {
							LayoutOrder = 2,
							testId = "tilt-verified-badge",
							backplateStyle = var6,
							checkStyle = var7
						}) else reactModule.createElement(verifiedBadgeModule, {
							LayoutOrder = 2,
							backplateStyle = var6,
							checkStyle = var7
						}) else nil
					})
				})
			})
		})
	})
end)