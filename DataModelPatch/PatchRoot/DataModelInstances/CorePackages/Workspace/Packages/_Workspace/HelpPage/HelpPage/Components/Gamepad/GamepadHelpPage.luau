local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local DisplayModule = require(Parent1.Display)
local GamepadListModule = require(Parent.Components.Gamepad.GamepadList)
local ConstantsModule = require(Parent.Constants)
local UseKeybindsModule = require(Parent.Hooks.useKeybinds)
local SignalsReactModule = require(Parent1.SignalsReact)
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local DeviceOrientationMode = require(Parent1.RobloxAppEnums).DeviceOrientationMode
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UserInputService (copy), UseDeviceOrientationFunction (copy), UseKeybindsModule (copy), UseTokensFunction (copy), ReactModule (copy), SignalsReactModule (copy), DisplayModule (copy), ConstantsModule (copy), DeviceOrientationMode (copy), View (copy), GamepadListModule (copy)
	local Platform = UserInputService:GetPlatform()
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local Controls = UseKeybindsModule().controls
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(1e999)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore).getViewportSize)
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: Controls (copy), p1 (copy), ConstantsModule (upval), Platform (copy)
		local t = {}
		local t1 = {}
		local t2 = {}
		
		for i, control in Controls do
			if control.gamepadInput ~= nil then
				local GamepadInput = control.gamepadInput
				local Input = GamepadInput.input
				
				if Input == nil then
					Input = if p1.isSpatial then GamepadInput.spatialGamepadInput elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Platform] then GamepadInput.playstationInput else GamepadInput.xboxInput
				end
				if Input ~= nil and #Input > 0 then
					local GAMEPADLAYOUTORDEREntry = ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[Input[1]]
					
					if GAMEPADLAYOUTORDEREntry <= ConstantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
						t[i] = control
					elseif GAMEPADLAYOUTORDEREntry <= ConstantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Platform] then
						t1[i] = control
					else
						t2[i] = control
					end
				end
			end
		end
		return t, t1, t2
	end, { Controls })
	local ImageLabel = ReactModule.createElement("ImageLabel", {
		Name = "GamepadImage",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = if p1.isSpatial then "rbxasset://textures/ui/Gamepad/VRController.png" else "rbxasset://textures/ui/Gamepad/Controller@3x.png"
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim
		-- upvalues: p1 (copy), UseSignalStateResult (copy), ConstantsModule (upval), UseTokensResult (copy)
		return if p1.isSpatial or UseSignalStateResult.X >= ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X and UseSignalStateResult.Y >= ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y then UDim.new(0, UseTokensResult.Size.Size_2400) else UDim.new(0, 0)
	end, { UseSignalStateResult })
	local UseMemoResult4, UseMemoResult2_1, UseMemoResult3_1, UseMemoResult4_1, UseMemoResult5, UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), UseStateResult (copy), UseSignalStateResult (copy), UseDeviceOrientationResult (copy), DeviceOrientationMode (upval), UseStateResult1 (copy), UseStateResult3 (copy)
		if p1.isSpatial then
			return Vector2.new(1, 0.5), UDim2.new(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR
		elseif (UseSignalStateResult.X < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or UseSignalStateResult.Y < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y) and UseDeviceOrientationResult == DeviceOrientationMode.Portrait then
			return Vector2.new(0, 0), UDim2.fromOffset(0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT
		else
			local ScaledUseStateResult = UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE
			local ScaledUseStateResult1 = UseStateResult * (1 - ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE)
			
			return Vector2.new(1, 0), UDim2.fromScale(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), if UseStateResult1 == nil or UseStateResult3 == nil or UseStateResult1.X <= 0 or UseStateResult3.X <= 0 or ScaledUseStateResult >= UseStateResult1.X and ScaledUseStateResult1 >= UseStateResult3.X then 1 else math.min(ScaledUseStateResult / UseStateResult1.X, ScaledUseStateResult1 / UseStateResult3.X), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT
		end
	end, { UseSignalStateResult, UseStateResult, p1.isSpatial })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		padding = { top = UseMemoResult1 },
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	}, {
		LeftColContainer = ReactModule.createElement(View, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = UseMemoResult4,
			Position = UseMemoResult2_1,
			scale = UseMemoResult5,
			onAbsoluteSizeChanged = function(Frame)
				-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy)
				if UseStateResult1 == nil then
					UseStateResult2_1(Frame.AbsoluteSize)
				end
			end
		}, {
			LeftCol = ReactModule.createElement(GamepadListModule, {
				layoutOrderReversed = false,
				addBlankIcon = false,
				controls = UseMemoResult,
				isSpatial = p1.isSpatial,
				platform = Platform
			})
		}),
		ImageComponentContainer = ReactModule.createElement(View, {
			testId = "VRGamepadInstructions",
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromOffset(UseStateResult * UseMemoResult6, UseStateResult * UseMemoResult6 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO)
		}, { ImageComponent = ImageLabel }),
		RightColContainer = ReactModule.createElement(View, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = UseMemoResult3_1,
			Position = UseMemoResult4_1,
			scale = UseMemoResult5,
			onAbsoluteSizeChanged = function(Frame)
				-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
				if UseStateResult3 == nil then
					UseStateResult2_2(Frame.AbsoluteSize)
				end
			end
		}, {
			RightCol = ReactModule.createElement(View, { tag = "col auto-xy" }, {
				TopRightColContainer = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, {
					TopRightCol = ReactModule.createElement(GamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = false,
						controls = UseMemoResult3,
						isSpatial = p1.isSpatial,
						platform = Platform
					})
				}),
				BottomRightColContainer = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
					BottomRightCol = ReactModule.createElement(GamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = true,
						controls = UseMemoResult2,
						isSpatial = p1.isSpatial,
						platform = Platform
					})
				})
			})
		})
	})
end)