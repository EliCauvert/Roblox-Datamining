local EasingModule = require(script.Parent.Easing)
local _ = require(script.Parent.ItemAnchors)
local ViewportProjectionModule = require(script.Parent.ViewportProjection)
local ItemVisibilityModule = {
	anchorPosition = function(p1)
		return p1.part.CFrame:PointToWorldSpace(p1.offset)
	end,
	facingWeight = function(p1, CF, Position, AnchorPositionResult)
		-- upvalues: EasingModule (copy)
		local Normal = p1.normal
		
		return if Normal then EasingModule.smoothstep(math.cos((math.rad(p1.zeroDegrees))), math.cos((math.rad(p1.fullDegrees))), (CF:VectorToWorldSpace(Normal):Dot((Position - AnchorPositionResult).Unit))) * p1.weight else p1.weight
	end
}

function ItemVisibilityModule.evaluate(List, p1, Callback)
	-- upvalues: ItemVisibilityModule (copy), ViewportProjectionModule (copy)
	local Position = p1.cameraCFrame.Position
	local List1 = {}
	
	for _, value in List do
		local v1 = nil
		
		for _, anchor in value.anchors do
			local AnchorPositionResult = ItemVisibilityModule.anchorPosition(anchor)
			local FacingWeightResult: number = ItemVisibilityModule.facingWeight(anchor, p1.rootCFrame, Position, AnchorPositionResult)
			local WorldToViewportResult, WorldToViewportResult2 = ViewportProjectionModule.worldToViewport(p1.cameraCFrame, p1.fieldOfView, p1.viewportSize, AnchorPositionResult)
			local CallbackResult = FacingWeightResult > 0 and WorldToViewportResult2 > 0 and (ViewportProjectionModule.isInsideViewport(WorldToViewportResult, p1.viewportSize, -4) and Callback(Position, AnchorPositionResult, anchor))
			local FacingWeightResult1: number = if CallbackResult then FacingWeightResult else 0
			
			if v1 == nil or v1.weight < FacingWeightResult1 then
				v1 = {
					itemId = value.itemId,
					position = WorldToViewportResult,
					facing = FacingWeightResult,
					weight = FacingWeightResult1
				}
			end
		end
		if v1 then
			table.insert(List1, v1)
		end
	end
	return List1
end

function ItemVisibilityModule.visibleCharacterParams(World, Object)
	local List = {}
	
	for _, child in World:GetChildren() do
		if child ~= Object then
			table.insert(List, child)
		end
	end
	for _, Part in Object:GetDescendants() do
		if Part:IsA("BasePart") and Part.Transparency >= 1 then
			table.insert(List, Part)
		end
	end
	local RaycastParams1 = RaycastParams.new()
	RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams1.FilterDescendantsInstances = List
	
	return RaycastParams1
end

function ItemVisibilityModule.createRaycastCheck(World, p2)
	-- upvalues: ItemVisibilityModule (copy)
	local VisibleCharacterParamsResult = ItemVisibilityModule.visibleCharacterParams(World, p2)
	
	return function(Origin, p3, p4): boolean
		-- upvalues: World (copy), VisibleCharacterParamsResult (copy)
		local Offset = p3 - Origin
		local RaycastResult = World:Raycast(Origin, Offset * 1.02, VisibleCharacterParamsResult)
		
		return RaycastResult == nil or (if RaycastResult.Instance == p4.target or RaycastResult.Instance:IsDescendantOf(p4.target) then true else Offset.Magnitude - 0.08 <= RaycastResult.Distance)
	end
end

return ItemVisibilityModule