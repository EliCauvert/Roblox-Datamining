local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local FFlagAXMigrateSystemSliderToFoundationSlider = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider
local FFlagAXMakeSlidersSmoothWithGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad
local SystemSlider = require(CorePackages.Packages.UIBlox).App.Slider.SystemSlider
local HeadSlider = RoactModule.PureComponent:extend("HeadSlider")

function HeadSlider.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateSystemSliderToFoundationSlider (copy), MutedErrorModule (copy)
	p1.moveListen = nil
	p1.endListen = nil
	p1.scaleRef = RoactModule.createRef()
	
	if FFlagAXMigrateSystemSliderToFoundationSlider then
		function p1.convertHeadValueToSliderValue(Head, Min, Max)
			-- upvalues: MutedErrorModule (upval)
			if Max <= Min then
				MutedErrorModule("HeadSlider_DEPRECATED.lua convertHeadValueToSliderValue argument error: headMaxVal must be greater than headMinVal.")
				
				return 0.5
			else
				return (Head - Min) / (Max - Min)
			end
		end
		
		function p1.convertSliderValueToHeadValue(p2, Min, Max)
			return p2 * (Max - Min) + Min
		end
	end
end

function HeadSlider.render(p1)
	-- upvalues: FFlagAXMigrateSystemSliderToFoundationSlider (copy), RoactModule (copy), FoundationModule (copy), ConstantsModule (copy), FFlagAXMakeSlidersSmoothWithGamepad (copy), SystemSlider (copy)
	local AvatarType = p1.props.avatarType
	local Head = p1.props.head
	local HeadScaleRules = p1.props.headScaleRules
	local LayoutOrder = p1.props.LayoutOrder
	local ForwardRef = p1.props.forwardRef
	
	return if FFlagAXMigrateSystemSliderToFoundationSlider then RoactModule.createElement(FoundationModule.Slider, {
		LayoutOrder = LayoutOrder,
		range = NumberRange.new(0, 1),
		value = p1.convertHeadValueToSliderValue(Head, HeadScaleRules.min, HeadScaleRules.max),
		onValueChanged = function(p2)
			-- upvalues: p1 (copy), HeadScaleRules (copy)
			p1.props.setScales({
				head = p1.convertSliderValueToHeadValue(p2, HeadScaleRules.min, HeadScaleRules.max)
			})
		end,
		onDragStarted = p1.props.lockNavigationCallback,
		onDragEnded = p1.props.unlockNavigationCallback,
		isDisabled = AvatarType == ConstantsModule.AvatarType.R6,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = ForwardRef,
		step = if FFlagAXMakeSlidersSmoothWithGamepad then 0.01 else nil
	}) else RoactModule.createElement(SystemSlider, {
		layoutOrder = LayoutOrder,
		min = HeadScaleRules.min,
		max = HeadScaleRules.max,
		stepInterval = HeadScaleRules.increment,
		value = Head,
		onValueChanged = function(Head)
			-- upvalues: p1 (copy)
			p1.props.setScales({ head = Head })
		end,
		onDragStart = p1.props.lockNavigationCallback,
		onDragEnd = p1.props.unlockNavigationCallback,
		isDisabled = AvatarType == ConstantsModule.AvatarType.R6,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = ForwardRef
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: ConstantsModule (copy)
	return {
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
		head = p1.AvatarExperience.AvatarEditor.Character.AvatarScales.head,
		headScaleRules = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.scalesRules].head
	}
end, function(Callback)
	-- upvalues: SetAvatarScalesModule (copy), SendAnalyticsModule (copy), SetCurrentToastMessageModule (copy)
	return {
		setScales = function(p1)
			-- upvalues: Callback (copy), SetAvatarScalesModule (upval)
			Callback(SetAvatarScalesModule(p1))
		end,
		sendAnalytics = function(p1, p2)
			-- upvalues: Callback (copy), SendAnalyticsModule (upval)
			Callback(SendAnalyticsModule(p1, p2))
		end,
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p1))
		end
	}
end)((RoactServices.connect({ analytics = AnalyticsModule })(HeadSlider)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)