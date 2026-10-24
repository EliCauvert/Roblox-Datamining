local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local DisplayModule = require(Parent.Display)
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)

local function computeGuiInset()
	-- upvalues: DisplayModule (copy), GuiService (copy), UserInputService (copy)
	local ShouldUseDeviceSafeInsets = DisplayModule.shouldUseDeviceSafeInsets
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	local Y = UserInputService.BottomBarSize.Y
	local Bottom = GuiService:GetSafeZoneOffsets().bottom
	
	return {
		top = if ShouldUseDeviceSafeInsets then 0 else UserInputService.StatusBarSize.Y,
		left = GuiInset.X,
		right = GuiInset2.X,
		bottom = if Y == 0 then Bottom else Y
	}
end

return {
	useGuiInset = function()
		-- upvalues: ReactModule (copy), computeGuiInset (copy), GuiService (copy), UserInputService (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(computeGuiInset)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), computeGuiInset (upval), GuiService (upval), UserInputService (upval)
			local function updateGuiInset()
				-- upvalues: UseStateResult2 (upval), computeGuiInset (upval)
				UseStateResult2((computeGuiInset()))
			end
			
			local Connections = {
				GuiService.SafeZoneOffsetsChanged:Connect(updateGuiInset),
				UserInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(updateGuiInset),
				UserInputService:GetPropertyChangedSignal("BottomBarSize"):Connect(updateGuiInset),
				UserInputService:GetPropertyChangedSignal("RightBarSize"):Connect(updateGuiInset)
			}
			
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end, {})
		
		return UseStateResult
	end,
	computeGuiInset = computeGuiInset
}