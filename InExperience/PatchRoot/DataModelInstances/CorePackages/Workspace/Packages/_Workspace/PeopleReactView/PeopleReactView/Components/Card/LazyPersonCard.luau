local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local _ = require(PeopleReactView.Stores.GetScrollingFrameStore)
local PersonCardModule = require(PeopleReactView.Components.Card.PersonCard)
local LazyScrollingComponentModule = require(PeopleReactView.Components.Common.LazyScrollingComponent)
local FlagsService = require(Parent.PeopleService).getService("Flags")
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = FlagsService.GetFFlagPeoplePageEnablePersonSignalStore
local FFlagPeoplePageRemoveSkeletons = FlagsService.FFlagPeoplePageRemoveSkeletons
local FFlagPeoplePageRemoveUseMemoElements = FlagsService.FFlagPeoplePageRemoveUseMemoElements
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagPeoplePageRemoveSkeletons (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if FFlagPeoplePageRemoveSkeletons then ReactModule.createElement(View, { tag = "bg-surface-100 radius-medium", Size = p1.size }) else ReactModule.createElement(View, { tag = "col bg-surface-100 radius-medium", Size = p1.size }, {
		ThumbnailContainer = ReactModule.createElement(View, {
			tag = "size-full aspect-1-1 padding-small",
			LayoutOrder = 1
		}, {
			ThumbnailSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
		}),
		Details = ReactModule.createElement(View, {
			tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small",
			LayoutOrder = 2
		}, {
			NameSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.9, 0, 0, UseTokensResult.Size.Size_350),
				radius = Radius.Small
			}),
			HandleSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_350),
				radius = Radius.Small
			})
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), GetFFlagPeoplePageEnablePersonSignalStoreFunction (copy), SignalsReactModule (copy), SignalsModule (copy), ReactIsModule (copy), FFlagPeoplePageRemoveUseMemoElements (copy), ReactModule (copy), PersonCardModule (copy), MemoResult (copy), FFlagPeoplePageRemoveSkeletons (copy), View (copy), Skeleton (copy), Radius (copy), LazyScrollingComponentModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalBindingResult = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then SignalsReactModule.useSignalBinding(SignalsModule.createComputed(function(p2)
		-- upvalues: p1 (copy)
		return if type(p1.layoutOrder) == "function" then p1.layoutOrder(p2) else p1.layoutOrder or 0
	end)) else nil
	local MapResult = nil
	MapResult = if ReactIsModule.isBinding(p1.width) then p1.width:map(function(XOffset): UDim2
		-- upvalues: UseTokensResult (copy)
		return UDim2.new(0, XOffset, 0, XOffset + UseTokensResult.Size.Size_1400)
	end) else UDim2.new(0, p1.width, 0, p1.width + UseTokensResult.Size.Size_1400)
	local Element = if FFlagPeoplePageRemoveUseMemoElements then ReactModule.createElement(PersonCardModule, {
		width = p1.width,
		person = p1.person,
		showTooltip = p1.showTooltip,
		onDismissTooltip = p1.onDismissTooltip,
		shouldShowMenu = p1.shouldShowMenu,
		layoutOrder = p1.layoutOrder,
		isCompactCardLayout = p1.isCompactCardLayout
	}) else ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), PersonCardModule (upval), p1 (copy)
		return ReactModule.createElement(PersonCardModule, {
			width = p1.width,
			person = p1.person,
			showTooltip = p1.showTooltip,
			onDismissTooltip = p1.onDismissTooltip,
			shouldShowMenu = p1.shouldShowMenu,
			layoutOrder = p1.layoutOrder,
			isCompactCardLayout = p1.isCompactCardLayout
		})
	end, {
		p1.width, p1.person, p1.showTooltip, p1.onDismissTooltip, p1.shouldShowMenu,
		p1.layoutOrder, p1.isCompactCardLayout
	})
	local Element1 = if FFlagPeoplePageRemoveUseMemoElements then ReactModule.createElement(MemoResult, { size = MapResult }) else ReactModule.useMemo(function()
		-- upvalues: FFlagPeoplePageRemoveSkeletons (upval), ReactModule (upval), View (upval), MapResult (ref), Skeleton (upval), Radius (upval), UseTokensResult (copy)
		return if FFlagPeoplePageRemoveSkeletons then ReactModule.createElement(View, { tag = "bg-surface-100 radius-medium", Size = MapResult }) else ReactModule.createElement(View, {
			tag = "col bg-surface-100 radius-medium",
			Size = MapResult
		}, {
			ThumbnailContainer = ReactModule.createElement(View, {
				tag = "size-full aspect-1-1 padding-small",
				LayoutOrder = 1
			}, {
				ThumbnailSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Small })
			}),
			Details = ReactModule.createElement(View, {
				tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small",
				LayoutOrder = 2
			}, {
				NameSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.9, 0, 0, UseTokensResult.Size.Size_350),
					radius = Radius.Small
				}),
				HandleSkeleton = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_350),
					radius = Radius.Small
				})
			})
		})
	end, { MapResult, UseTokensResult })
	
	return if p1.scrollingFrameStore then ReactModule.createElement(LazyScrollingComponentModule, {
		scrollingFrameAbsolutePositionY = p1.scrollingFrameStore.getAbsolutePositionY,
		scrollingFrameAbsoluteSizeY = p1.scrollingFrameStore.getAbsoluteSizeY,
		scrollingFrameCanvasPositionY = p1.scrollingFrameStore.getCanvasPositionY,
		placeholder = Element1,
		placeholderLayoutOrder = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then UseSignalBindingResult else p1.layoutOrder
	}, { PersonCard = Element }) else Element
end)