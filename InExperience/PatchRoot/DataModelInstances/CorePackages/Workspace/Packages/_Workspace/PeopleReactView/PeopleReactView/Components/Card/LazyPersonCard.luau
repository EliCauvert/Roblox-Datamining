local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local peopleServiceModule = require(parent.PeopleService)
local _ = require(peopleReactView.Stores.GetScrollingFrameStore)
local personCardModule = require(peopleReactView.Components.Card.PersonCard)
local lazyScrollingComponentModule = require(peopleReactView.Components.Common.LazyScrollingComponent)
local flags = peopleServiceModule.getService("Flags")
local getFFlagPeoplePageEnablePersonSignalStore = flags.GetFFlagPeoplePageEnablePersonSignalStore
local fFlagPeoplePageRemoveSkeletons = flags.FFlagPeoplePageRemoveSkeletons
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements
local var10 = reactModule.memo(function(p0) --[[ line: 33 ]]
	-- upvalues: useTokens (ref), fFlagPeoplePageRemoveSkeletons (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var11 = useTokens()
	
	return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, { tag = "bg-surface-100 radius-medium", Size = p0.size }) else reactModule.createElement(view, { tag = "col bg-surface-100 radius-medium", Size = p0.size }, {
		ThumbnailContainer = reactModule.createElement(view, {
			tag = "size-full aspect-1-1 padding-small",
			LayoutOrder = 1
		}, {
			ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Small })
		}),
		Details = reactModule.createElement(view, {
			tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small",
			LayoutOrder = 2
		}, {
			NameSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.9, 0, 0, var11.Size.Size_350),
				radius = radius.Small
			}),
			HandleSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var11.Size.Size_350),
				radius = radius.Small
			})
		})
	})
end)

return reactModule.memo(function(p1) --[[ line: 86 ]]
	-- upvalues: useTokens (ref), getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), signalsModule (ref), reactIsModule (ref), fFlagPeoplePageRemoveUseMemoElements (ref), reactModule (ref), personCardModule (ref), var10 (ref), fFlagPeoplePageRemoveSkeletons (ref), view (ref), skeleton (ref), radius (ref), lazyScrollingComponentModule (ref)
	local var12 = useTokens()
	local var13 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p2) --[[ line: 90 ]]
		-- upvalues: p1 (ref)
		return if type(p1.layoutOrder) == "function" then p1.layoutOrder(p2) else p1.layoutOrder or 0
	end)) else nil
	local var14 = if reactIsModule.isBinding(p1.width) then p1.width:map(function(p3) --[[ line: 100 ]]
		-- upvalues: var12 (ref)
		return UDim2.new(0, p3, 0, p3 + var12.Size.Size_1400)
	end) else UDim2.new(0, p1.width, 0, p1.width + var12.Size.Size_1400)
	local var15 = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(personCardModule, {
		width = p1.width,
		person = p1.person,
		showTooltip = p1.showTooltip,
		onDismissTooltip = p1.onDismissTooltip,
		shouldShowMenu = p1.shouldShowMenu,
		layoutOrder = p1.layoutOrder
	}) else reactModule.useMemo(function() --[[ line: 117 ]]
		-- upvalues: reactModule (copy), personCardModule (copy), p1 (ref)
		return reactModule.createElement(personCardModule, {
			width = p1.width,
			person = p1.person,
			showTooltip = p1.showTooltip,
			onDismissTooltip = p1.onDismissTooltip,
			shouldShowMenu = p1.shouldShowMenu,
			layoutOrder = p1.layoutOrder
		})
	end, {
		p1.width, p1.person, p1.showTooltip, p1.onDismissTooltip, p1.shouldShowMenu,
		p1.layoutOrder
	})
	
	return if p1.scrollingFrameStore then reactModule.createElement(lazyScrollingComponentModule, {
		scrollingFrameAbsolutePositionY = p1.scrollingFrameStore.getAbsolutePositionY,
		scrollingFrameAbsoluteSizeY = p1.scrollingFrameStore.getAbsoluteSizeY,
		scrollingFrameCanvasPositionY = p1.scrollingFrameStore.getCanvasPositionY,
		placeholder = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(var10, { size = var14 }) else reactModule.useMemo(function() --[[ line: 141 ]]
			-- upvalues: fFlagPeoplePageRemoveSkeletons (copy), reactModule (copy), view (copy), var14 (write), skeleton (copy), radius (copy), var12 (ref)
			return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, { tag = "bg-surface-100 radius-medium", Size = var14 }) else reactModule.createElement(view, { tag = "col bg-surface-100 radius-medium", Size = var14 }, {
				ThumbnailContainer = reactModule.createElement(view, {
					tag = "size-full aspect-1-1 padding-small",
					LayoutOrder = 1
				}, {
					ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Small })
				}),
				Details = reactModule.createElement(view, {
					tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small",
					LayoutOrder = 2
				}, {
					NameSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0.9, 0, 0, var12.Size.Size_350),
						radius = radius.Small
					}),
					HandleSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.6, 0, 0, var12.Size.Size_350),
						radius = radius.Small
					})
				})
			})
		end, { var14, var12 }),
		placeholderLayoutOrder = if getFFlagPeoplePageEnablePersonSignalStore() then var13 else p1.layoutOrder
	}, { PersonCard = var15 }) else var15
end)