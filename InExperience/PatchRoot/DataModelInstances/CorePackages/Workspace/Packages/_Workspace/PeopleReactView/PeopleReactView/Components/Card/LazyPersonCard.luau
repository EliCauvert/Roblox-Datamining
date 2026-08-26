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
local var1 = reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagPeoplePageRemoveSkeletons (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var2 = useTokens()
	
	return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, { tag = "bg-surface-100 radius-medium", Size = p1.size }) else reactModule.createElement(view, { tag = "col bg-surface-100 radius-medium", Size = p1.size }, {
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
				Size = UDim2.new(0.9, 0, 0, var2.Size.Size_350),
				radius = radius.Small
			}),
			HandleSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var2.Size.Size_350),
				radius = radius.Small
			})
		})
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), signalsModule (ref), reactIsModule (ref), fFlagPeoplePageRemoveUseMemoElements (ref), reactModule (ref), personCardModule (ref), var1 (ref), fFlagPeoplePageRemoveSkeletons (ref), view (ref), skeleton (ref), radius (ref), lazyScrollingComponentModule (ref)
	local var2 = useTokens()
	local var3 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p2)
		-- upvalues: p1 (ref)
		return if type(p1.layoutOrder) == "function" then p1.layoutOrder(p2) else p1.layoutOrder or 0
	end)) else nil
	local var4 = if reactIsModule.isBinding(p1.width) then p1.width:map(function(p2)
		-- upvalues: var2 (ref)
		return UDim2.new(0, p2, 0, p2 + var2.Size.Size_1400)
	end) else UDim2.new(0, p1.width, 0, p1.width + var2.Size.Size_1400)
	local var5 = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(personCardModule, {
		width = p1.width,
		person = p1.person,
		showTooltip = p1.showTooltip,
		onDismissTooltip = p1.onDismissTooltip,
		shouldShowMenu = p1.shouldShowMenu,
		layoutOrder = p1.layoutOrder
	}) else reactModule.useMemo(function()
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
		placeholder = if fFlagPeoplePageRemoveUseMemoElements then reactModule.createElement(var1, { size = var4 }) else reactModule.useMemo(function()
			-- upvalues: fFlagPeoplePageRemoveSkeletons (copy), reactModule (copy), view (copy), var4 (write), skeleton (copy), radius (copy), var2 (ref)
			return if fFlagPeoplePageRemoveSkeletons then reactModule.createElement(view, { tag = "bg-surface-100 radius-medium", Size = var4 }) else reactModule.createElement(view, { tag = "col bg-surface-100 radius-medium", Size = var4 }, {
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
						Size = UDim2.new(0.9, 0, 0, var2.Size.Size_350),
						radius = radius.Small
					}),
					HandleSkeleton = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.6, 0, 0, var2.Size.Size_350),
						radius = radius.Small
					})
				})
			})
		end, { var4, var2 }),
		placeholderLayoutOrder = if getFFlagPeoplePageEnablePersonSignalStore() then var3 else p1.layoutOrder
	}, { PersonCard = var5 }) else var5
end)