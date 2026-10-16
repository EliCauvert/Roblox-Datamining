local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseSelectedThemeFunction = RoactUtilsModule.Hooks.useSelectedTheme
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetDisplayBackgroundIdFunction = require(Parent.EditProfileBackground).BackgroundUtils.getDisplayBackgroundId
local _Color3 = Color3.fromRGB(185, 185, 185)
local _Color3_1 = Color3.fromRGB(200, 200, 200)
local InsertService = game:GetService("InsertService")

return function(p1) --[[ Line: 37 | Named "EditProfileBackgroundViewport" ]]
	-- upvalues: ReactModule (copy), UseSelectedThemeFunction (copy), UseLocalUserIdFunction (copy), UseSelectorFunction (copy), InsertService (copy), GetDisplayBackgroundIdFunction (copy), _Color3 (copy), _Color3_1 (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 44 ]]
		-- upvalues: UseLocalUserIdResult (copy)
		if p2.ProfilePlatform and p2.ProfilePlatform.Profiles and UseLocalUserIdResult then
			local UserEntry = p2.ProfilePlatform.Profiles.User[tostring(UseLocalUserIdResult)]
			
			if UserEntry and UserEntry.components and UserEntry.components.ProfileBackground then
				return UserEntry.components.ProfileBackground.assetId
			end
		end
		return -1
	end)
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseSelectorResult (copy), InsertService (upval), GetDisplayBackgroundIdFunction (upval), UseSelectedThemeResult (copy), UseRefResult1 (copy), UseRefResult (copy), _Color3 (upval), _Color3_1 (upval)
		task.defer(function() --[[ Line: 56 ]]
			-- upvalues: UseSelectorResult (upval), InsertService (upval), GetDisplayBackgroundIdFunction (upval), UseSelectedThemeResult (upval), UseRefResult1 (upval), UseRefResult (upval), _Color3 (upval), _Color3_1 (upval)
			if not UseSelectorResult then return end
			local Success, Result = pcall(function() --[[ Line: 61 ]]
				-- upvalues: InsertService (upval), GetDisplayBackgroundIdFunction (upval), UseSelectorResult (upval), UseSelectedThemeResult (upval)
				return InsertService:LoadAsset(GetDisplayBackgroundIdFunction(UseSelectorResult, UseSelectedThemeResult))
			end)
			
			if Success and Result then
				if UseRefResult1.current then
					for _, child in pairs(UseRefResult1.current:GetChildren()) do
						child:Destroy()
					end
				end
				local BackgroundModel = Instance.new("Model")
				BackgroundModel.Name = "BackgroundModel"
				BackgroundModel.Parent = UseRefResult1.current
				
				for _, child1 in pairs(Result:GetChildren()) do
					child1.Parent = BackgroundModel
				end
				BackgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
				Result:Destroy()
				local Current = UseRefResult.current
				
				if Current then
					Current.Ambient = _Color3
					Current.LightColor = _Color3_1
					Current.LightDirection = vector.create(0, 0.20000000298023224, 0.20000000298023224)
				end
			end
		end)
	end, { UseSelectorResult, UseSelectedThemeResult })
	ReactModule.useEffect(function() --[[ Line: 94 ]]
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy)
		if UseRefResult.current and UseRefResult2.current then
			UseRefResult.current.CurrentCamera = UseRefResult2.current
		end
	end)
	
	return ReactModule.createElement(View, { Size = UDim2.new(1, 0, 0, p1.height) }, {
		Background = ReactModule.createElement("ViewportFrame", {
			ZIndex = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = UseRefResult,
			Ambient = _Color3,
			LightColor = _Color3_1
		}, {
			WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult1 }),
			Camera = ReactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(vector.create(0, 7, 4), vector.create(0, 7, 10)),
				ref = UseRefResult2
			})
		})
	})
end