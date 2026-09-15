local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local libraryGridViewModule = require(script.Parent.LibraryGridView)
local _ = require(script.Parent.Parent.LibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens

local function LibraryGridSearch(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-left-medium padding-right-xsmall stroke-default radius-circle bg-surface-100",
		testId = "Library.Grid.Search"
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-default",
			name = iconName.MagnifyingGlass,
			size = iconSize.Small
		}),
		Input = reactModule.createElement("TextBox", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ref = p1.inputRef,
			FontFace = Font.fromEnum(var1.Typography.BodyMedium.Font),
			PlaceholderColor3 = var1.Color.Content.Default.Color3,
			PlaceholderText = p1.placeholder,
			Size = UDim2.new(1, -80, 0, var1.Size.Size_1000),
			Text = p1.query,
			TextColor3 = var1.Color.Content.Emphasis.Color3,
			TextSize = var1.Typography.BodyMedium.FontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			[reactModule.Change.Text] = function(p2)
				-- upvalues: p1 (ref)
				p1.onChanged(p2.Text)
			end,
			[reactModule.Tag] = "fill data-testid=Library.Grid.Search.Input"
		}),
		Close = reactModule.createElement(iconButton, {
			LayoutOrder = 3,
			testId = "Library.Grid.Search.Close",
			icon = iconName.X,
			onActivated = p1.onClose,
			size = inputSize.Small,
			variant = buttonVariant.Utility
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), LibraryGridSearch (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), view (ref), libraryGridViewModule (ref), text (ref), button (ref), overflowMenuPageShellModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(true)
	end, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref), var2 (ref)
		local current = var3.current
		
		if current ~= nil and current:IsA("TextBox") then
			current:ReleaseFocus()
		end
		p1.onSearchReset()
		var2(false)
	end, { p1.onSearchReset })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1 then
			task.defer(function()
				-- upvalues: var3 (copy)
				local current = var3.current
				
				if current ~= nil and current:IsA("TextBox") then
					current:CaptureFocus()
				end
			end)
			
			return
		end
	end, { var1 })
	local var6 = if var1 then reactModule.createElement(LibraryGridSearch, {
		query = p1.query,
		placeholder = p1.strings.searchPlaceholder,
		inputRef = var3,
		onChanged = p1.onQueryChanged,
		onClose = var5
	}) else nil
	local var7 = if not var1 then reactModule.createElement(iconButton, {
		testId = "Library.Grid.Search.Action",
		icon = iconName.MagnifyingGlass,
		onActivated = var4,
		size = inputSize.Medium,
		variant = buttonVariant.Utility
	}) else nil
	local _ = nil
	local var8 = reactModule.createElement(view, { tag = "col size-full padding-x-medium" }, {
		Body = reactModule.createElement(view, { tag = "fill size-full-0" }, {
			Content = if p1.status == "Loading" or p1.status == "NotReady" then reactModule.createElement(view, { tag = "size-full", testId = "Library.Category.Skeleton" }, {
				Grid = reactModule.createElement(libraryGridViewModule, {
					hasMore = false,
					isLoading = true,
					items = {},
					onLoadMore = function() end
				})
			}) elseif p1.status == "Failed" then reactModule.createElement(view, {
				tag = "col align-x-center gap-medium size-full-0 auto-y padding-large"
			}, {
				Message = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-body-medium content-default",
					Text = p1.strings.loadError
				}),
				Retry = reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = p1.onRetry,
					size = inputSize.Medium,
					text = p1.strings.retry,
					variant = buttonVariant.Standard
				})
			}) elseif #p1.items == 0 then reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
				Text = p1.strings.empty
			}) else reactModule.createElement(view, { tag = "col gap-medium size-full" }, {
				GridContainer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
					Grid = reactModule.createElement(libraryGridViewModule, {
						items = p1.items,
						hasMore = p1.hasMore,
						isLoadingMore = p1.isLoadingMore,
						onLoadMore = p1.onLoadMore
					})
				}),
				LoadMoreError = if p1.loadMoreFailed then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y padding-medium"
				}, {
					Message = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "fill text-body-medium text-align-x-left content-default",
						Text = p1.strings.loadError
					}),
					Retry = reactModule.createElement(button, {
						LayoutOrder = 2,
						onActivated = p1.onRetry,
						size = inputSize.Medium,
						text = p1.strings.retry,
						variant = buttonVariant.Standard
					})
				}) else nil
			})
		})
	})
	
	return if p1.presentation == "Sheet" then reactModule.createElement(view, { tag = "col size-full", testId = "Library.CategoryPage" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "Library.CategoryPage.Header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "Library.CategoryPage.Back",
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.onBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = if var1 then reactModule.createElement(view, { LayoutOrder = 2, tag = "grow auto-y" }, { Search = var6 }) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = p1.title
			}),
			Search = if not var1 then reactModule.createElement(view, { LayoutOrder = 3, tag = "auto-xy" }, { Action = var7 }) else nil
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-full-0" }, { Body = var8 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		disableScrolling = true,
		testId = "Library.CategoryPage",
		title = p1.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = p1.onBack,
		headerContent = var6,
		headerTrailing = var7,
		content = var8
	})
end