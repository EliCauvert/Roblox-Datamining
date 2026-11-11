local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local ReactModule = require(CorePackages.Packages.React)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local PerfInsightsIXPLayer = game:DefineFastString("PerfInsightsIXPLayer", "PerfRegressionTestLayer")
local PerfInsightsEnabled = game:DefineFastFlag("PerfInsightsEnabled", false)
local config = {
	hbMin = game:DefineFastInt("PerfInsightsHbMin", 0),
	hbMax = game:DefineFastInt("PerfInsightsHbMax", 0),
	inMin = game:DefineFastInt("PerfInsightsInMin", 0),
	inMax = game:DefineFastInt("PerfInsightsInMax", 0)
}
local config1 = config
local CurrentTime = 0

function PerformTask(MinValue: number, MaxValue: number)
	local NewCurrentTime = tick() + math.random(MinValue, MaxValue) * 0.001
	local Count = 0
	while tick() < NewCurrentTime do
		Count += 1
	end
end

function FrameWork()
	-- upvalues: CurrentTime (ref), config1 (ref)
	if tick() < CurrentTime + 2 then
		PerformTask(config1.hbMin, config1.hbMax)
	end
end

function InputWork()
	-- upvalues: config1 (ref)
	PerformTask(config1.inMin, config1.inMax)
end

return function()
	-- upvalues: PerfInsightsEnabled (copy), AppUserLayers (copy), PerfInsightsIXPLayer (copy), config1 (ref), UseUserExperimentFunction (copy), config (copy), ReactModule (copy), RunService (copy), UserInputService (copy), CurrentTime (ref)
	if PerfInsightsEnabled then
		local AppUserLayer = AppUserLayers[PerfInsightsIXPLayer]
		config1 = UseUserExperimentFunction({ AppUserLayer }, function(p1)
			-- upvalues: config (upval), AppUserLayer (copy)
			local v1 = p1[AppUserLayer]
			
			if v1 then
				config.hbMin = v1.PerfInsightsHbMin or config.hbMin
				config.hbMax = v1.PerfInsightsHbMax or config.hbMax
				config.inMin = v1.PerfInsightsInMin or config.inMin
				config.inMax = v1.PerfInsightsInMax or config.inMax
			end
			return config
		end)
		local IsHbMinAbove: boolean = config1.hbMin > 0 or (config1.hbMax > 0 or (config1.inMin > 0 or config1.inMax > 0))
		ReactModule.useEffect(function()
			-- upvalues: IsHbMinAbove (copy), RunService (upval), UserInputService (upval), CurrentTime (upval)
			if IsHbMinAbove then
				local List = {}
				local Flag = false
				local Flag1 = false
				table.insert(List, RunService.Stepped:Connect(FrameWork))
				table.insert(List, UserInputService.InputBegan:Connect(function(Input)
					-- upvalues: Flag (ref), CurrentTime (upval)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						Flag = true
						CurrentTime = tick()
					end
				end))
				table.insert(List, UserInputService.InputChanged:Connect(function()
					-- upvalues: Flag (ref), Flag1 (ref), CurrentTime (upval)
					if Flag then
						Flag1 = true
					end
					CurrentTime = tick()
				end))
				table.insert(List, UserInputService.InputEnded:Connect(function()
					-- upvalues: Flag (ref), Flag1 (ref)
					if Flag and not Flag1 then
						InputWork()
					end
					Flag = false
					Flag1 = false
				end))
				
				return function()
					-- upvalues: List (copy)
					for _, Connection in List do
						Connection:Disconnect()
					end
				end
			else
				return function() end
			end
		end, { IsHbMinAbove })
		
		return nil
	else
		return nil
	end
end