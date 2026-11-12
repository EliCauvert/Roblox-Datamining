local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local DestinationModule = require(script.Parent.Destination)
local PlacementModule = require(script.Parent.Placement)
local _ = require(script.Parent.RecyclableView)
local _ = require(script.Parent.RecyclableViewRegistry)
local VacantHosts = if FFlagViewRecyclerReact084 then require(ViewRecyclerReact.Parent.ViewRecyclerRoblox).Internal.VacantHosts else nil
local Count = 1

return {
	new = function(p1, Callback)
		-- upvalues: Count (ref), PlacementModule (copy), FFlagViewRecyclerReact084 (copy), VacantHosts (ref), DestinationModule (copy)
		local Count1: number = Count
		Count += 1
		local NewPlacement = PlacementModule.new(p1, { name = "RectPlacement", namespace = `rect:{Count1}` })
		local RectPlacement = {}
		local Frozen = nil
		local ForScopeResult = nil
		local Callback1: (() -> ())? = nil
		
		if FFlagViewRecyclerReact084 then
			ForScopeResult = VacantHosts.forScope(p1)
			
			Callback1 = function()
				-- upvalues: Frozen (ref), ForScopeResult (ref)
				local Frozen1 = Frozen
				
				if Frozen1 ~= nil then
					ForScopeResult.evacuate(function(Container): boolean
						-- upvalues: Frozen1 (copy)
						return Container == Frozen1.container
					end)
				end
			end
		end
		return {
			sync = function(List)
				-- upvalues: Callback (copy), Frozen (ref), NewPlacement (copy), FFlagViewRecyclerReact084 (upval), Callback1 (ref), DestinationModule (upval), RectPlacement (copy), ForScopeResult (ref)
				local Current = Callback().current
				assert(Current ~= nil, "RectPlacement: cannot sync without a container")
				
				if Frozen == nil or Frozen.container ~= Current then
					if Frozen ~= nil and NewPlacement.hasDestroyedView() then
						NewPlacement.releaseAll()
					end
					if FFlagViewRecyclerReact084 then
						Callback1()
					end
					Frozen = table.freeze({
						kind = DestinationModule.Kind.Rect,
						rectPlacement = RectPlacement,
						container = Current,
						vacantHosts = if FFlagViewRecyclerReact084 then ForScopeResult else nil
					})
				end
				local Buffer = table.create(#List)
				
				for i, value in List do
					assert(typeof(value.position) == "Vector2", "RectPlacement: slot position must be a Vector2")
					assert(typeof(value.size) == "Vector2", "RectPlacement: slot size must be a Vector2")
					Buffer[i] = {
						key = value.key,
						viewType = value.viewType,
						value = value.item,
						destination = Frozen,
						geometry = {
							position = value.position,
							size = value.size,
							zIndex = value.zIndex or 1
						}
					}
				end
				NewPlacement.sync(Buffer)
			end,
			releaseAll = if FFlagViewRecyclerReact084 then function()
				-- upvalues: NewPlacement (copy), Callback1 (ref)
				NewPlacement.releaseAll()
				Callback1()
			end else NewPlacement.releaseAll
		}
	end
}