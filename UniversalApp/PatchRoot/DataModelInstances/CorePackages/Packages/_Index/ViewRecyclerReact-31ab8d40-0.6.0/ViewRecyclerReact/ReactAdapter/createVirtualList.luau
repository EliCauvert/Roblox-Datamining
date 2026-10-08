local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local axis = viewRecyclerModule.Axis
local _ = viewRecyclerModule.Layout
local itemHooksModule = require(viewRecyclerReact.ReactAdapter.ItemHooks)
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local _ = require(viewRecyclerReact.ReactAdapter.VirtualList)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)
local createElement = reactModule.createElement

local function createItemViewType(p1)
	-- upvalues: createRecyclableViewModule (ref), itemHooksModule (ref), signalsReactModule (ref), reactModule (ref), createElement (ref)
	local component = p1.component
	
	return createRecyclableViewModule(function(p2)
		-- upvalues: itemHooksModule (copy), signalsReactModule (copy), reactModule (copy), createElement (copy), component (ref)
		local var1 = signalsReactModule.useSignalState(itemHooksModule.useRecyclingAssignment())
		local var2 = signalsReactModule.useSignalState(itemHooksModule.useRecyclingIndex())
		local var3 = reactModule.useRef(nil)
		local var4 = reactModule.useRef(nil)
		
		if var1 ~= nil then
			var3.current = var1
		end
		if var2 ~= nil then
			var4.current = var2
		end
		local current = var3.current
		local current_1 = var4.current
		
		return if current == nil or current_1 == nil then nil else createElement(component, {
			item = current.value,
			index = current_1,
			pending = p2.pending
		})
	end, {
		readiness = p1.readiness,
		hideWhilePending = p1.hideWhilePending
	})
end

return {
	create = function(p1)
		-- upvalues: createItemViewType (ref), axis (ref), createElement (ref)
		return function(p2)
			-- upvalues: createItemViewType (copy), axis (copy), createElement (copy), p1 (ref)
			assert(type(p2) == "table", "createVirtualList: definition must be a table")
			local _ = nil
			
			if p2.itemComponent == nil then
				local itemComponents = p2.itemComponents
				local getItemComponent = p2.getItemComponent
				assert(type(itemComponents) == "table" and #itemComponents > 0, "createVirtualList: itemComponents must be a non-empty array")
				assert(type(getItemComponent) == "function", "createVirtualList: getItemComponent must be a function")
				local t = {}
				
				for i, v in itemComponents do
					local component = v.component
					assert(type(component) == "function", "createVirtualList: component must be a React component")
					assert(t[component] == nil, "createVirtualList: each component may be declared only once")
					t[component] = createItemViewType(v)
				end
				local var1 = function(p3, p4)
					-- upvalues: getItemComponent (ref), t (ref)
					local var2 = t[getItemComponent(p3, p4)]
					assert(var2 ~= nil, "createVirtualList: getItemComponent returned an undeclared component")
					
					return var2
				end
			else
				assert(type(p2.itemComponent) == "function", "createVirtualList: itemComponent must be a React component")
				assert(p2.itemComponents == nil, "createVirtualList: choose one definition form")
				local var1 = createItemViewType({
					component = p2.itemComponent,
					readiness = p2.readiness,
					hideWhilePending = p2.hideWhilePending
				})
			end
			return function(p3)
				-- upvalues: axis (copy), var1 (write), createElement (copy), p1 (copy)
				assert(p3.pinnedStartItem == nil and p3.pinnedEndItem == nil, "createVirtualList: pinned Items require VirtualList")
				local cloned = table.clone(p3)
				cloned.axis = p3.axis or axis.Y
				cloned.itemType = var1
				
				return createElement(p1, cloned)
			end
		end
	end
}