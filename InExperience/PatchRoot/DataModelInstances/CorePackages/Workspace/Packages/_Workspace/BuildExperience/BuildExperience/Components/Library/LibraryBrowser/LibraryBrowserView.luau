local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local libraryTileModule = require(script.Parent.Parent.LibraryTile)
local _ = require(script.Parent.Parent.LibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility

local function renderLoadingTiles(p1)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), scrollView (ref), scrollBarVisibility (ref)
	local t = {}
	
	for i = 1, 4 do
		t[tostring(i)] = reactModule.createElement(view, {
			tag = "col gap-small",
			LayoutOrder = i,
			Size = UDim2.fromOffset(96, 136),
			testId = `Library.Category.{p1}.Skeleton.{i}`
		}, {
			Thumbnail = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(96, 96),
				radius = radius.Medium
			}),
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(72, 16),
				radius = radius.Small
			})
		})
	end
	return reactModule.createElement(scrollView, {
		Size = UDim2.new(1, 0, 0, 136),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 8)
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = scrollBarVisibility.None
		},
		testId = `Library.Category.{p1}.Skeleton`
	}, t)
end

local function renderCategory(p2, p3, p4)
	-- upvalues: reactModule (ref), libraryTileModule (ref), skeleton (ref), radius (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), renderLoadingTiles (ref), scrollView (ref), scrollBarVisibility (ref), icon (ref), iconName (ref), iconSize (ref)
	local t = {}
	local categoryKey = p2.categoryKey or p2.itemKind
	
	for i, v in p2.items do
		t[v.tileKey or (v.itemId or tostring(i))] = reactModule.createElement(libraryTileModule, {
			compact = true,
			categoryKey = categoryKey,
			tileKey = v.tileKey,
			itemId = v.itemId,
			itemKind = v.itemKind,
			displayName = v.displayName,
			subtitle = v.subtitle,
			thumbnail = v.thumbnail,
			model = v.model,
			onActivated = v.onActivated,
			LayoutOrder = i,
			Size = UDim2.fromOffset(96, 136),
			mediaSize = UDim2.fromOffset(96, 96)
		})
	end
	local categoryKey_1 = p2.categoryKey or p2.itemKind
	
	if p2.isLoadingMore then
		t.Pagination = reactModule.createElement(skeleton, {
			LayoutOrder = #p2.items + 1,
			Size = UDim2.fromOffset(96, 96),
			radius = radius.Small,
			testId = `Library.Category.{categoryKey_1}.LoadingMore`
		})
	elseif p2.loadMoreFailed then
		t.Pagination = reactModule.createElement(view, {
			tag = "col align-y-center gap-small",
			LayoutOrder = #p2.items + 1,
			Size = UDim2.fromOffset(96, 136),
			testId = `Library.Category.{categoryKey_1}.LoadMoreError`
		}, {
			Message = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-body-small content-default",
				Text = p4.loadError
			}),
			Retry = reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = p2.onRetry,
				size = inputSize.Small,
				text = p4.retry,
				variant = buttonVariant.Standard,
				testId = `Library.Category.{categoryKey_1}.RetryMore`
			})
		})
	end
	local var1 = if p2.status == "Ready" then p2.onOpenSection else nil
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p3,
		Size = UDim2.new(1, 0, 0, 168),
		[reactModule.Tag] = `data-testid=Library.Category.{categoryKey_1}`
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Text = "",
			Active = var1 ~= nil,
			Selectable = var1 ~= nil,
			Size = UDim2.new(1, 0, 0, 24),
			[reactModule.Event.Activated] = var1,
			[reactModule.Tag] = `row align-y-center gap-xsmall data-testid=Library.Category.{categoryKey_1}.Header`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p2.sectionTitle or p2.title,
				testId = `Library.Section.{categoryKey_1}.Title`
			}),
			Chevron = if var1 ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 2,
				tag = "auto-xy content-default",
				name = iconName.ChevronLargeRight,
				size = iconSize.Small,
				testId = `Library.Category.{categoryKey_1}.Header.Chevron`
			})
		}),
		Cells = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 136),
			[reactModule.Tag] = `data-testid=Library.Category.{categoryKey_1}.Cells`
		}, {
			Content = if p2.status == "Loading" or p2.status == "NotReady" then renderLoadingTiles(categoryKey_1) elseif p2.status == "Failed" then reactModule.createElement(view, {
				tag = "row align-y-center gap-small",
				Size = UDim2.new(1, 0, 0, 136)
			}, {
				Message = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "fill text-body-medium text-align-x-left content-default",
					Text = p4.loadError
				}),
				Retry = reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = p2.onRetry,
					size = inputSize.Small,
					text = p4.retry,
					variant = buttonVariant.Standard
				})
			}) else reactModule.createElement(scrollView, {
				onCanvasPositionChanged = p2.onScrollChanged,
				onAbsoluteCanvasSizeChanged = p2.onScrollChanged,
				onAbsoluteWindowSizeChanged = p2.onScrollChanged,
				Size = UDim2.new(1, 0, 0, 136),
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 8)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = scrollBarVisibility.None
				},
				testId = `Library.Section.{categoryKey_1}.Carousel`
			}, t)
		})
	})
end

return function(p5)
	-- upvalues: renderCategory (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), renderLoadingTiles (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), scrollView (ref), overflowMenuPageShellModule (ref), iconName (ref)
	local cloned
	local t = {}
	local var2 = nil
	
	for i, v in p5.categories do
		local sectionTitle = v.sectionTitle or v.title
		cloned = var2
		
		if cloned == nil or cloned.title ~= sectionTitle then
			cloned = { title = sectionTitle, categories = {} }
			var2 = cloned
			table.insert(t, cloned)
		end
		table.insert(cloned.categories, v)
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		cloned = table.clone(v_1.categories[1])
		cloned.items = {}
		
		for i_2, v_2 in v_1.categories do
			for i_3, v_3 in v_2.items do
				table.insert(cloned.items, v_3)
			end
		end
		t_1[v_1.title] = renderCategory(cloned, i_1, p5.strings)
	end
	if p5.status == "Loading" or p5.status == "NotReady" then
		t_1 = {}
		
		for i_2, v_2 in { "Model", "Image", "Sound" } do
			t_1[v_2] = reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = i_2,
				testId = `Library.Section.{v_2}.Skeleton`
			}, {
				Heading = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(112, 24),
					radius = radius.Small,
					testId = `Library.Section.{v_2}.HeadingSkeleton`
				}),
				Cards = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, { Content = renderLoadingTiles(v_2) })
			})
		end
	elseif p5.status == "Failed" then
		t_1 = {
			Error = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-body-medium text-align-x-center content-default",
				Text = p5.strings.loadError
			}),
			Retry = if p5.onRetry ~= nil then nil else reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = p5.onRetry,
				size = inputSize.Small,
				text = p5.strings.retry,
				variant = buttonVariant.Standard
			})
		}
	elseif #t == 0 then
		t_1.Empty = reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = p5.strings.empty
		})
	end
	local var3 = reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-bottom-small padding-top-medium",
		testId = "Library.Browser.Content"
	}, {
		Categories = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y"
		}, t_1)
	})
	
	return if p5.presentation == "Sheet" then reactModule.createElement(view, { tag = "col size-full", testId = "Library.Browser" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "Library.Browser-header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = p5.strings.title
			})
		}),
		Body = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0",
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, { Content = var3 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "Library.Browser",
		title = p5.strings.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = p5.onBack,
		content = var3
	})
end