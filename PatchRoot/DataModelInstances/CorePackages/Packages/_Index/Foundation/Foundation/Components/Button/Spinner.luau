-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

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

local function IconSpinner(p0) --[[ line: 26 ]]
	-- upvalues: useRotationModule (ref), reactModule (ref), imageModule (ref)
	return reactModule.createElement(imageModule, {
		Image = "icons/status/loading_large",
		tag = "position-center-center anchor-center-center size-full-full",
		imageStyle = p0.style,
		Rotation = useRotationModule(2),
		testId = p0.testId
	}, {
		UIScale = reactModule.createElement("UIScale", { Scale = p0.scale })
	})
end

local list = {
	Path2DControlPoint.new(UDim2.fromScale(1, 0.5), UDim2.fromScale(0, 0.25), UDim2.fromScale(0, -0.25)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 0), UDim2.fromScale(0.25, 0), UDim2.fromScale(-0.25, 0)),
	Path2DControlPoint.new(UDim2.fromScale(0, 0.5), UDim2.fromScale(0, -0.33), UDim2.fromScale(0, 0.33)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 1), UDim2.fromScale(-0.25, 0), UDim2.fromScale(0.25, 0))
}

local function Path2DSpinner(p1) --[[ line: 50 ]]
	-- upvalues: reactModule (ref), useRotationModule (ref), list (ref), viewModule (ref), isPluginSecurityModule (ref)
	local var14 = reactModule.useRef(nil)
	local var15 = useRotationModule(2)
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var14 (ref), list (copy)
		local current = var14.current
		
		if current ~= nil then
			current:SetControlPoints(list)
		end
	end, {})
	
	return reactModule.createElement(viewModule, {
		tag = "position-center-center anchor-center-center size-full",
		Rotation = var15,
		testId = p1.testId
	}, {
		Circle = reactModule.createElement("Path2D", {
			Closed = false,
			ref = var14,
			Color3 = p1.style:map(function(p2) --[[ line: 69 ]]
				return p2.Color3
			end),
			Transparency = if isPluginSecurityModule() then p1.style:map(function(p3) --[[ line: 73 ]]
				return p3.Transparency
			end) else nil,
			Thickness = p1.Thickness
		}),
		UIScale = reactModule.createElement("UIScale", { Scale = p1.scale })
	})
end

local t = { style = {} }

return reactModule.memo(reactModule.forwardRef(function(p4, p5) --[[ line: 95 | named "Spinner" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useSpinnerMotionStatesModule (ref), useMotion (ref), usePresence (ref), reactModule (ref), viewModule (ref), flagsModule (ref), Path2DSpinner (ref), IconSpinner (ref)
	local var16 = withDefaultsModule(p4, t)
	local var17 = useSpinnerMotionStatesModule()
	local var18, var19 = useMotion(var17.Default)
	local var20 = usePresence()
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: var20 (ref), var19 (ref), var17 (ref)
		if var20.isPresent then
			var19(var17.Loading)
			
			return
		end
		var19(var17.Default, { onAnimationComplete = var20.onExitComplete })
	end, { var20.isPresent })
	
	return reactModule.createElement(viewModule, {
		tag = "position-center-center anchor-center-center",
		Size = var16.Size,
		ref = p5
	}, {
		Spinner = reactModule.createElement(if flagsModule.FoundationUsePath2DSpinner then Path2DSpinner else IconSpinner, {
			scale = var18.scale,
			style = reactModule.joinBindings({ style = var16.style, transparency = var18.transparency }):map(function(p6) --[[ line: 122 ]]
				return {
					Color3 = p6.style.Color3,
					Transparency = p6.style.Transparency + p6.transparency / 2
				}
			end),
			Thickness = math.max(math.floor(var16.Size.X.Offset / 8), 1),
			testId = var16.testId
		})
	})
end))