local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local coreGuiService = game:GetService("CoreGui")
local utilityModule = require(coreGuiService:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"))
local t = {
	BackgroundLoop = "RobloxMusic.ogg",
	Error = "Error.mp3",
	ButtonPress = "ButtonPress.mp3",
	MoveSelection = "MoveSelection.mp3",
	OverlayOpen = "OverlayOpen.mp3",
	PopUp = "PopUp.mp3",
	PurchaseSuccess = "PurchaseSuccess.mp3",
	ScreenChange = "ScreenChange.mp3",
	SideMenuSlideIn = "SideMenuSlideIn.mp3"
}
local t_1 = {}

local function _(p0, p1, p2, p3)
	p0 = p0 / p3 - 1
	
	return p2 * math.sqrt(1 - p0 * p0) + p1
end

local function IsGameRunning()
	-- upvalues: runService (ref)
	return if UserSettings().GameSettings:InStudioMode() and game:GetService("UserInputService"):GetPlatform() ~= Enum.Platform.Windows then runService:IsRunning() else true
end

function GetSoundManager()
	-- upvalues: t_1 (ref), t (ref), IsGameRunning (ref), utilityModule (ref), coreGuiService (ref), guiService (ref)
	local t_2 = {
		SoundHolder = nil,
		CreateSound = function(_, p4)
			-- upvalues: t (copy)
			local text = "rbxasset://sounds/ui/Shell/" .. t[p4]
			local sound = Instance.new("Sound")
			sound.Name = p4
			sound.SoundId = text
			
			return sound
		end
	}
	local t_3 = {}
	
	local function _(p5)
		-- upvalues: t_1 (copy)
		if t_1[p5] then
			local removed = table.remove(t_1[p5], 1)
			
			if removed then
				table.insert(t_1[p5], removed)
				
				return removed
			end
		end
	end
	
	function t_2.Play(_, p6, p7, p8, p9, ...)
		-- upvalues: t (copy), t_1 (copy), t_3 (ref), IsGameRunning (copy)
		local var12 = nil
		
		if t[p6] then
			local var14
			if t_1[p6] then
				local removed = table.remove(t_1[p6], 1)
				
				if removed then
					table.insert(t_1[p6], removed)
					var14 = removed
				else
					var14 = nil
				end
				if not var14 then
					return var12
				end
				var14.Volume = p7 or 1
				var14.Looped = p8 or false
				var14.Pitch = p9 or 1
				var14:Play(...)
				t_3[var14] = var14.Volume
				
				if not IsGameRunning() then
					var14.Volume = 0
				end
				var12 = var14
				
				return var12
			end
		else
			spawn(function()
				-- upvalues: p6 (ref)
				error("Unable to find sound: " .. tostring(p6))
			end)
		end
	end
	
	function t_2.IsPlaying(_, p10)
		-- upvalues: t_2 (ref)
		local var15 = t_2.SoundHolder:FindFirstChild(p10)
		
		return if var15 then var15.IsPlaying else false
	end
	
	function t_2.Stop(_, p11, ...)
		-- upvalues: t_2 (ref), t (copy)
		if t_2.SoundHolder and t[p11] then
			local var16 = t_2.SoundHolder:FindFirstChild(p11)
			
			if var16 then
				var16:Stop()
			end
		end
	end
	
	function t_2.TweenSound(_, p12, p13, p14)
		-- upvalues: t_3 (ref), utilityModule (copy), IsGameRunning (copy)
		t_3[p12] = nil
		utilityModule.PropertyTweener(p12, "Volume", p12.Volume, p13, p14, function(...)
			-- upvalues: IsGameRunning (copy), utilityModule (copy)
			return IsGameRunning() and utilityModule.EaseInOutQuad(...) or 0
		end, true, function()
			-- upvalues: t_3 (copy), p12 (ref), p13 (ref)
			t_3[p12] = p13
		end)
	end
	
	;(function()
		-- upvalues: coreGuiService (copy), t_2 (ref), t (copy), t_1 (copy), guiService (copy), IsGameRunning (copy), t_3 (ref)
		local appShellSounds = Instance.new("Folder")
		appShellSounds.Name = "AppShellSounds"
		appShellSounds.Parent = coreGuiService
		t_2.SoundHolder = appShellSounds
		
		for i, v in pairs(t) do
			local folder_1 = Instance.new("Folder")
			folder_1.Name = i
			folder_1.Parent = t_2.SoundHolder
			t_1[i] = {}
			local var20 = t_2:CreateSound(i)
			var20.Parent = folder_1
			table.insert(t_1[i], var20)
			local var21 = t_2:CreateSound(i)
			var21.Parent = folder_1
			table.insert(t_1[i], var21)
			local var22 = t_2:CreateSound(i)
			var22.Parent = folder_1
			table.insert(t_1[i], var22)
		end
		local var18 = nil
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
			-- upvalues: guiService (copy), var18 (write)
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and var18 then
				local moveSelection = selectedCoreObject:FindFirstChild("MoveSelection")
				
				if moveSelection and moveSelection:IsA("Sound") then
					moveSelection.Volume = 0.35
					moveSelection:Play()
				end
			end
			var18 = selectedCoreObject
		end)
		
		if not IsGameRunning() then
			spawn(function()
				-- upvalues: IsGameRunning (copy), t_3 (copy)
				while not IsGameRunning() do
					wait(0.1)
				end
				for i, v in pairs(t_3) do
					i.Volume = v
				end
			end)
		end
	end)()
	
	return t_2
end

return GetSoundManager()