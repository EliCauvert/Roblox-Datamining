local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AppCompositionModule = require(Parent.AppComposition)
local DisplayModule = require(Parent.Display)
local SignalsReactModule = require(Parent.SignalsReact)
local LibraryTileModule = require(script.Parent.Parent.LibraryTile)
local _ = require(script.Parent.Parent.LibraryTypes)
local LibraryWorldCutoutViewModule = require(script.Parent.Parent.LibraryWorldCutout.LibraryWorldCutoutView)
local UseHardwareInsetsModule = require(BuildExperience.Components.ChatSheet.useHardwareInsets)
local Icon = FoundationModule.Icon
local ScrollView = FoundationModule.ScrollView
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility

local function renderLoadingTiles(CategoryKey, Offset, XOffset, UseTokensResult)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local Elements = {}
	
	for i = 1, 4 do
		Elements[tostring(i)] = ReactModule.createElement(View, {
			tag = "col gap-small",
			LayoutOrder = i,
			Size = UDim2.fromOffset(XOffset, XOffset + UseTokensResult.Size.Size_1000),
			testId = `Library.Category.{CategoryKey}.Skeleton.{i}`
		}, {
			Thumbnail = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(XOffset, XOffset),
				radius = Radius.Medium
			}),
			Title = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1800, UseTokensResult.Size.Size_400),
				radius = Radius.Small
			})
		})
	end
	return ReactModule.createElement(ScrollView, {
		Size = UDim2.new(1, 0, 0, XOffset + UseTokensResult.Size.Size_1000),
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = ScrollBarVisibility.None
		},
		testId = `Library.Category.{CategoryKey}.Skeleton`
	}, {
		Content = ReactModule.createElement(View, {
			tag = "row gap-small size-0-full auto-x",
			padding = { left = UDim.new(0, Offset), right = UDim.new(0, Offset) }
		}, Elements)
	})
end

local function renderCategory(p1, LayoutOrder, Offset, XOffset, UseTokensResult)
	-- upvalues: ReactModule (copy), LibraryTileModule (copy), renderLoadingTiles (copy), ScrollView (copy), ScrollBarVisibility (copy), View (copy), FoundationModule (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local NewXOffset = XOffset + UseTokensResult.Size.Size_1000
	local Elements = {}
	local CategoryKey = p1.categoryKey or p1.itemKind
	for LayoutOrder1, item in p1.items do
		Elements[item.tileKey or (item.itemId or tostring(LayoutOrder1))] = ReactModule.createElement(LibraryTileModule, {
			compact = true,
			tileKey = item.tileKey,
			itemId = item.itemId,
			itemKind = item.itemKind,
			isFolder = item.isFolder,
			folderPreview = item.folderPreview,
			displayName = item.displayName,
			unavailableText = item.unavailableText,
			thumbnail = item.thumbnail,
			model = item.model,
			onActivated = item.onActivated,
			LayoutOrder = LayoutOrder1,
			Size = UDim2.fromOffset(XOffset, NewXOffset),
			mediaSize = UDim2.fromOffset(XOffset, XOffset)
		})
	end
	local IsReady = p1.status == "Ready"
	local OnOpenCategory = if IsReady then p1.onOpenCategory else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = LayoutOrder,
		testId = `Library.Category.{CategoryKey}`
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-600",
			onActivated = OnOpenCategory,
			selection = { Selectable = OnOpenCategory ~= nil },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			padding = { left = UDim.new(0, Offset), right = UDim.new(0, Offset) },
			testId = `Library.Category.{CategoryKey}.Header`
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p1.title,
				testId = `Library.Section.{CategoryKey}.Title`
			}),
			Chevron = if OnOpenCategory == nil then nil else ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.ChevronLargeRight,
				size = IconSize.Small,
				style = UseTokensResult.Color.Content.Default,
				testId = `Library.Category.{CategoryKey}.Header.Chevron`
			})
		}),
		Cells = ReactModule.createElement(View, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, NewXOffset),
			testId = `Library.Category.{CategoryKey}.Cells`
		}, {
			Content = if p1.status == "Loading" or p1.status == "NotReady" then renderLoadingTiles(CategoryKey, Offset, XOffset, UseTokensResult) else ReactModule.createElement(ScrollView, {
				onCanvasPositionChanged = p1.onScrollChanged,
				onAbsoluteCanvasSizeChanged = p1.onScrollChanged,
				onAbsoluteWindowSizeChanged = p1.onScrollChanged,
				Size = UDim2.new(1, 0, 0, NewXOffset),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = ScrollBarVisibility.None
				},
				testId = `Library.Section.{CategoryKey}.Carousel`
			}, {
				Content = ReactModule.createElement(View, {
					tag = "row gap-small size-0-full auto-x",
					padding = { left = UDim.new(0, Offset), right = UDim.new(0, Offset) }
				}, Elements)
			})
		})
	})
end

return function(p2)
	-- upvalues: AppCompositionModule (copy), UseHardwareInsetsModule (copy), FoundationModule (copy), SignalsReactModule (copy), DisplayModule (copy), renderCategory (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), renderLoadingTiles (copy), Text (copy), LibraryWorldCutoutViewModule (copy), ScrollView (copy)
	local Margin = AppCompositionModule.useCompositionLayout().margin
	local Bottom = UseHardwareInsetsModule().bottom
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(160)
	local Size2400 = if SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore(false).getDisplaySize) == Enum.DisplaySize.Small then UseTokensResult.Size.Size_2400 else UseScaledValueResult
	local Elements = {}
	
	for i, category in p2.categories do
		Elements[category.categoryKey or category.itemKind] = renderCategory(category, i, Margin, Size2400, UseTokensResult)
	end
	if p2.status == "Loading" or p2.status == "NotReady" then
		Elements = {}
		
		for LayoutOrder, value in { "Model", "Image", "Sound" } do
			Elements[value] = ReactModule.createElement(View, {
				tag = "col gap-large size-full-0 auto-y",
				LayoutOrder = LayoutOrder,
				testId = `Library.Section.{value}.Skeleton`
			}, {
				Heading = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y",
					padding = { left = UDim.new(0, Margin), right = UDim.new(0, Margin) }
				}, {
					Skeleton = ReactModule.createElement(Skeleton, {
						Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_600),
						radius = Radius.Small,
						testId = `Library.Section.{value}.HeadingSkeleton`
					})
				}),
				Cards = ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, {
					Content = renderLoadingTiles(value, Margin, Size2400, UseTokensResult)
				})
			})
		end
	elseif #p2.categories == 0 then
		Elements.Empty = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = p2.strings.empty
		})
	end
	local WorldCutout = p2.worldCutout
	
	if WorldCutout ~= nil then
		Elements.WorldCutout = ReactModule.createElement(LibraryWorldCutoutViewModule, {
			LayoutOrder = 0,
			inset = Margin,
			isLoading = p2.status == "Loading" or p2.status == "NotReady",
			title = WorldCutout.title,
			onActivated = WorldCutout.onActivated,
			onRectChanged = WorldCutout.onRectChanged
		})
	end
	return ReactModule.createElement(View, { tag = "col size-full", testId = "Library.Browser" }, {
		Body = ReactModule.createElement(ScrollView, {
			LayoutOrder = 1,
			tag = "fill size-full-0",
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			Content = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y padding-top-medium",
				testId = "Library.Browser.Content",
				padding = {
					bottom = UDim.new(0, UseTokensResult.Padding.Small + Bottom)
				}
			}, {
				Categories = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-large size-full-0 auto-y"
				}, Elements)
			})
		})
	})
end