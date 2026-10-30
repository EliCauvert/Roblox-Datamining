local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local ReachedThresholdModule = require(ViewRecycler.Core.ViewportBehavior.ReachedThreshold)
local _ = require(ViewRecycler.Core.Types)
local PaginationEdgesModule = {
	hasStructuralChange = function(p1): boolean
		-- upvalues: DataSourceChangeTypeModule (copy)
		for _, change in p1.changes do
			if change.type ~= DataSourceChangeTypeModule.Update then
				return true
			end
		end
		return false
	end
}
local Validate = if FFlagViewRecyclerReact08 then function(p2)
	-- upvalues: ReachedThresholdModule (copy)
	if p2.startReachedThreshold ~= nil then
		ReachedThresholdModule.validate(p2.startReachedThreshold, "Virtualizer: startReachedThreshold")
	end
end else nil

if FFlagViewRecyclerReact08 then
	function PaginationEdgesModule.create(p2)
		-- upvalues: Validate (ref), ReachedThresholdModule (copy)
		Validate(p2)
		local v1 = p2
		local Flag = true
		local Flag1 = true
		
		return {
			configure = function(p3)
				-- upvalues: Validate (upval), v1 (ref)
				Validate(p3)
				v1 = p3
			end,
			isEnabled = function()
				-- upvalues: v1 (ref)
				return v1.startReachedEnabled or v1.endReachedEnabled
			end,
			check = function(p3, p4)
				-- upvalues: Flag (ref), Flag1 (ref), ReachedThresholdModule (upval), v1 (ref)
				if p4 then
					Flag = true
					Flag1 = true
				end
				local IsScrollOffsetBelow = p3.scrollOffset <= ReachedThresholdModule.resolve(v1.startReachedThreshold, p3.viewportLength, 0)
				local AtEnd = p3.atEnd
				local StartReachedEnabled = IsScrollOffsetBelow and (Flag and v1.startReachedEnabled)
				local EndReachedEnabled = AtEnd and (Flag1 and v1.endReachedEnabled)
				
				if StartReachedEnabled then
					Flag = false
				elseif not IsScrollOffsetBelow then
					Flag = true
				end
				if EndReachedEnabled then
					Flag1 = false
					
					return StartReachedEnabled, EndReachedEnabled
				end
				if not AtEnd then
					Flag1 = true
				end
				return StartReachedEnabled, EndReachedEnabled
			end
		}
	end
else
	function PaginationEdgesModule:create()
		local Flag = true
		local Flag1 = true
		
		return {
			check = function(p2)
				-- upvalues: Flag (ref), Flag1 (ref)
				if p2.rearmAfterStructureChange then
					Flag = true
					Flag1 = true
				end
				local IsScrollOffsetBelow = p2.scrollOffset <= p2.startThreshold
				local AtEnd = p2.atEnd
				local CanReachStart = IsScrollOffsetBelow and (Flag and p2.canReachStart)
				local CanReachEnd = AtEnd and (Flag1 and p2.canReachEnd)
				
				if CanReachStart then
					Flag = false
				elseif not IsScrollOffsetBelow then
					Flag = true
				end
				if CanReachEnd then
					Flag1 = false
				elseif not AtEnd then
					Flag1 = true
				end
				return { startReached = CanReachStart, endReached = CanReachEnd }
			end
		}
	end
end
return PaginationEdgesModule