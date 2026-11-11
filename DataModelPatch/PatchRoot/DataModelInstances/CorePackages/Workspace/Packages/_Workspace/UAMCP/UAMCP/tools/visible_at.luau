local UtilsModule = require(script.Parent.Parent.utils)

local function isTransparentContainer(Object): boolean
	if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
		return false
	elseif (Object:IsA("ImageLabel") or Object:IsA("ImageButton")) and (Object.Image ~= "" and Object.ImageTransparency < 1) then
		return false
	else
		return Object.BackgroundTransparency >= 0.99
	end
end

return {
	description = "Find leaf-level visible GuiObjects that overlap a screen coordinate. Filters out transparent containers and disabled ScreenGuis to reduce noise. Returns only innermost (leaf) elements.",
	params = {
		{
			name = "x",
			desc = "screen X coordinate",
			required = true
		},
		{
			name = "y",
			desc = "screen Y coordinate",
			required = true
		},
		{
			name = "root",
			desc = "root path (default \"game.CoreGui\")",
			required = false
		},
		{
			name = "all",
			desc = "if true, include transparent containers in results (default false)",
			required = false
		}
	},
	call = function(Vector): string
		-- upvalues: UtilsModule (copy), isTransparentContainer (copy)
		if not Vector.x or not Vector.y then
			return "ERROR: 'x' and 'y' are required"
		end
		local Number: number? = tonumber(Vector.x)
		local Number1: number? = tonumber(Vector.y)
		
		if not Number or not Number1 then
			return "ERROR: 'x' and 'y' must be valid numbers"
		end
		local IsAll = Vector.all == true
		local ResolveInstanceResult = UtilsModule.resolveInstance(Vector.root or "game.CoreGui")
		
		if ResolveInstanceResult then
			local List = {}
			
			local function recurse(Object)
				-- upvalues: Number (copy), Number1 (copy), IsAll (copy), isTransparentContainer (upval), List (copy), recurse (copy)
				if Object:IsA("LayerCollector") then
					if not Object.Enabled then return end
				elseif Object:IsA("GuiObject") and not Object.Visible then return end
				if Object:IsA("GuiObject") then
					local AbsolutePosition = Object.AbsolutePosition
					local AbsoluteSize = Object.AbsoluteSize
					
					if AbsolutePosition.X <= Number and Number <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Number1 and Number1 <= AbsolutePosition.Y + AbsoluteSize.Y then
						local Flag = false
						
						for _, Gui in ipairs(Object:GetChildren()) do
							if Gui:IsA("GuiObject") and Gui.Visible then
								local AbsolutePosition1 = Gui.AbsolutePosition
								local AbsoluteSize1 = Gui.AbsoluteSize
								
								if AbsolutePosition1.X <= Number and Number <= AbsolutePosition1.X + AbsoluteSize1.X and AbsolutePosition1.Y <= Number1 and Number1 <= AbsolutePosition1.Y + AbsoluteSize1.Y then
									Flag = true
									break
								end
							end
						end
						if not Flag and (IsAll or not isTransparentContainer(Object)) then
							local Message: string = ("%s \"%s\"  Pos=%s Size=%s"):format(Object.ClassName, Object.Name, tostring(AbsolutePosition), (tostring(AbsoluteSize)))
							
							if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
								Message ..= " Text=\"" .. Object.Text:sub(1, 40) .. "\""
							end
							List[#List + 1] = Message .. "\n    " .. Object:GetFullName()
						end
					end
				end
				for _, child in ipairs(Object:GetChildren()) do
					if child:IsA("GuiObject") or child:IsA("Folder") or child:IsA("ScreenGui") then
						recurse(child)
					end
				end
			end
			
			recurse(ResolveInstanceResult)
			
			return if #List == 0 then ("No visible leaf GuiObjects found at (%d, %d)"):format(Number, Number1) else ("Found %d leaf element(s) at (%d, %d):\n\n"):format(#List, Number, Number1) .. table.concat(List, "\n\n")
		else
			return "ERROR: could not resolve root path: " .. tostring(Vector.root)
		end
	end
}