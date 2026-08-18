local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local fFlagLuaAppSupportDeviceSafeInsets = sharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and sharedFlagsModule.FFlagLuaAppSupportDeviceSafeInsets

local function computeGuiInset(value, p0, p1) --[[ line: 19 ]]
	local guiInset, guiInset_1 = value:GetGuiInset()
	local y = p0.BottomBarSize.Y
	
	return {
		top = if p1 then 0 else p0.StatusBarSize.Y,
		left = guiInset.X,
		right = guiInset_1.X,
		bottom = if y == 0 then value:GetSafeZoneOffsets().bottom else y
	}
end

return {
	useGuiInset = function() --[[ line: 32 ]]
		-- upvalues: reactModule (ref), computeGuiInset (ref), guiService (ref), userInputService (ref), fFlagLuaAppSupportDeviceSafeInsets (ref)
		local var8, var9 = reactModule.useState(function() --[[ line: 33 ]]
			-- upvalues: computeGuiInset (copy), guiService (copy), userInputService (copy), fFlagLuaAppSupportDeviceSafeInsets (copy)
			return computeGuiInset(guiService, userInputService, fFlagLuaAppSupportDeviceSafeInsets)
		end)
		reactModule.useEffect(function() --[[ line: 37 ]]
			-- upvalues: var9 (ref), computeGuiInset (copy), guiService (copy), userInputService (copy), fFlagLuaAppSupportDeviceSafeInsets (copy)
			local function updateGuiInset() --[[ line: 38 ]]
				-- upvalues: var9 (copy), computeGuiInset (copy), guiService (copy), userInputService (copy), fFlagLuaAppSupportDeviceSafeInsets (copy)
				var9(computeGuiInset(guiService, userInputService, fFlagLuaAppSupportDeviceSafeInsets))
			end
			
			local list = {
				guiService.SafeZoneOffsetsChanged:Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("BottomBarSize"):Connect(updateGuiInset),
				userInputService:GetPropertyChangedSignal("RightBarSize"):Connect(updateGuiInset)
			}
			
			return function() --[[ line: 49 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, {})
		
		return var8
	end,
	computeGuiInset = computeGuiInset
}