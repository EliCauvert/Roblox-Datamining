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

return reactModule.memo(function(p0) --[[ line: 29 | named "GamepadHelpPage" ]]
	-- upvalues: userInputService (ref), useDeviceOrientation (ref), useKeybindsModule (ref), useTokens (ref), reactModule (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), deviceOrientationMode (ref), view (ref), gamepadListModule (ref)
	local platform = userInputService:GetPlatform()
	local var9 = useDeviceOrientation()
	local controls = useKeybindsModule().controls
	local var10 = useTokens()
	local var11, var12 = reactModule.useState(1e999)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(nil)
	local var17 = signalsReactModule.useSignalState(signalsReactModule.useSignalState(displayModule.GetDisplayStore).getViewportSize)
	local var18, var19, var20 = reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: controls (ref), p0 (ref), constantsModule (copy), platform (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in controls do
			if v.gamepadInput ~= nil then
				local gamepadInput = v.gamepadInput
				local input = gamepadInput.input
				
				if input == nil then
					input = if p0.isSpatial then gamepadInput.spatialGamepadInput elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[platform] then gamepadInput.playstationInput else gamepadInput.xboxInput
				end
				if input ~= nil and #input > 0 then
					local var32 = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[input[1]]
					
					if var32 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
						t[i] = v
					elseif var32 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[platform] then
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
		Image = if p0.isSpatial then "rbxasset://textures/ui/Gamepad/VRController.png" else "rbxasset://textures/ui/Gamepad/Controller@3x.png"
	})
	local var22 = reactModule.useMemo(function() --[[ line: 101 ]]
		-- upvalues: p0 (ref), var17 (ref), constantsModule (copy), var10 (ref)
		return if p0.isSpatial or var17.X >= constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X and var17.Y >= constantsModule.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y then UDim.new(0, var10.Size.Size_2400) else UDim.new(0, 0)
	end, { var17 })
	local var23, var24, var25, var26, var27, var28 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: p0 (ref), constantsModule (copy), var11 (ref), var17 (ref), var9 (ref), deviceOrientationMode (copy), var13 (ref), var15 (ref)
		if p0.isSpatial then
			return Vector2.new(1, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, var11 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, var11 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR
		elseif (var17.X < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or var17.Y < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y) and var9 == deviceOrientationMode.Portrait then
			return Vector2.new(0, 0), UDim2.fromOffset(0, var11 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, var11 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT
		end
		local var33 = var11 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE
		local var34 = var11 * (1 - constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE)
		
		return Vector2.new(1, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), if not (var13 == nil or var15 == nil or (var13.X <= 0 or var15.X <= 0) or var33 >= var13.X and var34 >= var15.X) then math.min(var33 / var13.X, var34 / var15.X) else 1, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT
	end, { var17, var11, p0.isSpatial })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		padding = { top = var22 },
		onAbsoluteSizeChanged = function(value) --[[ line: 193 ]]
			-- upvalues: var12 (ref)
			var12(value.AbsoluteSize.X)
		end
	}, {
		LeftColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var23,
			Position = var24,
			scale = var27,
			onAbsoluteSizeChanged = function(value) --[[ line: 202 ]]
				-- upvalues: var13 (ref), var14 (ref)
				if var13 == nil then
					var14(value.AbsoluteSize)
				end
			end
		}, {
			LeftCol = reactModule.createElement(gamepadListModule, {
				layoutOrderReversed = false,
				addBlankIcon = false,
				controls = var18,
				isSpatial = p0.isSpatial,
				platform = platform
			})
		}),
		ImageComponentContainer = reactModule.createElement(view, {
			testId = "VRGamepadInstructions",
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromOffset(var11 * var28, var11 * var28 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO)
		}, { ImageComponent = imageLabel }),
		RightColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var25,
			Position = var26,
			scale = var27,
			onAbsoluteSizeChanged = function(value) --[[ line: 233 ]]
				-- upvalues: var15 (ref), var16 (ref)
				if var15 == nil then
					var16(value.AbsoluteSize)
				end
			end
		}, {
			RightCol = reactModule.createElement(view, { tag = "col auto-xy" }, {
				TopRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
					TopRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = false,
						controls = var20,
						isSpatial = p0.isSpatial,
						platform = platform
					})
				}),
				BottomRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
					BottomRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = true,
						controls = var19,
						isSpatial = p0.isSpatial,
						platform = platform
					})
				})
			})
		})
	})
end)