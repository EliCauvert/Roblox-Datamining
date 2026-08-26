local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local displayModule = require(parent_1.Display)
local gamepadListModule = require(parent.Components.Gamepad.GamepadList)
local constantsModule = require(parent.Constants)
local useKeybindsModule = require(parent.Hooks.useKeybinds)
local signalsReactModule = require(parent_1.SignalsReact)
local useDeviceOrientation = require(parent_1.RobloxAppHooks).useDeviceOrientation
local deviceOrientationMode = require(parent_1.RobloxAppEnums).DeviceOrientationMode
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: userInputService (ref), useDeviceOrientation (ref), useKeybindsModule (ref), useTokens (ref), reactModule (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), deviceOrientationMode (ref), view (ref), gamepadListModule (ref)
	local platform = userInputService:GetPlatform()
	local var1 = useDeviceOrientation()
	local controls = useKeybindsModule().controls
	local var2 = useTokens()
	local var3, var4 = reactModule.useState(1e999)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(nil)
	local var9 = signalsReactModule.useSignalState(signalsReactModule.useSignalState(displayModule.GetDisplayStore).getViewportSize)
	local var10, var11, var12 = reactModule.useMemo(function()
		-- upvalues: controls (ref), p1 (ref), constantsModule (copy), platform (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in controls do
			if v.gamepadInput ~= nil then
				local gamepadInput = v.gamepadInput
				local input = gamepadInput.input
				
				if input == nil then
					input = if p1.isSpatial then gamepadInput.spatialGamepadInput elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[platform] then gamepadInput.playstationInput else gamepadInput.xboxInput
				end
				if input ~= nil and #input > 0 then
					local var13 = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[input[1]]
					
					if var13 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
						t[i] = v
					elseif var13 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[platform] then
						t_1[i] = v
					else
						t_2[i] = v
					end
				end
			end
		end
		return t, t_1, t_2
	end, { controls })
	local imageLabel = reactModule.createElement("ImageLabel", {
		Name = "GamepadImage",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = if p1.isSpatial then "rbxasset://textures/ui/Gamepad/VRController.png" else "rbxasset://textures/ui/Gamepad/Controller@3x.png"
	})
	local var14 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var9 (ref), constantsModule (copy), var2 (ref)
		return if p1.isSpatial or var9.X >= constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X and var9.Y >= constantsModule.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y then UDim.new(0, var2.Size.Size_2400) else UDim.new(0, 0)
	end, { var9 })
	local var15, var16, var17, var18, var19, var20 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), constantsModule (copy), var3 (ref), var9 (ref), var1 (ref), deviceOrientationMode (copy), var5 (ref), var7 (ref)
		if p1.isSpatial then
			return Vector2.new(1, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, var3 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, var3 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR
		elseif (var9.X < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or var9.Y < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y) and var1 == deviceOrientationMode.Portrait then
			return Vector2.new(0, 0), UDim2.fromOffset(0, var3 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, var3 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT
		end
		local var21 = var3 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE
		local var22 = var3 * (1 - constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE)
		
		return Vector2.new(1, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), if not (var5 == nil or var7 == nil or (var5.X <= 0 or var7.X <= 0) or var21 >= var5.X and var22 >= var7.X) then math.min(var21 / var5.X, var22 / var7.X) else 1, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT
	end, { var9, var3, p1.isSpatial })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		padding = { top = var14 },
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var4 (ref)
			var4(value.AbsoluteSize.X)
		end
	}, {
		LeftColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var15,
			Position = var16,
			scale = var19,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var5 (ref), var6 (ref)
				if var5 == nil then
					var6(value.AbsoluteSize)
				end
			end
		}, {
			LeftCol = reactModule.createElement(gamepadListModule, {
				layoutOrderReversed = false,
				addBlankIcon = false,
				controls = var10,
				isSpatial = p1.isSpatial,
				platform = platform
			})
		}),
		ImageComponentContainer = reactModule.createElement(view, {
			testId = "VRGamepadInstructions",
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromOffset(var3 * var20, var3 * var20 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO)
		}, { ImageComponent = imageLabel }),
		RightColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var17,
			Position = var18,
			scale = var19,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var7 (ref), var8 (ref)
				if var7 == nil then
					var8(value.AbsoluteSize)
				end
			end
		}, {
			RightCol = reactModule.createElement(view, { tag = "col auto-xy" }, {
				TopRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
					TopRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = false,
						controls = var12,
						isSpatial = p1.isSpatial,
						platform = platform
					})
				}),
				BottomRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
					BottomRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = true,
						controls = var11,
						isSpatial = p1.isSpatial,
						platform = platform
					})
				})
			})
		})
	})
end)