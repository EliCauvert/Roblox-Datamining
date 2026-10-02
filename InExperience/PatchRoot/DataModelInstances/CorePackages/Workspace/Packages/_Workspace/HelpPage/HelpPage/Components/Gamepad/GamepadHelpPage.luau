local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local displayModule = require(parent_1.Display)
local _ = require(parent.Configs.ConfigTypes)
local _ = require(parent.Components.Common.ActionText)
local gamepadListModule = require(parent.Components.Gamepad.GamepadList)
local diagramLayoutViewModule = require(parent.Components.Common.DiagramLayoutView)
local constantsModule = require(parent.Constants)
local useKeybindsModule = require(parent.Hooks.useKeybinds)
local signalsReactModule = require(parent_1.SignalsReact)
local useDeviceOrientation = require(parent_1.RobloxAppHooks).useDeviceOrientation
local deviceOrientationMode = require(parent_1.RobloxAppEnums).DeviceOrientationMode
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagHelpPageCCLModule = require(parent.Flags.FFlagHelpPageCCL)

local function _(p1, p2, p3)
	-- upvalues: fFlagHelpPageCCLModule (ref), constantsModule (ref)
	local gamepadInput = p1.gamepadInput
	
	if gamepadInput == nil then
		return nil
	end
	local var1 = if fFlagHelpPageCCLModule and p2 and gamepadInput.spatialGamepadInput ~= nil then gamepadInput.spatialGamepadInput else gamepadInput.input
	
	if var1 == nil then
		if p2 then
			return gamepadInput.spatialGamepadInput
		elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p3] then
			return gamepadInput.playstationInput
		end
		var1 = gamepadInput.xboxInput
	end
	return var1
end

local _ = function(p1)
	return tonumber(string.match(p1, "^AbilityAction(%d+)$"))
end

local function getResolvedControls(p1, p2, p3)
	-- upvalues: fFlagHelpPageCCLModule (ref), constantsModule (ref)
	local t = {}
	local t_1 = {}
	
	local function addControl(p4)
		-- upvalues: p2 (ref), p3 (ref), fFlagHelpPageCCLModule (copy), constantsModule (copy), t (ref)
		local var1
		local gamepadInput = p4.gamepadInput
		
		if gamepadInput == nil then
			var1 = nil
		else
			local var2 = if fFlagHelpPageCCLModule and p2 and gamepadInput.spatialGamepadInput ~= nil then gamepadInput.spatialGamepadInput else gamepadInput.input
			
			if var2 == nil then
				var2 = if p2 then gamepadInput.spatialGamepadInput elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p3] then gamepadInput.playstationInput else gamepadInput.xboxInput
			end
			var1 = var2
		end
		if var1 == nil then return end
		for i, v in ipairs(var1) do
			if not p2 or constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[v] ~= nil then
				local list = { v }
				local var3 = tostring(v)
				local var4 = t[var3]
				
				if var4 == nil then
					t[var3] = {
						label = p4.label,
						gamepadInput = { input = list },
						actionLabels = { { label = p4.label, disabled = p4.disabled } }
					}
				else
					table.insert(var4.actionLabels, { label = p4.label, disabled = p4.disabled })
				end
			end
		end
	end
	
	for i, v in p1 do
		local var5 = tonumber(string.match(i, "^AbilityAction(%d+)$"))
		
		if var5 == nil then
			addControl(v)
		else
			t_1[var5] = v
		end
	end
	local t_2 = {}
	
	for i_1 in t_1 do
		table.insert(t_2, i_1)
	end
	table.sort(t_2)
	
	for i_2, v_1 in ipairs(t_2) do
		addControl(t_1[v_1])
	end
	return t
end

return reactModule.memo(function(p5)
	-- upvalues: userInputService (ref), useDeviceOrientation (ref), useKeybindsModule (ref), useTokens (ref), reactModule (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), deviceOrientationMode (ref), fFlagHelpPageCCLModule (ref), getResolvedControls (ref), diagramLayoutViewModule (ref), gamepadListModule (ref), view (ref)
	local var6 = if p5.getPlatform then p5.getPlatform() else userInputService:GetPlatform()
	local var7 = useDeviceOrientation()
	local controls = useKeybindsModule().controls
	local var8 = useTokens()
	local var9, var10 = reactModule.useState(1e999)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = signalsReactModule.useSignalState(signalsReactModule.useSignalState(displayModule.GetDisplayStore).getViewportSize)
	local var16 = not p5.isSpatial
	
	if var16 and var15.X >= constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X then
		var16 = var15.Y < constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y and var7 == deviceOrientationMode.Portrait
	end
	local var17, var18, var19 = reactModule.useMemo(function()
		-- upvalues: fFlagHelpPageCCLModule (copy), getResolvedControls (copy), controls (ref), p5 (ref), var6 (ref), constantsModule (copy)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		if fFlagHelpPageCCLModule then
			for i, v in pairs(getResolvedControls(controls, p5.isSpatial, var6)) do
				local input = v.gamepadInput.input
				
				if input ~= nil and #input > 0 then
					if constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[input[1]] <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
						t[i] = v
					else
						t_2[i] = v
					end
				end
			end
			return t, t_1, t_2
		else
			for i, v in controls do
				if v.gamepadInput ~= nil then
					local gamepadInput = v.gamepadInput
					local input = gamepadInput.input
					
					if input == nil then
						input = if p5.isSpatial then gamepadInput.spatialGamepadInput elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[var6] then gamepadInput.playstationInput else gamepadInput.xboxInput
					end
					if input ~= nil and #input > 0 then
						local var20 = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[input[1]]
						
						if var20 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
							t[i] = v
						elseif var20 <= constantsModule.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[var6] then
							t_1[i] = v
						else
							t_2[i] = v
						end
					end
				end
			end
			return t, t_1, t_2
		end
	end, if fFlagHelpPageCCLModule then { controls, var6, p5.isSpatial } else { controls })
	local imageLabel = reactModule.createElement("ImageLabel", {
		Name = "GamepadImage",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = if p5.isSpatial then "rbxasset://textures/ui/Gamepad/VRController.png" else "rbxasset://textures/ui/Gamepad/Controller@3x.png"
	})
	local var21 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), var15 (ref), constantsModule (copy), var8 (ref)
		return if p5.isSpatial or var15.X >= constantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X and var15.Y >= constantsModule.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y then UDim.new(0, var8.Size.Size_2400) else UDim.new(0, 0)
	end, if fFlagHelpPageCCLModule then { var15, p5.isSpatial, var8.Size.Size_2400 } else { var15 })
	local var22, var23, var24, var25, var26, var27 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), fFlagHelpPageCCLModule (copy), constantsModule (copy), var9 (ref), var16 (ref), var11 (ref), var13 (ref)
		if p5.isSpatial and not fFlagHelpPageCCLModule then
			return Vector2.new(1, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, var9 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, var9 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR
		elseif var16 then
			return Vector2.new(0, 0), UDim2.fromOffset(0, var9 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, var9 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT
		end
		local var28 = var9 * constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE
		local var29 = var9 * (1 - constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE)
		
		return Vector2.new(1, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(constantsModule.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), if not (var11 == nil or var13 == nil or (var11.X <= 0 or var13.X <= 0) or var28 >= var11.X and var29 >= var13.X) then math.min(var28 / var11.X, var29 / var13.X) else 1, constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT
	end, if fFlagHelpPageCCLModule then {
		var9,
		p5.isSpatial,
		var16,
		var11,
		var13
	} else { var15, var9, p5.isSpatial })
	
	return if fFlagHelpPageCCLModule then reactModule.createElement(diagramLayoutViewModule, {
		testId = "Gamepad",
		diagramTestId = "VRGamepadInstructions",
		layout = {
			leftAnchor = var22,
			leftPosition = var23,
			rightAnchor = var24,
			rightPosition = var25,
			columnWidth = if fFlagHelpPageCCLModule and var16 then constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SIZE_PORTRAIT elseif fFlagHelpPageCCLModule then constantsModule.HELP_PAGE.GAMEPAD_SIZES.COL_SIZE else nil,
			columnTopPadding = UDim.new(0, var8.Padding.Large),
			columnScale = var26,
			diagramSize = Vector2.new(var9 * var27, var9 * var27 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO),
			topPadding = var21
		},
		left = reactModule.createElement(gamepadListModule, {
			layoutOrderReversed = false,
			addBlankIcon = false,
			controls = var17,
			isSpatial = p5.isSpatial,
			platform = var6
		}),
		right = reactModule.createElement(gamepadListModule, {
			layoutOrderReversed = true,
			addBlankIcon = false,
			controls = var19,
			isSpatial = p5.isSpatial,
			platform = var6
		}),
		diagram = imageLabel,
		onSizeChanged = function(p6)
			-- upvalues: var10 (ref)
			var10(p6.AbsoluteSize.X)
		end,
		onLeftSizeChanged = function(p6)
			-- upvalues: var11 (ref), var12 (ref)
			if var11 == nil then
				var12(p6.AbsoluteSize)
			end
		end,
		onRightSizeChanged = function(p6)
			-- upvalues: var13 (ref), var14 (ref)
			if var13 == nil then
				var14(p6.AbsoluteSize)
			end
		end
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		padding = { top = var21 },
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var10 (ref)
			var10(value.AbsoluteSize.X)
		end
	}, {
		LeftColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var22,
			Position = var23,
			scale = var26,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var11 (ref), var12 (ref)
				if var11 == nil then
					var12(value.AbsoluteSize)
				end
			end
		}, {
			LeftCol = reactModule.createElement(gamepadListModule, {
				layoutOrderReversed = false,
				addBlankIcon = false,
				controls = var17,
				isSpatial = p5.isSpatial,
				platform = var6
			})
		}),
		ImageComponentContainer = reactModule.createElement(view, {
			testId = "VRGamepadInstructions",
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromOffset(var9 * var27, var9 * var27 / constantsModule.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO)
		}, { ImageComponent = imageLabel }),
		RightColContainer = reactModule.createElement(view, {
			tag = "auto-xy padding-top-large",
			AnchorPoint = var24,
			Position = var25,
			scale = var26,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var13 (ref), var14 (ref)
				if var13 == nil then
					var14(value.AbsoluteSize)
				end
			end
		}, {
			RightCol = reactModule.createElement(view, { tag = "col auto-xy" }, {
				TopRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
					TopRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = false,
						controls = var19,
						isSpatial = p5.isSpatial,
						platform = var6
					})
				}),
				BottomRightColContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, {
					BottomRightCol = reactModule.createElement(gamepadListModule, {
						layoutOrderReversed = true,
						addBlankIcon = true,
						controls = var18,
						isSpatial = p5.isSpatial,
						platform = var6
					})
				})
			})
		})
	})
end)