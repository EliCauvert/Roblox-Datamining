local Workspace = game:GetService("Workspace")
local _ = require(script.Parent.Types)
local CarouselMinVisibleFraction = require(script.Parent.AnimationAutoplayTuning).carouselMinVisibleFraction

local function getVisibleSize(p1, List)
	local Left = p1.left
	local Top = p1.top
	local Right = p1.right
	local Bottom = p1.bottom
	
	for _, value in List do
		Left = math.max(Left, value.left)
		Top = math.max(Top, value.top)
		Right = math.min(Right, value.right)
		Bottom = math.min(Bottom, value.bottom)
	end
	return Right - Left, Bottom - Top
end

local function _(Vector, Vector1)
	return {
		left = Vector.X,
		top = Vector.Y,
		right = Vector.X + Vector1.X,
		bottom = Vector.Y + Vector1.Y
	}
end

local function inspect(Frame)
	local List = {}
	local v1 = nil
	local v2 = nil
	local Object = Frame
	while Object do
		if Object:IsA("GuiObject") then
			local Frame1 = Object
			
			if not Frame1.Visible then
				return false, List, nil, nil
			end
			if Object ~= Frame then
				if Object:IsA("ScrollingFrame") then
					local ScrollFrame = Object
					local AbsolutePosition = ScrollFrame.AbsolutePosition
					local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
					table.insert(List, {
						left = AbsolutePosition.X,
						top = AbsolutePosition.Y,
						right = AbsolutePosition.X + AbsoluteWindowSize.X,
						bottom = AbsolutePosition.Y + AbsoluteWindowSize.Y
					})
					local ScrollingDirection = ScrollFrame.ScrollingDirection
					local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
					local AbsoluteWindowSize1 = ScrollFrame.AbsoluteWindowSize
					
					if v1 == nil and ScrollingDirection ~= Enum.ScrollingDirection.X and AbsoluteWindowSize1.Y + 1 < AbsoluteCanvasSize.Y then
						v1 = ScrollFrame
					end
					if v2 == nil and ScrollingDirection ~= Enum.ScrollingDirection.Y and AbsoluteWindowSize1.X + 1 < AbsoluteCanvasSize.X then
						v2 = ScrollFrame
					end
				elseif Frame1.ClipsDescendants then
					local AbsolutePosition = Frame1.AbsolutePosition
					local AbsoluteSize = Frame1.AbsoluteSize
					table.insert(List, {
						left = AbsolutePosition.X,
						top = AbsolutePosition.Y,
						right = AbsolutePosition.X + AbsoluteSize.X,
						bottom = AbsolutePosition.Y + AbsoluteSize.Y
					})
				end
			end
		elseif Object:IsA("LayerCollector") and not Object.Enabled then
			return false, List, nil, nil
		end
		Object = Object.Parent
	end
	return true, List, v1, v2
end

return {
	measureAnimationTiles = function(Frames)
		-- upvalues: Workspace (copy), getVisibleSize (copy), CarouselMinVisibleFraction (copy), inspect (copy)
		local CurrentCamera = Workspace.CurrentCamera
		local ViewportSize = if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(1920, 1080)
		local config = {
			left = 0,
			top = 0,
			right = ViewportSize.X,
			bottom = ViewportSize.Y
		}
		local t = {}
		local Count = 0
		
		local function _(Key)
			-- upvalues: t (copy), Count (ref)
			local Entry = t[Key]
			
			if Entry == nil then
				Count += 1
				Entry = Count
				t[Key] = Entry
			end
			return Entry
		end
		
		local List = {}
		
		for Key, frame in Frames do
			local AbsoluteSize = frame.AbsoluteSize
			local NoParent: boolean = frame.Parent == nil or AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0
			local AbsolutePosition = nil
			
			if not NoParent then
				AbsolutePosition = frame.AbsolutePosition
				local VisibleSize, VisibleSize2 = getVisibleSize({
					left = AbsolutePosition.X,
					top = AbsolutePosition.Y,
					right = AbsolutePosition.X + AbsoluteSize.X,
					bottom = AbsolutePosition.Y + AbsoluteSize.Y
				}, { config })
				NoParent = VisibleSize2 <= 0 or VisibleSize < AbsoluteSize.X * CarouselMinVisibleFraction
			end
			if not NoParent then
				local InspectResult, InspectResult2, InspectResult3, InspectResult4 = inspect(frame)
				
				if InspectResult then
					table.insert(InspectResult2, config)
					local VisibleSize1, VisibleSize2_1 = getVisibleSize({
						left = AbsolutePosition.X,
						top = AbsolutePosition.Y,
						right = AbsolutePosition.X + AbsoluteSize.X,
						bottom = AbsolutePosition.Y + AbsoluteSize.Y
					}, InspectResult2)
					
					if VisibleSize2_1 > 0 and VisibleSize1 >= AbsoluteSize.X * CarouselMinVisibleFraction then
						local config1 = {
							key = Key,
							x = AbsolutePosition.X,
							y = AbsolutePosition.Y,
							height = AbsoluteSize.Y,
							visibleHeight = VisibleSize2_1
						}
						local FormatResult = nil
						
						if InspectResult4 then
							local v3 = "carousel:%*"
							local Entry = t[InspectResult4]
							
							if Entry == nil then
								Count += 1
								Entry = Count
								t[InspectResult4] = Entry
							end
							FormatResult = v3:format(Entry)
						else
							local v4 = "grid:%*"
							local Entry = nil
							
							if InspectResult3 then
								Entry = t[InspectResult3]
								
								if Entry == nil then
									Count += 1
									Entry = Count
									t[InspectResult3] = Entry
								end
							else
								Entry = 0
							end
							FormatResult = v4:format(Entry)
						end
						config1.groupId = FormatResult
						config1.isCarousel = InspectResult4 ~= nil
						table.insert(List, config1)
					end
				end
			end
		end
		return List
	end,
	isTileShown = function(p2)
		-- upvalues: inspect (copy)
		return p2.Parent ~= nil and inspect(p2)
	end,
	getVisibleSize = getVisibleSize
}