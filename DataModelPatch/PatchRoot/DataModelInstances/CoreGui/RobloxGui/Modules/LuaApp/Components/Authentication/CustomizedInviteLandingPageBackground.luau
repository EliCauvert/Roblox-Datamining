local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local LandingPageConstants = require(CorePackages.Workspace.Packages.LandingPage).Constants.LandingPageConstants
local OtterModule = require(CorePackages.Packages.Otter)
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize

return function(p1)
	-- upvalues: LandingPageConstants (copy), UseScreenSizeFunction (copy), ReactModule (copy), OtterModule (copy)
	local BackgroundAnimation = LandingPageConstants.CustomizedLandingPage.BackgroundAnimation
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(BackgroundAnimation.RIGHT_EDGE)
	local UseBindingResult1, _ = ReactModule.useBinding(OtterModule.createSingleMotor(BackgroundAnimation.RIGHT_EDGE))
	local UseBindingResult3, UseBindingResult2_1 = ReactModule.useBinding(BackgroundAnimation.OPAQUE)
	local UseBindingResult4, _ = ReactModule.useBinding(OtterModule.createSingleMotor(BackgroundAnimation.OPAQUE))
	UseBindingResult1:getValue():onStep(function(p2)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(p2)
	end)
	UseBindingResult1:getValue():onComplete(function(LEFTEDGE)
		-- upvalues: BackgroundAnimation (copy), UseBindingResult4 (copy), UseBindingResult1 (copy)
		if LEFTEDGE == BackgroundAnimation.LEFT_EDGE then
			UseBindingResult4:getValue():setGoal(BackgroundAnimation.OTTER_FADE_OUT)
			
			return
		else
			UseBindingResult1:getValue():setGoal(BackgroundAnimation.OTTER_SCROLL_LEFT)
		end
	end)
	UseBindingResult4:getValue():onStep(function(p2)
		-- upvalues: UseBindingResult2_1 (copy)
		UseBindingResult2_1(p2)
	end)
	UseBindingResult4:getValue():onComplete(function(TRANSPARENT)
		-- upvalues: BackgroundAnimation (copy), UseBindingResult1 (copy), UseBindingResult4 (copy)
		if TRANSPARENT == BackgroundAnimation.TRANSPARENT then
			UseBindingResult1:getValue():setGoal(BackgroundAnimation.OTTER_INSTANT_RIGHT)
			UseBindingResult4:getValue():setGoal(BackgroundAnimation.OTTER_INSTANT_IN)
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult1 (copy), BackgroundAnimation (copy)
		UseBindingResult1:getValue():setGoal(BackgroundAnimation.OTTER_SCROLL_LEFT)
	end, {})
	local Largest = math.max(UseScreenSizeResult.X, UseScreenSizeResult.Y)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		BackgroundImage = ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Image = p1.backgroundImage,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UseBindingResult:map(function(XScale): UDim2
				return UDim2.new(XScale, 0, 0.5, 0)
			end),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop,
			ImageTransparency = UseBindingResult3:map(function(p2)
				return p2
			end),
			BackgroundTransparency = UseBindingResult3:map(function(p2)
				return p2
			end)
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(Largest, Largest) }),
			UIGradient = ReactModule.createElement("UIGradient", LandingPageConstants.CustomizedLandingPage.BackgroundGradient)
		}),
		FadeBackgroundImage = ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = p1.backgroundImage,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(Largest, Largest) }),
			UIGradient = ReactModule.createElement("UIGradient", LandingPageConstants.CustomizedLandingPage.BackgroundGradient)
		})
	})
end