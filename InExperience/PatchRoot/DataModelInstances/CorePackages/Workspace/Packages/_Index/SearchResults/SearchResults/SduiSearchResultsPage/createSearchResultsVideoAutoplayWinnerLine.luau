local CollectionService = game:GetService("CollectionService")
local Parent = script:FindFirstAncestor("SearchResults").Parent
local VideoUtilsModule = require(Parent.VideoUtils)
local ReadingOrderPosition = VideoUtilsModule.ReadingOrderPosition
local ViewportAutoplayAnchorTileTag = VideoUtilsModule.ViewportAutoplayAnchorTileTag
local FIntLuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx = require(Parent.SharedFlags).FIntLuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx
local LuaAppVideoAutoplayWinnerLineTieMarginTenthsPxRatio = game:DefineFastInt("LuaAppVideoAutoplayWinnerLineTieMarginTenthsPx", 5) / 10

local function getFirstTwoAnchors(ScrollingFrame, Largest)
	-- upvalues: CollectionService (copy), ViewportAutoplayAnchorTileTag (copy), ReadingOrderPosition (copy)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	
	for _, Frame in CollectionService:GetTagged(ViewportAutoplayAnchorTileTag) do
		if Frame:IsA("GuiObject") and Frame:IsDescendantOf(ScrollingFrame) then
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			
			if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
				local GetResult = ReadingOrderPosition.get(AbsolutePosition.Y, AbsolutePosition.X, AbsoluteSize.Y, Largest)
				
				if v2 == nil or GetResult < v2 then
					v3 = v1
					v4 = v2
					v1 = Frame
					v2 = GetResult
				elseif v4 == nil or GetResult < v4 then
					v3 = Frame
					v4 = GetResult
				end
			end
		end
	end
	return v1, v2, v3, v4
end

return function()
	-- upvalues: getFirstTwoAnchors (copy), LuaAppVideoAutoplayWinnerLineTieMarginTenthsPxRatio (copy), FIntLuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (copy)
	local Largest = nil
	local Object = nil
	local Object1 = nil
	local v5 = nil
	
	return function(p1, ScrollingFrame)
		-- upvalues: Largest (ref), v5 (ref), Object (ref), Object1 (ref), getFirstTwoAnchors (upval), LuaAppVideoAutoplayWinnerLineTieMarginTenthsPxRatio (upval), FIntLuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx (upval)
		local Largest1 = math.max(p1.max.X - p1.min.X, 1)
		
		if not ScrollingFrame:IsA("ScrollingFrame") or ScrollingFrame.CanvasPosition.Y ~= 0 then
			return if Largest1 == Largest and v5 ~= nil and Object ~= nil and Object:IsDescendantOf(ScrollingFrame) and (Object1 == nil or Object1:IsDescendantOf(ScrollingFrame)) then v5 - p1.min.Y else nil
		end
		Largest = nil
		Object = nil
		Object1 = nil
		v5 = nil
		local FirstTwoAnchors, FirstTwoAnchors2, FirstTwoAnchors3, FirstTwoAnchors4 = getFirstTwoAnchors(ScrollingFrame, Largest1)
		
		if FirstTwoAnchors == nil or FirstTwoAnchors2 == nil then
			return nil
		end
		local Smallest = if FirstTwoAnchors3 == nil or FirstTwoAnchors4 == nil or FirstTwoAnchors.Parent ~= FirstTwoAnchors3.Parent then math.min(FirstTwoAnchors.AbsolutePosition.Y + FirstTwoAnchors.AbsoluteSize.Y / 2, p1.min.Y + FIntLuaAppVideoAutoplayWinnerLineOffsetFromTopBarPx) else (FirstTwoAnchors2 + FirstTwoAnchors4) / 2 - LuaAppVideoAutoplayWinnerLineTieMarginTenthsPxRatio
		
		if p1.max.Y < Smallest then
			return nil
		else
			Largest = Largest1
			Object = FirstTwoAnchors
			Object1 = FirstTwoAnchors3
			v5 = Smallest
			
			return Smallest - p1.min.Y
		end
	end
end