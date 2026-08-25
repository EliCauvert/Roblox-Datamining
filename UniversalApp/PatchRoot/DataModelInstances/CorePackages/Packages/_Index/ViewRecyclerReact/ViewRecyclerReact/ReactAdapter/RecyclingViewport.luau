local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local axis = viewRecyclerModule.Axis
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclingScopeModule = require(viewRecyclerReact.ReactAdapter.RecyclingScope)
local recyclingScopeContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local recyclingViewportContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingViewportContext)
local createElement = reactModule.createElement
local record = viewRecyclerModule.Adapter._Private.Record
local frozen = table.freeze({ "axis", "activationMargin", "retentionMargin" })

local function _(value, p0)
	if value == nil then return end
	if type(value) == "function" then
		value(p0)
		
		return
	end
	value.current = p0
end

return {
	create = function(p1)
		-- upvalues: recyclingScopeModule (ref), reactModule (ref), recyclingScopeContextModule (ref), record (ref), frozen (ref), viewRecyclerRobloxModule (ref), axis (ref), createElement (ref), recyclingViewportContextModule (ref)
		local var8 = recyclingScopeModule.create(p1)
		
		return function(p2)
			-- upvalues: reactModule (copy), recyclingScopeContextModule (copy), record (copy), frozen (copy), viewRecyclerRobloxModule (copy), axis (copy), createElement (copy), recyclingViewportContextModule (copy), var8 (ref)
			local var9 = reactModule.useContext(recyclingScopeContextModule)
			local var10 = reactModule.useState(function()
				-- upvalues: p2 (ref)
				return {
					axis = p2.axis,
					activationMargin = p2.activationMargin,
					retentionMargin = p2.retentionMargin
				}
			end)
			assert(record.containsEqual(p2, var10, frozen), "RecyclingViewport: axis and margins cannot change during its lifetime")
			local var11 = reactModule.useState(function()
				-- upvalues: viewRecyclerRobloxModule (copy), var10 (ref)
				return viewRecyclerRobloxModule.ViewportCoordinator.new(var10)
			end)
			local var12 = reactModule.useState(function()
				-- upvalues: var11 (ref)
				return { register = var11.register }
			end)
			local scrollingFrameRef = p2.scrollingFrameRef
			local var13 = reactModule.useCallback(function(p3)
				-- upvalues: var11 (ref), scrollingFrameRef (ref)
				var11.setViewport(p3)
				
				if scrollingFrameRef == nil then return end
				if type(scrollingFrameRef) == "function" then
					scrollingFrameRef(p3)
					
					return
				end
				scrollingFrameRef.current = p3
			end, { var11, scrollingFrameRef })
			reactModule.useEffect(function()
				-- upvalues: var11 (ref)
				return function()
					-- upvalues: var11 (copy)
					var11.destroy()
				end
			end, { var11 })
			local t = {
				Size = UDim2.fromScale(1, 1),
				ScrollingDirection = if p2.axis == axis.X then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y,
				ref = var13
			}
			
			if p2.scrollingFrameProps ~= nil then
				for i, v in p2.scrollingFrameProps do
					if t[i] ~= nil then
						error(`RecyclingViewport: {tostring(i)} is already used by ViewRecycler`)
					end
					t[i] = v
				end
			end
			local var15 = createElement(recyclingViewportContextModule.Provider, { value = var12 }, {
				Viewport = createElement("ScrollingFrame", t, p2.children)
			})
			
			if var9 == nil then
				return createElement(var8, {
					maxPoolSize = p2.maxPoolSize,
					diagnostics = p2.diagnostics
				}, { Viewport = var15 })
			end
			assert(p2.maxPoolSize == nil and p2.diagnostics == nil, "RecyclingViewport: configure recycling options on the ancestor RecyclingScope")
			
			return var15
		end
	end
}