local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local TutilsModule = require(CorePackages.Packages.tutils)
local UseBodyDataCallbacksContextModule = require(Modules.AvatarExperience.Common.Context.useBodyDataCallbacksContext)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local SystemSlider = require(CorePackages.Packages.UIBlox).App.Slider.SystemSlider
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXMigrateSystemSliderToFoundationSlider = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider
local FFlagAXMakeSlidersSmoothWithGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad

local function selectHeadState(p1)
	-- upvalues: ConstantsModule (copy)
	return {
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
		head = p1.AvatarExperience.AvatarEditor.Character.AvatarScales.head,
		headScaleRules = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.scalesRules].head
	}
end

local Callback1: ((any, any, any) -> any)? = nil
local Callback: ((any, any, any) -> any)? = nil

if FFlagAXMigrateSystemSliderToFoundationSlider then
	Callback1 = function(Head, Min, Max)
		-- upvalues: MutedErrorModule (copy)
		if Max <= Min then
			MutedErrorModule("HeadSlider.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.")
			
			return 0.5
		else
			return (Head - Min) / (Max - Min)
		end
	end
	
	Callback = function(p1, Min, Max)
		return p1 * (Max - Min) + Min
	end
end
return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseSelectorFunction (copy), selectHeadState (copy), TutilsModule (copy), UseDispatchFunction (copy), UseBodyDataCallbacksContextModule (copy), ConstantsModule (copy), ReactModule (copy), FFlagAXMigrateSystemSliderToFoundationSlider (copy), Callback (ref), SetAvatarScalesModule (copy), FoundationModule (copy), Callback1 (ref), FFlagAXMakeSlidersSmoothWithGamepad (copy), SystemSlider (copy)
	local UseSelectorResult = UseSelectorFunction(selectHeadState, TutilsModule.deepEqual)
	local UseDispatchResult = UseDispatchFunction()
	local UseBodyDataCallbacksContextModuleResult = UseBodyDataCallbacksContextModule()
	local AvatarType = UseSelectorResult.avatarType
	local HeadScaleRules = UseSelectorResult.headScaleRules
	local IsDisabled = Frame.isDisabled or AvatarType == ConstantsModule.AvatarType.R6
	local UseStateResult, UseStateResult2 = ReactModule.useState({ head = UseSelectorResult.head })
	local UseResult = if FFlagAXMigrateSystemSliderToFoundationSlider then ReactModule.useCallback(function(p1)
		-- upvalues: Callback (upval), HeadScaleRules (copy), UseBodyDataCallbacksContextModuleResult (copy), UseStateResult2 (copy)
		local CallbackResult = Callback(p1, HeadScaleRules.min, HeadScaleRules.max)
		UseBodyDataCallbacksContextModuleResult.setAvatarScales({ head = CallbackResult })
		UseStateResult2({ head = CallbackResult })
	end, { UseBodyDataCallbacksContextModuleResult }) else ReactModule.useCallback(function(Head)
		-- upvalues: UseBodyDataCallbacksContextModuleResult (copy), UseStateResult2 (copy)
		UseBodyDataCallbacksContextModuleResult.setAvatarScales({ head = Head })
		UseStateResult2({ head = Head })
	end, { UseBodyDataCallbacksContextModuleResult, HeadScaleRules })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.lockNavigationCallback then
			Frame.lockNavigationCallback()
		end
	end, { Frame.lockNavigationCallback })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), UseBodyDataCallbacksContextModuleResult (copy), UseDispatchResult (copy), SetAvatarScalesModule (upval), UseStateResult (copy)
		if Frame.unlockNavigationCallback then
			Frame.unlockNavigationCallback()
		end
		UseBodyDataCallbacksContextModuleResult.setAvatarScales(nil)
		UseDispatchResult(SetAvatarScalesModule({ head = UseStateResult.head }))
	end, {
		Frame.unlockNavigationCallback,
		UseStateResult,
		UseBodyDataCallbacksContextModuleResult,
		UseDispatchResult
	})
	
	return if FFlagAXMigrateSystemSliderToFoundationSlider then ReactModule.createElement(FoundationModule.Slider, {
		LayoutOrder = Frame.LayoutOrder,
		range = NumberRange.new(0, 1),
		value = Callback1(UseStateResult.head, HeadScaleRules.min, HeadScaleRules.max),
		onValueChanged = UseResult,
		onDragStarted = UseResult1,
		onDragEnded = UseResult2,
		isDisabled = IsDisabled,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown,
		ref = Ref,
		step = if FFlagAXMakeSlidersSmoothWithGamepad then 0.01 else nil
	}) else ReactModule.createElement(SystemSlider, {
		layoutOrder = Frame.LayoutOrder,
		min = HeadScaleRules.min,
		max = HeadScaleRules.max,
		stepInterval = HeadScaleRules.increment,
		value = UseStateResult.head,
		onValueChanged = UseResult,
		onDragStart = UseResult1,
		onDragEnd = UseResult2,
		isDisabled = IsDisabled,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown,
		ref = Ref
	})
end))