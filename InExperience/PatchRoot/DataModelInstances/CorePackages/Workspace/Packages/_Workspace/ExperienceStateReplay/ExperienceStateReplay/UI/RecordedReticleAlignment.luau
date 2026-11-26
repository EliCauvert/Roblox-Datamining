local Players = game:GetService("Players")
local AimAlignmentProbeModule = require(script.Parent.AimAlignmentProbe)
local FFlagExperienceStateReplayRecordedViewportEventModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayRecordedViewportEvent)

local function _(Vector, Vector1): UDim2
	return UDim2.new(Vector.X.Scale, Vector.X.Offset + math.round(Vector1.X), Vector.Y.Scale, Vector.Y.Offset + math.round(Vector1.Y))
end

local function isEnabledScreenGuiDescendant(Frame, Ancestor)
	local Parent = Frame.Parent
	while Parent ~= nil and Parent ~= Ancestor do
		if Parent:IsA("GuiObject") and not Parent.Visible then
			return false
		end
		if Parent:IsA("ScreenGui") then
			return Parent.Enabled
		end
		if Parent:IsA("BillboardGui") or Parent:IsA("SurfaceGui") then
			return false
		end
		Parent = Parent.Parent
	end
	return false
end

local function isWeaponCrosshair(Frame, Parent): boolean
	if string.lower(Frame.Name) ~= "crosshair" then
		return false
	end
	local Parent1 = Frame.Parent
	while Parent1 ~= nil and Parent1 ~= Parent do
		if Parent1.Name == "Mouse" then
			return true
		end
		Parent1 = Parent1.Parent
	end
	return false
end

local function discover(Ancestor, Vector, Vector1)
	-- upvalues: isEnabledScreenGuiDescendant (copy), isWeaponCrosshair (copy), AimAlignmentProbeModule (copy)
	local Frames = {}
	local Frames1 = {}
	local NewAbsolutePositions = {}
	
	for _, Gui in Ancestor:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Visible and isEnabledScreenGuiDescendant(Gui, Ancestor) then
			local AbsoluteSize: number = Gui.AbsoluteSize
			local IsWeaponCrosshair = isWeaponCrosshair(Gui, Ancestor)
			local v1: number = if IsWeaponCrosshair then 256 else 128
			
			if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and AbsoluteSize.X <= v1 and AbsoluteSize.Y <= v1 then
				local NewAbsolutePosition = Gui.AbsolutePosition + AbsoluteSize / 2
				local IsMagnitudeBelow: boolean = Vector ~= nil and (math.abs(NewAbsolutePosition.X - Vector.X) <= 8 and math.abs(NewAbsolutePosition.Y - Vector.Y) <= 8)
				local IsMagnitudeBelow1: boolean = math.abs(NewAbsolutePosition.X - Vector1.X) <= 128 and math.abs(NewAbsolutePosition.Y - Vector1.Y) <= 128
				local IsMagnitudeBelow2: boolean = Vector ~= nil and (math.abs(NewAbsolutePosition.X - Vector.X) <= 128 and math.abs(NewAbsolutePosition.Y - Vector.Y) <= 128)
				local IsYBelow: boolean = IsWeaponCrosshair and (NewAbsolutePosition.X >= 0 and (NewAbsolutePosition.Y >= 0 and (NewAbsolutePosition.X <= Vector1.X * 2 and NewAbsolutePosition.Y <= Vector1.Y * 2)))
				
				if AimAlignmentProbeModule.isAimName(Gui.Name) and (IsMagnitudeBelow1 or IsMagnitudeBelow2 or IsYBelow) then
					table.insert(Frames, Gui)
					NewAbsolutePositions[Gui] = NewAbsolutePosition
				elseif IsMagnitudeBelow then
					table.insert(Frames1, Gui)
					NewAbsolutePositions[Gui] = NewAbsolutePosition
				end
			end
		end
	end
	local Frames2 = if #Frames > 0 then Frames else Frames1
	local t = {}
	
	for _, value in Frames2 do
		t[value] = true
	end
	local List = {}
	local Flag = nil
	
	for _, value1 in Frames2 do
		local Parent = value1.Parent
		Flag = false
		while Parent ~= nil and Parent ~= Ancestor do
			if not t[Parent] then
				Parent = Parent.Parent
				continue
			end
			Flag = true
			break
		end
		if not Flag then
			table.insert(List, value1)
		end
	end
	return List, #Frames > 0, NewAbsolutePositions
end

return {
	create = function(p1)
		-- upvalues: Players (copy), FFlagExperienceStateReplayRecordedViewportEventModule (copy), isEnabledScreenGuiDescendant (copy), discover (copy)
		local List = {}
		local T = {}
		local Count = 0
		local Callback = p1 or function()
			-- upvalues: Players (upval)
			local LocalPlayer = Players.LocalPlayer
			
			return LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")
		end
		
		local function clear()
			-- upvalues: List (ref), T (ref), Count (ref)
			for _, value in List do
				if value.object.Parent ~= nil and value.object.Position == value.applied then
					value.object.Position = value.base
				end
			end
			List = {}
			T = {}
			Count = 0
		end
		
		return {
			step = function(Camera, Object, p2)
				-- upvalues: clear (copy), FFlagExperienceStateReplayRecordedViewportEventModule (upval), Callback (copy), Count (ref), List (ref), isEnabledScreenGuiDescendant (upval), T (ref), discover (upval)
				if Camera == nil then
					clear()
					
					return
				end
				local ViewportSize: number = Camera.ViewportSize
				local DMCTRecordedViewportSizeAttribute = if Object then Object:GetAttribute("DMCTRecordedViewportSize") else nil
				
				if typeof(DMCTRecordedViewportSizeAttribute) ~= "Vector2" and Camera.GetAttribute then
					DMCTRecordedViewportSizeAttribute = Camera:GetAttribute("DMCTRecordedViewportSize")
				end
				if FFlagExperienceStateReplayRecordedViewportEventModule then
					DMCTRecordedViewportSizeAttribute = p2
				end
				if ViewportSize.X < 16 or ViewportSize.Y < 16 then
					clear()
					
					return
				end
				local IsYAbove: boolean = typeof(DMCTRecordedViewportSizeAttribute) == "Vector2" and DMCTRecordedViewportSizeAttribute.X >= 16 and DMCTRecordedViewportSizeAttribute.Y >= 16
				local ViewportSizeRatio = if IsYAbove then (ViewportSize - DMCTRecordedViewportSizeAttribute) / 2 else Vector2.zero
				local CallbackResult = Callback()
				
				if CallbackResult == nil then
					clear()
					
					return
				end
				Count += 1
				local Flag = false
				
				for i = #List, 1, -1 do
					local Entry = List[i]
					
					if not Entry.object:IsDescendantOf(CallbackResult) or not Entry.object.Visible or not isEnabledScreenGuiDescendant(Entry.object, CallbackResult) then
						if Entry.object.Parent ~= nil and Entry.object.Position == Entry.applied then
							Entry.object.Position = Entry.base
						end
						print("[AIMALIGN] deselecting " .. Entry.object:GetFullName())
						table.remove(List, i)
						Flag = true
					end
				end
				if Flag then
					T = {}
				end
				if #List == 0 and (Flag or Count % 60 == 1) then
					local DiscoverResult, DiscoverResult2, DiscoverResult3 = discover(CallbackResult, if IsYAbove then DMCTRecordedViewportSizeAttribute / 2 else nil, ViewportSize / 2)
					local t = {}
					
					for _, Object1 in DiscoverResult do
						if DiscoverResult2 or T[Object1] then
							table.insert(List, {
								object = Object1,
								base = Object1.Position,
								applied = Object1.Position,
								offset = if DiscoverResult2 then ViewportSize / 2 - DiscoverResult3[Object1] else nil
							})
							print("[AIMALIGN] centering " .. Object1:GetFullName())
						else
							t[Object1] = true
						end
					end
					T = t
				end
				for _, value in List do
					local Position = value.object.Position
					
					if Position ~= value.applied then
						value.base = Position
					end
					local Base = value.base
					local Offset = value.offset or ViewportSizeRatio
					value.applied = UDim2.new(Base.X.Scale, Base.X.Offset + math.round(Offset.X), Base.Y.Scale, Base.Y.Offset + math.round(Offset.Y))
					value.object.Position = value.applied
				end
				if Count % 300 == 1 and #List > 0 then
					local Entry = List[1]
					print("[AIMALIGN] active=" .. Entry.object:GetFullName() .. " applied=" .. tostring(Entry.applied) .. " absolute=" .. tostring(Entry.object.AbsolutePosition))
				end
			end,
			clear = clear
		}
	end
}