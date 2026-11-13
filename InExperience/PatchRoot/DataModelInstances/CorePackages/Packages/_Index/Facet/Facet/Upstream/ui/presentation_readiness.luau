local _ = require("./types")
local _ = require("../vendor/compose/core")
local FontReadinessModule = require("./font_readiness")
local TextMeasureModule = require("./text_measure")
local GeometrySignatureModule = require("./geometry_signature")
local config = { TextLabel = true, TextButton = true, TextBox = true }

local function inWindow(Frame: Frame): boolean
	local Parent = Frame.Parent
	while Parent and not Parent:IsA("ScrollingFrame") do
		Parent = Parent.Parent
	end
	if Parent and Parent:IsA("ScrollingFrame") then
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		local AbsolutePosition1 = Parent.AbsolutePosition
		local AbsoluteWindowSize = Parent.AbsoluteWindowSize
		
		return AbsolutePosition.X < AbsolutePosition1.X + AbsoluteWindowSize.X and (AbsolutePosition1.X < AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < AbsolutePosition1.Y + AbsoluteWindowSize.Y) and AbsolutePosition1.Y < AbsolutePosition.Y + AbsoluteSize.Y
	else
		return true
	end
end

return function(p1, Frames)
	-- upvalues: FontReadinessModule (copy), GeometrySignatureModule (copy), config (copy), TextMeasureModule (copy), inWindow (copy)
	local FontReadinessModuleResult = FontReadinessModule(p1, Frames)
	local GeometrySignatureModuleResult = GeometrySignatureModule()
	local FinishResult = 0
	local Ceiled = math.ceil(math.max(1, p1.metric("motion.restLimit")) * 60)
	local Count = 0
	
	local function prepared()
		-- upvalues: config (upval), TextMeasureModule (upval), GeometrySignatureModuleResult (copy), inWindow (upval), Frames (copy), FinishResult (ref), FontReadinessModuleResult (copy)
		local Frames1 = {}
		local Inverted = true
		local v1 = false
		
		local function record(Frame: Frame, p2)
			-- upvalues: config (upval), Frames1 (copy), Inverted (ref), TextMeasureModule (upval), GeometrySignatureModuleResult (upval)
			if config[Frame.ClassName] and (Frame:IsA("TextLabel") or Frame:IsA("TextButton") or Frame:IsA("TextBox")) then
				table.insert(Frames1, Frame)
				Inverted = Inverted and not TextMeasureModule.pending(Frame)
				
				if p2 then
					local AbsoluteSize = Frame.AbsoluteSize
					local TextBounds = Frame.TextBounds
					GeometrySignatureModuleResult.push(Frame.AbsolutePosition)
					GeometrySignatureModuleResult.push(AbsoluteSize)
					GeometrySignatureModuleResult.push(TextBounds)
					GeometrySignatureModuleResult.push(Frame.Text)
				end
			end
		end
		
		local function visit(Frame, Visible)
			-- upvalues: inWindow (upval), Inverted (ref), record (copy), visit (copy)
			for _, child in Frame:GetChildren() do
				if Visible and child:IsA("GuiObject") and child:GetAttribute("FacetCollectionRow") == true and child.AbsoluteSize.X > 0 and child.AbsoluteSize.Y > 0 and inWindow(child) then
					Inverted = Inverted and (child:GetAttribute("FacetCollectionReady") ~= false and (child.Visible and (not child:IsA("CanvasGroup") or child.GroupTransparency < 1)))
				end
				local Inverted1 = Visible and (not child:IsA("GuiObject") or child.Visible)
				record(child, Inverted1)
				visit(child, Inverted1)
			end
		end
		
		for _, frame in Frames do
			local AbsoluteSize = frame.AbsoluteSize
			v1 = v1 or frame.Parent ~= nil and (AbsoluteSize.X > 0 and AbsoluteSize.Y > 0)
			GeometrySignatureModuleResult.push(frame.AbsolutePosition)
			GeometrySignatureModuleResult.push(AbsoluteSize)
			GeometrySignatureModuleResult.push(frame.Visible)
			
			if config[frame.ClassName] and (frame:IsA("TextLabel") or frame:IsA("TextButton") or frame:IsA("TextBox")) then
				table.insert(Frames1, frame)
			end
			visit(frame, frame.Visible)
		end
		FinishResult = GeometrySignatureModuleResult.finish()
		local IsFacetSettlingAttribute = false
		
		for _, frame1 in Frames do
			local Parent = frame1.Parent
			while Parent and not IsFacetSettlingAttribute do
				IsFacetSettlingAttribute = Parent:GetAttribute("FacetSettling") == true
				Parent = Parent.Parent
			end
		end
		return v1 and (Inverted and (not IsFacetSettlingAttribute and FontReadinessModuleResult(Frames1)))
	end
	
	local Flag = false
	
	return p1.runtime.settled({
		ready = function(): boolean
			-- upvalues: prepared (copy), Flag (ref), p1 (copy), Count (ref), Ceiled (copy)
			if prepared() then
				local IsMotionFrameLimitAbove: boolean = not Flag and p1.metric("motion.frameLimit") > 0
				Flag = true
				
				return not IsMotionFrameLimitAbove
			else
				Count += 1
				
				return Ceiled <= Count
			end
		end,
		sample = function()
			-- upvalues: FinishResult (ref)
			return FinishResult
		end,
		timeout = p1.metric("motion.restLimit")
	})
end