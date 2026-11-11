local UtilsModule = require(script.Parent.Parent.utils)

local function checkUniversalApp(): string
	local List = {}
	local Count = 0
	local Count1 = 0
	
	local function _(Text, p1)
		-- upvalues: Count1 (ref), Count (ref), List (copy)
		Count1 += 1
		
		if p1 then
			Count += 1
			List[#List + 1] = "  [OK] " .. Text
			
			return
		else
			List[#List + 1] = "  [--] " .. Text
		end
	end
	
	local LuaAppScreenGui = game:FindFirstChild("CoreGui"):FindFirstChild("LuaAppScreenGui")
	Count1 += 1
	
	if LuaAppScreenGui then
		Count += 1
		List[#List + 1] = "  [OK] LuaAppScreenGui exists"
	else
		List[#List + 1] = "  [--] LuaAppScreenGui exists"
	end
	local SystemBar = LuaAppScreenGui and LuaAppScreenGui:FindFirstChild("SystemBar", true)
	local RealSystemBar = SystemBar and SystemBar:FindFirstChild("RealSystemBar", true)
	local PrimaryItems = RealSystemBar and RealSystemBar:FindFirstChild("PrimaryItems", true)
	Count1 += 1
	
	if PrimaryItems then
		Count += 1
		List[#List + 1] = "  [OK] SystemBar rendered"
	else
		List[#List + 1] = "  [--] SystemBar rendered"
	end
	Count1 += 1
	
	if PrimaryItems and #PrimaryItems:GetChildren() >= 3 and PrimaryItems then
		Count += 1
		List[#List + 1] = "  [OK] Nav items populated (>=3)"
	else
		List[#List + 1] = "  [--] Nav items populated (>=3)"
	end
	local RNAppContainer = LuaAppScreenGui and LuaAppScreenGui:FindFirstChild("RNAppContainer")
	Count1 += 1
	
	if RNAppContainer then
		Count += 1
		List[#List + 1] = "  [OK] RNAppContainer exists"
	else
		List[#List + 1] = "  [--] RNAppContainer exists"
	end
	Count1 += 1
	
	if RNAppContainer and RNAppContainer:FindFirstChild("NavigatorView") then
		Count += 1
		List[#List + 1] = "  [OK] NavigatorView exists"
	else
		List[#List + 1] = "  [--] NavigatorView exists"
	end
	return ("%s (%d/%d checks passed)  [Universal App]\n%s"):format(if Count == Count1 then "READY" else "NOT_READY", Count, Count1, table.concat(List, "\n"))
end

local function checkInExperience(): string
	local CoreGui = game:FindFirstChild("CoreGui")
	local List = {}
	local Count = 0
	local Count1 = 0
	
	local function _(Text, p1)
		-- upvalues: Count1 (ref), Count (ref), List (copy)
		Count1 += 1
		
		if p1 then
			Count += 1
			List[#List + 1] = "  [OK] " .. Text
			
			return
		else
			List[#List + 1] = "  [--] " .. Text
		end
	end
	
	local TopBarApp = CoreGui:FindFirstChild("TopBarApp")
	local TopBarApp1 = TopBarApp and TopBarApp:FindFirstChild("TopBarApp")
	Count1 += 1
	
	if TopBarApp1 then
		Count += 1
		List[#List + 1] = "  [OK] TopBarApp ScreenGui exists"
	else
		List[#List + 1] = "  [--] TopBarApp ScreenGui exists"
	end
	local UnibarLeftFrame = TopBarApp1 and TopBarApp1:FindFirstChild("UnibarLeftFrame")
	Count1 += 1
	
	if UnibarLeftFrame and UnibarLeftFrame:FindFirstChild("UnibarMenu") then
		Count += 1
		List[#List + 1] = "  [OK] Unibar rendered"
	else
		List[#List + 1] = "  [--] Unibar rendered"
	end
	local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
	Count1 += 1
	
	if RobloxGui and RobloxGui:FindFirstChild("SettingsClippingShield") then
		Count += 1
		List[#List + 1] = "  [OK] Settings menu available"
	else
		List[#List + 1] = "  [--] Settings menu available"
	end
	local LocalPlayer = game:GetService("Players").LocalPlayer
	Count1 += 1
	
	if LocalPlayer and LocalPlayer.Character then
		Count += 1
		List[#List + 1] = "  [OK] Player has character"
	else
		List[#List + 1] = "  [--] Player has character"
	end
	return ("%s (%d/%d checks passed)  [In-Experience]\n%s"):format(if Count == Count1 then "READY" else "NOT_READY", Count, Count1, table.concat(List, "\n"))
end

return {
	description = "Check whether the app has finished loading. Auto-detects Universal App vs In-Experience UI context. Returns READY or NOT_READY with details.",
	params = {},
	call = function(_)
		-- upvalues: UtilsModule (copy), checkInExperience (copy), checkUniversalApp (copy)
		return if game:FindFirstChild("CoreGui") then if UtilsModule.isInExperienceContext() then checkInExperience() else checkUniversalApp() else "NOT_READY: CoreGui not found"
	end
}