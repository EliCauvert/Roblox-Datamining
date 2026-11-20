local _ = require(script.Parent.CalloutLayout)
local _ = require(script.Parent.ItemAnchors)
local ItemVisibilityModule = require(script.Parent.ItemVisibility)
local _ = require(script.Parent.PinSeparation)
local ViewportProjectionModule = require(script.Parent.ViewportProjection)

local function _(p1, Part, p2): boolean
	local Covers = p1.covers
	
	return (p1.part == Part or Covers ~= nil and (Covers[Part.Name] == true and Part.Parent == p1.part.Parent)) and (not p1.frontOnly or Part.CFrame:PointToObjectSpace(p2).Z <= 0)
end

local TapTargetsModule = { PIN_HIT_SIZE = 28 }

function TapTargetsModule.isOverPinOrCard(Vector, List, List1): boolean
	-- upvalues: TapTargetsModule (copy)
	for _, Vector1 in List do
		if Vector1.x <= Vector.X and Vector.X <= Vector1.x + Vector1.width and Vector1.y <= Vector.Y and Vector.Y <= Vector1.y + Vector1.height then
			return true
		end
	end
	local PINHITSIZERatio = TapTargetsModule.PIN_HIT_SIZE / 2
	
	for _, value in List1 do
		if value.opacity > 0 and math.abs(Vector.X - value.position.X) <= PINHITSIZERatio and math.abs(Vector.Y - value.position.Y) <= PINHITSIZERatio then
			return true
		end
	end
	return false
end

function TapTargetsModule.findTappedItem(p1, List, p2, p3)
	-- upvalues: ViewportProjectionModule (copy), ItemVisibilityModule (copy)
	local AbsoluteSize = p1.viewportFrame.AbsoluteSize
	
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
		return nil
	end
	local Camera = p1.camera
	local RaycastResult = p1.worldModel:Raycast(Camera.CFrame.Position, ViewportProjectionModule.viewportToRay(Camera.CFrame, Camera.FieldOfView, AbsoluteSize, p2) * 200, (ItemVisibilityModule.visibleCharacterParams(p1.worldModel, p1.character)))
	
	if not RaycastResult then
		return nil
	end
	local Hit = RaycastResult.Instance
	
	local function _(p4): boolean
		-- upvalues: p3 (copy)
		local v1 = if p3 then p3[p4] else nil
		
		return v1 ~= nil and v1.opacity > 0
	end
	
	local ItemId = nil
	local v1 = 0
	
	for _, value in List do
		for _, anchor in value.anchors do
			local Target = anchor.target
			local v2 = 0
			
			if Target == anchor.part or Hit ~= Target and not Hit:IsDescendantOf(Target) then
				if Hit:IsA("BasePart") then
					local Position = RaycastResult.Position
					local Covers = anchor.covers
					local IsPartMatch: boolean = anchor.part == Hit or Covers ~= nil and (Covers[Hit.Name] == true and Hit.Parent == anchor.part.Parent)
					
					if if IsPartMatch then not anchor.frontOnly or Hit.CFrame:PointToObjectSpace(Position).Z <= 0 else false then
						local IsNotHead: boolean = Target:IsA("Accessory") and anchor.part.Name ~= "Head"
						v2 = if IsNotHead then 2 else 1
					end
				end
			else
				v2 = 3
			end
			local IsOpacityAbove = false
			
			if v2 > 0 then
				IsOpacityAbove = false
				
				if v2 == v1 then
					local ItemId1 = value.itemId
					local v3 = if p3 then p3[ItemId1] else nil
					IsOpacityAbove = v3 ~= nil and v3.opacity > 0
					
					if IsOpacityAbove then
						local IsOpacityAbove1 = false
						
						if ItemId ~= nil then
							local v4 = if p3 then p3[ItemId] else nil
							IsOpacityAbove1 = v4 ~= nil and v4.opacity > 0
						end
						IsOpacityAbove = not IsOpacityAbove1
					end
				end
			end
			if v1 < v2 or IsOpacityAbove then
				ItemId = value.itemId
				v1 = v2
			end
		end
	end
	return ItemId
end

return TapTargetsModule