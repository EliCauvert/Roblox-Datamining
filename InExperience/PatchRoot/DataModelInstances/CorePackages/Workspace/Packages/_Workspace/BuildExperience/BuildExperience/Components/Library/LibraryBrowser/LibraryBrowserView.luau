local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local appCompositionModule = require(parent.AppComposition)
local displayModule = require(parent.Display)
local signalsReactModule = require(parent.SignalsReact)
local libraryTileModule = require(script.Parent.Parent.LibraryTile)
local _ = require(script.Parent.Parent.LibraryTypes)
local libraryWorldCutoutViewModule = require(script.Parent.Parent.LibraryWorldCutout.LibraryWorldCutoutView)
local useHardwareInsetsModule = require(buildExperience.Components.ChatSheet.useHardwareInsets)
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility

local function renderLoadingTiles(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), scrollView (ref), scrollBarVisibility (ref)
	local t = {}
	
	for i = 1, 4 do
		t[tostring(i)] = reactModule.createElement(view, {
			tag = "col gap-small",
			LayoutOrder = i,
			Size = UDim2.fromOffset(p3, p3 + p4.Size.Size_1000),
			testId = `Library.Category.{p1}.Skeleton.{i}`
		}, {
			Thumbnail = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(p3, p3),
				radius = radius.Medium
			}),
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(p4.Size.Size_1800, p4.Size.Size_400),
				radius = radius.Small
			})
		})
	end
	return reactModule.createElement(scrollView, {
		Size = UDim2.new(1, 0, 0, p3 + p4.Size.Size_1000),
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = scrollBarVisibility.None
		},
		testId = `Library.Category.{p1}.Skeleton`
	}, {
		Content = reactModule.createElement(view, {
			tag = "row gap-small size-0-full auto-x",
			padding = { left = UDim.new(0, p2), right = UDim.new(0, p2) }
		}, t)
	})
end

local function renderCategory(p5, p6, p7, p8, p9)
	-- upvalues: reactModule (ref), libraryTileModule (ref), renderLoadingTiles (ref), scrollView (ref), scrollBarVisibility (ref), view (ref), foundationModule (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local var1 = p8 + p9.Size.Size_1000
	local t = {}
	local categoryKey = p5.categoryKey or p5.itemKind
	
	for i, v in p5.items do
		t[v.tileKey or (v.itemId or tostring(i))] = reactModule.createElement(libraryTileModule, {
			compact = true,
			tileKey = v.tileKey,
			itemId = v.itemId,
			itemKind = v.itemKind,
			isFolder = v.isFolder,
			folderPreview = v.folderPreview,
			displayName = v.displayName,
			unavailableText = v.unavailableText,
			thumbnail = v.thumbnail,
			model = v.model,
			onActivated = v.onActivated,
			LayoutOrder = i,
			Size = UDim2.fromOffset(p8, var1),
			mediaSize = UDim2.fromOffset(p8, p8)
		})
	end
	local var2 = if p5.status == "Ready" then p5.onOpenCategory else nil
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p6,
		testId = `Library.Category.{categoryKey}`
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-600",
			onActivated = var2,
			selection = { Selectable = var2 ~= nil },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			padding = { left = UDim.new(0, p7), right = UDim.new(0, p7) },
			testId = `Library.Category.{categoryKey}.Header`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p5.title,
				testId = `Library.Section.{categoryKey}.Title`
			}),
			Chevron = if var2 ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.ChevronLargeRight,
				size = iconSize.Small,
				style = p9.Color.Content.Default,
				testId = `Library.Category.{categoryKey}.Header.Chevron`
			})
		}),
		Cells = reactModule.createElement(view, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var1),
			testId = `Library.Category.{categoryKey}.Cells`
		}, {
			Content = if p5.status == "Loading" or p5.status == "NotReady" then renderLoadingTiles(categoryKey, p7, p8, p9) else reactModule.createElement(scrollView, {
				onCanvasPositionChanged = p5.onScrollChanged,
				onAbsoluteCanvasSizeChanged = p5.onScrollChanged,
				onAbsoluteWindowSizeChanged = p5.onScrollChanged,
				Size = UDim2.new(1, 0, 0, var1),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = scrollBarVisibility.None
				},
				testId = `Library.Section.{categoryKey}.Carousel`
			}, {
				Content = reactModule.createElement(view, {
					tag = "row gap-small size-0-full auto-x",
					padding = { left = UDim.new(0, p7), right = UDim.new(0, p7) }
				}, t)
			})
		})
	})
end

return function(p10)
	-- upvalues: appCompositionModule (ref), useHardwareInsetsModule (ref), foundationModule (ref), signalsReactModule (ref), displayModule (ref), renderCategory (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), renderLoadingTiles (ref), text (ref), libraryWorldCutoutViewModule (ref), scrollView (ref)
	local margin = appCompositionModule.useCompositionLayout().margin
	local bottom = useHardwareInsetsModule().bottom
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = if signalsReactModule.useSignalState(displayModule.GetDisplayStore(false).getDisplaySize) == Enum.DisplaySize.Small then var3.Size.Size_2400 else foundationModule.Hooks.useScaledValue(160)
	local t = {}
	
	for i, v in p10.categories do
		t[v.categoryKey or v.itemKind] = renderCategory(v, i, margin, var4, var3)
	end
	if p10.status == "Loading" or p10.status == "NotReady" then
		t = {}
		
		for i_1, v_1 in { "Model", "Image", "Sound" } do
			t[v_1] = reactModule.createElement(view, {
				tag = "col gap-large size-full-0 auto-y",
				LayoutOrder = i_1,
				testId = `Library.Section.{v_1}.Skeleton`
			}, {
				Heading = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y",
					padding = { left = UDim.new(0, margin), right = UDim.new(0, margin) }
				}, {
					Skeleton = reactModule.createElement(skeleton, {
						Size = UDim2.fromOffset(var3.Size.Size_2800, var3.Size.Size_600),
						radius = radius.Small,
						testId = `Library.Section.{v_1}.HeadingSkeleton`
					})
				}),
				Cards = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, { Content = renderLoadingTiles(v_1, margin, var4, var3) })
			})
		end
	elseif #p10.categories == 0 then
		t.Empty = reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = p10.strings.empty
		})
	end
	local worldCutout = p10.worldCutout
	
	if worldCutout ~= nil then
		t.WorldCutout = reactModule.createElement(libraryWorldCutoutViewModule, {
			LayoutOrder = 0,
			inset = margin,
			isLoading = if p10.status ~= "Loading" then p10.status == "NotReady" else true,
			title = worldCutout.title,
			onActivated = worldCutout.onActivated,
			onRectChanged = worldCutout.onRectChanged
		})
	end
	return reactModule.createElement(view, { tag = "col size-full", testId = "Library.Browser" }, {
		Body = reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			tag = "fill size-full-0",
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y padding-top-medium",
				testId = "Library.Browser.Content",
				padding = { bottom = UDim.new(0, var3.Padding.Small + bottom) }
			}, {
				Categories = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col gap-large size-full-0 auto-y"
				}, t)
			})
		})
	})
end