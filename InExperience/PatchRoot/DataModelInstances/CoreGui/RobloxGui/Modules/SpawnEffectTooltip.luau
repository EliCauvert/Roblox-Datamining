local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local SpawnEffectTooltipAppModule = require(script.SpawnEffectTooltipApp)
local SpawnEffectTooltipDelaySeconds = game:DefineFastInt("SpawnEffectTooltipDelaySeconds", 3)
local SpawnEffectTooltipMaxPollSeconds = game:DefineFastInt("SpawnEffectTooltipMaxPollSeconds", 60)

local function _(): boolean
	-- upvalues: AppStorageService (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("HasSeenFirstSpawnEffect")
	end)
	
	return Success and Result == "true"
end

local _ = function()
	-- upvalues: AppStorageService (copy)
	pcall(function()
		-- upvalues: AppStorageService (upval)
		AppStorageService:SetItem("HasSeenFirstSpawnEffect", "true")
		AppStorageService:Flush()
	end)
end

local function showToast()
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), AppStorageService (copy), ReactModule (copy), FoundationModule (copy), SpawnEffectTooltipAppModule (copy)
	local SpawnEffectTooltip = Instance.new("ScreenGui")
	SpawnEffectTooltip.Name = "SpawnEffectTooltip"
	SpawnEffectTooltip.ResetOnSpawn = false
	SpawnEffectTooltip.DisplayOrder = 10
	SpawnEffectTooltip.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SpawnEffectTooltip.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(SpawnEffectTooltip)
	pcall(function()
		-- upvalues: AppStorageService (upval)
		AppStorageService:SetItem("HasSeenFirstSpawnEffect", "true")
		AppStorageService:Flush()
	end)
	Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		App = ReactModule.createElement(SpawnEffectTooltipAppModule, {
			onDismissed = function()
				-- upvalues: Root (copy), SpawnEffectTooltip (copy)
				task.defer(function()
					-- upvalues: Root (upval), SpawnEffectTooltip (upval)
					Root:unmount()
					SpawnEffectTooltip:Destroy()
				end)
			end
		})
	}))
end

return function()
	-- upvalues: Players (copy), AppStorageService (copy), SpawnEffectTooltipMaxPollSeconds (copy), SpawnEffectTooltipDelaySeconds (copy), showToast (copy)
	if not game:GetEngineFeature("SpawnEffectPlayedSignal") or not game:GetEngineFeature("HasSeenFirstSpawnEffect") then return end
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	if not game:GetEngineFeature("ReadHasRobloxSubscriptionLua") or not LocalPlayer.HasRobloxSubscription then return end
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("HasSeenFirstSpawnEffect")
	end)
	
	if Success then
		Success = Result == "true"
	end
	if not Success then
		local function _()
			-- upvalues: LocalPlayer (copy)
			return LocalPlayer:HasSpawnEffectPlayed()
		end
		
		task.spawn(function()
			-- upvalues: LocalPlayer (copy), SpawnEffectTooltipMaxPollSeconds (upval), SpawnEffectTooltipDelaySeconds (upval), AppStorageService (upval), showToast (upval)
			local Count = 0
			while not LocalPlayer:HasSpawnEffectPlayed() do
				if SpawnEffectTooltipMaxPollSeconds <= Count then return end
				task.wait(0.5)
				Count += 0.5
			end
			task.delay(SpawnEffectTooltipDelaySeconds, function()
				-- upvalues: AppStorageService (upval), showToast (upval)
				local Success, Result = pcall(function()
					-- upvalues: AppStorageService (upval)
					return AppStorageService:GetItem("HasSeenFirstSpawnEffect")
				end)
				
				if Success then
					Success = Result == "true"
				end
				if not Success then
					showToast()
				end
			end)
		end)
		
		return
	end
end