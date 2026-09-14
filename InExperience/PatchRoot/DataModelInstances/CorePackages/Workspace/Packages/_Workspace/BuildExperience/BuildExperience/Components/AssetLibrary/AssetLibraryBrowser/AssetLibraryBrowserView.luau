local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryTileModule = require(script.Parent.Parent.AssetLibraryTile)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
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
			testId = `AssetLibrary.Category.{p1}.Skeleton.{i}`
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
		testId = `AssetLibrary.Category.{p1}.Skeleton`
	}, t)
end

local function renderSection(p2, p3, p4)
	-- upvalues: reactModule (ref), assetLibraryTileModule (ref), renderLoadingTiles (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), scrollView (ref), scrollBarVisibility (ref), icon (ref), iconName (ref), iconSize (ref)
	local t = {}
	
	for i, v in p2.categories do
		local var1 = v.assets[1]
		
		if var1 ~= nil then
			local categoryKey = v.categoryKey or v.assetType
			t[categoryKey] = reactModule.createElement(assetLibraryTileModule, {
				compact = true,
				categoryKey = categoryKey,
				tileKey = var1.tileKey,
				assetId = var1.assetId,
				assetType = var1.assetType,
				displayName = var1.displayName,
				subtitle = var1.subtitle,
				thumbnail = var1.thumbnail,
				model = var1.model,
				onActivated = var1.onActivated,
				LayoutOrder = i,
				Size = UDim2.fromOffset(96, 136),
				mediaSize = UDim2.fromOffset(96, 96)
			})
		end
	end
	local var2 = p2.categories[1]
	local categoryKey = var2.categoryKey or var2.assetType
	local var3 = if var2.status == "Ready" then var2.onOpenSection else nil
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p3,
		Size = UDim2.new(1, 0, 0, 168),
		[reactModule.Tag] = `data-testid=AssetLibrary.Category.{categoryKey}`
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = reactModule.createElement("TextButton", {
			Active = var3 ~= nil,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Selectable = var3 ~= nil,
			Size = UDim2.new(1, 0, 0, 24),
			Text = "",
			[reactModule.Event.Activated] = var3,
			[reactModule.Tag] = `row align-y-center gap-xsmall data-testid=AssetLibrary.Category.{categoryKey}.Header`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p2.title,
				testId = `AssetLibrary.Section.{categoryKey}.Title`
			}),
			Chevron = if var3 ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 2,
				tag = "auto-xy content-default",
				name = iconName.ChevronLargeRight,
				size = iconSize.Small,
				testId = `AssetLibrary.Category.{categoryKey}.Header.Chevron`
			})
		}),
		Cells = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 136),
			[reactModule.Tag] = `data-testid=AssetLibrary.Category.{categoryKey}.Cells`
		}, {
			Content = if var2.status == "Loading" or var2.status == "NotReady" then renderLoadingTiles(categoryKey) elseif var2.status == "Failed" then reactModule.createElement(view, {
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
					onActivated = var2.onRetry,
					size = inputSize.Small,
					text = p4.retry,
					variant = buttonVariant.Standard
				})
			}) else reactModule.createElement(scrollView, {
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
				testId = `AssetLibrary.Section.{categoryKey}.Carousel`
			}, t)
		})
	})
end

return function(value)
	-- upvalues: renderSection (ref), reactModule (ref), text (ref), view (ref), scrollView (ref), overflowMenuPageShellModule (ref), iconName (ref)
	local t = {}
	local t_1 = nil
	
	for i, v in value.categories do
		local sectionTitle = v.sectionTitle or v.title
		
		if t_1 == nil or t_1.title ~= sectionTitle then
			t_1 = { title = sectionTitle, categories = {} }
			table.insert(t, t_1)
		end
		if t_1 ~= nil then
			table.insert(t_1.categories, v)
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in t do
		t_2[v_1.title] = renderSection(v_1, i_1, value.strings)
	end
	if #t == 0 then
		t_2.Empty = reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = value.strings.empty
		})
	end
	local var4 = reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-bottom-small padding-top-medium",
		testId = "AssetLibrary.Browser.Content"
	}, {
		Categories = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y"
		}, t_2)
	})
	
	return if value.presentation == "Sheet" then reactModule.createElement(view, { tag = "col size-full", testId = "AssetLibrary.Browser" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "AssetLibrary.Browser-header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = value.strings.title
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
		}, { Content = var4 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "AssetLibrary.Browser",
		title = value.strings.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		content = var4
	})
end