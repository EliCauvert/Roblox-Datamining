local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local DisplayModule = require(Parent1.Display)
local _ = require(Parent.Configs.ConfigTypes)
local _ = require(Parent.Components.Common.ActionText)
local GamepadListModule = require(Parent.Components.Gamepad.GamepadList)
local DiagramLayoutViewModule = require(Parent.Components.Common.DiagramLayoutView)
local ConstantsModule = require(Parent.Constants)
local UseKeybindsModule = require(Parent.Hooks.useKeybinds)
local SignalsReactModule = require(Parent1.SignalsReact)
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local DeviceOrientationMode = require(Parent1.RobloxAppEnums).DeviceOrientationMode
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagHelpPageCCLModule = require(Parent.Flags.FFlagHelpPageCCL)

local function _(p1, p2, p3) --[[ Line: 41 | Named "getGamepadInput" ]]
	-- upvalues: FFlagHelpPageCCLModule (copy), ConstantsModule (copy)
	local GamepadInput = p1.gamepadInput
	
	if GamepadInput == nil then
		return nil
	end
	local SpatialGamepadInput = if FFlagHelpPageCCLModule and p2 and GamepadInput.spatialGamepadInput ~= nil then GamepadInput.spatialGamepadInput else GamepadInput.input
	
	if SpatialGamepadInput == nil then
		if p2 then
			return GamepadInput.spatialGamepadInput
		end
		if ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p3] then
			return GamepadInput.playstationInput
		end
		SpatialGamepadInput = GamepadInput.xboxInput
	end
	return SpatialGamepadInput
end

local _ = function(Text: string): number --[[ Line: 69 | Named "getAbilitySlot" ]]
	return (tonumber(string.match(Text, "^AbilityAction(%d+)$")))
end

local function getResolvedControls(Controls, IsSpatial, Platform) --[[ Line: 73 ]]
	-- upvalues: FFlagHelpPageCCLModule (copy), ConstantsModule (copy)
	local t = {}
	local t1 = {}
	
	local function addControl(p1) --[[ Line: 81 ]]
		-- upvalues: IsSpatial (copy), Platform (copy), FFlagHelpPageCCLModule (upval), ConstantsModule (upval), t (copy)
		local GamepadInput = p1.gamepadInput
		local v1 = nil
		
		if GamepadInput == nil then
			v1 = nil
		else
			local SpatialGamepadInput = if FFlagHelpPageCCLModule and IsSpatial and GamepadInput.spatialGamepadInput ~= nil then GamepadInput.spatialGamepadInput else GamepadInput.input
			
			if SpatialGamepadInput == nil then
				SpatialGamepadInput = if IsSpatial then GamepadInput.spatialGamepadInput elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Platform] then GamepadInput.playstationInput else GamepadInput.xboxInput
			end
			v1 = SpatialGamepadInput
		end
		if v1 == nil then return end
		for _, value in ipairs(v1) do
			if not IsSpatial or ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[value] ~= nil then
				local Input = { value }
				local Text = tostring(value)
				local Entry = t[Text]
				
				if Entry == nil then
					t[Text] = {
						label = p1.label,
						gamepadInput = { input = Input },
						actionLabels = { { label = p1.label, disabled = p1.disabled } }
					}
				else
					table.insert(Entry.actionLabels, { label = p1.label, disabled = p1.disabled })
				end
			end
		end
	end
	
	for i, control in Controls do
		local Number: number? = tonumber(string.match(i, "^AbilityAction(%d+)$"))
		
		if Number == nil then
			addControl(control)
		else
			t1[Number] = control
		end
	end
	local List = {}
	
	for i1 in t1 do
		table.insert(List, i1)
	end
	table.sort(List)
	
	for _, value in ipairs(List) do
		addControl(t1[value])
	end
	return t
end

return ReactModule.memo(function(p2) --[[ Line: 141 | Named "GamepadHelpPage" ]]
	-- upvalues: UserInputService (copy), UseDeviceOrientationFunction (copy), UseKeybindsModule (copy), UseTokensFunction (copy), ReactModule (copy), SignalsReactModule (copy), DisplayModule (copy), ConstantsModule (copy), DeviceOrientationMode (copy), FFlagHelpPageCCLModule (copy), getResolvedControls (copy), DiagramLayoutViewModule (copy), GamepadListModule (copy), View (copy)
	local Platform = if p2.getPlatform then p2.getPlatform() else UserInputService:GetPlatform()
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local Controls = UseKeybindsModule().controls
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(1e999)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore).getViewportSize)
	local IsUseDeviceOrientationResultMatch: boolean = not p2.isSpatial and (if UseSignalStateResult.X < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X then UseDeviceOrientationResult == DeviceOrientationMode.Portrait else UseSignalStateResult.Y < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y and UseDeviceOrientationResult == DeviceOrientationMode.Portrait)
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 156 ]]
		-- upvalues: FFlagHelpPageCCLModule (upval), getResolvedControls (upval), Controls (copy), p2 (copy), Platform (copy), ConstantsModule (upval)
		local t = {}
		local t2 = {}
		local t3 = {}
		
		if FFlagHelpPageCCLModule then
			for i, value in pairs((getResolvedControls(Controls, p2.isSpatial, Platform))) do
				local Input = value.gamepadInput.input
				
				if Input ~= nil and #Input > 0 then
					if ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[Input[1]] <= ConstantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
						t[i] = value
					else
						t3[i] = value
					end
				end
			end
			return t, t2, t3
		else
			for i1, control in Controls do
				if control.gamepadInput ~= nil then
					local GamepadInput = control.gamepadInput
					local Input = GamepadInput.input
					
					if Input == nil then
						Input = if p2.isSpatial then GamepadInput.spatialGamepadInput elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Platform] then GamepadInput.playstationInput else GamepadInput.xboxInput
					end
					if Input ~= nil and #Input > 0 then
						local GAMEPADLAYOUTORDEREntry = ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[Input[1]]
						
						if GAMEPADLAYOUTORDEREntry <= ConstantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
							t[i1] = control
						elseif GAMEPADLAYOUTORDEREntry <= ConstantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Platform] then
							t2[i1] = control
						else
							t3[i1] = control
						end
					end
				end
			end
			return t, t2, t3
		end
	end, if FFlagHelpPageCCLModule then { Controls, Platform, p2.isSpatial } else { Controls })
	local ImageLabel = ReactModule.createElement("ImageLabel", {
		Name = "GamepadImage",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = if p2.isSpatial then "rbxasset://textures/ui/Gamepad/VRController.png" else "rbxasset://textures/ui/Gamepad/Controller@3x.png"
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim --[[ Line: 233 ]]
		-- upvalues: p2 (copy), UseSignalStateResult (copy), ConstantsModule (upval), UseTokensResult (copy)
		return if p2.isSpatial or UseSignalStateResult.X >= ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X and UseSignalStateResult.Y >= ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y then UDim.new(0, UseTokensResult.Size.Size_2400) else UDim.new(0, 0)
	end, if FFlagHelpPageCCLModule then {
		UseSignalStateResult,
		p2.isSpatial,
		UseTokensResult.Size.Size_2400
	} else { UseSignalStateResult })
	local UseMemoResult4, UseMemoResult2_1, UseMemoResult3_1, UseMemoResult4_1, UseMemoResult5, UseMemoResult6 = ReactModule.useMemo(function() --[[ Line: 254 ]]
		-- upvalues: p2 (copy), FFlagHelpPageCCLModule (upval), ConstantsModule (upval), UseStateResult (copy), IsUseDeviceOrientationResultMatch (copy), UseStateResult1 (copy), UseStateResult3 (copy)
		if p2.isSpatial and not FFlagHelpPageCCLModule then
			return Vector2.new(1, 0.5), UDim2.new(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR
		elseif IsUseDeviceOrientationResultMatch then
			return Vector2.new(0, 0), UDim2.fromOffset(0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT
		else
			local ScaledUseStateResult = UseStateResult * ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE
			local ScaledUseStateResult1 = UseStateResult * (1 - ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE)
			
			return Vector2.new(1, 0), UDim2.fromScale(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), if UseStateResult1 == nil or UseStateResult3 == nil or UseStateResult1.X <= 0 or UseStateResult3.X <= 0 or ScaledUseStateResult >= UseStateResult1.X and ScaledUseStateResult1 >= UseStateResult3.X then 1 else math.min(ScaledUseStateResult / UseStateResult1.X, ScaledUseStateResult1 / UseStateResult3.X), ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT
		end
	end, if FFlagHelpPageCCLModule then {
		UseStateResult,
		p2.isSpatial,
		IsUseDeviceOrientationResultMatch,
		UseStateResult1,
		UseStateResult3
	} else { UseSignalStateResult, UseStateResult, p2.isSpatial })
	local COLSIZEPORTRAIT = if FFlagHelpPageCCLModule and IsUseDeviceOrientationResultMatch then ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SIZE_PORTRAIT elseif FFlagHelpPageCCLModule then ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SIZE else nil
	
	return if FFlagHelpPageCCLModule then ReactModule.createElement(DiagramLayoutViewModule, {
		testId = "Gamepad",
		diagramTestId = "VRGamepadInstructions",
		layout = {
			leftAnchor = UseMemoResult4,
			leftPosition = UseMemoResult2_1,
			rightAnchor = UseMemoResult3_1,
			rightPosition = UseMemoResult4_1,
			columnWidth = COLSIZEPORTRAIT,
			columnTopPadding = UDim.new(0, UseTokensResult.Padding.Large),
			columnScale = UseMemoResult5,
			diagramSize = Vector2.new(UseStateResult * UseMemoResult6, UseStateResult * UseMemoResult6 / ConstantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO),
			topPadding = UseMemoResult1
		},
		left = ReactModule.createElement(GamepadListModule, {
			layoutOrderReversed = false,
			addBlankIcon = false,
			controls = UseMemoResult,
			isSpatial = p2.isSpatial,
			platform = Platform
		}),
		right = ReactModule.createElement(GamepadListModule, {
			layoutOrderReversed = true,
			addBlankIcon = false,
			controls = UseMemoResult3,
			isSpatial = p2.isSpatial,
			platform = Platform
		}),
		diagram = ImageLabel,
		onSizeChanged = function(Frame) --[[ Line: 368 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end,
		onLeftSizeChanged = function(Frame) --[[ Line: 371 ]]
			-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy)
			if UseStateResult1 == nil then
				UseStateResult2_1(Frame.AbsoluteSize)
			end
		end,
		onRightSizeChanged = function(Frame) --[[ Line: 376 ]]
			-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
			if UseStateResult3 == nil then
				UseStateResult2_2(Frame.AbsoluteSize)
			end
		end
	}) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		padding = { top = UseMemoResult1 },
		onAbsoluteSizeChanged = function(Frame) --[[ Line: 389 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	}, {
		LeftColContainer = ReactModule.createElement(View, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = UseMemoResult4,
			Position = UseMemoResult2_1,
			scale = UseMemoResult5,
			onAbsoluteSizeChanged = function(Frame) --[[ Line: 398 ]]
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
				isSpatial = p2.isSpatial,
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
			onAbsoluteSizeChanged = function(Frame) --[[ Line: 429 ]]
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
						isSpatial = p2.isSpatial,
						platform = Platform
					})
				}),
				BottomRightColContainer = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
					BottomRightCol = ReactModule.createElement(GamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = true,
						controls = UseMemoResult2,
						isSpatial = p2.isSpatial,
						platform = Platform
					})
				})
			})
		})
	})
end)