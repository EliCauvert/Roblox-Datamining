local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local TutilsModule = require(CorePackages.Packages.tutils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseBodyDataCallbacksContextModule = require(Modules.AvatarExperience.Common.Context.useBodyDataCallbacksContext)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local TwoAxisSliderModule = require(Modules.AvatarExperience.AvatarEditor.Components.TwoAxisSlider)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _Vector2 = Vector2.new(224, 195)

local function mapPositionToScales(Vector, BodyTypeScaleRules, ProportionScaleRules)
	local ClampedValue = math.clamp((1 - Vector.Y) * (BodyTypeScaleRules.max - BodyTypeScaleRules.min) + BodyTypeScaleRules.min, BodyTypeScaleRules.min, BodyTypeScaleRules.max)
	
	return math.clamp((1 - (if ClampedValue == 0 then 0.5 else (Vector.X - 0.5 * Vector.Y) / ClampedValue)) * (ProportionScaleRules.max - ProportionScaleRules.min) + ProportionScaleRules.min, ProportionScaleRules.min, ProportionScaleRules.max), ClampedValue
end

local function mapScalesToPosition(p1, p2, BodyTypeScaleRules, ProportionScaleRules): Vector2
	local MinRatio = (p2 - BodyTypeScaleRules.min) / (BodyTypeScaleRules.max - BodyTypeScaleRules.min)
	
	return Vector2.new((1 - (p1 - ProportionScaleRules.min) / (ProportionScaleRules.max - ProportionScaleRules.min)) * MinRatio + (1 - MinRatio) * 0.5, 1 - MinRatio)
end

local function selectScalesState(p1)
	-- upvalues: ConstantsModule (copy)
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local AvatarSetting = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.scalesRules]
	
	return {
		bodyType = AvatarScales.bodyType,
		proportion = AvatarScales.proportion,
		bodyTypeScaleRules = AvatarSetting.bodyType,
		proportionScaleRules = AvatarSetting.proportion
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), selectScalesState (copy), TutilsModule (copy), UseBodyDataCallbacksContextModule (copy), UseDispatchFunction (copy), ReactModule (copy), mapPositionToScales (copy), mapScalesToPosition (copy), SetAvatarScalesModule (copy), _Vector2 (copy), FFlagRenameDeprecatedUIBloxTokens (copy), TwoAxisSliderModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(selectScalesState, TutilsModule.deepEqual)
	local UseBodyDataCallbacksContextModuleResult = UseBodyDataCallbacksContextModule()
	local UseDispatchResult = UseDispatchFunction()
	local BodyTypeScaleRules = UseSelectorResult.bodyTypeScaleRules
	local ProportionScaleRules = UseSelectorResult.proportionScaleRules
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		proportion = UseSelectorResult.proportion,
		bodyType = UseSelectorResult.bodyType
	})
	
	return ReactModule.createElement("ImageLabel", {
		Image = "rbxasset://textures/AvatarEditorImages/Sliders/body-type-slider-background.png",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(0, _Vector2.X, 0, _Vector2.X / (_Vector2.X / _Vector2.Y)),
		ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Surface.Surface_300 else UseTokensResult.Semantic.Color.BackgroundUi.Default).Color3,
		ImageTransparency = if Frame.isDisabled then 0.5 else (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Surface.Surface_300 else UseTokensResult.Semantic.Color.BackgroundUi.Default).Transparency,
		ref = Ref
	}, {
		TwoAxisSlider = ReactModule.createElement(TwoAxisSliderModule, {
			invertDPadX = true,
			mapPositionToScales = ReactModule.useCallback(function(p1)
				-- upvalues: mapPositionToScales (upval), BodyTypeScaleRules (copy), ProportionScaleRules (copy)
				return mapPositionToScales(p1, BodyTypeScaleRules, ProportionScaleRules)
			end, { BodyTypeScaleRules, ProportionScaleRules }),
			mapScalesToPosition = ReactModule.useCallback(function(p1, p2)
				-- upvalues: mapScalesToPosition (upval), BodyTypeScaleRules (copy), ProportionScaleRules (copy)
				return mapScalesToPosition(p1, p2, BodyTypeScaleRules, ProportionScaleRules)
			end, { BodyTypeScaleRules, ProportionScaleRules }),
			setScales = ReactModule.useCallback(function(Proportion, BodyType)
				-- upvalues: UseBodyDataCallbacksContextModuleResult (copy), UseStateResult2 (copy)
				UseBodyDataCallbacksContextModuleResult.setAvatarScales({ proportion = Proportion, bodyType = BodyType })
				UseStateResult2({ proportion = Proportion, bodyType = BodyType })
			end, { UseBodyDataCallbacksContextModuleResult }),
			xScaleRules = ProportionScaleRules,
			yScaleRules = BodyTypeScaleRules,
			xScale = UseStateResult.proportion,
			yScale = UseStateResult.bodyType,
			getBackgroundAbsolutePosition = ReactModule.useCallback(function()
				-- upvalues: Ref (copy)
				return if Ref and Ref.current then Ref.current.AbsolutePosition else nil
			end, {}),
			getBackgroundAbsoluteSize = ReactModule.useCallback(function()
				-- upvalues: Ref (copy)
				return if Ref and Ref.current then Ref.current.AbsoluteSize else nil
			end, {}),
			isDisabled = Frame.isDisabled,
			onDragStart = ReactModule.useCallback(function()
				-- upvalues: Frame (copy)
				if Frame.lockNavigationCallback then
					Frame.lockNavigationCallback()
				end
			end, { Frame.lockNavigationCallback }),
			onDragEnd = ReactModule.useCallback(function()
				-- upvalues: Frame (copy), UseBodyDataCallbacksContextModuleResult (copy), UseDispatchResult (copy), SetAvatarScalesModule (upval), UseStateResult (copy)
				if Frame.unlockNavigationCallback then
					Frame.unlockNavigationCallback()
				end
				UseBodyDataCallbacksContextModuleResult.setAvatarScales(nil)
				UseDispatchResult(SetAvatarScalesModule({
					proportion = UseStateResult.proportion,
					bodyType = UseStateResult.bodyType
				}))
			end, {
				Frame.unlockNavigationCallback,
				UseStateResult,
				UseBodyDataCallbacksContextModuleResult,
				UseDispatchResult
			})
		})
	})
end))