local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local eventConnection = require(parent.ReactUtils).EventConnection
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local runService = require(foundation.Utility.Wrappers).Services.RunService

local function _(p1, p2)
	local z = p2.Z
	
	return math.max(p2.X, p2.Y, z) * (1 / math.tan(math.rad(p1) / 2)) + z / 2
end

local _ = function(value, p1, p2)
	return CFrame.fromAxisAngle(p2, p1):VectorToWorldSpace(value)
end

local t = { rotationSpeed = 0.01, fieldOfView = 70 }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), eventConnection (ref), runService (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(var1.model)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useBinding(CFrame.new())
	local var9, var10 = reactModule.useBinding(0)
	local var11, var12 = reactModule.useState(CFrame.new())
	local var13, var14 = reactModule.useState(Vector3.new())
	local var15, var16 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var3 (ref)
		if var6.current and var3 ~= nil then
			var3.Parent = var6.current
		end
		return function()
			-- upvalues: var3 (copy)
			if var3 ~= nil then
				var3.Parent = nil
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var12 (ref), var14 (ref), var16 (ref), var1 (ref)
		if var3 ~= nil then
			local pivot = var3:GetPivot()
			var12(pivot)
			var14(pivot.LookVector)
			local extentsSize = var3:GetExtentsSize()
			local z = extentsSize.Z
			var16(math.max(extentsSize.X, extentsSize.Y, z) * (1 / math.tan(math.rad(var1.fieldOfView) / 2)) + z / 2)
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), var6 (ref), var4 (ref)
		if var3 ~= nil then
			var3.Parent = nil
		end
		if var1.model ~= nil then
			var1.model.Parent = var6.current
			var4(var1.model)
		end
	end, { var1.model })
	
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
			LightColor = var2.Color.Extended.Gray.Gray_200.Color3,
			Ambient = var2.Color.Extended.Gray.Gray_200.Color3,
			CurrentCamera = var5
		}, {
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				FieldOfView = var1.fieldOfView,
				CFrame = var7,
				ref = var5
			}),
			WorldModel = reactModule.createElement("WorldModel", { ref = var6 }),
			RenderSteppedConnection = reactModule.createElement(eventConnection, {
				event = runService.RenderStepped,
				callback = function()
					-- upvalues: var10 (ref), var9 (ref), var1 (ref), var13 (ref), var11 (ref), var15 (ref), var8 (ref)
					var10(var9:getValue() + var1.rotationSpeed or 0)
					var8(CFrame.new(var11.Position + CFrame.fromAxisAngle(Vector3.new(0, 1, 0), var9:getValue()):VectorToWorldSpace(var13) * var15, var11.Position))
				end
			})
		})
	})
end