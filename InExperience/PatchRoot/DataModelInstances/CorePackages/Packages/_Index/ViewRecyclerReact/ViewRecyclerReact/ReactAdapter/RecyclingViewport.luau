local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local ViewRecyclerRobloxModule = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local Axis = ViewRecyclerModule.Axis
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.RecyclingScope)
local RecyclingScopeContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local RecyclingViewportContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingViewportContext)
local CreateElementFunction = ReactModule.createElement
local ShallowTable = ViewRecyclerModule.Adapter._Private.ShallowTable
local Frozen = table.freeze({ "axis", "activationMargin", "retentionMargin" })

local function _(Callback: (any) -> (), Current)
	if Callback == nil then return end
	if type(Callback) == "function" then
		Callback(Current)
		
		return
	else
		Callback.current = Current
	end
end

return {
	create = function(p1)
		-- upvalues: RecyclingScopeModule (copy), FFlagViewRecyclerReact08 (copy), ReactModule (copy), RecyclingScopeContextModule (copy), ShallowTable (copy), Frozen (copy), ViewRecyclerRobloxModule (copy), Axis (copy), CreateElementFunction (copy), RecyclingViewportContextModule (copy)
		local NewRecyclingScope = RecyclingScopeModule.create(p1)
		
		return function(p2)
			-- upvalues: FFlagViewRecyclerReact08 (upval), ReactModule (upval), RecyclingScopeContextModule (upval), ShallowTable (upval), Frozen (upval), ViewRecyclerRobloxModule (upval), Axis (upval), CreateElementFunction (upval), RecyclingViewportContextModule (upval), NewRecyclingScope (copy)
			local UseContextResult = if FFlagViewRecyclerReact08 then nil else ReactModule.useContext(RecyclingScopeContextModule)
			local UseStateResult = ReactModule.useState(function()
				-- upvalues: p2 (copy)
				return {
					axis = p2.axis,
					activationMargin = p2.activationMargin,
					retentionMargin = p2.retentionMargin
				}
			end)
			assert(ShallowTable.containsEqual(p2, UseStateResult, Frozen), "RecyclingViewport: axis and margins cannot change during its lifetime")
			local UseStateResult1 = ReactModule.useState(function()
				-- upvalues: ViewRecyclerRobloxModule (upval), UseStateResult (copy)
				return ViewRecyclerRobloxModule.ViewportCoordinator.new(UseStateResult)
			end)
			local UseStateResult2 = ReactModule.useState(function()
				-- upvalues: UseStateResult1 (copy)
				return { register = UseStateResult1.register }
			end)
			local ScrollingFrameRefFunction = p2.scrollingFrameRef
			local UseResult = ReactModule.useCallback(function(Current)
				-- upvalues: UseStateResult1 (copy), ScrollingFrameRefFunction (copy)
				UseStateResult1.setViewport(Current)
				
				if ScrollingFrameRefFunction == nil then return end
				if type(ScrollingFrameRefFunction) == "function" then
					ScrollingFrameRefFunction(Current)
					
					return
				else
					ScrollingFrameRefFunction.current = Current
				end
			end, { UseStateResult1, ScrollingFrameRefFunction })
			ReactModule.useEffect(function()
				-- upvalues: UseStateResult1 (copy)
				return function()
					-- upvalues: UseStateResult1 (upval)
					UseStateResult1.destroy()
				end
			end, { UseStateResult1 })
			local config = {
				Size = UDim2.fromScale(1, 1),
				ScrollingDirection = if p2.axis == Axis.X then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y,
				ref = UseResult
			}
			
			if p2.scrollingFrameProps ~= nil then
				for i, scrollingFrameProp in p2.scrollingFrameProps do
					if config[i] ~= nil then
						error(`RecyclingViewport: {tostring(i)} is already used by ViewRecycler`)
					end
					config[i] = scrollingFrameProp
				end
			end
			local Element = CreateElementFunction(RecyclingViewportContextModule.Provider, { value = UseStateResult2 }, {
				Viewport = CreateElementFunction("ScrollingFrame", config, p2.children)
			})
			
			if FFlagViewRecyclerReact08 or UseContextResult == nil then
				return CreateElementFunction(NewRecyclingScope, {
					maxPoolSize = p2.maxPoolSize,
					diagnostics = p2.diagnostics
				}, { Viewport = Element })
			else
				assert(p2.maxPoolSize == nil and p2.diagnostics == nil, "RecyclingViewport: configure recycling options on the ancestor RecyclingScope")
				
				return Element
			end
		end
	end
}