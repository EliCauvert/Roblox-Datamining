local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local eventConnection = require(parent.ReactUtils).EventConnection
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local runService = require(foundation.Utility.Wrappers).Services.RunService
local flagsModule = require(foundation.Utility.Flags)

local function _(p0, p1) --[[ line: 23 | named "getCameraDistance" ]]
	local z = p1.Z
	
	return math.max(p1.X, p1.Y, z) * (1 / math.tan(math.rad(p0) / 2)) + z / 2
end

local _ = function(value, p2, p3) --[[ line: 33 | named "rotateVectorAround" ]]
	return CFrame.fromAxisAngle(p3, p2):VectorToWorldSpace(value)
end

local t = { rotationSpeed = 0.01, fieldOfView = 70 }

return function(p4) --[[ line: 48 | named "ObjectViewport" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), flagsModule (ref), eventConnection (ref), runService (ref)
	local var6 = withDefaultsModule(p4, t)
	local var7 = useTokensModule()
	local var8, var9 = reactModule.useState(var6.model)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useBinding(CFrame.new())
	local var14, var15 = reactModule.useBinding(0)
	local var16, var17 = reactModule.useState(CFrame.new())
	local var18, var19 = reactModule.useState(Vector3.new())
	local var20, var21 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var11 (ref), var8 (ref)
		if var11.current and var8 ~= nil then
			var8.Parent = var11.current
		end
		return function() --[[ line: 68 ]]
			-- upvalues: var8 (copy)
			if var8 ~= nil then
				var8.Parent = nil
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var8 (ref), flagsModule (copy), var17 (ref), var19 (ref), var21 (ref), var6 (ref)
		if var8 ~= nil then
			local var22 = if flagsModule.FoundationMigrateDeprecatedApis then var8:GetPivot() else var8:GetModelCFrame()
			var17(var22)
			var19(var22.LookVector)
			local extentsSize = var8:GetExtentsSize()
			local z = extentsSize.Z
			var21(math.max(extentsSize.X, extentsSize.Y, z) * (1 / math.tan(math.rad(var6.fieldOfView) / 2)) + z / 2)
		end
	end, { var8 })
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: var8 (ref), var6 (ref), var11 (ref), var9 (ref)
		if var8 ~= nil then
			var8.Parent = nil
		end
		if var6.model ~= nil then
			var6.model.Parent = var11.current
			var9(var6.model)
		end
	end, { var6.model })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		AspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ViewportFrame = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			LightDirection = Vector3.new(1, 1, 1),
			Size = UDim2.new(1, 25, 1, 25),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			LightColor = var7.Color.Extended.Gray.Gray_200.Color3,
			Ambient = var7.Color.Extended.Gray.Gray_200.Color3,
			CurrentCamera = var10
		}, {
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = var6.fieldOfView,
				CFrame = var12,
				ref = var10
			}),
			WorldModel = reactModule.createElement("WorldModel", { ref = var11 }),
			RenderSteppedConnection = reactModule.createElement(eventConnection, {
				event = runService.RenderStepped,
				callback = function() --[[ line: 138 ]]
					-- upvalues: var15 (ref), var14 (ref), var6 (ref), var18 (ref), flagsModule (copy), var16 (ref), var20 (ref), var13 (ref)
					var15(var14:getValue() + var6.rotationSpeed or 0)
					local var24 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), var14:getValue()):VectorToWorldSpace(var18)
					var13(if flagsModule.FoundationMigrateDeprecatedApis then CFrame.new(var16.Position + var24 * var20, var16.Position) else CFrame.new(var16.p + var24 * var20, var16.p))
				end
			})
		})
	})
end