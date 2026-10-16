local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local Axis = ViewRecyclerModule.Axis
local _ = ViewRecyclerModule.Layout
local ItemHooksModule = require(ViewRecyclerReact.ReactAdapter.ItemHooks)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local _ = require(ViewRecyclerReact.ReactAdapter.VirtualList)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)
local CreateElementFunction = ReactModule.createElement

local function createItemViewType(p1) --[[ Line: 57 ]]
	-- upvalues: CreateRecyclableViewModule (copy), ItemHooksModule (copy), SignalsReactModule (copy), ReactModule (copy), CreateElementFunction (copy)
	local Component = p1.component
	
	return CreateRecyclableViewModule(function(p2) --[[ Line: 59 ]]
		-- upvalues: ItemHooksModule (upval), SignalsReactModule (upval), ReactModule (upval), CreateElementFunction (upval), Component (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState((ItemHooksModule.useRecyclingAssignment()))
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(ItemHooksModule.useRecyclingIndex())
		local UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(nil)
		
		if UseSignalStateResult ~= nil then
			UseRefResult.current = UseSignalStateResult
		end
		if UseSignalStateResult1 ~= nil then
			UseRefResult1.current = UseSignalStateResult1
		end
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		
		return if Current == nil or Current1 == nil then nil else CreateElementFunction(Component, {
			item = Current.value,
			index = Current1,
			pending = p2.pending
		})
	end, {
		readiness = p1.readiness,
		hideWhilePending = p1.hideWhilePending
	})
end

return {
	create = function(p1) --[[ Line: 87 ]]
		-- upvalues: createItemViewType (copy), Axis (copy), CreateElementFunction (copy)
		return function(p2) --[[ Line: 88 ]]
			-- upvalues: createItemViewType (upval), Axis (upval), CreateElementFunction (upval), p1 (copy)
			assert(type(p2) == "table", "createVirtualList: definition must be a table")
			local ItemViewType = nil
			
			if p2.itemComponent == nil then
				local ItemComponents = p2.itemComponents
				local GetItemComponentFunction = p2.getItemComponent
				assert(type(ItemComponents) == "table" and #ItemComponents > 0, "createVirtualList: itemComponents must be a non-empty array")
				assert(type(GetItemComponentFunction) == "function", "createVirtualList: getItemComponent must be a function")
				local t = {}
				
				for _, itemComponent in ItemComponents do
					local ComponentFunction = itemComponent.component
					assert(type(ComponentFunction) == "function", "createVirtualList: component must be a React component")
					assert(t[ComponentFunction] == nil, "createVirtualList: each component may be declared only once")
					t[ComponentFunction] = createItemViewType(itemComponent)
				end
				ItemViewType = function(p3, p4) --[[ Line: 120 ]]
					-- upvalues: GetItemComponentFunction (copy), t (copy)
					local Entry = t[GetItemComponentFunction(p3, p4)]
					assert(Entry ~= nil, "createVirtualList: getItemComponent returned an undeclared component")
					
					return Entry
				end
			else
				assert(type(p2.itemComponent) == "function", "createVirtualList: itemComponent must be a React component")
				assert(p2.itemComponents == nil, "createVirtualList: choose one definition form")
				ItemViewType = createItemViewType({
					component = p2.itemComponent,
					readiness = p2.readiness,
					hideWhilePending = p2.hideWhilePending
				})
			end
			return function(Tbl) --[[ Line: 128 | Named "SpecializedVirtualList" ]]
				-- upvalues: Axis (upval), ItemViewType (ref), CreateElementFunction (upval), p1 (upval)
				assert(Tbl.pinnedStartItem == nil and Tbl.pinnedEndItem == nil, "createVirtualList: pinned Items require VirtualList")
				local Copy = table.clone(Tbl)
				Copy.axis = Tbl.axis or Axis.Y
				Copy.itemType = ItemViewType
				
				return CreateElementFunction(p1, Copy)
			end
		end
	end
}