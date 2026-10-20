local UtilsModule = require(script.Parent.Parent.utils)

return {
	description = "Scroll a ScrollingFrame so that a target element is visible in the viewport. Finds targets by path, instance Name, or Text content (in that priority). Returns the new click center coordinates.",
	params = {
		{
			name = "target",
			desc = "Name or Text content of the element to scroll into view",
			required = false
		},
		{
			name = "path",
			desc = "Full DataModel path to the element (most reliable)",
			required = false
		},
		{
			name = "root",
			desc = "root path to search under (default \"game.CoreGui\")",
			required = false
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy)
		local ResolveInstanceResult = nil
		
		if p1.path then
			ResolveInstanceResult = UtilsModule.resolveInstance(p1.path)
			
			if not ResolveInstanceResult then
				return "ERROR: could not resolve path \"" .. tostring(p1.path) .. "\""
			end
		else
			if not p1.target then
				return "ERROR: either 'target' or 'path' is required"
			end
			local ResolveInstanceResult1 = UtilsModule.resolveInstance(p1.root or "game.CoreGui")
			
			if not ResolveInstanceResult1 then
				return "ERROR: could not resolve root path: " .. tostring(p1.root)
			end
			local Text = tostring(p1.target)
			local v1 = nil
			local v2 = nil
			
			local function findTarget(ResolveInstanceResult)
				-- upvalues: v1 (ref), Text (copy), v2 (ref), UtilsModule (upval), findTarget (copy)
				if v1 then return end
				if ResolveInstanceResult.Name == Text then
					v1 = ResolveInstanceResult
					
					return
				end
				if not v2 and UtilsModule.TEXT_CLASSES[ResolveInstanceResult.ClassName] then
					local Success, Result = pcall(function()
						-- upvalues: ResolveInstanceResult (copy)
						return ResolveInstanceResult.Text
					end)
					
					if Success and Result and Result:lower():find(Text:lower(), 1, true) then
						v2 = ResolveInstanceResult
					end
				end
				for _, child in ipairs(ResolveInstanceResult:GetChildren()) do
					findTarget(child)
				end
			end
			
			findTarget(ResolveInstanceResult1)
			ResolveInstanceResult = v1 or v2
			
			if not ResolveInstanceResult then
				return "ERROR: no element found matching \"" .. Text .. "\" (searched by Name and Text content)"
			end
		end
		if not ResolveInstanceResult then
			return "ERROR: no target resolved"
		end
		local Frame = ResolveInstanceResult
		
		if not Frame:IsA("GuiObject") then
			return ("ERROR: resolved target \"%s\" is not a GuiObject (cannot scroll to it)"):format(Frame:GetFullName())
		end
		local AncestorScrollFrame = UtilsModule.findAncestorScrollFrame(Frame)
		
		if not AncestorScrollFrame then
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			
			return ("Target \"%s\" (%s) is not inside a ScrollingFrame. No scrolling needed.\n"):format(Frame.Name, Frame.ClassName) .. ("Path: %s\n"):format(Frame:GetFullName()) .. ("AbsolutePosition: %s\n"):format((tostring(AbsolutePosition))) .. ("Click center: (%.0f, %.0f)  <-- use these coords"):format(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2)
		end
		local AbsolutePosition = AncestorScrollFrame.AbsolutePosition
		local AbsoluteSize = AncestorScrollFrame.AbsoluteSize
		local AbsolutePosition1 = Frame.AbsolutePosition
		local AbsoluteSize1 = Frame.AbsoluteSize
		local NewY = AbsolutePosition.Y + AbsoluteSize.Y
		local NewY1 = AbsolutePosition1.Y + AbsoluteSize1.Y
		local IsNewYAbove: boolean = AbsolutePosition.Y <= AbsolutePosition1.Y and NewY >= NewY1
		
		if not IsNewYAbove then
			AncestorScrollFrame.CanvasPosition = Vector2.new(AncestorScrollFrame.CanvasPosition.X, (math.min(math.max(0, AbsolutePosition1.Y - AbsolutePosition.Y + AncestorScrollFrame.CanvasPosition.Y + AbsoluteSize1.Y / 2 - AbsoluteSize.Y / 2), (math.max(0, AncestorScrollFrame.AbsoluteCanvasSize.Y - AbsoluteSize.Y)))))
			task.wait()
		end
		local AbsolutePosition2 = Frame.AbsolutePosition
		local AbsoluteSize2 = Frame.AbsoluteSize
		local List = {
			("Target: \"%s\" (%s)"):format(Frame.Name, Frame.ClassName),
			("Path: %s"):format(Frame:GetFullName()),
			("ScrollingFrame: %s"):format(AncestorScrollFrame:GetFullName()),
			("Was visible: %s"):format((tostring(IsNewYAbove))),
			("Now visible: %s"):format((tostring(AbsolutePosition.Y <= AbsolutePosition2.Y and AbsolutePosition2.Y + AbsoluteSize2.Y <= AbsolutePosition.Y + AbsoluteSize.Y))),
			("New AbsolutePosition: %s"):format((tostring(AbsolutePosition2))),
			("New AbsoluteSize: %s"):format((tostring(AbsoluteSize2))),
			("Click center: (%.0f, %.0f)  <-- use these coords"):format(AbsolutePosition2.X + AbsoluteSize2.X / 2, AbsolutePosition2.Y + AbsoluteSize2.Y / 2)
		}
		
		if not IsNewYAbove then
			List[#List + 1] = ("Scrolled CanvasPosition to: %s"):format((tostring(AncestorScrollFrame.CanvasPosition)))
		end
		return table.concat(List, "\n")
	end
}