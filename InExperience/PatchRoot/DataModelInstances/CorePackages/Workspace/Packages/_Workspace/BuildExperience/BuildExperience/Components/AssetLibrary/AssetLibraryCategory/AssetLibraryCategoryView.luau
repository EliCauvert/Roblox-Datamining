local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryGridViewModule = require(script.Parent.AssetLibraryGridView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(value)
	-- upvalues: reactModule (ref), view (ref), assetLibraryGridViewModule (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), overflowMenuPageShellModule (ref), iconName (ref)
	local _ = nil
	
	return reactModule.createElement(overflowMenuPageShellModule, {
		disableScrolling = true,
		testId = "AssetLibrary.CategoryPage",
		title = value.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		content = if value.status == "Loading" or value.status == "NotReady" then reactModule.createElement(view, {
			tag = "size-full",
			testId = "AssetLibrary.Category.Skeleton"
		}, {
			Grid = reactModule.createElement(assetLibraryGridViewModule, {
				hasMore = false,
				isLoading = true,
				assets = {},
				onLoadMore = function() end
			})
		}) elseif value.status == "Failed" then reactModule.createElement(view, {
			tag = "col align-x-center gap-medium size-full-0 auto-y padding-large"
		}, {
			Message = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-default",
				Text = value.strings.loadError
			}),
			Retry = reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = value.onRetry,
				size = inputSize.Medium,
				text = value.strings.retry,
				variant = buttonVariant.Standard
			})
		}) elseif #value.assets == 0 then reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
			Text = value.strings.empty
		}) else reactModule.createElement(view, { tag = "col gap-medium size-full" }, {
			GridContainer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
				Grid = reactModule.createElement(assetLibraryGridViewModule, {
					assets = value.assets,
					hasMore = value.hasMore,
					onLoadMore = value.onLoadMore
				})
			}),
			LoadMoreError = if value.loadMoreFailed then reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-small size-full-0 auto-y padding-medium"
			}, {
				Message = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "fill text-body-medium text-align-x-left content-default",
					Text = value.strings.loadError
				}),
				Retry = reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = value.onRetry,
					size = inputSize.Medium,
					text = value.strings.retry,
					variant = buttonVariant.Standard
				})
			}) else nil
		})
	})
end