local UtilsModule = require(script.Parent.Parent.utils)

return {
	description = "Show detailed properties of an instance at the given DataModel path. Also verifies the path exists.",
	params = {
		{
			name = "path",
			desc = "DataModel path, e.g. \"game.CoreGui.LuaAppScreenGui\"",
			required = true
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy)
		local ResolveInstanceResult = UtilsModule.resolveInstance(p1.path)
		
		if not ResolveInstanceResult then
			return "NOT FOUND: \"" .. tostring(p1.path) .. "\" does not resolve to an instance."
		end
		local List = {
			("Instance: %s"):format(ResolveInstanceResult.Name),
			("ClassName: %s"):format(ResolveInstanceResult.ClassName),
			("FullPath: %s"):format(ResolveInstanceResult:GetFullName()),
			("Children: %d"):format(#ResolveInstanceResult:GetChildren())
		}
		
		if ResolveInstanceResult:IsA("GuiObject") then
			table.insert(List, "")
			table.insert(List, "-- Layout --")
			table.insert(List, "Position: " .. tostring(ResolveInstanceResult.Position))
			table.insert(List, "Size: " .. tostring(ResolveInstanceResult.Size))
			table.insert(List, "AnchorPoint: " .. tostring(ResolveInstanceResult.AnchorPoint))
			table.insert(List, "AbsolutePosition: " .. tostring(ResolveInstanceResult.AbsolutePosition))
			table.insert(List, "AbsoluteSize: " .. tostring(ResolveInstanceResult.AbsoluteSize))
			table.insert(List, "AbsoluteRotation: " .. tostring(ResolveInstanceResult.AbsoluteRotation))
			table.insert(List, "")
			table.insert(List, "-- Visibility --")
			table.insert(List, "Visible: " .. tostring(ResolveInstanceResult.Visible))
			table.insert(List, "BackgroundTransparency: " .. tostring(ResolveInstanceResult.BackgroundTransparency))
			table.insert(List, "ZIndex: " .. tostring(ResolveInstanceResult.ZIndex))
			table.insert(List, "LayoutOrder: " .. tostring(ResolveInstanceResult.LayoutOrder))
			table.insert(List, "ClipsDescendants: " .. tostring(ResolveInstanceResult.ClipsDescendants))
			table.insert(List, "AutomaticSize: " .. tostring(ResolveInstanceResult.AutomaticSize))
		end
		if ResolveInstanceResult:IsA("TextLabel") or ResolveInstanceResult:IsA("TextButton") or ResolveInstanceResult:IsA("TextBox") then
			table.insert(List, "")
			table.insert(List, "-- Text --")
			table.insert(List, "Text: \"" .. tostring(ResolveInstanceResult.Text) .. "\"")
			table.insert(List, "TextColor3: " .. tostring(ResolveInstanceResult.TextColor3))
			table.insert(List, "TextSize: " .. tostring(ResolveInstanceResult.TextSize))
			table.insert(List, "Font: " .. tostring(ResolveInstanceResult.Font))
			table.insert(List, "TextWrapped: " .. tostring(ResolveInstanceResult.TextWrapped))
			table.insert(List, "RichText: " .. tostring(ResolveInstanceResult.RichText))
		end
		if ResolveInstanceResult:IsA("ImageLabel") or ResolveInstanceResult:IsA("ImageButton") then
			table.insert(List, "")
			table.insert(List, "-- Image --")
			table.insert(List, "Image: " .. tostring(ResolveInstanceResult.Image))
			table.insert(List, "ImageTransparency: " .. tostring(ResolveInstanceResult.ImageTransparency))
			table.insert(List, "ScaleType: " .. tostring(ResolveInstanceResult.ScaleType))
		end
		if ResolveInstanceResult:IsA("ScrollingFrame") then
			table.insert(List, "")
			table.insert(List, "-- Scrolling --")
			table.insert(List, "CanvasSize: " .. tostring(ResolveInstanceResult.CanvasSize))
			table.insert(List, "CanvasPosition: " .. tostring(ResolveInstanceResult.CanvasPosition))
			table.insert(List, "ScrollingDirection: " .. tostring(ResolveInstanceResult.ScrollingDirection))
		end
		if ResolveInstanceResult:IsA("ScreenGui") then
			table.insert(List, "")
			table.insert(List, "-- ScreenGui --")
			table.insert(List, "DisplayOrder: " .. tostring(ResolveInstanceResult.DisplayOrder))
			table.insert(List, "Enabled: " .. tostring(ResolveInstanceResult.Enabled))
			table.insert(List, "IgnoreGuiInset: " .. tostring(ResolveInstanceResult.IgnoreGuiInset))
		end
		local Children = ResolveInstanceResult:GetChildren()
		
		if #Children > 0 then
			table.insert(List, "")
			table.insert(List, "-- Children --")
			
			for _, Gui in ipairs(Children) do
				local Text: string = ("  %s \"%s\""):format(Gui.ClassName, Gui.Name)
				
				if Gui:IsA("GuiObject") then
					Text ..= "  Vis=" .. tostring(Gui.Visible)
				end
				table.insert(List, Text)
			end
		end
		return table.concat(List, "\n")
	end
}