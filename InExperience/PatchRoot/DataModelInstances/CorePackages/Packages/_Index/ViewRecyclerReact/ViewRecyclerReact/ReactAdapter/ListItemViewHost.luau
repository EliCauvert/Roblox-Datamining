local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local compositionPlacementContextModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementContext)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local reparentableHost = viewRecyclerRobloxModule.ReparentableHost
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local _ = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRecord)
local createElement = reactModule.createElement

local function CommitReadyContent(p0) --[[ line: 21 ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), createElement (ref)
	local itemView = p0.itemView
	local var7 = signalsReactModule.useSignalState(itemView.signal)
	local var8 = if var7 == nil then nil else var7.generation
	local var9 = signalsReactModule.useSignalState(itemView.contentRevision)
	reactModule.useLayoutEffect(function() --[[ line: 30 ]]
		-- upvalues: var8 (ref), itemView (ref), var9 (ref)
		if var8 ~= nil then
			itemView.commitContent(var8, var9)
		end
	end, { var9, var8, itemView.commitContent })
	
	return createElement(p0.signalComponent, {
		valueSignal = itemView.valueSignal,
		pending = itemView.pending
	})
end

return reactModule.memo(function(p1) --[[ line: 41 | named "ListItemViewHost" ]]
	-- upvalues: reactModule (ref), reparentableHost (ref), recyclableViewRegistryModule (ref), createElement (ref), CommitReadyContent (ref), compositionPlacementContextModule (ref)
	local itemView = p1.itemView
	local signal = itemView.signal
	local var10 = itemView.portalFrame(false)
	assert(var10 ~= nil, "ListItemViewHost: record host was destroyed before unmount")
	local var11 = reactModule.useState(function() --[[ line: 47 ]]
		-- upvalues: itemView (ref), signal (ref)
		return {
			manager = itemView.compositionPlacementManager,
			parentSignal = signal
		}
	end)
	reactModule.useLayoutEffect(function() --[[ line: 54 ]]
		-- upvalues: var10 (ref), reparentableHost (copy), itemView (ref)
		local var13 = itemView.bindHost({
			clearSelection = function() --[[ line: 61 ]]
				-- upvalues: reparentableHost (copy), var10 (copy)
				reparentableHost.clearSelection(var10)
			end,
			detachFromPlaceholder = function(p2) --[[ line: 55 ]]
				-- upvalues: var10 (copy), reparentableHost (copy)
				if var10.Parent == p2 then
					reparentableHost.detach(var10)
				end
			end
		})
		
		return function() --[[ line: 66 ]]
			-- upvalues: reparentableHost (copy), var10 (copy), var13 (ref)
			reparentableHost.detach(var10)
			var13()
		end
	end, { itemView, var10 })
	local metadata = recyclableViewRegistryModule.getMetadata(itemView.itemViewType)
	assert(metadata ~= nil, "ListItemViewHost: unknown Recyclable view type")
	
	return p1.createPortal(createElement(compositionPlacementContextModule.Provider, { value = var11 }, {
		Content = reactModule.useMemo(function() --[[ line: 74 ]]
			-- upvalues: metadata (ref), createElement (copy), CommitReadyContent (copy), itemView (ref), itemView (ref)
			return if metadata.readiness == "ReadyOnCommit" then createElement(CommitReadyContent, {
				itemView = itemView,
				signalComponent = metadata.signalComponent
			}) else createElement(metadata.signalComponent, {
				valueSignal = itemView.valueSignal,
				pending = itemView.pending
			})
		end, { itemView, metadata })
	}), var10)
end)