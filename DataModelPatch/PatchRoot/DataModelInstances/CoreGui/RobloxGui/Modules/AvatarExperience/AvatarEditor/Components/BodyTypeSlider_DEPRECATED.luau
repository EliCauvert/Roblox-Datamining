local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local TwoAxisSliderModule = require(Modules.AvatarExperience.AvatarEditor.Components.TwoAxisSlider)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _Vector2 = Vector2.new(224, 195)
local BodyTypeSlider = RoactModule.PureComponent:extend("BodyTypeSlider")

function BodyTypeSlider.init(p1)
	local ForwardRef = p1.props.forwardRef
	
	function p1.mapPositionToScales(Vector)
		-- upvalues: p1 (copy)
		local BodyTypeScaleRules = p1.props.bodyTypeScaleRules
		local ClampedValue = math.clamp((1 - Vector.Y) * (BodyTypeScaleRules.max - BodyTypeScaleRules.min) + BodyTypeScaleRules.min, BodyTypeScaleRules.min, BodyTypeScaleRules.max)
		local ProportionScaleRules = p1.props.proportionScaleRules
		
		return math.clamp((1 - (if ClampedValue == 0 then 0.5 else (Vector.X - 0.5 * Vector.Y) / ClampedValue)) * (ProportionScaleRules.max - ProportionScaleRules.min) + ProportionScaleRules.min, ProportionScaleRules.min, ProportionScaleRules.max), ClampedValue
	end
	
	function p1.mapScalesToPosition(p2, p3): Vector2
		-- upvalues: p1 (copy)
		local BodyTypeScaleRules = p1.props.bodyTypeScaleRules
		local MinRatio = (p3 - BodyTypeScaleRules.min) / (BodyTypeScaleRules.max - BodyTypeScaleRules.min)
		local ProportionScaleRules = p1.props.proportionScaleRules
		
		return Vector2.new((1 - (p2 - ProportionScaleRules.min) / (ProportionScaleRules.max - ProportionScaleRules.min)) * MinRatio + 0.5 * (1 - MinRatio), 1 - MinRatio)
	end
	
	function p1.setScales(Proportion, BodyType)
		-- upvalues: p1 (copy)
		p1.props.setScales({ proportion = Proportion, bodyType = BodyType })
	end
	
	function p1.getBackgroundAbsolutePosition()
		-- upvalues: ForwardRef (copy)
		local Value = ForwardRef:getValue()
		
		return if Value then Value.AbsolutePosition else nil
	end
	
	function p1.getBackgroundAbsoluteSize()
		-- upvalues: ForwardRef (copy)
		local Value = ForwardRef:getValue()
		
		return if Value then Value.AbsoluteSize else nil
	end
end

function BodyTypeSlider.render(p1)
	-- upvalues: WithStyleFunction (copy), _Vector2 (copy), RoactModule (copy), TwoAxisSliderModule (copy)
	local Proportion = p1.props.proportion
	local BodyType = p1.props.bodyType
	local ProportionScaleRules = p1.props.proportionScaleRules
	local BodyTypeScaleRules = p1.props.bodyTypeScaleRules
	local LayoutOrder = p1.props.LayoutOrder
	local LockNavigationCallback = p1.props.lockNavigationCallback
	local UnlockNavigationCallback = p1.props.unlockNavigationCallback
	local ForwardRef = p1.props.forwardRef
	
	return WithStyleFunction(function(p2)
		-- upvalues: _Vector2 (upval), p1 (copy), RoactModule (upval), LayoutOrder (copy), ForwardRef (copy), TwoAxisSliderModule (upval), ProportionScaleRules (copy), BodyTypeScaleRules (copy), Proportion (copy), BodyType (copy), LockNavigationCallback (copy), UnlockNavigationCallback (copy)
		local Theme = p2.Theme
		local IsDisabled = p1.props.isDisabled
		
		return RoactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Image = "rbxasset://textures/AvatarEditorImages/Sliders/body-type-slider-background.png",
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(0, _Vector2.X, 0, _Vector2.X / (_Vector2.X / _Vector2.Y)),
			BackgroundTransparency = 1,
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = if IsDisabled then 0.5 else Theme.BackgroundUIDefault.Transparency,
			[RoactModule.Ref] = ForwardRef
		}, {
			TwoAxisSlider = RoactModule.createElement(TwoAxisSliderModule, {
				invertDPadX = true,
				mapPositionToScales = p1.mapPositionToScales,
				mapScalesToPosition = p1.mapScalesToPosition,
				setScales = p1.setScales,
				xScaleRules = ProportionScaleRules,
				yScaleRules = BodyTypeScaleRules,
				xScale = Proportion,
				yScale = BodyType,
				getBackgroundAbsolutePosition = p1.getBackgroundAbsolutePosition,
				getBackgroundAbsoluteSize = p1.getBackgroundAbsoluteSize,
				isDisabled = IsDisabled,
				onDragStart = LockNavigationCallback,
				onDragEnd = UnlockNavigationCallback
			})
		})
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: ConstantsModule (copy)
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local AvatarSetting = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.scalesRules]
	
	return {
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
		bodyType = AvatarScales.bodyType,
		proportion = AvatarScales.proportion,
		bodyTypeScaleRules = AvatarSetting.bodyType,
		proportionScaleRules = AvatarSetting.proportion
	}
end, function(Callback)
	-- upvalues: SetAvatarScalesModule (copy)
	return {
		setScales = function(p1)
			-- upvalues: Callback (copy), SetAvatarScalesModule (upval)
			Callback(SetAvatarScalesModule(p1))
		end
	}
end)(BodyTypeSlider)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)