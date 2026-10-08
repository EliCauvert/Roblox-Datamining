local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local recyclableViewReadinessModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local reparentableHost = viewRecyclerRobloxModule.ReparentableHost
local _ = require(viewRecyclerReact.ReactAdapter.Private.RecyclableView)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local createElement = reactModule.createElement

local function CommitObserver(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local itemView = p1.itemView
	local var1 = signalsReactModule.useSignalState(itemView.contentRevision)
	reactModule.useLayoutEffect(function()
		-- upvalues: itemView (ref), var1 (ref)
		itemView.commitContent(var1)
	end, { var1, itemView.commitContent })
	
	return nil
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reparentableHost (ref), recyclableViewRegistryModule (ref), createElement (ref), signalsReactModule (ref), recyclableViewReadinessModule (ref), CommitObserver (ref), recyclableViewContextModule (ref)
	local itemView = p1.itemView
	local signal = itemView.signal
	local var1 = itemView.portalFrame(false)
	assert(var1 ~= nil, "RecyclableViewHost: view host was destroyed before unmount")
	local var2 = reactModule.useState(function()
		-- upvalues: itemView (ref), signal (ref)
		return {
			placement = itemView.compositionPlacement,
			assignmentSignal = signal,
			indexSignal = itemView.indexSignal,
			itemSignal = itemView.itemSignal,
			itemKeySignal = itemView.itemKeySignal
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
	assert(metadata ~= nil, "RecyclableViewHost: unknown Recyclable view type")
	local var3 = reactModule.useMemo(function()
		-- upvalues: createElement (copy), metadata (ref), itemView (ref)
		return createElement(metadata.signalComponent, {
			itemSignal = itemView.itemSignal,
			pending = itemView.pending
		})
	end, { itemView, metadata })
	local var4 = signalsReactModule.useSignalState(itemView.hasItem)
	reactModule.useLayoutEffect(function()
		-- upvalues: var4 (ref), itemView (ref)
		if var4 then
			itemView.setContentMounted(true)
			
			return function()
				-- upvalues: itemView (copy)
				itemView.setContentMounted(false)
			end
		end
		return nil
	end, { var4, itemView })
	local t = {}
	
	if var4 then
		t.Content = var3
	end
	if var4 and metadata.readiness == recyclableViewReadinessModule.ReadyOnCommit then
		t.Observer = createElement(CommitObserver, { itemView = itemView })
	end
	return p1.createPortal(createElement(recyclableViewContextModule.Provider, { value = var2 }, t), var1)
end)