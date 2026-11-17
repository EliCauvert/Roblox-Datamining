local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")

local function hasSightWord(Text: string): boolean
	local Lowered = string.lower(Text)
	local Init = 1
	while true do
		local StartIndex, EndIndex = string.find(Lowered, "sight", Init, true)
		if StartIndex == nil or EndIndex == nil then
			return false
		end
		local Segment: string = if StartIndex > 1 then string.sub(Text, StartIndex - 1, StartIndex - 1) else ""
		local Segment1 = string.sub(Text, StartIndex, StartIndex)
		local Segment2 = string.sub(Text, EndIndex + 1, EndIndex + 1)
		
		if Segment2 == "s" then
			Segment2 = string.sub(Text, EndIndex + 2, EndIndex + 2)
		end
		local IsSegmentMatch: boolean = Segment == "" or (string.match(Segment, "%l") == nil or Segment1 == "S")
		local IsSegmentMatch1: boolean = Segment2 == "" or string.match(Segment2, "%l") == nil
		
		if IsSegmentMatch and IsSegmentMatch1 then
			return true
		end
		Init = StartIndex + 1
	end
end

local AimAlignmentProbeModule = {
	isAimName = function(Text: string)
		-- upvalues: hasSightWord (copy)
		local Lowered = string.lower(Text)
		
		return string.find(Lowered, "crosshair", 1, true) ~= nil or string.find(Lowered, "reticle", 1, true) ~= nil or hasSightWord(Text)
	end,
	offsetFromViewportCenter = function(Vector, Vector1: number, ViewportSize: number): number
		return Vector + Vector1 / 2 - ViewportSize / 2
	end
}

local function firstHiddenAncestor(Frame, PlayerGui)
	local Parent = Frame.Parent
	while Parent ~= nil and Parent ~= PlayerGui do
		if Parent:IsA("GuiObject") and not Parent.Visible then
			return Parent
		end
		if Parent:IsA("ScreenGui") and not Parent.Enabled then
			return Parent
		end
		Parent = Parent.Parent
	end
	return nil
end

function AimAlignmentProbeModule.sample(Camera, Object)
	-- upvalues: GuiService (copy), Players (copy), firstHiddenAncestor (copy), AimAlignmentProbeModule (copy)
	if Camera == nil then return end
	local ViewportSize: number = Camera.ViewportSize
	
	if ViewportSize.X < 16 or ViewportSize.Y < 16 then return end
	local DMCTRecordedViewportSizeAttribute = if Object == nil then nil else Object:GetAttribute("DMCTRecordedViewportSize")
	
	if typeof(DMCTRecordedViewportSizeAttribute) ~= "Vector2" and Camera.GetAttribute then
		DMCTRecordedViewportSizeAttribute = Camera:GetAttribute("DMCTRecordedViewportSize")
	end
	if typeof(DMCTRecordedViewportSizeAttribute) ~= "Vector2" then
		DMCTRecordedViewportSizeAttribute = Vector2.new(0, 0)
	end
	print(string.format("[AIMALIGN] renderViewport=%.0fx%.0f recordedViewport=%.0fx%.0f recordedCameraPresent=%s", ViewportSize.X, ViewportSize.Y, DMCTRecordedViewportSizeAttribute.X, DMCTRecordedViewportSizeAttribute.Y, (tostring(Object ~= nil))))
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	print(string.format("[AIMALIGN] guiInset topLeft=%s bottomRight=%s", tostring(GuiInset), (tostring(GuiInset2))))
	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")
	
	if PlayerGui == nil then
		print("[AIMALIGN] PlayerGui unavailable")
		
		return
	end
	local Count = 0
	local Count1 = 0
	local List = {}
	
	for _, ScreenGui in PlayerGui:GetChildren() do
		if ScreenGui:IsA("ScreenGui") then
			Count1 += 1
			
			if Count1 <= 12 then
				print(string.format("[AIMALIGN] screenGui=%s enabled=%s ignoreInset=%s", ScreenGui:GetFullName(), tostring(ScreenGui.Enabled), (tostring(ScreenGui.IgnoreGuiInset))))
			end
		end
	end
	print("[AIMALIGN] screenGuiCount=" .. tostring(Count1))
	
	for _, Gui in PlayerGui:GetDescendants() do
		if Gui:IsA("GuiObject") then
			local Success, Result, Result3 = pcall(function()
				-- upvalues: Gui (copy)
				return Gui.AbsolutePosition, Gui.AbsoluteSize
			end)
			
			if Success and Result ~= nil and Result3 ~= nil then
				local NewResult = Result + Result3 / 2
				local FirstHiddenAncestorResult = firstHiddenAncestor(Gui, PlayerGui)
				
				if Gui.Visible and FirstHiddenAncestorResult == nil and Result3.X > 0 and Result3.Y > 0 and Result3.X <= 128 and Result3.Y <= 128 and math.abs(NewResult.X - ViewportSize.X / 2) <= 160 and math.abs(NewResult.Y - ViewportSize.Y / 2) <= 100 then
					table.insert(List, {
						object = Gui,
						center = NewResult,
						size = Result3,
						distance = (NewResult - ViewportSize / 2).Magnitude
					})
				end
				local IsMagnitudeBelow: boolean = DMCTRecordedViewportSizeAttribute.X > 16 and (DMCTRecordedViewportSizeAttribute.Y > 16 and (Result3.X > 0 and (Result3.Y > 0 and (Result3.X <= 128 and (Result3.Y <= 128 and math.abs(NewResult.X - DMCTRecordedViewportSizeAttribute.X / 2) <= 8))))) and math.abs(NewResult.Y - DMCTRecordedViewportSizeAttribute.Y / 2) <= 8
				local IsAimName = AimAlignmentProbeModule.isAimName(Gui.Name) or IsMagnitudeBelow
				
				if IsAimName then
					Count += 1
				end
				if IsAimName and Count <= 12 then
					local OffsetFromViewportCenterResult = AimAlignmentProbeModule.offsetFromViewportCenter(Result, Result3, ViewportSize)
					local Parent = Gui.Parent
					print(string.format("[AIMALIGN] candidate=%s nearRecordedCenter=%s visible=%s hiddenAncestor=%s pos=(%.1f,%.1f) size=(%.1f,%.1f) centerOffset=(%.1f,%.1f) authored=%s anchor=%s parent=%s%s", Gui:GetFullName(), tostring(IsMagnitudeBelow), tostring(Gui.Visible), if FirstHiddenAncestorResult then FirstHiddenAncestorResult:GetFullName() else "none", Result.X, Result.Y, Result3.X, Result3.Y, OffsetFromViewportCenterResult.X, OffsetFromViewportCenterResult.Y, tostring(Gui.Position), tostring(Gui.AnchorPoint), if Parent then Parent:GetFullName() else "nil", if Parent and Parent:IsA("GuiObject") then string.format(" pos=%s size=%s", tostring(Parent.AbsolutePosition), (tostring(Parent.AbsoluteSize))) else ""))
				end
			end
		end
	end
	print("[AIMALIGN] candidateCount=" .. tostring(Count))
	table.sort(List, function(A, B): boolean
		return A.distance < B.distance
	end)
	
	for i = 1, math.min(#List, 12) do
		local Entry = List[i]
		print(string.format("[AIMALIGN] nearCenterVisible=%s class=%s center=(%.1f,%.1f) size=(%.1f,%.1f) parent=%s", Entry.object:GetFullName(), Entry.object.ClassName, Entry.center.X, Entry.center.Y, Entry.size.X, Entry.size.Y, Entry.object.Parent:GetFullName()))
	end
end

return AimAlignmentProbeModule