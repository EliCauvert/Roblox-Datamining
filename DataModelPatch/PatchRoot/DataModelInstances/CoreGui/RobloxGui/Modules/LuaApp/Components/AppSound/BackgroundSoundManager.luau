local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local NewResult = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ExperienceEventReceiver).new()
local AppMusicVolumePercentageRatio = game:DefineFastInt("AppMusicVolumePercentage", 25) / 100

return function()
	-- upvalues: ReactModule (copy), SoundManager (copy), Sounds (copy), AppMusicVolumePercentageRatio (copy), NewResult (copy)
	ReactModule.useEffect(function()
		-- upvalues: SoundManager (upval), Sounds (upval), AppMusicVolumePercentageRatio (upval), NewResult (upval)
		SoundManager:PlaySound(Sounds.VRAppLobbySound.Name, {
			Looped = true,
			FadeInTime = 3,
			Volume = AppMusicVolumePercentageRatio
		})
		local OnLaunchedResult = NewResult:onLaunched(function()
			-- upvalues: SoundManager (upval), Sounds (upval)
			SoundManager:StopSound(Sounds.VRAppLobbySound.Name)
		end)
		local OnLeftResult = NewResult:onLeft(function()
			-- upvalues: SoundManager (upval), Sounds (upval), AppMusicVolumePercentageRatio (upval)
			SoundManager:PlaySound(Sounds.VRAppLobbySound.Name, {
				Looped = true,
				FadeInTime = 3,
				Volume = AppMusicVolumePercentageRatio
			})
		end)
		
		return function()
			-- upvalues: OnLaunchedResult (copy), OnLeftResult (copy)
			OnLaunchedResult:disconnect()
			OnLeftResult:disconnect()
		end
	end, {})
end