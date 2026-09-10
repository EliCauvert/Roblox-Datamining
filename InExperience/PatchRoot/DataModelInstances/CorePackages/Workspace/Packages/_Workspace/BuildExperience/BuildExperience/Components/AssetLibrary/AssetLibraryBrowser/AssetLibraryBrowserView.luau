local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryTileModule = require(script.Parent.Parent.AssetLibraryTile)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function AssetLibrarySearchField(value)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "row align-y-center fill gap-small auto-y padding-left-medium padding-right-xsmall stroke-default radius-circle bg-surface-100",
		testId = "AssetLibrary.Search"
	}, {
		SearchIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-default",
			testId = "AssetLibrary.Search.Icon",
			name = iconName.MagnifyingGlass,
			size = iconSize.Small
		}),
		InputWrapper = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-0-1000" }, {
			Input = reactModule.createElement("TextBox", {
				ref = value.inputRef,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				FontFace = Font.fromEnum(var1.Typography.BodyMedium.Font),
				PlaceholderColor3 = var1.Color.Content.Default.Color3,
				PlaceholderText = value.placeholder,
				Size = UDim2.fromScale(1, 1),
				Text = value.text,
				TextColor3 = var1.Color.Content.Emphasis.Color3,
				TextSize = var1.Typography.BodyMedium.FontSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				[reactModule.Change.Text] = function(p1)
					-- upvalues: value (ref)
					value.onChanged(p1.Text)
				end
			})
		}),
		Close = reactModule.createElement(iconButton, {
			LayoutOrder = 3,
			testId = "AssetLibrary.Search.Close",
			icon = iconName.X,
			onActivated = value.onClose,
			size = inputSize.Small,
			variant = buttonVariant.Utility
		})
	})
end

local function renderLoadingTiles(p1, p2)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local t = {}
	
	for i = 1, 4 do
		t[tostring(i)] = reactModule.createElement(view, {
			tag = "col gap-small",
			LayoutOrder = i,
			Size = UDim2.fromOffset(p2, p2 + 48)
		}, {
			Thumbnail = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(p2, p2),
				radius = radius.Medium
			}),
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(88, 20),
				radius = radius.Small
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-0-full auto-x",
		testId = `AssetLibrary.Category.{p1}.Skeleton`
	}, t)
end

local function renderCategory(p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), assetLibraryTileModule (ref), view (ref), renderLoadingTiles (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), scrollView (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref)
	if not p7 and p3.status == "Ready" and (#p3.assets == 0 and p3.notice == nil) then
		return nil
	end
	local var1 = p6 + 48
	local t = {}
	
	for i, v in p3.assets do
		t[v.tileKey or tostring(v.assetId)] = reactModule.createElement(assetLibraryTileModule, {
			subtitle = nil,
			tileKey = v.tileKey,
			assetId = v.assetId,
			assetType = v.assetType,
			displayName = v.displayName,
			thumbnail = v.thumbnail,
			model = v.model,
			onActivated = v.onActivated,
			LayoutOrder = i,
			Size = UDim2.fromOffset(p6, var1),
			mediaSize = UDim2.fromOffset(p6, p6)
		})
	end
	t.EndPadding = reactModule.createElement(view, {
		LayoutOrder = #p3.assets + 1,
		Size = UDim2.fromOffset(20, var1),
		testId = `AssetLibrary.Category.{p3.assetType}.EndPadding`
	})
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p4,
		testId = `AssetLibrary.Category.{p3.assetType}`
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y",
			onActivated = p3.onOpenCategory,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			testId = `AssetLibrary.Category.{p3.assetType}.Header`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p3.title,
				testId = `AssetLibrary.Category.{p3.assetType}.Header.Title`
			}),
			Chevron = if p3.onOpenCategory ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 2,
				tag = "auto-xy content-default",
				name = iconName.ChevronLargeRight,
				size = iconSize.Small,
				testId = `AssetLibrary.Category.{p3.assetType}.Header.Chevron`
			})
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, {
			Content = if p3.status == "Loading" or p3.status == "NotReady" then reactModule.createElement(view, { tag = "no-clip", Size = UDim2.new(1, 0, 0, var1) }, { Tiles = renderLoadingTiles(p3.assetType, p6) }) elseif p3.status == "Failed" then reactModule.createElement(view, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
				Message = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "fill text-body-medium text-align-x-left content-default",
					Text = p5.loadError
				}),
				Retry = reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = p3.onRetry,
					size = inputSize.Small,
					text = p5.retry,
					variant = buttonVariant.Standard
				})
			}) elseif #p3.assets > 0 then reactModule.createElement(scrollView, {
				ClipsDescendants = false,
				tag = "no-clip",
				Size = UDim2.new(1, 0, 0, var1),
				testId = `AssetLibrary.Category.{p3.assetType}.Carousel`,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None
				}
			}, {
				Tiles = reactModule.createElement(view, { tag = "row gap-medium size-0-full auto-x no-clip" }, t)
			}) elseif p3.notice == nil then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left content-muted",
				Text = p5.empty
			}) else nil
		}),
		Notice = if p3.notice ~= nil then nil else reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			Text = p3.notice,
			testId = `AssetLibrary.Category.{p3.assetType}.Notice`
		})
	})
end

return function(value)
	-- upvalues: useTokens (ref), reactModule (ref), renderCategory (ref), text (ref), view (ref), AssetLibrarySearchField (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), scrollView (ref), overflowMenuPageShellModule (ref)
	local var2 = useTokens()
	local var3, var4 = reactModule.useState(0)
	local medium = var2.Gap.Medium
	local var5 = if var3 > 0 then math.max(1, math.floor((var3 + medium) / 3.333333333333 - medium)) else var2.Size.Size_2500
	local t = {}
	local var6 = false
	
	for i, v in value.categories do
		local var7 = renderCategory(v, i, value.strings, var5, value.presentation == "Sheet")
		
		if var7 ~= nil then
			var6 = true
			t[v.assetType] = var7
		end
	end
	if not var6 then
		t.Empty = reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = value.strings.empty
		})
	end
	local var8 = reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-bottom-small padding-top-medium",
		testId = "AssetLibrary.Browser.Content",
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var4 (ref)
			var4(value.AbsoluteSize.X)
		end
	}, {
		Categories = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxlarge size-full-0 auto-y"
		}, t)
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
			Title = if value.isSearchExpanded then reactModule.createElement(AssetLibrarySearchField, {
				text = value.query,
				placeholder = value.strings.searchPlaceholder,
				inputRef = value.searchInputRef,
				onChanged = value.onQueryChanged,
				onClose = value.onSearchCancelled
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = value.strings.title
			}),
			Search = if not value.isSearchExpanded then reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				testId = "AssetLibrary.Search.Action",
				icon = iconName.MagnifyingGlass,
				onActivated = value.onSearchActivated,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}) else nil,
			SheetCloseInset = reactModule.createElement(view, {
				LayoutOrder = 4,
				testId = "AssetLibrary.Sheet.CloseInset",
				Size = UDim2.fromOffset(var2.Size.Size_1000, var2.Size.Size_1000)
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
		}, { Content = var8 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "AssetLibrary.Browser",
		title = value.strings.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		headerContent = if value.isSearchExpanded then reactModule.createElement(AssetLibrarySearchField, {
			text = value.query,
			placeholder = value.strings.searchPlaceholder,
			inputRef = value.searchInputRef,
			onChanged = value.onQueryChanged,
			onClose = value.onSearchCancelled
		}) else nil,
		headerTrailing = if not value.isSearchExpanded then reactModule.createElement(iconButton, {
			testId = "AssetLibrary.Search.Action",
			icon = iconName.MagnifyingGlass,
			onActivated = value.onSearchActivated,
			size = inputSize.Medium,
			variant = buttonVariant.Utility
		}) else nil,
		content = var8
	})
end