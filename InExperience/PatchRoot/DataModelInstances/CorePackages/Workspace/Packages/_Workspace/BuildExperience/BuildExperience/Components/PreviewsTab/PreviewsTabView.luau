local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local ExperienceResultsLoadingSkeletonModule = require(BuildExperience.Components.MyCreationsTab.ExperienceResultsLoadingSkeleton)
local List = FoundationModule.List
local View = FoundationModule.View
local RefreshScrollingFrame = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.RefreshScrollingFrame
local DataStatus = require(Parent.DataHydration).DataStatus
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: DataStatus (copy), ReactModule (copy), List (copy), ExperienceResultsLoadingSkeletonModule (copy), RefreshScrollingFrame (copy), View (copy), BuildEmptyStateModule (copy), InputSize (copy)
	local IsListStatusMatch: boolean = #Frame.rows == 0 and Frame.listStatus == DataStatus.Ready
	local Elements = {}
	
	if #Frame.rows > 0 then
		for LayoutOrder, row in Frame.rows do
			Elements[`U{row.universeId}`] = ReactModule.createElement(List.Item, {
				LayoutOrder = LayoutOrder,
				leading = { iconName = row.gameIcon },
				title = row.title,
				description = row.description,
				testId = `PreviewsTab.PreviewRow.{row.universeId}`,
				onActivated = row.onActivated
			})
		end
	elseif Frame.listStatus == DataStatus.NotReady then
		for i = 1, 2 do
			Elements[`Loading{i}`] = ReactModule.createElement(ExperienceResultsLoadingSkeletonModule, { testIdPrefix = "PreviewsTab", LayoutOrder = i, index = i })
		end
	end
	if Frame.listStatus == DataStatus.Failed then
		Elements.Error = ReactModule.createElement(List.Item, {
			testId = "PreviewsTab.LoadError",
			LayoutOrder = #Frame.rows + 1,
			title = Frame.loadError
		})
	end
	if Frame.failedLoadMore then
		Elements.LoadMoreError = ReactModule.createElement(List.Item, {
			testId = "PreviewsTab.LoadMoreError",
			LayoutOrder = #Frame.rows + 2,
			title = Frame.loadError,
			onActivated = Frame.retryLoadMore
		})
	end
	local IsLoadingMore = Frame.isLoadingMore
	
	return ReactModule.createElement(View, {
		tag = "col fill size-full",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Filter = Frame.filterHeader,
		Results = ReactModule.createElement(RefreshScrollingFrame, {
			usesBuilderIcon = true,
			refresh = Frame.refresh,
			onCanvasPositionChangedCallback = Frame.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = Frame.loadMoreIfNeeded,
			createFooter = ReactModule.useCallback(function()
				-- upvalues: IsLoadingMore (copy), ReactModule (upval), ExperienceResultsLoadingSkeletonModule (upval)
				return if IsLoadingMore then ReactModule.createElement(ExperienceResultsLoadingSkeletonModule, { LayoutOrder = 1, index = 1, testIdPrefix = "PreviewsTab" }) else nil
			end, { IsLoadingMore }),
			scrollingElementProps = {
				LayoutOrder = 1,
				ZIndex = 1,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(1, 0, 1, 1),
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				[ReactModule.Tag] = "fill"
			}
		}, {
			ContentLayout = ReactModule.createElement(View, {
				tag = "composition-layout-detail size-full-0 auto-y",
				testId = "PreviewsTab.ContentLayout"
			}, {
				ContentBody = ReactModule.createElement(View, { tag = "composition-content-body col size-full-0 auto-y" }, if IsListStatusMatch then {
					EmptyContent = ReactModule.createElement(View, { tag = "col size-full" }, {
						EmptyState = ReactModule.createElement(View, {
							tag = "col align-x-center align-y-center fill size-full-0 padding-large",
							testId = "PreviewsTab.Empty"
						}, {
							Content = ReactModule.createElement(BuildEmptyStateModule, { message = Frame.emptyText })
						})
					})
				} else {
					List = ReactModule.createElement(List.Root, {
						hasDivider = false,
						isContained = { isContained = false, hasMargin = false },
						size = InputSize.Large
					}, Elements)
				})
			})
		})
	})
end