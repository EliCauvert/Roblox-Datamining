local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UtilityModule = require(CoreGui:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"))
local config = {
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
local t = {}

local function _(p1, p2, p3, p4) --[[ Line: 33 | Named "EaseOutCirc" ]]
	local v1 = p1 / p4 - 1
	
	return p3 * math.sqrt(1 - v1 * v1) + p2
end

local function IsGameRunning() --[[ Line: 39 ]]
	-- upvalues: RunService (copy)
	return not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows or RunService:IsRunning()
end

function GetSoundManager() --[[ Line: 46 ]]
	-- upvalues: t (copy), config (copy), IsGameRunning (copy), UtilityModule (copy), CoreGui (copy), GuiService (copy)
	local Volumes = {}
	
	local function _(p1) --[[ Line: 53 | Named "FindSoundObjectForName" ]]
		-- upvalues: t (upval)
		if t[p1] then
			local Removed = table.remove(t[p1], 1)
			
			if Removed then
				table.insert(t[p1], Removed)
				
				return Removed
			end
		end
	end
	
	local config1 = {
		SoundHolder = nil,
		CreateSound = function(_, Name) --[[ Line: 63 ]]
			-- upvalues: config (upval)
			local Sound = Instance.new("Sound")
			Sound.Name = Name
			Sound.SoundId = "rbxasset://sounds/ui/Shell/" .. config[Name]
			
			return Sound
		end,
		Play = function(_, p1, p2, p3, p4, ...) --[[ Line: 74 ]]
			-- upvalues: config (upval), t (upval), Volumes (copy), IsGameRunning (upval)
			local v1 = nil
			local Sound = nil
			repeat
				if config[p1] then
					repeat
						if t[p1] then
							local Removed = table.remove(t[p1], 1)
							
							if Removed then
								table.insert(t[p1], Removed)
								Sound = Removed
								break
							end
						end
						Sound = nil
					until true
					if not Sound then break end
					Sound.Volume = p2 or 1
					Sound.Looped = p3 or false
					Sound.Pitch = p4 or 1
					Sound:Play(...)
					Volumes[Sound] = Sound.Volume
					
					if not IsGameRunning() then
						Sound.Volume = 0
					end
					v1 = Sound
					
					return v1
				else
					spawn(function() --[[ Line: 95 ]]
						-- upvalues: p1 (copy)
						error("Unable to find sound: " .. tostring(p1))
					end)
					continue
				end
			until true
			return v1
		end
	}
	
	function config1:IsPlaying(ChildName) --[[ Line: 103 ]]
		-- upvalues: config1 (copy)
		local ChildName1 = config1.SoundHolder:FindFirstChild(ChildName)
		
		return if ChildName1 then ChildName1.IsPlaying else false
	end
	
	function config1:Stop(ChildName, ...) --[[ Line: 111 ]]
		-- upvalues: config1 (copy), config (upval)
		if config1.SoundHolder and config[ChildName] then
			local ChildName1 = config1.SoundHolder:FindFirstChild(ChildName)
			
			if ChildName1 then
				ChildName1:Stop()
			end
		end
	end
	
	function config1:TweenSound(Sound, p1, p2) --[[ Line: 120 ]]
		-- upvalues: Volumes (copy), UtilityModule (upval), IsGameRunning (upval)
		Volumes[Sound] = nil
		UtilityModule.PropertyTweener(Sound, "Volume", Sound.Volume, p1, p2, function(...) --[[ Line: 123 ]]
			-- upvalues: IsGameRunning (upval), UtilityModule (upval)
			return IsGameRunning() and UtilityModule.EaseInOutQuad(...) or 0
		end, true, function() --[[ Line: 127 ]]
			-- upvalues: Volumes (upval), Sound (copy), p1 (copy)
			Volumes[Sound] = p1
		end)
	end
	
	;(function() --[[ Line: 138 | Named "Initialize" ]]
		-- upvalues: CoreGui (upval), config1 (copy), config (upval), t (upval), GuiService (upval), IsGameRunning (upval), Volumes (copy)
		local AppShellSounds = Instance.new("Folder")
		AppShellSounds.Name = "AppShellSounds"
		AppShellSounds.Parent = CoreGui
		config1.SoundHolder = AppShellSounds
		
		for Name, _ in pairs(config) do
			local Folder = Instance.new("Folder")
			Folder.Name = Name
			Folder.Parent = config1.SoundHolder
			t[Name] = {}
			local Sound = config1:CreateSound(Name)
			Sound.Parent = Folder
			table.insert(t[Name], Sound)
			local Sound1 = config1:CreateSound(Name)
			Sound1.Parent = Folder
			table.insert(t[Name], Sound1)
			local Sound2 = config1:CreateSound(Name)
			Sound2.Parent = Folder
			table.insert(t[Name], Sound2)
		end
		local v1 = nil
		GuiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ Line: 159 ]]
			-- upvalues: GuiService (upval), v1 (ref)
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject and v1 then
				local MoveSelection = SelectedCoreObject:FindFirstChild("MoveSelection")
				
				if MoveSelection and MoveSelection:IsA("Sound") then
					MoveSelection.Volume = 0.35
					MoveSelection:Play()
				end
			end
			v1 = SelectedCoreObject
		end)
		
		if not IsGameRunning() then
			spawn(function() --[[ Line: 172 ]]
				-- upvalues: IsGameRunning (upval), Volumes (upval)
				while not IsGameRunning() do
					wait(0.1)
				end
				for i, volume in pairs(Volumes) do
					i.Volume = volume
				end
			end)
		end
	end)()
	
	return config1
end

return GetSoundManager()