local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local compositionPlacementContextModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementContext)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local reparentableHost = viewRecyclerRobloxModule.ReparentableHost
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local _ = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRecord)
local createElement = reactModule.createElement

local function CommitReadyContent(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), createElement (ref)
	local itemView = p1.itemView
	local var1 = signalsReactModule.useSignalState(itemView.signal)
	local var2 = if var1 == nil then nil else var1.generation
	local var3 = signalsReactModule.useSignalState(itemView.contentRevision)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), itemView (ref), var3 (ref)
		if var2 ~= nil then
			itemView.commitContent(var2, var3)
		end
	end, { var3, var2, itemView.commitContent })
	
	return createElement(p1.signalComponent, {
		valueSignal = itemView.valueSignal,
		pending = itemView.pending
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reparentableHost (ref), recyclableViewRegistryModule (ref), createElement (ref), CommitReadyContent (ref), compositionPlacementContextModule (ref)
	local itemView = p1.itemView
	local signal = itemView.signal
	local var1 = itemView.portalFrame(false)
	assert(var1 ~= nil, "ListItemViewHost: record host was destroyed before unmount")
	local var2 = reactModule.useState(function()
		-- upvalues: itemView (ref), signal (ref)
		return {
			manager = itemView.compositionPlacementManager,
			parentSignal = signal
		}
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), reparentableHost (copy), itemView (ref)
		local var3 = itemView.bindHost({
			clearSelection = function()
				-- upvalues: reparentableHost (copy), var1 (copy)
				reparentableHost.clearSelection(var1)
			end,
			detachFromPlaceholder = function(p2)
				-- upvalues: var1 (copy), reparentableHost (copy)
				if var1.Parent == p2 then
					reparentableHost.detach(var1)
				end
			end
		})
		
		return function()
			-- upvalues: reparentableHost (copy), var1 (copy), var3 (ref)
			reparentableHost.detach(var1)
			var3()
		end
	end, { itemView, var1 })
	local metadata = recyclableViewRegistryModule.getMetadata(itemView.itemViewType)
	assert(metadata ~= nil, "ListItemViewHost: unknown Recyclable view type")
	
	return p1.createPortal(createElement(compositionPlacementContextModule.Provider, { value = var2 }, {
		Content = reactModule.useMemo(function()
			-- upvalues: metadata (ref), createElement (copy), CommitReadyContent (copy), itemView (ref), itemView (ref)
			return if metadata.readiness == "ReadyOnCommit" then createElement(CommitReadyContent, {
				itemView = itemView,
				signalComponent = metadata.signalComponent
			}) else createElement(metadata.signalComponent, {
				valueSignal = itemView.valueSignal,
				pending = itemView.pending
			})
		end, { itemView, metadata })
	}), var1)
end)