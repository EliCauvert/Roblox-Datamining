local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local HeaderBar = FoundationModule.HeaderBar
local Icon = FoundationModule.Icon
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local MomentMediaTile = MomentsCommonModule.Media.MomentMediaTile
local ReactionModule = if require(Moments.Flags.FFlagMomentsUseSharedReactions) then require(Parent.Reactions.Reaction) else MomentsCommonModule.Components.Reaction
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local FormFactor = MomentsCommonModule.Enums.FormFactor
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local _ = require(script.Parent.usePostInsightsPageViewModel)
local _Vector2 = Vector2.new(83, 124)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local Frozen = table.freeze({ ZIndex = require(Moments.Constants).DisplayOrder.Modals })

local function noop() end

local function Thumbnail(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), _Vector2 (copy), MomentMediaTile (copy)
	return ReactModule.createElement(View, {
		tag = "radius-small clip bg-surface-300",
		testId = "post-insights-thumbnail",
		LayoutOrder = Frame.LayoutOrder,
		cornerRadius = UDim.new(0, UseTokensFunction().Radius.Small),
		Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
	}, {
		Media = if Frame.mediaItem == nil then nil else ReactModule.createElement(MomentMediaTile, { isActive = false, mediaItem = Frame.mediaItem })
	})
end

local function InteractionCounts(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	
	for LayoutOrder, interactionCount in Frame.interactionCounts do
		Elements[interactionCount.key] = ReactModule.createElement(View, {
			tag = "col align-x-center gap-xsmall auto-y padding-y-small",
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromOffset(52, 0)
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = interactionCount.icon,
				size = UseTokensResult.Size.Size_600,
				style = UseTokensResult.Color.Content.Emphasis
			}),
			Count = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-small content-emphasis",
				Text = interactionCount.countText,
				testId = `post-insights-count-{interactionCount.key}`
			})
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row gap-small"] = true,
			["auto-xy"] = Frame.isWide,
			["align-x-center size-full-0 auto-y"] = not Frame.isWide
		}
	}, Elements)
end

local function Summary(Frame: Frame)
	-- upvalues: ReactModule (copy), View (copy), Thumbnail (copy), Text (copy), InteractionCounts (copy)
	local ViewProps = Frame.viewProps
	
	return if Frame.isWide then ReactModule.createElement(View, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = ReactModule.createElement(Thumbnail, { LayoutOrder = 1, mediaItem = ViewProps.mediaItem }),
		Details = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill gap-small auto-y" }, {
			Caption = if ViewProps.caption == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end content-emphasis",
				testId = "post-insights-caption",
				Text = ViewProps.caption
			}),
			Counts = ReactModule.createElement(InteractionCounts, {
				LayoutOrder = 2,
				isWide = true,
				interactionCounts = ViewProps.interactionCounts
			})
		})
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center gap-xlarge size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = ReactModule.createElement(Thumbnail, { LayoutOrder = 1, mediaItem = ViewProps.mediaItem }),
		Counts = ReactModule.createElement(InteractionCounts, {
			LayoutOrder = 2,
			isWide = false,
			interactionCounts = ViewProps.interactionCounts
		})
	})
end

local function SectionHeading(Frame)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-heading-small content-emphasis",
		LayoutOrder = Frame.LayoutOrder,
		Text = Frame.text
	})
end

local function Metric(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col fill gap-xxsmall auto-y padding-x-xsmall padding-y-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium content-default",
			Text = Frame.label
		}),
		Value = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-heading-small content-emphasis",
			Text = Frame.valueText,
			testId = Frame.testId
		})
	})
end

local function OverviewSection(Frame)
	-- upvalues: ReactModule (copy), SectionHeading (copy), Metric (copy), View (copy)
	local config = {
		Heading = ReactModule.createElement(SectionHeading, { LayoutOrder = 1, text = Frame.heading })
	}
	
	for i = 1, math.ceil(#Frame.overviewMetrics / 2) do
		local Elements = {}
		
		for i1 = 1, 2 do
			local OverviewMetric = Frame.overviewMetrics[(i - 1) * 2 + i1]
			
			if OverviewMetric ~= nil then
				Elements[OverviewMetric.key] = ReactModule.createElement(Metric, {
					LayoutOrder = i1,
					label = OverviewMetric.label,
					valueText = OverviewMetric.valueText,
					testId = `post-insights-metric-{OverviewMetric.key}`
				})
			end
		end
		config[`Row{i}`] = ReactModule.createElement(View, {
			tag = "row gap-medium size-full-0 auto-y",
			LayoutOrder = i + 1
		}, Elements)
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = Frame.LayoutOrder
	}, config)
end

local function EngagementSection(Frame)
	-- upvalues: ReactModule (copy), View (copy), ReactionModule (copy), ReactionSize (copy), Text (copy), SectionHeading (copy)
	local Elements = {}
	
	for LayoutOrder, reactionCount in Frame.viewProps.reactionCounts do
		Elements[reactionCount.reactionType] = ReactModule.createElement(View, {
			tag = "col align-x-center gap-xxsmall auto-y",
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromOffset(38, 0)
		}, {
			Reaction = ReactModule.createElement(ReactionModule, {
				LayoutOrder = 1,
				reactionType = reactionCount.reactionType,
				size = ReactionSize.Small
			}),
			Count = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-medium content-emphasis",
				Text = reactionCount.countText,
				testId = `post-insights-reaction-{reactionCount.reactionType}`
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Heading = ReactModule.createElement(SectionHeading, {
			LayoutOrder = 1,
			text = Frame.viewProps.engagementHeading
		}),
		Card = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y padding-xsmall"
		}, {
			Total = ReactModule.createElement(View, { LayoutOrder = 1, tag = "col gap-xsmall auto-xy" }, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-medium content-muted",
					Text = Frame.viewProps.totalReactionsLabel
				}),
				Value = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-heading-small content-emphasis",
					testId = "post-insights-total-reactions",
					Text = Frame.viewProps.totalReactionsText
				})
			}),
			Reactions = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row flex-x-between size-full-0 auto-y",
				sizeConstraint = { MaxSize = Vector2.new(353, 1e999) }
			}, Elements)
		})
	})
end

return function(ViewProps)
	-- upvalues: UseDeviceInsetsFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Frozen (copy), View (copy), noop (copy), StateLayerAffordance (copy), HeaderBar (copy), IconName (copy), Text (copy), ScrollView (copy), Summary (copy), OverviewSection (copy), EngagementSection (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local OnBackFunction = ViewProps.onBack
	
	return ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnBackFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: OnBackFunction (upval)
						OnBackFunction()
						p1:cancel()
					end)
				}
			}
		end, { OnBackFunction }),
		frameProps = Frozen
	}, {
		InputSink = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 1,
			onActivated = noop,
			stateLayer = { affordance = StateLayerAffordance.None }
		}),
		Page = ReactModule.createElement(View, {
			tag = "col size-full bg-surface-0",
			testId = "post-insights-page",
			ZIndex = 2
		}, {
			Header = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				padding = {
					top = UDim.new(0, UseDeviceInsetsResult.top),
					left = UDim.new(0, UseDeviceInsetsResult.left),
					right = UDim.new(0, UseDeviceInsetsResult.right)
				}
			}, {
				HeaderBar = ReactModule.createElement(HeaderBar.Root, { hasBackground = false, testId = "post-insights-header" }, {
					Leading = ReactModule.createElement(HeaderBar.Leading, nil, {
						Actions = ReactModule.createElement(HeaderBar.Actions, {
							actions = {
								{
									id = "back",
									icon = IconName.ChevronLargeLeft,
									onActivated = ViewProps.onBack
								}
							}
						}),
						Title = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-heading-medium text-truncate-end content-emphasis",
							Text = ViewProps.title
						})
					})
				})
			}),
			Body = ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				tag = "fill size-full-0",
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				Centering = ReactModule.createElement(View, {
					tag = "col align-x-center size-full-0 auto-y",
					padding = {
						bottom = UDim.new(0, UseDeviceInsetsResult.bottom),
						left = UDim.new(0, UseDeviceInsetsResult.left),
						right = UDim.new(0, UseDeviceInsetsResult.right)
					}
				}, {
					Content = ReactModule.createElement(View, {
						tag = "col gap-xlarge size-full-0 auto-y padding-xlarge",
						sizeConstraint = { MaxSize = Vector2.new(608, 1e999) }
					}, {
						Summary = ReactModule.createElement(Summary, {
							LayoutOrder = 1,
							viewProps = ViewProps,
							isWide = UseFormFactorFunction() == FormFactor.Wide
						}),
						Overview = ReactModule.createElement(OverviewSection, {
							LayoutOrder = 2,
							heading = ViewProps.overviewHeading,
							overviewMetrics = ViewProps.overviewMetrics
						}),
						Engagement = ReactModule.createElement(EngagementSection, { LayoutOrder = 3, viewProps = ViewProps })
					})
				})
			})
		})
	})
end