local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput

return ReactModule.memo(function()
	-- upvalues: UseTokensFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UserInputService (copy), GuiService (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local Y = UserInputService.BottomBarSize.Y
	local Bottom = GuiService:GetSafeZoneOffsets().bottom
	
	return ReactModule.createElement(View, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		padding = {
			top = UDim.new(0, UserInputService.StatusBarSize.Y),
			bottom = UDim.new(0, if Y == 0 then Bottom else Y)
		}
	}, {
		InnerContainer = ReactModule.createElement(View, {
			tag = "size-full col gap-large bg-surface-100 radius-large",
			LayoutOrder = 1,
			sizeConstraint = {
				MaxSize = if IsUsePreferredInputResultMatch then Vector2.new(800, 1000) else Vector2.new(600, 800)
			}
		}, {
			HeaderSection = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row flex-between items-center gap-medium padding-xxlarge",
				LayoutOrder = 1
			}, {
				LeftContent = ReactModule.createElement(View, {
					tag = "auto-xy row gap-small items-center",
					LayoutOrder = 1
				}, {
					IconSkeleton = ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0, UseTokensResult.Size.Size_800, 0, UseTokensResult.Size.Size_800),
						radius = Radius.Circle
					}),
					LabelSkeleton = ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0, UseTokensResult.Size.Size_3000, 0, UseTokensResult.Size.Size_700),
						radius = Radius.Medium
					})
				}),
				RightContent = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
					MenuSkeleton = ReactModule.createElement(Skeleton, {
						Size = UDim2.new(0, UseTokensResult.Size.Size_800, 0, UseTokensResult.Size.Size_800),
						radius = Radius.Circle
					})
				})
			}),
			Content = ReactModule.createElement(View, { tag = "size-full-0 grow", LayoutOrder = 2 }, {
				ScrollView = ReactModule.createElement(ScrollView, {
					tag = "size-full",
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(1, 0, 1, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						VerticalScrollBarInset = Enum.ScrollBarInset.None,
						scrollBarVisibility = ScrollBarVisibility.Always
					}
				}, {
					Content = ReactModule.createElement(View, {
						tag = "size-full-0 auto-y col gap-xlarge padding-x-xxlarge"
					}, {
						PunishmentDescription = ReactModule.createElement(Skeleton, {
							LayoutOrder = 1,
							Size = UDim2.new(0.8, 0, 0, UseTokensResult.Size.Size_500),
							radius = Radius.Medium
						}),
						WhatHappened = ReactModule.createElement(View, {
							tag = "size-full-0 auto-y col gap-medium",
							LayoutOrder = 2
						}, {
							Title = ReactModule.createElement(Skeleton, {
								LayoutOrder = 1,
								Size = UDim2.new(0.25, 0, 0, UseTokensResult.Size.Size_700),
								radius = Radius.Medium
							}),
							Content = ReactModule.createElement(Skeleton, {
								LayoutOrder = 2,
								Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2500),
								radius = Radius.Medium
							})
						}),
						ReviewedEvidence = ReactModule.createElement(View, {
							tag = "size-full-0 auto-y col gap-medium",
							LayoutOrder = 3
						}, {
							Title = ReactModule.createElement(Skeleton, {
								LayoutOrder = 1,
								Size = UDim2.new(0.25, 0, 0, UseTokensResult.Size.Size_700),
								radius = Radius.Medium
							}),
							Content = ReactModule.createElement(Skeleton, {
								LayoutOrder = 2,
								Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_3000),
								radius = Radius.Medium
							})
						})
					})
				})
			}),
			Footer = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-xxlarge padding-bottom-xxlarge padding-top-medium bg-surface-100 radius-large",
				LayoutOrder = 3
			}, {
				TopCornerCover = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Radius.Large),
					Position = UDim2.fromOffset(0, 0),
					BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3
				}),
				ButtonSkeleton = ReactModule.createElement(Skeleton, {
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1100),
					radius = Radius.Medium
				})
			})
		})
	})
end)