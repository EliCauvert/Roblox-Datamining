local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseIsFPSAtTargetFunction = require(CorePackages.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget

return ReactModule.memo(function()
	-- upvalues: UseIsFPSAtTargetFunction (copy), ReactModule (copy), RunService (copy), RoactModule (copy)
	local UseIsFPSAtTargetResult = UseIsFPSAtTargetFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(tick())
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseIsFPSAtTargetResult (copy), UseRefResult3 (copy), RunService (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		if not UseIsFPSAtTargetResult then
			UseRefResult3.current = RunService.RenderStepped:Connect(function(_)
				-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
				local CurrentTime = tick()
				UseRefResult2.current += (CurrentTime - UseRefResult1.current) * 0.5 * 360
				
				if UseRefResult.current and UseRefResult.current.Rotation ~= nil then
					UseRefResult.current.Rotation = UseRefResult2.current
				end
				UseRefResult1.current = CurrentTime
			end)
			
			return
		end
		if UseRefResult3.current then
			UseRefResult3.current:Disconnect()
		end
	end, { UseIsFPSAtTargetResult })
	
	return if UseIsFPSAtTargetResult then nil else RoactModule.createElement("ScreenGui", {}, {
		Spinner = RoactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png",
			BackgroundTransparency = 1,
			Size = UDim2.new(0.05, 0, 0.05, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = UDim2.new(0.475, 0, 0.425, 0),
			ref = UseRefResult
		})
	})
end)