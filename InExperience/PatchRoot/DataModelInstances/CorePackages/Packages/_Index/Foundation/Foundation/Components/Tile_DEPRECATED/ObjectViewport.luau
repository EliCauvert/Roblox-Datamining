local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local EventConnection = require(Parent.ReactUtils).EventConnection
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local RunService = require(Foundation.Utility.Wrappers).Services.RunService

local function _(Degrees: number, Vector): number --[[ Line: 19 | Named "getCameraDistance" ]]
	local Z: number = Vector.Z
	
	return math.max(Vector.X, Vector.Y, Z) * (1 / math.tan(math.rad(Degrees) / 2)) + Z / 2
end

local _ = function(p1, Angle, Axis) --[[ Line: 29 | Named "rotateVectorAround" ]]
	return CFrame.fromAxisAngle(Axis, Angle):VectorToWorldSpace(p1)
end

local config = { rotationSpeed = 0.01, fieldOfView = 70 }

return function(p1) --[[ Line: 44 | Named "ObjectViewport" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), EventConnection (copy), RunService (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.model)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(CFrame.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(CFrame.new())
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState((Vector3.new()))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult (copy)
		if UseRefResult1.current and UseStateResult ~= nil then
			UseStateResult.Parent = UseRefResult1.current
		end
		return function() --[[ Line: 64 ]]
			-- upvalues: UseStateResult (upval)
			if UseStateResult ~= nil then
				UseStateResult.Parent = nil
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 71 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), WithDefaultsModuleResult (copy)
		if UseStateResult ~= nil then
			local Pivot = UseStateResult:GetPivot()
			UseStateResult2_1(Pivot)
			UseStateResult2_2(Pivot.LookVector)
			local ExtentsSize = UseStateResult:GetExtentsSize()
			local Z: number = ExtentsSize.Z
			UseStateResult2_3(math.max(ExtentsSize.X, ExtentsSize.Y, Z) * (1 / math.tan(math.rad(WithDefaultsModuleResult.fieldOfView) / 2)) + Z / 2)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 82 ]]
		-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if UseStateResult ~= nil then
			UseStateResult.Parent = nil
		end
		if WithDefaultsModuleResult.model ~= nil then
			WithDefaultsModuleResult.model.Parent = UseRefResult1.current
			UseStateResult2(WithDefaultsModuleResult.model)
		end
	end, { WithDefaultsModuleResult.model })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		AspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = ReactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			LightDirection = vector.create(1, 1, 1),
			Size = UDim2.new(1, 25, 1, 25),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = UseTokensModuleResult.Color.Extended.Gray.Gray_200.Color3,
			Ambient = UseTokensModuleResult.Color.Extended.Gray.Gray_200.Color3,
			CurrentCamera = UseRefResult
		}, {
			Camera = ReactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = WithDefaultsModuleResult.fieldOfView,
				CFrame = UseBindingResult,
				ref = UseRefResult
			}),
			WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult1 }),
			RenderSteppedConnection = ReactModule.createElement(EventConnection, {
				event = RunService.RenderStepped,
				callback = function() --[[ Line: 132 ]]
					-- upvalues: UseBindingResult2_1 (copy), UseBindingResult1 (copy), WithDefaultsModuleResult (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseBindingResult2 (copy)
					UseBindingResult2_1(UseBindingResult1:getValue() + WithDefaultsModuleResult.rotationSpeed or 0)
					UseBindingResult2((CFrame.new(UseStateResult1.Position + CFrame.fromAxisAngle(vector.create(0, 1, 0), (UseBindingResult1:getValue())):VectorToWorldSpace(UseStateResult3) * UseStateResult4, UseStateResult1.Position)))
				end
			})
		})
	})
end