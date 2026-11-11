local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local TutilsModule = require(CorePackages.Packages.tutils)
local UseBodyDataCallbacksContextModule = require(Modules.AvatarExperience.Common.Context.useBodyDataCallbacksContext)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local TwoAxisSliderModule = require(Modules.AvatarExperience.AvatarEditor.Components.TwoAxisSlider)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _Vector2 = Vector2.new(224, 224)
local ComponentAssetsCircle17 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17"]

local function mapPositionToScales(Vector, WidthRules, HeightRules)
	return math.clamp(Vector.X * (WidthRules.max - WidthRules.min) + WidthRules.min, WidthRules.min, WidthRules.max), (math.clamp((1 - Vector.Y) * (HeightRules.max - HeightRules.min) + HeightRules.min, HeightRules.min, HeightRules.max))
end

local function mapScalesToPosition(p1, p2, WidthRules, HeightRules): Vector2
	return Vector2.new((p1 - WidthRules.min) / (WidthRules.max - WidthRules.min), 1 - (p2 - HeightRules.min) / (HeightRules.max - HeightRules.min))
end

local function selectScalesState(p1)
	-- upvalues: ConstantsModule (copy)
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local AvatarSetting = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.scalesRules]
	
	return {
		width = AvatarScales.width,
		height = AvatarScales.height,
		widthRules = AvatarSetting.width,
		heightRules = AvatarSetting.height
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseBodyDataCallbacksContextModule (copy), UseSelectorFunction (copy), selectScalesState (copy), TutilsModule (copy), ReactModule (copy), mapPositionToScales (copy), mapScalesToPosition (copy), SetAvatarScalesModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17 (copy), _Vector2 (copy), FFlagRenameDeprecatedUIBloxTokens (copy), TwoAxisSliderModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseBodyDataCallbacksContextModuleResult = UseBodyDataCallbacksContextModule()
	local UseSelectorResult = UseSelectorFunction(selectScalesState, TutilsModule.deepEqual)
	local WidthRules = UseSelectorResult.widthRules
	local HeightRules = UseSelectorResult.heightRules
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		width = UseSelectorResult.width,
		height = UseSelectorResult.height
	})
	
	return ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Image = ComponentAssetsCircle17,
		Size = UDim2.new(0, _Vector2.X, 0, _Vector2.Y),
		ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Surface.Surface_300 else UseTokensResult.Semantic.Color.BackgroundUi.Default).Color3,
		ImageTransparency = if Frame.isDisabled then 0.5 else (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Surface.Surface_300 else UseTokensResult.Semantic.Color.BackgroundUi.Default).Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		ref = Ref
	}, {
		TwoAxisSlider = ReactModule.createElement(TwoAxisSliderModule, {
			mapPositionToScales = ReactModule.useCallback(function(p1)
				-- upvalues: mapPositionToScales (upval), WidthRules (copy), HeightRules (copy)
				return mapPositionToScales(p1, WidthRules, HeightRules)
			end, { WidthRules, HeightRules }),
			mapScalesToPosition = ReactModule.useCallback(function(p1, p2)
				-- upvalues: mapScalesToPosition (upval), WidthRules (copy), HeightRules (copy)
				return mapScalesToPosition(p1, p2, WidthRules, HeightRules)
			end, { WidthRules, HeightRules }),
			setScales = ReactModule.useCallback(function(Width, Height)
				-- upvalues: UseBodyDataCallbacksContextModuleResult (copy), UseStateResult2 (copy)
				UseBodyDataCallbacksContextModuleResult.setAvatarScales({ width = Width, height = Height })
				UseStateResult2({ width = Width, height = Height })
			end, { UseBodyDataCallbacksContextModuleResult }),
			xScaleRules = WidthRules,
			yScaleRules = HeightRules,
			xScale = UseStateResult.width,
			yScale = UseStateResult.height,
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
					width = UseStateResult.width,
					height = UseStateResult.height
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