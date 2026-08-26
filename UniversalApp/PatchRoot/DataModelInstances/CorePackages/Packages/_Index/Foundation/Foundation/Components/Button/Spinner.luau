local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local motionModule = require(parent.Motion)
local useMotion = motionModule.useMotion
local usePresence = motionModule.usePresence
local useSpinnerMotionStatesModule = require(script.Parent.useSpinnerMotionStates)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useRotationModule = require(foundation.Utility.useRotation)
local withDefaultsModule = require(foundation.Utility.withDefaults)

local function IconSpinner(p1)
	-- upvalues: useRotationModule (ref), reactModule (ref), imageModule (ref)
	return reactModule.createElement(imageModule, {
		Image = "icons/status/loading_large",
		tag = "position-center-center anchor-center-center size-full-full",
		imageStyle = p1.style,
		Rotation = useRotationModule(2),
		testId = p1.testId
	}, {
		UIScale = reactModule.createElement("UIScale", { Scale = p1.scale })
	})
end

local list = {
	Path2DControlPoint.new(UDim2.fromScale(1, 0.5), UDim2.fromScale(0, 0.25), UDim2.fromScale(0, -0.25)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 0), UDim2.fromScale(0.25, 0), UDim2.fromScale(-0.25, 0)),
	Path2DControlPoint.new(UDim2.fromScale(0, 0.5), UDim2.fromScale(0, -0.33), UDim2.fromScale(0, 0.33)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 1), UDim2.fromScale(-0.25, 0), UDim2.fromScale(0.25, 0))
}

local function Path2DSpinner(p1)
	-- upvalues: reactModule (ref), useRotationModule (ref), list (ref), viewModule (ref), isPluginSecurityModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useRotationModule(2)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), list (copy)
		local current = var1.current
		
		if current ~= nil then
			current:SetControlPoints(list)
		end
	end, {})
	
	return reactModule.createElement(viewModule, {
		tag = "position-center-center anchor-center-center size-full",
		Rotation = var2,
		testId = p1.testId
	}, {
		Circle = reactModule.createElement("Path2D", {
			Closed = false,
			ref = var1,
			Color3 = p1.style:map(function(p2)
				return p2.Color3
			end),
			Transparency = if isPluginSecurityModule() then p1.style:map(function(p2)
				return p2.Transparency
			end) else nil,
			Thickness = p1.Thickness
		}),
		UIScale = reactModule.createElement("UIScale", { Scale = p1.scale })
	})
end

local t = { style = {} }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useSpinnerMotionStatesModule (ref), useMotion (ref), usePresence (ref), reactModule (ref), viewModule (ref), flagsModule (ref), Path2DSpinner (ref), IconSpinner (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useSpinnerMotionStatesModule()
	local var3, var4 = useMotion(var2.Default)
	local var5 = usePresence()
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), var2 (ref)
		if var5.isPresent then
			var4(var2.Loading)
			
			return
		end
		var4(var2.Default, { onAnimationComplete = var5.onExitComplete })
	end, { var5.isPresent })
	
	return reactModule.createElement(viewModule, {
		tag = "position-center-center anchor-center-center",
		Size = var1.Size,
		ref = p2
	}, {
		Spinner = reactModule.createElement(if flagsModule.FoundationUsePath2DSpinner then Path2DSpinner else IconSpinner, {
			scale = var3.scale,
			style = reactModule.joinBindings({ style = var1.style, transparency = var3.transparency }):map(function(p3)
				return {
					Color3 = p3.style.Color3,
					Transparency = p3.style.Transparency + p3.transparency / 2
				}
			end),
			Thickness = math.max(math.floor(var1.Size.X.Offset / 8), 1),
			testId = var1.testId
		})
	})
end))