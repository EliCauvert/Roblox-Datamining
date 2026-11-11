local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SystemSlider = UIBloxModule.App.Slider.SystemSlider
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectLowerAdjustmentLimitsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Selectors.selectLowerAdjustmentLimits)
local SelectUpperAdjustmentLimitsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Selectors.selectUpperAdjustmentLimits)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ConstantsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local AdjustmentSliderTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)
local AxisTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AxisType)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local AXAdjustmentSnapThreshold = game:DefineFastInt("AXAdjustmentSnapThreshold", 5)
local AXAddVRContainerRefToAASlider = game:DefineFastFlag("AXAddVRContainerRefToAASlider", false)
local FFlagAXMakeSlidersSmoothWithGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad
local ComponentAssetsCircle21 = UIBloxModule.App.ImageSet.Images["component_assets/circle_21"]
local config = {
	[AdjustmentSliderTypeModule.PositionX] = {
		AdjustmentKey = "position",
		LimitKey = "xPosition",
		Invert = true,
		Text = AxisTypeModule.X,
		Color = ConstantsModule.XAxisColor
	},
	[AdjustmentSliderTypeModule.PositionY] = {
		AdjustmentKey = "position",
		LimitKey = "yPosition",
		Text = AxisTypeModule.Y,
		Color = ConstantsModule.YAxisColor
	},
	[AdjustmentSliderTypeModule.PositionZ] = {
		AdjustmentKey = "position",
		LimitKey = "zPosition",
		Invert = true,
		Text = AxisTypeModule.Z,
		Color = ConstantsModule.ZAxisColor
	},
	[AdjustmentSliderTypeModule.RotationX] = {
		AdjustmentKey = "rotation",
		LimitKey = "xRotation",
		Invert = true,
		Text = AxisTypeModule.X,
		Color = ConstantsModule.XAxisColor
	},
	[AdjustmentSliderTypeModule.RotationY] = {
		AdjustmentKey = "rotation",
		LimitKey = "yRotation",
		Text = AxisTypeModule.Y,
		Color = ConstantsModule.YAxisColor
	},
	[AdjustmentSliderTypeModule.RotationZ] = {
		AdjustmentKey = "rotation",
		LimitKey = "zRotation",
		Text = AxisTypeModule.Z,
		Color = ConstantsModule.ZAxisColor
	},
	[AdjustmentSliderTypeModule.Scale] = {
		Text = "",
		AdjustmentKey = "scale",
		LimitKey = "xScale",
		Color = ConstantsModule.ZAxisColor
	}
}

local function _(p1, p2, p3)
	-- upvalues: config (copy)
	local AdjustmentKey = config[p1].AdjustmentKey
	local LimitKey = config[p1].LimitKey
	
	return p2[AdjustmentKey][LimitKey], p3[AdjustmentKey][LimitKey]
end

local function SliderImage(Theme, AdjustmentSliderType, XOffset)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle21 (copy), config (copy), ConstantsModule (copy)
	return ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, XOffset, 0, XOffset),
		Image = ComponentAssetsCircle21,
		ImageColor3 = config[AdjustmentSliderType].Color,
		ImageTransparency = Theme.IconEmphasis.Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0)
	}, {
		Letter = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = true,
			ZIndex = 2,
			Size = UDim2.new(1, -3, 1, -3),
			Text = config[AdjustmentSliderType].Text,
			FontFace = ConstantsModule.FontFace,
			TextColor3 = Color3.new(1, 1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		})
	})
end

local _ = function(p1, p2, p3, p4, p5)
	local Negated = if p1 < p4 then -math.abs((p1 - p4) / (p2 - p4)) else math.abs((p1 - p4) / (p3 - p4))
	
	if p5 then
		Negated = -Negated
	end
	return Negated * 100
end

local _ = function(p1: number, p2, p3, p4, p5): number
	if p5 then
		p1 = -p1
	end
	return if p1 < 0 then p4 - math.abs(p1 / 100) * math.abs(p4 - p2) else p4 + math.abs(p1 / 100) * math.abs(p3 - p4)
end

local function v24(p1)
	return p1.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected
end

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider then
	local _ = function(p1, _, p2, p3, p4): number
		-- upvalues: MutedErrorModule (copy)
		if p2 <= p3 then
			MutedErrorModule("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.")
			
			return 0.5
		else
			local v1: number = if p1 < p3 then 0.5 - (p3 - p1) / (p2 - p3) / 2 else (p1 - p3) / (p2 - p3) / 2 + 0.5
			
			return if p4 then 1 - v1 else v1
		end
	end
	
	local _ = function(p1: number, _, p2, p3, p4)
		if p4 then
			p1 = 1 - p1
		end
		return if p1 < 0.5 then p3 - (0.5 - p1) / 0.5 * (p2 - p3) else p3 + (p1 - 0.5) / 0.5 * (p2 - p3)
	end
	
	return function(Frame)
		-- upvalues: UseStyleFunction (copy), AXAddVRContainerRefToAASlider (copy), UseIsSpatialFunction (copy), ReactModule (copy), UseSelectorFunction (copy), SelectLowerAdjustmentLimitsModule (copy), SelectUpperAdjustmentLimitsModule (copy), v24 (copy), ConstantsModule (copy), ResponsiveModule (copy), config (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseDesignTokensFunction (copy), AdjustmentSliderTypeModule (copy), MutedErrorModule (copy), SliderImage (copy), FoundationModule (copy), FFlagAXMakeSlidersSmoothWithGamepad (copy)
		local Theme = UseStyleFunction().Theme
		local UseIsSpatialResult = if AXAddVRContainerRefToAASlider then UseIsSpatialFunction() else nil
		local Ref = if AXAddVRContainerRefToAASlider and UseIsSpatialResult then ReactModule.createRef() else nil
		local UseSelectorResult = UseSelectorFunction(SelectLowerAdjustmentLimitsModule)
		local UseSelectorResult1 = UseSelectorFunction(SelectUpperAdjustmentLimitsModule)
		local IsNotAdjustmentSliderTypeToAdjustmentTypeEntryMatch = ConstantsModule.AdjustmentSliderTypeToAdjustmentType[Frame.adjustmentSliderType] ~= UseSelectorFunction(v24)
		local UseRefResult = ReactModule.useRef(false)
		local IsUseLastInputResultMatch = nil
		IsUseLastInputResultMatch = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional
		local AdjustmentSliderType = Frame.adjustmentSliderType
		local AdjustmentKey = config[AdjustmentSliderType].AdjustmentKey
		local LimitKey = config[AdjustmentSliderType].LimitKey
		local UseSelectorResultEntry = UseSelectorResult[AdjustmentKey][LimitKey]
		local UseSelectorResultEntry1: number = UseSelectorResult1[AdjustmentKey][LimitKey]
		local UseDesignTokensResult = UseDesignTokensFunction(function(p1)
			-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
			return {
				smallIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Semantic.Icon.Size.Small,
				padding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200
			}
		end)
		local v1: number = if Frame.adjustmentSliderType == AdjustmentSliderTypeModule.Scale then 1 else 0
		local Invert = config[Frame.adjustmentSliderType].Invert
		local UseStateFunction = ReactModule.useState
		local SliderValue: number = Frame.sliderValue
		local v2 = nil
		
		if UseSelectorResultEntry1 <= v1 then
			MutedErrorModule("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.")
			v2 = 0.5
		else
			local NewSliderValue: number = if SliderValue < v1 then 0.5 - (v1 - SliderValue) / (UseSelectorResultEntry1 - v1) / 2 else (SliderValue - v1) / (UseSelectorResultEntry1 - v1) / 2 + 0.5
			v2 = if Invert then 1 - NewSliderValue else NewSliderValue
		end
		local UseStateResult, UseStateResult2 = UseStateFunction(v2)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), Frame (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy), MutedErrorModule (upval)
			local SliderValue = Frame.sliderValue
			local v3 = nil
			
			if UseSelectorResultEntry1 <= v1 then
				MutedErrorModule("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.")
				v3 = 0.5
			else
				local NewSliderValue: number = if SliderValue < v1 then 0.5 - (v1 - SliderValue) / (UseSelectorResultEntry1 - v1) / 2 else (SliderValue - v1) / (UseSelectorResultEntry1 - v1) / 2 + 0.5
				v3 = if Invert then 1 - NewSliderValue else NewSliderValue
			end
			UseStateResult2(v3)
		end, {
			Frame.sliderValue,
			UseSelectorResultEntry,
			UseSelectorResultEntry1,
			v1,
			Invert
		})
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			LayoutOrder = Frame.LayoutOrder,
			ref = if AXAddVRContainerRefToAASlider and UseIsSpatialResult then Ref else nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, UseDesignTokensResult.padding),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			SliderImage = SliderImage(Theme, Frame.adjustmentSliderType, UseDesignTokensResult.smallIconSize),
			Slider = ReactModule.createElement(FoundationModule.Slider, {
				layoutOrder = 2,
				ref = Frame.sliderRef,
				NextSelectionDown = Frame.NextSelectionDown,
				NextSelectionUp = Frame.NextSelectionUp,
				isDisabled = IsNotAdjustmentSliderTypeToAdjustmentTypeEntryMatch,
				range = NumberRange.new(0, 1),
				value = UseStateResult,
				onDragStarted = function()
					-- upvalues: UseRefResult (copy)
					UseRefResult.current = true
				end,
				onValueChanged = function(p1: number)
					-- upvalues: IsUseLastInputResultMatch (ref), UseStateResult (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy), Frame (copy), UseStateResult2 (copy)
					if math.abs(0.5 - p1) < 0.025 then
						if IsUseLastInputResultMatch then
							if p1 < 0.5 and UseStateResult < p1 or p1 > 0.5 and p1 < UseStateResult then
								p1 = 0.5
							elseif UseStateResult == 0.5 then
								p1 = if p1 > 0.5 then 0.525 else 0.475
							end
						else
							p1 = 0.5
						end
					end
					local v3: number = p1
					
					if Invert then
						v3 = 1 - v3
					end
					Frame.updateCharacterCallback(if v3 < 0.5 then v1 - (0.5 - v3) / 0.5 * (UseSelectorResultEntry1 - v1) else v1 + (v3 - 0.5) / 0.5 * (UseSelectorResultEntry1 - v1), Frame.adjustmentSliderType)
					UseStateResult2(p1)
				end,
				onDragEnded = function()
					-- upvalues: UseRefResult (copy), UseStateResult (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy), Frame (copy)
					if not UseRefResult.current then return end
					local UseStateResult1: number = UseStateResult
					
					if Invert then
						UseStateResult1 = 1 - UseStateResult1
					end
					Frame.setSliderValuesCallback(if UseStateResult1 < 0.5 then v1 - (0.5 - UseStateResult1) / 0.5 * (UseSelectorResultEntry1 - v1) else v1 + (UseStateResult1 - 0.5) / 0.5 * (UseSelectorResultEntry1 - v1), Frame.adjustmentSliderType)
					UseRefResult.current = false
				end,
				width = UDim.new(1, -UseDesignTokensResult.padding - UseDesignTokensResult.smallIconSize),
				step = if FFlagAXMakeSlidersSmoothWithGamepad then 0.01 else nil
			})
		})
	end
else
	return function(Frame)
		-- upvalues: UseStyleFunction (copy), AXAddVRContainerRefToAASlider (copy), UseIsSpatialFunction (copy), ReactModule (copy), UseSelectorFunction (copy), SelectLowerAdjustmentLimitsModule (copy), SelectUpperAdjustmentLimitsModule (copy), v24 (copy), ConstantsModule (copy), ResponsiveModule (copy), config (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseDesignTokensFunction (copy), AdjustmentSliderTypeModule (copy), SliderImage (copy), SystemSlider (copy), AXAdjustmentSnapThreshold (copy)
		local Theme = UseStyleFunction().Theme
		local UseIsSpatialResult = if AXAddVRContainerRefToAASlider then UseIsSpatialFunction() else nil
		local Ref = if AXAddVRContainerRefToAASlider and UseIsSpatialResult then ReactModule.createRef() else nil
		local UseSelectorResult = UseSelectorFunction(SelectLowerAdjustmentLimitsModule)
		local UseSelectorResult1 = UseSelectorFunction(SelectUpperAdjustmentLimitsModule)
		local IsNotAdjustmentSliderTypeToAdjustmentTypeEntryMatch = ConstantsModule.AdjustmentSliderTypeToAdjustmentType[Frame.adjustmentSliderType] ~= UseSelectorFunction(v24)
		local UseRefResult = ReactModule.useRef(false)
		local IsUseLastInputResultMatch = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional
		local AdjustmentSliderType = Frame.adjustmentSliderType
		local AdjustmentKey = config[AdjustmentSliderType].AdjustmentKey
		local LimitKey = config[AdjustmentSliderType].LimitKey
		local UseSelectorResultEntry: number = UseSelectorResult[AdjustmentKey][LimitKey]
		local UseSelectorResultEntry1: number = UseSelectorResult1[AdjustmentKey][LimitKey]
		local UseDesignTokensResult = UseDesignTokensFunction(function(p1)
			-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
			return {
				smallIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Semantic.Icon.Size.Small,
				padding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200
			}
		end)
		local v1: number = if Frame.adjustmentSliderType == AdjustmentSliderTypeModule.Scale then 1 else 0
		local Invert = config[Frame.adjustmentSliderType].Invert
		local UseStateFunction = ReactModule.useState
		local SliderValue: number = Frame.sliderValue
		local Negated = if v1 > SliderValue then -math.abs((SliderValue - v1) / (UseSelectorResultEntry - v1)) else math.abs((SliderValue - v1) / (UseSelectorResultEntry1 - v1))
		
		if Invert then
			Negated = -Negated
		end
		local UseStateResult, UseStateResult2 = UseStateFunction(Negated * 100)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), Frame (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy)
			local SliderValue = Frame.sliderValue
			local Negated = if SliderValue < v1 then -math.abs((SliderValue - v1) / (UseSelectorResultEntry - v1)) else math.abs((SliderValue - v1) / (UseSelectorResultEntry1 - v1))
			
			if Invert then
				Negated = -Negated
			end
			UseStateResult2(Negated * 100)
		end, {
			Frame.sliderValue,
			UseSelectorResultEntry,
			UseSelectorResultEntry1,
			v1,
			Invert
		})
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			LayoutOrder = Frame.LayoutOrder,
			ref = if AXAddVRContainerRefToAASlider and UseIsSpatialResult then Ref else nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, UseDesignTokensResult.padding),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			SliderImage = SliderImage(Theme, Frame.adjustmentSliderType, UseDesignTokensResult.smallIconSize),
			Slider = ReactModule.createElement(SystemSlider, {
				min = -100,
				max = 100,
				stepInterval = 2,
				layoutOrder = 2,
				ref = Frame.sliderRef,
				NextSelectionDown = Frame.NextSelectionDown,
				NextSelectionUp = Frame.NextSelectionUp,
				isDisabled = IsNotAdjustmentSliderTypeToAdjustmentTypeEntryMatch,
				value = UseStateResult,
				onDragStart = function()
					-- upvalues: UseRefResult (copy)
					UseRefResult.current = true
				end,
				onValueChanged = function(Value: number)
					-- upvalues: AXAdjustmentSnapThreshold (upval), IsUseLastInputResultMatch (copy), UseStateResult (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy), Frame (copy), UseStateResult2 (copy)
					if math.abs(Value) < AXAdjustmentSnapThreshold then
						if IsUseLastInputResultMatch then
							if Value < 0 and UseStateResult < Value or Value > 0 and Value < UseStateResult then
								Value = 0
							elseif UseStateResult == 0 then
								Value = (if Value < 0 then -1 else 1) * AXAdjustmentSnapThreshold
							end
						else
							Value = 0
						end
					end
					local Value1: number = Value
					
					if Invert then
						Value1 = -Value1
					end
					Frame.updateCharacterCallback(if Value1 < 0 then v1 - math.abs(Value1 / 100) * math.abs(v1 - UseSelectorResultEntry) else v1 + math.abs(Value1 / 100) * math.abs(UseSelectorResultEntry1 - v1), Frame.adjustmentSliderType)
					UseStateResult2(Value)
				end,
				onDragEnd = function()
					-- upvalues: UseRefResult (copy), UseStateResult (copy), UseSelectorResultEntry (copy), UseSelectorResultEntry1 (copy), v1 (copy), Invert (copy), Frame (copy)
					if not UseRefResult.current then return end
					local UseStateResult1: number = UseStateResult
					
					if Invert then
						UseStateResult1 = -UseStateResult1
					end
					Frame.setSliderValuesCallback(if UseStateResult1 < 0 then v1 - math.abs(UseStateResult1 / 100) * math.abs(v1 - UseSelectorResultEntry) else v1 + math.abs(UseStateResult1 / 100) * math.abs(UseSelectorResultEntry1 - v1), Frame.adjustmentSliderType)
					UseRefResult.current = false
				end,
				width = UDim.new(1, -UseDesignTokensResult.padding - UseDesignTokensResult.smallIconSize),
				containerRef = if AXAddVRContainerRefToAASlider and UseIsSpatialResult then Ref else nil
			})
		})
	end
end