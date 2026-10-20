local MusicPicker = script:FindFirstAncestor("MusicPicker")
local Parent = MusicPicker.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Radius = FoundationModule.Enums.Radius
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MusicPickerRowModule = require(MusicPicker.Components.MusicPickerRow)
local _ = require(MusicPicker.Types.MusicPickerTypes)

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), Text (copy), Skeleton (copy), Radius (copy), Button (copy), FoundationModule (copy), MusicPickerRowModule (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseTokensResult = UseTokensFunction()
	local Content = Frame.content
	local EmptyState = Content.emptyState
	local OnLoadMoreFunction = Content.onLoadMore
	local IsIsLoadingMore = Content.isLoadingMore == true
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: OnLoadMoreFunction (copy), IsIsLoadingMore (copy)
		if OnLoadMoreFunction == nil or IsIsLoadingMore then return end
		local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
		local Y1: number = ScrollFrame.AbsoluteWindowSize.Y
		
		if Y <= 0 or Y1 <= 0 then return end
		if Y - 128 <= ScrollFrame.CanvasPosition.Y + Y1 then
			OnLoadMoreFunction()
		end
	end, { OnLoadMoreFunction, IsIsLoadingMore })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			UseResult(Current)
		end
	end, { UseResult, #Content.items })
	
	if Content.status == "success" and #Content.items == 0 and EmptyState ~= nil then
		return ReactModule.createElement(View, {
			testId = "saved-empty-state",
			tag = "col align-x-center align-y-center gap-xxlarge size-full padding-bottom-xxlarge",
			LayoutOrder = Frame.LayoutOrder,
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink }
		}, {
			Graphic = ReactModule.createElement(View, { LayoutOrder = 1, tag = "size-3000" }, {
				Tile = ReactModule.createElement(View, {
					Rotation = -15,
					testId = "saved-empty-state-tile",
					tag = "position-center-center anchor-center-center size-2400 stroke-thick stroke-muted radius-medium"
				}),
				Icon = ReactModule.createElement(Icon, {
					testId = "saved-empty-state-icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = EmptyState.icon,
					size = UseTokensResult.Size.Size_1200,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}),
			Copy = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-small size-full-0 auto-y"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = EmptyState.title
				}),
				Subtitle = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = EmptyState.subtitle
				})
			})
		})
	end
	local Config = nil
	if Content.status == "loading" then
		local Elements = {}
		
		for i = 1, 6 do
			Elements[`Skeleton{i}`] = ReactModule.createElement(Skeleton, {
				LayoutOrder = i,
				radius = Radius.Medium,
				Size = UDim2.new(1, 0, 0, 64)
			})
		end
		Config = Elements
	elseif Content.status == "error" then
		Config = {
			Error = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-top-large text-body-medium text-align-x-center content-default",
				Text = Content.errorText or ""
			}),
			Retry = if Content.onRetry == nil then nil else ReactModule.createElement(Button, {
				LayoutOrder = 2,
				onActivated = Content.onRetry,
				size = FoundationModule.Enums.InputSize.Small,
				text = Content.retryText or "",
				variant = FoundationModule.Enums.ButtonVariant.Standard
			})
		}
	elseif Content.status == "success" and #Content.items == 0 then
		Config = {
			Empty = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-top-large text-body-medium text-align-x-center content-default",
				Text = Content.emptyText or ""
			})
		}
	elseif #Content.items > 0 then
		local Elements = {}
		
		for LayoutOrder, item in Content.items do
			Elements[tostring(item.id)] = ReactModule.createElement(MusicPickerRowModule, {
				item = item,
				layoutOrder = LayoutOrder,
				onSelect = Frame.onSelect
			})
		end
		if IsIsLoadingMore then
			Elements.LoadingMore = ReactModule.createElement(Skeleton, {
				LayoutOrder = #Content.items + 1,
				radius = Radius.Medium,
				Size = UDim2.new(1, 0, 0, 64)
			})
			Elements.LoadingMoreSpacer = ReactModule.createElement(View, {
				LayoutOrder = #Content.items + 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Padding.Large)
			})
		end
		Config = Elements
	else
		Config = nil
	end
	return ReactModule.createElement(ScrollView, {
		tag = "col align-x-left align-y-top size-full",
		LayoutOrder = Frame.LayoutOrder,
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, if Content.status == "loading" then UseTokensResult.Gap.Small else UseTokensResult.Gap.XXSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if OnLoadMoreFunction == nil then nil else UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = ScrollBarVisibility.None
		},
		scrollingFrameRef = UseRefResult,
		onCanvasPositionChanged = if OnLoadMoreFunction == nil then nil else UseResult,
		onAbsoluteCanvasSizeChanged = if OnLoadMoreFunction == nil then nil else UseResult,
		onAbsoluteWindowSizeChanged = if OnLoadMoreFunction == nil then nil else UseResult
	}, Config)
end