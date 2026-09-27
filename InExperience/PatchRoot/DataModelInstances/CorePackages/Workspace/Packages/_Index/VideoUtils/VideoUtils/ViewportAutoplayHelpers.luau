local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local viewportAutoplayRowSpanAttributeModule = require(videoUtils.ViewportAutoplayRowSpanAttribute)
local viewportAutoplayCellVerticalPaddingAttributeModule = require(videoUtils.ViewportAutoplayCellVerticalPaddingAttribute)
local viewportAutoplayAlignmentTypeAttributeModule = require(videoUtils.ViewportAutoplayAlignmentTypeAttribute)
local alignmentType = require(parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
local t = {
	getTileRowSpan = function(p1)
		-- upvalues: viewportAutoplayRowSpanAttributeModule (ref)
		local var1 = p1:GetAttribute(viewportAutoplayRowSpanAttributeModule)
		
		return if typeof(var1) == "number" and var1 > 0 then math.floor(var1) else 1
	end,
	resolveOneByOneHeight = function(p1, p2)
		-- upvalues: viewportAutoplayCellVerticalPaddingAttributeModule (ref)
		local var1 = p1:GetAttribute(viewportAutoplayCellVerticalPaddingAttributeModule)
		
		return if typeof(var1) == "number" and p2 >= 2 then (p1.AbsoluteSize.Y - var1 * (p2 - 1)) / p2 else nil
	end,
	isTilePinnedLeft = function(p1)
		-- upvalues: viewportAutoplayAlignmentTypeAttributeModule (ref), alignmentType (ref)
		local var1 = p1:GetAttribute(viewportAutoplayAlignmentTypeAttributeModule)
		
		return var1 == alignmentType.LeftPin or (if var1 == alignmentType.RightPin then false else nil)
	end,
	getReadingOrderPositions = function(p1, p2, p3, p4, p5)
		local y = p1.AbsolutePosition.Y
		local y_1 = p1.AbsoluteSize.Y
		
		if p4 <= 1 or p5 == nil then
			return { y + p2 / p3 * y_1 }
		end
		local var1 = (y_1 - p5) / (p4 - 1)
		local var2 = p2 / p3 * p5
		local list = table.create(p4)
		
		for i = 0, p4 - 1 do
			list[i + 1] = y + i * var1 + var2
		end
		return list
	end
}

function t.computeRowAnchorOverrides(p6, p7)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p6 do
		if t.getTileRowSpan(v) == 2 then
			local var3 = t.isTilePinnedLeft(v)
			
			if var3 ~= nil then
				local var4 = t.resolveOneByOneHeight(v, 2)
				
				if var4 ~= nil then
					local v_2
					local var5 = v.AbsoluteSize.Y - var4
					local y = v.AbsolutePosition.Y
					local var6 = y + v.AbsoluteSize.Y
					local var7 = (y + var6) / 2
					local var8 = if var3 then y else var7
					local var9 = if var3 then var7 else var6
					local list = {
						{
							instance = v,
							absoluteX = v.AbsolutePosition.X,
							rowTop = if var3 then y else y + var5,
							naturalOffset = v.AbsolutePosition.X / p7 * var4
						}
					}
					
					for i_1, v_1 in p6 do
						if v_1 ~= v and t.getTileRowSpan(v_1) == 1 then
							v_2 = v_1.AbsolutePosition.Y + v_1.AbsoluteSize.Y / 2
							
							if var8 <= v_2 and v_2 <= var9 then
								table.insert(list, {
									instance = v_1,
									absoluteX = v_1.AbsolutePosition.X,
									rowTop = v_1.AbsolutePosition.Y,
									naturalOffset = v_1.AbsolutePosition.X / p7 * v_1.AbsoluteSize.Y
								})
							end
						end
					end
					table.sort(list, function(p8, p9)
						return p8.absoluteX < p9.absoluteX
					end)
					local listCount = #list
					
					for v_1, v_2 in list do
						t_1[v_2.instance] = v_2.rowTop + list[if var3 then (v_1 - 2) % listCount + 1 else v_1 % listCount + 1].naturalOffset
					end
				end
			end
		end
	end
	return t_1
end

return t