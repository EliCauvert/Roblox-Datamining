local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local ReparentableHost = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox).ReparentableHost
local _ = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableView)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local CreateElementFunction = ReactModule.createElement

local function CommitObserver(p1) --[[ Line: 22 ]]
	-- upvalues: SignalsReactModule (copy), ReactModule (copy)
	local ItemView = p1.itemView
	local UseSignalStateResult = SignalsReactModule.useSignalState(ItemView.signal)
	local Generation = if UseSignalStateResult == nil then nil else UseSignalStateResult.generation
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ItemView.contentRevision)
	ReactModule.useLayoutEffect(function() --[[ Line: 29 ]]
		-- upvalues: Generation (copy), ItemView (copy), UseSignalStateResult1 (copy)
		if Generation ~= nil then
			ItemView.commitContent(Generation, UseSignalStateResult1)
		end
	end, {
		UseSignalStateResult1,
		Generation,
		ItemView.commitContent
	})
	
	return nil
end

return (ReactModule.memo(function(p1) --[[ Line: 37 | Named "RecyclableViewHost" ]]
	-- upvalues: ReactModule (copy), ReparentableHost (copy), RecyclableViewRegistryModule (copy), CreateElementFunction (copy), RecyclableViewReadinessModule (copy), CommitObserver (copy), RecyclableViewContextModule (copy)
	local ItemView = p1.itemView
	local Signal = ItemView.signal
	local PortalFrameResult = ItemView.portalFrame(false)
	assert(PortalFrameResult ~= nil, "RecyclableViewHost: view host was destroyed before unmount")
	local UseStateResult = ReactModule.useState(function() --[[ Line: 42 ]]
		-- upvalues: ItemView (copy), Signal (copy)
		return {
			placement = ItemView.compositionPlacement,
			assignmentSignal = Signal,
			itemSignal = ItemView.itemSignal,
			itemKeySignal = ItemView.itemKeySignal
		}
	end)
	ReactModule.useLayoutEffect(function() --[[ Line: 51 ]]
		-- upvalues: PortalFrameResult (copy), ReparentableHost (upval), ItemView (copy)
		local BindHostResult = ItemView.bindHost({
			clearSelection = function() --[[ Line: 58 ]]
				-- upvalues: ReparentableHost (upval), PortalFrameResult (upval)
				ReparentableHost.clearSelection(PortalFrameResult)
			end,
			detachFromPlaceholder = function(Parent) --[[ Line: 52 ]]
				-- upvalues: PortalFrameResult (upval), ReparentableHost (upval)
				if PortalFrameResult.Parent == Parent then
					ReparentableHost.detach(PortalFrameResult)
				end
			end
		})
		
		return function() --[[ Line: 63 ]]
			-- upvalues: ReparentableHost (upval), PortalFrameResult (upval), BindHostResult (copy)
			ReparentableHost.detach(PortalFrameResult)
			BindHostResult()
		end
	end, { ItemView, PortalFrameResult })
	local Metadata = RecyclableViewRegistryModule.getMetadata(ItemView.itemViewType)
	assert(Metadata ~= nil, "RecyclableViewHost: unknown Recyclable view type")
	local config = {
		Content = ReactModule.useMemo(function() --[[ Line: 71 ]]
			-- upvalues: CreateElementFunction (upval), Metadata (copy), ItemView (copy)
			return CreateElementFunction(Metadata.signalComponent, {
				itemSignal = ItemView.itemSignal,
				pending = ItemView.pending
			})
		end, { ItemView, Metadata })
	}
	
	if Metadata.readiness == RecyclableViewReadinessModule.ReadyOnCommit then
		config.Observer = CreateElementFunction(CommitObserver, { itemView = ItemView })
	end
	return p1.createPortal(CreateElementFunction(RecyclableViewContextModule.Provider, { value = UseStateResult }, config), PortalFrameResult)
end))