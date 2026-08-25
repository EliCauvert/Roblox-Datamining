local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSelectedTheme = roactUtilsModule.Hooks.useSelectedTheme
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local getDisplayBackgroundId = require(parent.EditProfileBackground).BackgroundUtils.getDisplayBackgroundId
local color = Color3.fromRGB(185, 185, 185)
local color_1 = Color3.fromRGB(200, 200, 200)
local insertService = game:GetService("InsertService")

return function(value)
	-- upvalues: reactModule (ref), useSelectedTheme (ref), useLocalUserId (ref), useSelector (ref), insertService (ref), getDisplayBackgroundId (ref), color (ref), color_1 (ref), view (ref)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = useSelectedTheme()
	local var9 = useLocalUserId()
	local var10 = useSelector(function(p0)
		-- upvalues: var9 (ref)
		if p0.ProfilePlatform and p0.ProfilePlatform.Profiles and var9 then
			local var11 = p0.ProfilePlatform.Profiles.User[tostring(var9)]
			
			return if var11 and var11.components and var11.components.ProfileBackground then var11.components.ProfileBackground.assetId else -1
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), insertService (copy), getDisplayBackgroundId (copy), var8 (ref), var6 (ref), var5 (ref), color (copy), color_1 (copy)
		task.defer(function()
			-- upvalues: var10 (copy), insertService (copy), getDisplayBackgroundId (copy), var8 (copy), var6 (copy), var5 (copy), color (copy), color_1 (copy)
			if not var10 then return end
			local ok, status = pcall(function()
				-- upvalues: insertService (copy), getDisplayBackgroundId (copy), var10 (copy), var8 (copy)
				return insertService:LoadAsset(getDisplayBackgroundId(var10, var8))
			end)
			
			if ok and status then
				if var6.current then
					for i, v in pairs(var6.current:GetChildren()) do
						v:Destroy()
					end
				end
				local backgroundModel = Instance.new("Model")
				backgroundModel.Name = "BackgroundModel"
				backgroundModel.Parent = var6.current
				
				for i, v in pairs(status:GetChildren()) do
					v.Parent = backgroundModel
				end
				backgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
				status:Destroy()
				local current = var5.current
				
				if current then
					current.Ambient = color
					current.LightColor = color_1
					current.LightDirection = Vector3.new(0, 0.20000000298, 0.20000000298)
				end
			end
		end)
	end, { var10, var8 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5.current and var7.current then
			var5.current.CurrentCamera = var7.current
		end
	end)
	
	return reactModule.createElement(view, { Size = UDim2.new(1, 0, 0, value.height) }, {
		Background = reactModule.createElement("ViewportFrame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var5,
			Ambient = color,
			LightColor = color_1
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var6 }),
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 7, 4), Vector3.new(0, 7, 10)),
				ref = var7
			})
		})
	})
end