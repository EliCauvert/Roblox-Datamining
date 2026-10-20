local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local TwoAxisSliderModule = require(Modules.AvatarExperience.AvatarEditor.Components.TwoAxisSlider)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _Vector2 = Vector2.new(224, 224)
local ComponentAssetsCircle17 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17"]
local BodySizeSlider = RoactModule.PureComponent:extend("BodySizeSlider")

function BodySizeSlider.init(p1)
	local ForwardRef = p1.props.forwardRef
	
	function p1.mapPositionToScales(Vector)
		-- upvalues: p1 (copy)
		local WidthRules = p1.props.widthRules
		local HeightRules = p1.props.heightRules
		
		return math.clamp(Vector.X * (WidthRules.max - WidthRules.min) + WidthRules.min, WidthRules.min, WidthRules.max), (math.clamp((1 - Vector.Y) * (HeightRules.max - HeightRules.min) + HeightRules.min, HeightRules.min, HeightRules.max))
	end
	
	function p1.mapScalesToPosition(p2, p3): Vector2
		-- upvalues: p1 (copy)
		local WidthRules = p1.props.widthRules
		local HeightRules = p1.props.heightRules
		
		return Vector2.new((p2 - WidthRules.min) / (WidthRules.max - WidthRules.min), 1 - (p3 - HeightRules.min) / (HeightRules.max - HeightRules.min))
	end
	
	function p1.setScales(Width, Height)
		-- upvalues: p1 (copy)
		p1.props.setScales({ width = Width, height = Height })
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

function BodySizeSlider.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17 (copy), _Vector2 (copy), TwoAxisSliderModule (copy)
	local Width = p1.props.width
	local Height = p1.props.height
	local WidthRules = p1.props.widthRules
	local HeightRules = p1.props.heightRules
	local LayoutOrder = p1.props.LayoutOrder
	local LockNavigationCallback = p1.props.lockNavigationCallback
	local UnlockNavigationCallback = p1.props.unlockNavigationCallback
	local IsDisabled = p1.props.isDisabled
	local ForwardRef = p1.props.forwardRef
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), ComponentAssetsCircle17 (upval), _Vector2 (upval), IsDisabled (copy), LayoutOrder (copy), ForwardRef (copy), TwoAxisSliderModule (upval), p1 (copy), WidthRules (copy), HeightRules (copy), Width (copy), Height (copy), LockNavigationCallback (copy), UnlockNavigationCallback (copy)
		local Theme = p2.Theme
		
		return RoactModule.createElement(ImageSetLabel, {
			Image = ComponentAssetsCircle17,
			Size = UDim2.new(0, _Vector2.X, 0, _Vector2.Y),
			BackgroundTransparency = 1,
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = if IsDisabled then 0.5 else Theme.BackgroundUIDefault.Transparency,
			LayoutOrder = LayoutOrder,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			ZIndex = 2,
			[RoactModule.Ref] = ForwardRef
		}, {
			TwoAxisSlider = RoactModule.createElement(TwoAxisSliderModule, {
				mapPositionToScales = p1.mapPositionToScales,
				mapScalesToPosition = p1.mapScalesToPosition,
				setScales = p1.setScales,
				xScaleRules = WidthRules,
				yScaleRules = HeightRules,
				xScale = Width,
				yScale = Height,
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
		height = AvatarScales.height,
		width = AvatarScales.width,
		heightRules = AvatarSetting.height,
		widthRules = AvatarSetting.width,
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	}
end, function(Callback)
	-- upvalues: SetAvatarScalesModule (copy)
	return {
		setScales = function(p1)
			-- upvalues: Callback (copy), SetAvatarScalesModule (upval)
			Callback(SetAvatarScalesModule(p1))
		end
	}
end)(BodySizeSlider)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)