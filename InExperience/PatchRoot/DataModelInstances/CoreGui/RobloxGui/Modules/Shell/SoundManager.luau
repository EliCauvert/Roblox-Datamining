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

local function _(p1, p2, p3, p4)
	p1 = p1 / p4 - 1
	
	return p3 * math.sqrt(1 - p1 * p1) + p2
end

local function IsGameRunning()
	-- upvalues: runService (ref)
	return if UserSettings().GameSettings:InStudioMode() and game:GetService("UserInputService"):GetPlatform() ~= Enum.Platform.Windows then runService:IsRunning() else true
end

function GetSoundManager()
	-- upvalues: t_1 (ref), t (ref), IsGameRunning (ref), utilityModule (ref), coreGuiService (ref), guiService (ref)
	local t_2 = {
		SoundHolder = nil,
		CreateSound = function(_, p1)
			-- upvalues: t (copy)
			local text = "rbxasset://sounds/ui/Shell/" .. t[p1]
			local sound = Instance.new("Sound")
			sound.Name = p1
			sound.SoundId = text
			
			return sound
		end
	}
	local t_3 = {}
	
	local function _(p1)
		-- upvalues: t_1 (copy)
		if t_1[p1] then
			local removed = table.remove(t_1[p1], 1)
			
			if removed then
				table.insert(t_1[p1], removed)
				
				return removed
			end
		end
	end
	
	function t_2.Play(_, p1, p2, p3, p4, ...)
		-- upvalues: t (copy), t_1 (copy), t_3 (ref), IsGameRunning (copy)
		local var1 = nil
		
		if t[p1] then
			local var2
			if t_1[p1] then
				local removed = table.remove(t_1[p1], 1)
				
				if removed then
					table.insert(t_1[p1], removed)
					var2 = removed
				else
					var2 = nil
				end
				if not var2 then
					return var1
				end
				var2.Volume = p2 or 1
				var2.Looped = p3 or false
				var2.Pitch = p4 or 1
				var2:Play(...)
				t_3[var2] = var2.Volume
				
				if not IsGameRunning() then
					var2.Volume = 0
				end
				var1 = var2
				
				return var1
			end
		else
			spawn(function()
				-- upvalues: p1 (ref)
				error("Unable to find sound: " .. tostring(p1))
			end)
		end
	end
	
	function t_2.IsPlaying(_, p1)
		-- upvalues: t_2 (ref)
		local var1 = t_2.SoundHolder:FindFirstChild(p1)
		
		return if var1 then var1.IsPlaying else false
	end
	
	function t_2.Stop(_, p1, ...)
		-- upvalues: t_2 (ref), t (copy)
		if t_2.SoundHolder and t[p1] then
			local var1 = t_2.SoundHolder:FindFirstChild(p1)
			
			if var1 then
				var1:Stop()
			end
		end
	end
	
	function t_2.TweenSound(_, p1, p2, p3)
		-- upvalues: t_3 (ref), utilityModule (copy), IsGameRunning (copy)
		t_3[p1] = nil
		utilityModule.PropertyTweener(p1, "Volume", p1.Volume, p2, p3, function(...)
			-- upvalues: IsGameRunning (copy), utilityModule (copy)
			return IsGameRunning() and utilityModule.EaseInOutQuad(...) or 0
		end, true, function()
			-- upvalues: t_3 (copy), p1 (ref), p2 (ref)
			t_3[p1] = p2
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
			local var1 = t_2:CreateSound(i)
			var1.Parent = folder_1
			table.insert(t_1[i], var1)
			local var2 = t_2:CreateSound(i)
			var2.Parent = folder_1
			table.insert(t_1[i], var2)
			local var3 = t_2:CreateSound(i)
			var3.Parent = folder_1
			table.insert(t_1[i], var3)
		end
		local var4 = nil
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
			-- upvalues: guiService (copy), var4 (write)
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and var4 then
				local moveSelection = selectedCoreObject:FindFirstChild("MoveSelection")
				
				if moveSelection and moveSelection:IsA("Sound") then
					moveSelection.Volume = 0.35
					moveSelection:Play()
				end
			end
			var4 = selectedCoreObject
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