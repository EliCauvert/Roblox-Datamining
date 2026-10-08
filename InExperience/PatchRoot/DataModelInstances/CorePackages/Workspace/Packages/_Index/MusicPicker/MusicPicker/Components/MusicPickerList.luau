local musicPicker = script:FindFirstAncestor("MusicPicker")
local parent = musicPicker.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local radius = foundationModule.Enums.Radius
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagMomentsCreationMusicPickerPaginationModule = require(musicPicker.Flags.FFlagMomentsCreationMusicPickerPagination)
local musicPickerRowModule = require(musicPicker.Components.MusicPickerRow)
local _ = require(musicPicker.Types.MusicPickerTypes)

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsCreationMusicPickerPaginationModule (ref), reactModule (ref), view (ref), icon (ref), text (ref), skeleton (ref), radius (ref), button (ref), foundationModule (ref), musicPickerRowModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = useTokens()
	local content = p1.content
	local emptyState = content.emptyState
	local onLoadMore = content.onLoadMore
	local var2 = content.isLoadingMore == true
	local var3 = nil
	local var4 = nil
	
	if fFlagMomentsCreationMusicPickerPaginationModule then
		local var5 = reactModule.useRef(nil)
		local var6 = reactModule.useCallback(function(p2)
			-- upvalues: onLoadMore (ref), var2 (ref)
			if onLoadMore == nil or var2 then return end
			local y = p2.AbsoluteCanvasSize.Y
			local y_1 = p2.AbsoluteWindowSize.Y
			
			if y <= 0 or y_1 <= 0 then return end
			if y - 128 <= p2.CanvasPosition.Y + y_1 then
				onLoadMore()
			end
		end, { onLoadMore, var2 })
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), var6 (ref)
			local current = var5.current
			
			if current ~= nil then
				var6(current)
			end
		end, { var6, #content.items })
		var3 = var5
		var4 = var6
	end
	if content.status == "success" and #content.items == 0 and emptyState ~= nil then
		return reactModule.createElement(view, {
			testId = "saved-empty-state",
			tag = "col align-x-center align-y-center gap-xxlarge size-full padding-bottom-xxlarge",
			LayoutOrder = p1.LayoutOrder,
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink }
		}, {
			Graphic = reactModule.createElement(view, { LayoutOrder = 1, tag = "size-3000" }, {
				Tile = reactModule.createElement(view, {
					Rotation = -15,
					testId = "saved-empty-state-tile",
					tag = "position-center-center anchor-center-center size-2400 stroke-thick stroke-muted radius-medium"
				}),
				Icon = reactModule.createElement(icon, {
					testId = "saved-empty-state-icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = emptyState.icon,
					size = var1.Size.Size_1200,
					style = var1.Color.Content.Emphasis
				})
			}),
			Copy = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-small size-full-0 auto-y"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = emptyState.title
				}),
				Subtitle = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = emptyState.subtitle
				})
			})
		})
	end
	local var7
	local _ = nil
	
	if content.status == "loading" then
		local t = {}
		
		for i = 1, 6 do
			t[`Skeleton{i}`] = reactModule.createElement(skeleton, {
				LayoutOrder = i,
				radius = radius.Medium,
				Size = UDim2.new(1, 0, 0, 64)
			})
		end
		var7 = t
	elseif content.status == "error" then
		var7 = {
			Error = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-top-large text-body-medium text-align-x-center content-default",
				Text = content.errorText or ""
			}),
			Retry = if content.onRetry ~= nil then nil else reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = content.onRetry,
				size = foundationModule.Enums.InputSize.Small,
				text = content.retryText or "",
				variant = foundationModule.Enums.ButtonVariant.Standard
			})
		}
	elseif content.status == "success" and #content.items == 0 then
		var7 = {
			Empty = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-top-large text-body-medium text-align-x-center content-default",
				Text = content.emptyText or ""
			})
		}
	elseif #content.items > 0 then
		local t = {}
		
		for i_1, v in content.items do
			t[tostring(v.id)] = reactModule.createElement(musicPickerRowModule, { item = v, layoutOrder = i_1, onSelect = p1.onSelect })
		end
		if var2 then
			t.LoadingMore = reactModule.createElement(skeleton, {
				LayoutOrder = #content.items + 1,
				radius = radius.Medium,
				Size = UDim2.new(1, 0, 0, 64)
			})
		end
		var7 = t
	else
		var7 = nil
	end
	return reactModule.createElement(scrollView, {
		tag = "col align-x-left align-y-top size-full",
		LayoutOrder = p1.LayoutOrder,
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, if content.status == "loading" then var1.Gap.Small else var1.Gap.XXSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if onLoadMore ~= nil then nil else UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = scrollBarVisibility.None
		},
		scrollingFrameRef = var3,
		onCanvasPositionChanged = if onLoadMore ~= nil then nil else var4,
		onAbsoluteCanvasSizeChanged = if onLoadMore ~= nil then nil else var4,
		onAbsoluteWindowSizeChanged = if onLoadMore ~= nil then nil else var4
	}, var7)
end