local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local eventConnection = require(parent.ReactUtils).EventConnection
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local runService = require(foundation.Utility.Wrappers).Services.RunService

local function _(p0, p1)
	local z = p1.Z
	
	return math.max(p1.X, p1.Y, z) * (1 / math.tan(math.rad(p0) / 2)) + z / 2
end

local _ = function(value, p2, p3)
	return CFrame.fromAxisAngle(p3, p2):VectorToWorldSpace(value)
end

local t = { rotationSpeed = 0.01, fieldOfView = 70 }

return function(p4)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), eventConnection (ref), runService (ref)
	local var5 = withDefaultsModule(p4, t)
	local var6 = useTokensModule()
	local var7, var8 = reactModule.useState(var5.model)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useBinding(CFrame.new())
	local var13, var14 = reactModule.useBinding(0)
	local var15, var16 = reactModule.useState(CFrame.new())
	local var17, var18 = reactModule.useState(Vector3.new())
	local var19, var20 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var7 (ref)
		if var10.current and var7 ~= nil then
			var7.Parent = var10.current
		end
		return function()
			-- upvalues: var7 (copy)
			if var7 ~= nil then
				var7.Parent = nil
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var16 (ref), var18 (ref), var20 (ref), var5 (ref)
		if var7 ~= nil then
			local pivot = var7:GetPivot()
			var16(pivot)
			var18(pivot.LookVector)
			local extentsSize = var7:GetExtentsSize()
			local z = extentsSize.Z
			var20(math.max(extentsSize.X, extentsSize.Y, z) * (1 / math.tan(math.rad(var5.fieldOfView) / 2)) + z / 2)
		end
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var5 (ref), var10 (ref), var8 (ref)
		if var7 ~= nil then
			var7.Parent = nil
		end
		if var5.model ~= nil then
			var5.model.Parent = var10.current
			var8(var5.model)
		end
	end, { var5.model })
	
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
			LightColor = var6.Color.Extended.Gray.Gray_200.Color3,
			Ambient = var6.Color.Extended.Gray.Gray_200.Color3,
			CurrentCamera = var9
		}, {
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = var5.fieldOfView,
				CFrame = var11,
				ref = var9
			}),
			WorldModel = reactModule.createElement("WorldModel", { ref = var10 }),
			RenderSteppedConnection = reactModule.createElement(eventConnection, {
				event = runService.RenderStepped,
				callback = function()
					-- upvalues: var14 (ref), var13 (ref), var5 (ref), var17 (ref), var15 (ref), var19 (ref), var12 (ref)
					var14(var13:getValue() + var5.rotationSpeed or 0)
					var12(CFrame.new(var15.Position + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), var13:getValue()):VectorToWorldSpace(var17) * var19, var15.Position))
				end
			})
		})
	})
end