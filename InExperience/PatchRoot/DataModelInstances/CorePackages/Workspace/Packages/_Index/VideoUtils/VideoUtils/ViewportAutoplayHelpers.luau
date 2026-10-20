local VideoUtils = script:FindFirstAncestor("VideoUtils")
local ViewportAutoplayRowSpanAttributeModule = require(VideoUtils.ViewportAutoplayRowSpanAttribute)
local ViewportAutoplayCellVerticalPaddingAttributeModule = require(VideoUtils.ViewportAutoplayCellVerticalPaddingAttribute)
local ViewportAutoplayAlignmentTypeAttributeModule = require(VideoUtils.ViewportAutoplayAlignmentTypeAttribute)
local AlignmentType = require(VideoUtils.Parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
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
		local Y = Frame.AbsolutePosition.Y
		local Y1 = Frame.AbsoluteSize.Y
		
		if p3 <= 1 or p4 == nil then
			return { Y + p1 / p2 * Y1 }
		end
		local YRatio = (Y1 - p4) / (p3 - 1)
		local v1 = p1 / p2 * p4
		local Buffer = table.create(p3)
		
		for i = 0, p3 - 1 do
			Buffer[i + 1] = Y + i * YRatio + v1
		end
		return Buffer
	end
}

function ViewportAutoplayHelpersModule.computeRowAnchorOverrides(Frames, p5)
	-- upvalues: ViewportAutoplayHelpersModule (copy)
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
						naturalOffset = frame.AbsolutePosition.X / p5 * ResolveOneByOneHeightResult
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
								naturalOffset = frame1.AbsolutePosition.X / p5 * frame1.AbsoluteSize.Y
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