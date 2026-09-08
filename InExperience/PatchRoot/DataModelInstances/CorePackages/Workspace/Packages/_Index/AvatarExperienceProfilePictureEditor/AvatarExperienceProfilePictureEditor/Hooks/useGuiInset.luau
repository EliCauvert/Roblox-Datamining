local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)

local function computeGuiInset()
	-- upvalues: sharedFlagsModule (ref), guiService (ref), userInputService (ref)
	local fFlagLuaAppSupportDeviceSafeInsets = sharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and sharedFlagsModule.FFlagLuaAppSupportDeviceSafeInsets
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	local y = userInputService.BottomBarSize.Y
	
	return {
		top = if fFlagLuaAppSupportDeviceSafeInsets then 0 else userInputService.StatusBarSize.Y,
		left = guiInset.X,
		right = guiInset_1.X,
		bottom = if y == 0 then guiService:GetSafeZoneOffsets().bottom else y
	}
end

return {
	useGuiInset = function()
		-- upvalues: reactModule (ref), computeGuiInset (ref), guiService (ref), userInputService (ref)
		local var1, var2 = reactModule.useState(computeGuiInset)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), computeGuiInset (copy), guiService (copy), userInputService (copy)
			local function updateGuiInset()
				-- upvalues: var2 (copy), computeGuiInset (copy)
				var2(computeGuiInset())
			end
			
			local list = {
				guiService.SafeZoneOffsetsChanged:Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("BottomBarSize"):Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("RightBarSize"):Connect(updateGuiInset)
			}
			
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, {})
		
		return var1
	end,
	computeGuiInset = computeGuiInset
}