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
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = useSelectedTheme()
	local var5 = useLocalUserId()
	local var6 = useSelector(function(p1)
		-- upvalues: var5 (ref)
		if p1.ProfilePlatform and p1.ProfilePlatform.Profiles and var5 then
			local var7 = p1.ProfilePlatform.Profiles.User[tostring(var5)]
			
			return if var7 and var7.components and var7.components.ProfileBackground then var7.components.ProfileBackground.assetId else -1
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), insertService (copy), getDisplayBackgroundId (copy), var4 (ref), var2 (ref), var1 (ref), color (copy), color_1 (copy)
		task.defer(function()
			-- upvalues: var6 (copy), insertService (copy), getDisplayBackgroundId (copy), var4 (copy), var2 (copy), var1 (copy), color (copy), color_1 (copy)
			if not var6 then return end
			local ok, status = pcall(function()
				-- upvalues: insertService (copy), getDisplayBackgroundId (copy), var6 (copy), var4 (copy)
				return insertService:LoadAsset(getDisplayBackgroundId(var6, var4))
			end)
			
			if ok and status then
				if var2.current then
					for i, v in pairs(var2.current:GetChildren()) do
						v:Destroy()
					end
				end
				local backgroundModel = Instance.new("Model")
				backgroundModel.Name = "BackgroundModel"
				backgroundModel.Parent = var2.current
				
				for i, v in pairs(status:GetChildren()) do
					v.Parent = backgroundModel
				end
				backgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
				status:Destroy()
				local current = var1.current
				
				if current then
					current.Ambient = color
					current.LightColor = color_1
					current.LightDirection = Vector3.new(0, 0.20000000298, 0.20000000298)
				end
			end
		end)
	end, { var6, var4 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1.current and var3.current then
			var1.current.CurrentCamera = var3.current
		end
	end)
	
	return reactModule.createElement(view, { Size = UDim2.new(1, 0, 0, value.height) }, {
		Background = reactModule.createElement("ViewportFrame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var1,
			Ambient = color,
			LightColor = color_1
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var2 }),
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 7, 4), Vector3.new(0, 7, 10)),
				ref = var3
			})
		})
	})
end