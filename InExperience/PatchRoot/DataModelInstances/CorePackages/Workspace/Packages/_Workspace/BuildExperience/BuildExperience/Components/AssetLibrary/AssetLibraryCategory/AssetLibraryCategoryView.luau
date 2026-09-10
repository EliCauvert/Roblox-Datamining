local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryGridViewModule = require(script.Parent.AssetLibraryGridView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(value)
	-- upvalues: reactModule (ref), view (ref), assetLibraryGridViewModule (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), iconButton (ref), iconName (ref), overflowMenuPageShellModule (ref)
	local _ = nil
	local var1 = if value.status == "Loading" or value.status == "NotReady" then reactModule.createElement(view, {
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
	
	return if value.presentation == "Sheet" then reactModule.createElement(view, {
		tag = "col size-full",
		testId = "AssetLibrary.CategoryPage"
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "AssetLibrary.CategoryPage.Header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "AssetLibrary.CategoryPage.Back",
				icon = iconName.ChevronLargeLeft,
				onActivated = value.onBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left content-emphasis",
				Text = value.title
			})
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-full-0" }, { Body = var1 })
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		disableScrolling = true,
		testId = "AssetLibrary.CategoryPage",
		title = value.title,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		content = var1
	})
end