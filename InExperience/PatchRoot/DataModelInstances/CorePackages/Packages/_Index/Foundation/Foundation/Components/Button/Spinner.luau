local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local MotionModule = require(Parent.Motion)
local UseMotionFunction = MotionModule.useMotion
local UsePresenceFunction = MotionModule.usePresence
local UseSpinnerMotionStatesModule = require(script.Parent.useSpinnerMotionStates)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseRotationModule = require(Foundation.Utility.useRotation)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)

local function IconSpinner(p1) --[[ Line: 26 ]]
	-- upvalues: UseRotationModule (copy), ReactModule (copy), ImageModule (copy)
	return ReactModule.createElement(ImageModule, {
		Image = "icons/status/loading_large",
		tag = "position-center-center anchor-center-center size-full-full",
		imageStyle = p1.style,
		Rotation = UseRotationModule(2),
		testId = p1.testId
	}, {
		UIScale = ReactModule.createElement("UIScale", { Scale = p1.scale })
	})
end

local list = {
	Path2DControlPoint.new(UDim2.fromScale(1, 0.5), UDim2.fromScale(0, 0.25), UDim2.fromScale(0, -0.25)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 0), UDim2.fromScale(0.25, 0), UDim2.fromScale(-0.25, 0)),
	Path2DControlPoint.new(UDim2.fromScale(0, 0.5), UDim2.fromScale(0, -0.33), UDim2.fromScale(0, 0.33)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 1), UDim2.fromScale(-0.25, 0), UDim2.fromScale(0.25, 0))
}

local function Path2DSpinner(p1) --[[ Line: 50 ]]
	-- upvalues: ReactModule (copy), UseRotationModule (copy), list (copy), ViewModule (copy), IsPluginSecurityModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRotationModuleResult = UseRotationModule(2)
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseRefResult (copy), list (upval)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current:SetControlPoints(list)
		end
	end, {})
	
	return ReactModule.createElement(ViewModule, {
		tag = "position-center-center anchor-center-center size-full",
		Rotation = UseRotationModuleResult,
		testId = p1.testId
	}, {
		Circle = ReactModule.createElement("Path2D", {
			Closed = false,
			ref = UseRefResult,
			Color3 = p1.style:map(function(p2) --[[ Line: 69 ]]
				return p2.Color3
			end),
			Transparency = if IsPluginSecurityModule() then p1.style:map(function(p2) --[[ Line: 73 ]]
				return p2.Transparency
			end) else nil,
			Thickness = p1.Thickness
		}),
		UIScale = ReactModule.createElement("UIScale", { Scale = p1.scale })
	})
end

local config = { style = {} }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 95 | Named "Spinner" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseSpinnerMotionStatesModule (copy), UseMotionFunction (copy), UsePresenceFunction (copy), ReactModule (copy), ViewModule (copy), FlagsModule (copy), Path2DSpinner (copy), IconSpinner (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseSpinnerMotionStatesModuleResult = UseSpinnerMotionStatesModule()
	local UseMotionResult, UseMotionResult2 = UseMotionFunction(UseSpinnerMotionStatesModuleResult.Default)
	local UsePresenceResult = UsePresenceFunction()
	ReactModule.useEffect(function() --[[ Line: 102 ]]
		-- upvalues: UsePresenceResult (copy), UseMotionResult2 (copy), UseSpinnerMotionStatesModuleResult (copy)
		if UsePresenceResult.isPresent then
			UseMotionResult2(UseSpinnerMotionStatesModuleResult.Loading)
			
			return
		else
			UseMotionResult2(UseSpinnerMotionStatesModuleResult.Default, { onAnimationComplete = UsePresenceResult.onExitComplete })
		end
	end, { UsePresenceResult.isPresent })
	
	return ReactModule.createElement(ViewModule, {
		tag = "position-center-center anchor-center-center",
		Size = WithDefaultsModuleResult.Size,
		ref = Ref
	}, {
		Spinner = ReactModule.createElement(if FlagsModule.FoundationUsePath2DSpinner then Path2DSpinner else IconSpinner, {
			scale = UseMotionResult.scale,
			style = ReactModule.joinBindings({
				style = WithDefaultsModuleResult.style,
				transparency = UseMotionResult.transparency
			}):map(function(p2) --[[ Line: 122 ]]
				return {
					Color3 = p2.style.Color3,
					Transparency = p2.style.Transparency + p2.transparency / 2
				}
			end),
			Thickness = math.max(math.floor(WithDefaultsModuleResult.Size.X.Offset / 8), 1),
			testId = WithDefaultsModuleResult.testId
		})
	})
end))