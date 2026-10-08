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
	local var1 = signalsReactModule.useSignalState(itemView.signal)
	local var2 = if var1 == nil then nil else var1.generation
	local var3 = signalsReactModule.useSignalState(itemView.contentRevision)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), itemView (ref), var3 (ref)
		if var2 ~= nil then
			itemView.commitContent(var2, var3)
		end
	end, { var3, var2, itemView.commitContent })
	
	return nil
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reparentableHost (ref), recyclableViewRegistryModule (ref), createElement (ref), recyclableViewReadinessModule (ref), CommitObserver (ref), recyclableViewContextModule (ref)
	local itemView = p1.itemView
	local signal = itemView.signal
	local var1 = itemView.portalFrame(false)
	assert(var1 ~= nil, "RecyclableViewHost: view host was destroyed before unmount")
	local var2 = reactModule.useState(function()
		-- upvalues: itemView (ref), signal (ref)
		return {
			placement = itemView.compositionPlacement,
			assignmentSignal = signal,
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
	local t = {
		Content = reactModule.useMemo(function()
			-- upvalues: createElement (copy), metadata (ref), itemView (ref)
			return createElement(metadata.signalComponent, {
				itemSignal = itemView.itemSignal,
				pending = itemView.pending
			})
		end, { itemView, metadata })
	}
	
	if metadata.readiness == recyclableViewReadinessModule.ReadyOnCommit then
		t.Observer = createElement(CommitObserver, { itemView = itemView })
	end
	return p1.createPortal(createElement(recyclableViewContextModule.Provider, { value = var2 }, t), var1)
end)