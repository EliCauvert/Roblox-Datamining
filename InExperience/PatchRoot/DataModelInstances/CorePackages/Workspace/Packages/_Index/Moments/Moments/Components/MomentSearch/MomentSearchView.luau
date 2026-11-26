local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local _ = require(Parent.ReactFocusNavigation)
local MomentSearchTileViewModule = require(script.Parent.MomentSearchTileView)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentsFeedSurfaceModule = require(Moments.Components.MomentsFeedSurface)
local MomentsBackHeaderModule = require(Moments.Components.MomentsBackHeader)
local MomentOverlayInsetContextModule = require(Moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ScrollView = FoundationModule.ScrollView
local Enums = FoundationModule.Enums
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
}

local function noop() end

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), Enums (copy), View (copy), MomentSearchTileViewModule (copy), Text (copy), MomentsBackHeaderModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy), noop (copy), BuilderIconsModule (copy), ScrollView (copy), MomentOverlayInsetContextModule (copy), MomentsFeedSurfaceModule (copy)
	local Elements = {}
	
	for LayoutOrder, topic in p1.topics do
		Elements[tostring(LayoutOrder)] = ReactModule.createElement(FoundationModule.Chip, {
			LayoutOrder = LayoutOrder,
			text = topic.text,
			size = Enums.ChipSize.Small,
			onActivated = topic.onActivated,
			testId = `--moments-search-topic-{LayoutOrder}`
		})
	end
	local Elements1 = {}
	
	for LayoutOrder1, recommendation in p1.recommendations do
		Elements1[recommendation.id] = ReactModule.createElement(View, {
			tag = "col gap-small",
			LayoutOrder = LayoutOrder1,
			Size = UDim2.fromOffset(110, 194)
		}, {
			Tile = ReactModule.createElement(View, { LayoutOrder = 1, Size = UDim2.fromOffset(110, 154) }, {
				Content = ReactModule.createElement(MomentSearchTileViewModule, recommendation)
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-label-medium text-align-x-left text-truncate-end content-emphasis",
				Text = recommendation.title
			})
		})
	end
	local Elements2 = {
		Layout = ReactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.fromOffset(2, 2),
			CellSize = p1.cellSize,
			FillDirectionMaxCells = p1.columns,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if p1.status == "loading" and #p1.results == 0 then
		for i = 1, 9 do
			Elements2[`loading-{i}`] = ReactModule.createElement(FoundationModule.Skeleton, { LayoutOrder = i, Size = p1.cellSize })
		end
	else
		for LayoutOrder2, result in p1.results do
			local Copy = table.clone(result)
			Copy.LayoutOrder = LayoutOrder2
			Elements2[result.id] = ReactModule.createElement(MomentSearchTileViewModule, Copy)
		end
	end
	local IsError = p1.status == "error"
	local NoHasMore: boolean = p1.status == "ready" and #p1.results == 0 and not p1.hasMore
	local Element = if p1.selectedSource == nil then nil else ReactModule.createElement(MomentsBackHeaderModule, { onBack = p1.onCloseViewer })
	
	return ReactModule.createElement(FocusNavigationUtilsModule.FocusRoot, {
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		eventMap = EventMap,
		eventHandlers = p1.backEventHandlers
	}, {
		Page = ReactModule.createElement(View, {
			tag = "size-full bg-surface-0",
			testId = "--moments-search"
		}, {
			InputSink = ReactModule.createElement(View, {
				tag = "size-full",
				ZIndex = 1,
				onActivated = noop,
				stateLayer = { affordance = Enums.StateLayerAffordance.None }
			}),
			Content = ReactModule.createElement(View, {
				tag = "col size-full",
				ZIndex = 2,
				padding = p1.padding,
				Visible = p1.selectedSource == nil
			}, {
				Header = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-small size-full-0 auto-y padding-medium"
				}, {
					Back = ReactModule.createElement(FoundationModule.IconButton, {
						LayoutOrder = 1,
						testId = "--moments-search-back",
						icon = BuilderIconsModule.Icon.ChevronLargeLeft,
						onActivated = p1.onBack
					}),
					InputContainer = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill size-0-0 auto-y" }, {
						Input = ReactModule.createElement(FoundationModule.TextInput, {
							label = "",
							hasClearButton = true,
							testId = "--moments-search-input",
							text = p1.text,
							placeholder = p1.labels.search,
							width = UDim.new(1, 0),
							size = Enums.InputSize.Medium,
							leadingIcon = BuilderIconsModule.Icon.MagnifyingGlass,
							textBoxRef = p1.inputRef,
							onChanged = p1.onChanged,
							onReturnPressed = p1.onSubmit
						})
					})
				}),
				Scroll = ReactModule.createElement(ScrollView, {
					LayoutOrder = 2,
					tag = "fill size-full-0",
					testId = "--moments-search-scroll",
					scrollingFrameRef = p1.scrollRef,
					onAbsoluteSizeChanged = p1.onSizeChanged,
					onCanvasPositionChanged = p1.onScrolled,
					onAbsoluteCanvasSizeChanged = p1.onLayoutChanged,
					onAbsoluteWindowSizeChanged = p1.onLayoutChanged,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(),
						ScrollingDirection = Enum.ScrollingDirection.Y
					},
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}, {
					Topics = if p1.showLanding and #p1.topics > 0 then ReactModule.createElement(ScrollView, {
						LayoutOrder = 1,
						tag = "padding-x-medium",
						Size = UDim2.new(1, 0, 0, 40),
						layout = {
							FillDirection = Enum.FillDirection.Horizontal,
							Padding = p1.gap,
							SortOrder = Enum.SortOrder.LayoutOrder
						},
						scroll = {
							AutomaticCanvasSize = Enum.AutomaticSize.X,
							CanvasSize = UDim2.new(),
							ScrollingDirection = Enum.ScrollingDirection.X,
							scrollBarVisibility = Enums.Visibility.None
						}
					}, Elements) else nil,
					RecommendedTitle = if p1.showLanding and #p1.recommendations > 0 then ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small size-full-0 auto-y padding-medium",
						testId = "--moments-search-recommended",
						onActivated = p1.onOpenRecommendations
					}, {
						Title = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-heading-small content-emphasis",
							Text = p1.labels.recommended
						}),
						Chevron = ReactModule.createElement(FoundationModule.Icon, {
							LayoutOrder = 2,
							name = BuilderIconsModule.Icon.ChevronSmallRight,
							size = Enums.IconSize.Small
						})
					}) else nil,
					Recommendations = if p1.showLanding and #p1.recommendations > 0 then ReactModule.createElement(ScrollView, {
						LayoutOrder = 3,
						tag = "padding-x-medium",
						Size = UDim2.new(1, 0, 0, 200),
						layout = {
							FillDirection = Enum.FillDirection.Horizontal,
							Padding = p1.gap,
							SortOrder = Enum.SortOrder.LayoutOrder
						},
						scroll = {
							AutomaticCanvasSize = Enum.AutomaticSize.X,
							CanvasSize = UDim2.new(),
							ScrollingDirection = Enum.ScrollingDirection.X,
							scrollBarVisibility = Enums.Visibility.None
						}
					}, Elements1) else nil,
					Grid = if p1.status == "idle" then nil else ReactModule.createElement(View, {
						LayoutOrder = 4,
						tag = "size-full-0 auto-y",
						testId = "--moments-search-results"
					}, Elements2),
					Message = if IsError or NoHasMore then ReactModule.createElement(View, {
						LayoutOrder = 5,
						tag = "col align-x-center gap-medium size-full-0 auto-y padding-xlarge"
					}, {
						Title = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "size-full-0 auto-y text-title-medium text-wrap content-emphasis",
							Text = if IsError then p1.labels.error else p1.labels.empty
						}),
						Retry = if IsError then ReactModule.createElement(FoundationModule.Button, {
							LayoutOrder = 2,
							testId = "--moments-search-retry",
							text = p1.labels.retry,
							onActivated = p1.onRetry
						}) else nil
					}) else nil,
					More = if p1.hasMore and not IsError then ReactModule.createElement(FoundationModule.Button, {
						LayoutOrder = 6,
						testId = "--moments-search-more",
						text = p1.labels.more,
						isDisabled = p1.status == "loading",
						onActivated = p1.onMore
					}) else nil
				})
			}),
			Viewer = if p1.selectedSource == nil then nil else ReactModule.createElement(View, { tag = "size-full", ZIndex = 3 }, {
				Inset = ReactModule.createElement(MomentOverlayInsetContextModule.Context.Provider, { value = p1.bottomInset }, {
					Feed = ReactModule.createElement(MomentsFeedSurfaceModule, {
						source = p1.selectedSource,
						initialIndex = p1.selectedIndex,
						active = p1.playbackActive,
						playbackActive = p1.playbackActive,
						header = Element
					})
				})
			})
		})
	})
end