local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local tiltKeyartModule = require(tiltLoadingScreen.Components.TiltKeyart)
local verifiedBadgeModule = require(tiltLoadingScreen.Components.VerifiedBadge)
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

local function _(value) --[[ line: 47 | named "clamp01" ]]
	return math.clamp(value, 0, 1)
end

local _ = function(p0) --[[ line: 51 | named "clipWindowHeight" ]]
	return math.ceil(p0.FontSize * p0.LineHeight)
end

local _ = function(p1) --[[ line: 55 | named "clippingFromReveal" ]]
	return p1:map(function(p2) --[[ line: 56 ]]
		return p2 < 0.999
	end)
end

return reactModule.memo(function(p3) --[[ line: 61 | named "TiltLockup" ]]
	-- upvalues: useTokens (ref), t (ref), reactModule (ref), view (ref), tiltKeyartModule (ref), text (ref), verifiedBadgeModule (ref)
	local var6 = useTokens()
	local animation = p3.animation or t
	local color3 = var6.Color.Content.Emphasis.Color3
	local color3_1 = var6.Color.Content.Default.Color3
	local color3_2 = var6.Color.System.Emphasis.Color3
	local headingLarge = var6.Typography.HeadingLarge
	local bodyMedium = var6.Typography.BodyMedium
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-large size-full-0 auto-y",
		testId = "tilt-lockup"
	}, {
		ArtTitle = reactModule.createElement(view, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Card = reactModule.createElement(tiltKeyartModule, {
				thumbnailUrl = p3.thumbnailUrl or "",
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
					ClipsDescendants = animation.title.reveal:map(function(p4) --[[ line: 56 ]]
						return p4 < 0.999
					end),
					Size = UDim2.new(1, 0, 0, math.ceil(headingLarge.FontSize * headingLarge.LineHeight)),
					padding = { top = animation.title.slide }
				}, {
					Title = reactModule.createElement(text, {
						tag = "size-full text-heading-large text-no-wrap text-align-x-center text-align-y-center text-truncate-end",
						Text = p3.gameName or "",
						textStyle = animation.title.reveal:map(function(p5) --[[ line: 74 ]]
							-- upvalues: color3 (ref)
							return { Color3 = color3, Transparency = 1 - math.clamp(p5, 0, 1) }
						end)
					})
				}),
				SubWrap = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center",
					LayoutOrder = 2,
					ClipsDescendants = animation.creator.reveal:map(function(p6) --[[ line: 56 ]]
						return p6 < 0.999
					end),
					Size = UDim2.new(1, 0, 0, math.ceil(bodyMedium.FontSize * bodyMedium.LineHeight)),
					padding = { top = animation.creator.slide }
				}, {
					Row = reactModule.createElement(view, {
						tag = "row align-x-center align-y-center gap-xsmall size-full-0 auto-y"
					}, {
						Author = reactModule.createElement(text, {
							tag = "shrink auto-xy text-body-medium text-no-wrap text-truncate-end",
							LayoutOrder = 1,
							Text = p3.creatorName or "",
							textStyle = animation.creator.reveal:map(function(p7) --[[ line: 78 ]]
								-- upvalues: color3_1 (ref)
								return {
									Color3 = color3_1,
									Transparency = 1 - math.clamp(p7, 0, 1) * 0.6
								}
							end)
						}),
						Verified = if p3.isCreatorVerified then reactModule.createElement(verifiedBadgeModule, {
							LayoutOrder = 2,
							backplateStyle = animation.verified.reveal:map(function(p8) --[[ line: 82 ]]
								-- upvalues: color3_2 (ref)
								return {
									Color3 = color3_2,
									Transparency = 1 - math.clamp(p8, 0, 1)
								}
							end),
							checkStyle = animation.verified.reveal:map(function(p9) --[[ line: 86 ]]
								-- upvalues: var6 (ref)
								return {
									Color3 = var6.Color.Content.Emphasis.Color3,
									Transparency = 1 - math.clamp(p9, 0, 1)
								}
							end)
						}) else nil
					})
				})
			})
		})
	})
end)