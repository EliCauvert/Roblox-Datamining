local _ = require(script:FindFirstAncestor("ViewRecyclerReact").Parent.ViewRecycler)
local DestinationModule = require(script.Parent.Destination)
local PlacementModule = require(script.Parent.Placement)
local _ = require(script.Parent.RecyclableView)
local _ = require(script.Parent.RecyclableViewRegistry)
local Count = 1

return {
	new = function(p1, Callback)
		-- upvalues: Count (ref), PlacementModule (copy), DestinationModule (copy)
		local Count1: number = Count
		Count += 1
		local NewPlacement = PlacementModule.new(p1, { name = "RectPlacement", namespace = `rect:{Count1}` })
		local RectPlacement = {}
		local Frozen = nil
		
		return {
			sync = function(List)
				-- upvalues: Callback (copy), Frozen (ref), NewPlacement (copy), DestinationModule (upval), RectPlacement (copy)
				local Current = Callback().current
				assert(Current ~= nil, "RectPlacement: cannot sync without a container")
				
				if Frozen == nil or Frozen.container ~= Current then
					if Frozen ~= nil and NewPlacement.hasDestroyedView() then
						NewPlacement.releaseAll()
					end
					Frozen = table.freeze({
						kind = DestinationModule.Kind.Rect,
						rectPlacement = RectPlacement,
						container = Current
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
			releaseAll = NewPlacement.releaseAll
		}
	end
}