local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ViewportAutoplayRowSpanAttributeModule = require(VideoUtils.ViewportAutoplayRowSpanAttribute)
local ViewportAutoplayCellVerticalPaddingAttributeModule = require(VideoUtils.ViewportAutoplayCellVerticalPaddingAttribute)
local ViewportAutoplayAlignmentTypeAttributeModule = require(VideoUtils.ViewportAutoplayAlignmentTypeAttribute)
local ViewportAutoplayColSpanAttributeModule = require(VideoUtils.ViewportAutoplayColSpanAttribute)
local ViewportAutoplayCellHorizontalPaddingAttributeModule = require(VideoUtils.ViewportAutoplayCellHorizontalPaddingAttribute)
local ViewportAutoplayGridCellTagModule = require(VideoUtils.ViewportAutoplayGridCellTag)
local ReadingOrderPositionModule = require(VideoUtils.ReadingOrderPosition)
local AlignmentType = require(Parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
local FFlagLuaAppSduiSearchResultsVideoPreview = require(Parent.SharedFlags).FFlagLuaAppSduiSearchResultsVideoPreview
local ViewportAutoplayHelpersModule = {
	getTileRowSpan = function(Frame): number
		-- upvalues: ViewportAutoplayRowSpanAttributeModule (copy)
		local Attribute: number = Frame:GetAttribute(ViewportAutoplayRowSpanAttributeModule)
		
		return if typeof(Attribute) == "number" and Attribute > 0 then math.floor(Attribute) else 1
	end,
	resolveOneByOneHeight = function(Frame, p1: number)
		-- upvalues: ViewportAutoplayCellVerticalPaddingAttributeModule (copy)
		local Attribute = Frame:GetAttribute(ViewportAutoplayCellVerticalPaddingAttributeModule)
		
		return if typeof(Attribute) == "number" and p1 >= 2 then (Frame.AbsoluteSize.Y - Attribute * (p1 - 1)) / p1 else nil
	end,
	isTilePinnedLeft = function(Frame)
		-- upvalues: ViewportAutoplayAlignmentTypeAttributeModule (copy), AlignmentType (copy)
		local Attribute = Frame:GetAttribute(ViewportAutoplayAlignmentTypeAttributeModule)
		
		return Attribute == AlignmentType.LeftPin or Attribute ~= AlignmentType.RightPin and nil
	end,
	getReadingOrderPositions = function(Frame: Frame, p1, p2, p3: number, p4)
		-- upvalues: FFlagLuaAppSduiSearchResultsVideoPreview (copy), ReadingOrderPositionModule (copy)
		local Y = Frame.AbsolutePosition.Y
		local Y1 = Frame.AbsoluteSize.Y
		
		if p3 <= 1 or p4 == nil then
			return {
				if FFlagLuaAppSduiSearchResultsVideoPreview then ReadingOrderPositionModule.get(Y, p1, Y1, p2) else Y + p1 / p2 * Y1
			}
		end
		local YRatio = (Y1 - p4) / (p3 - 1)
		local Offset = if FFlagLuaAppSduiSearchResultsVideoPreview then ReadingOrderPositionModule.getOffset(p1, p4, p2) else p1 / p2 * p4
		local Buffer = table.create(p3)
		
		for i = 0, p3 - 1 do
			Buffer[i + 1] = Y + i * YRatio + Offset
		end
		return Buffer
	end,
	findGridCell = function(Gui, Gui1)
		-- upvalues: ViewportAutoplayGridCellTagModule (copy)
		local Gui2 = Gui
		while Gui2 and Gui2 ~= Gui1 do
			if Gui2:IsA("GuiObject") and Gui2:HasTag(ViewportAutoplayGridCellTagModule) then
				return Gui2
			end
			Gui2 = Gui2.Parent
		end
		return nil
	end,
	getTopRowReadingOrderPositions = function(Frame: Frame, p5)
		-- upvalues: ViewportAutoplayColSpanAttributeModule (copy), ViewportAutoplayCellHorizontalPaddingAttributeModule (copy), ReadingOrderPositionModule (copy)
		local Attribute: number = Frame:GetAttribute(ViewportAutoplayColSpanAttributeModule)
		local Attribute1 = Frame:GetAttribute(ViewportAutoplayCellHorizontalPaddingAttributeModule)
		
		if typeof(Attribute) ~= "number" or Attribute < 2 or typeof(Attribute1) ~= "number" then
			return nil
		end
		local Floored = math.floor(Attribute)
		local Y = Frame.AbsoluteSize.Y
		local NewX = Frame.AbsoluteSize.X + Attribute1
		local Y1 = Frame.AbsolutePosition.Y
		local Buffer = table.create(Floored)
		
		for i = 0, Floored - 1 do
			local NewX1 = Frame.AbsolutePosition.X + i * NewX
			Buffer[i + 1] = {
				absoluteX = NewX1,
				readingOrderPosition = ReadingOrderPositionModule.get(Y1, NewX1, Y, p5)
			}
		end
		return Buffer
	end
}

function ViewportAutoplayHelpersModule.computeRowAnchorOverrides(Frames, p6)
	-- upvalues: ViewportAutoplayHelpersModule (copy), FFlagLuaAppSduiSearchResultsVideoPreview (copy), ReadingOrderPositionModule (copy)
	local NewRowTops = {}
	
	for _, frame in Frames do
		if ViewportAutoplayHelpersModule.getTileRowSpan(frame) == 2 then
			local IsTilePinnedLeft = ViewportAutoplayHelpersModule.isTilePinnedLeft(frame)
			local NoIsTilePinnedLeft = IsTilePinnedLeft == nil
			local ResolveOneByOneHeightResult = nil
			
			if not NoIsTilePinnedLeft then
				ResolveOneByOneHeightResult = ViewportAutoplayHelpersModule.resolveOneByOneHeight(frame, 2)
				NoIsTilePinnedLeft = ResolveOneByOneHeightResult == nil
			end
			if not NoIsTilePinnedLeft then
				local YDelta = frame.AbsoluteSize.Y - ResolveOneByOneHeightResult
				local Y = frame.AbsolutePosition.Y
				local NewY = Y + frame.AbsoluteSize.Y
				local YRatio = (Y + NewY) / 2
				local Y1 = if IsTilePinnedLeft then Y else YRatio
				local YRatio1 = if IsTilePinnedLeft then YRatio else NewY
				local List = {
					{
						instance = frame,
						absoluteX = frame.AbsolutePosition.X,
						rowTop = if IsTilePinnedLeft then Y else Y + YDelta,
						naturalOffset = if FFlagLuaAppSduiSearchResultsVideoPreview then ReadingOrderPositionModule.getOffset(frame.AbsolutePosition.X, ResolveOneByOneHeightResult, p6) else frame.AbsolutePosition.X / p6 * ResolveOneByOneHeightResult
					}
				}
				
				for _, frame1 in Frames do
					if frame1 ~= frame and ViewportAutoplayHelpersModule.getTileRowSpan(frame1) == 1 then
						local NewY1 = frame1.AbsolutePosition.Y + frame1.AbsoluteSize.Y / 2
						
						if Y1 <= NewY1 and NewY1 <= YRatio1 then
							table.insert(List, {
								instance = frame1,
								absoluteX = frame1.AbsolutePosition.X,
								rowTop = frame1.AbsolutePosition.Y,
								naturalOffset = if FFlagLuaAppSduiSearchResultsVideoPreview then ReadingOrderPositionModule.getOffset(frame1.AbsolutePosition.X, frame1.AbsoluteSize.Y, p6) else frame1.AbsolutePosition.X / p6 * frame1.AbsoluteSize.Y
							})
						end
					end
				end
				table.sort(List, function(A, B): boolean
					return A.absoluteX < B.absoluteX
				end)
				local CountList = #List
				
				for i, value in List do
					NewRowTops[value.instance] = value.rowTop + List[if IsTilePinnedLeft then (i - 2) % CountList + 1 else i % CountList + 1].naturalOffset
				end
			end
		end
	end
	return NewRowTops
end

return ViewportAutoplayHelpersModule