local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameOnAxis = RoactFitComponents.FitFrameOnAxis
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetAvatarTypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarType)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXBlockMakeupEquipR6 = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlockMakeupEquipR6
local ComponentAssetsCircle29 = Images["component_assets/circle_29"]
local ComponentAssetsCircle25 = Images["component_assets/circle_25"]
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }
local AvatarTypeSwitch = RoactModule.PureComponent:extend("AvatarTypeSwitch")

local function resizeTextLabel(Label)
	-- upvalues: Text (copy)
	Label.Size = UDim2.new(UDim.new(0, Text.GetTextWidth(Label.Text, Label.Font, Label.TextSize)), (UDim.new(0, Label.TextSize)))
end

function AvatarTypeSwitch.resizeTextLabels(p1)
	-- upvalues: resizeTextLabel (copy)
	local Current = p1.r6Ref.current
	local Current1 = p1.r15Ref.current
	
	if Current and Current1 then
		resizeTextLabel(Current)
		resizeTextLabel(Current1)
		local Largest = math.max(Current.AbsoluteSize.x, Current1.AbsoluteSize.x)
		Current.Size = UDim2.new(0, Largest, 0, Current.Size.Y.Offset)
		Current1.Size = UDim2.new(0, Largest, 0, Current1.Size.Y.Offset)
		
		return
	end
end

function AvatarTypeSwitch:makeOnOverlayClosed(p1)
	-- upvalues: WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	return function()
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy)
		local WasLastInputGamepadResult = WasLastInputGamepadFunction()
		LogOnOverlayClosedFunction("AvatarTypeSwitch")
		
		if not FFlagAXMigrateAXToGlobalAutofocus and WasLastInputGamepadResult then
			p1.captureFocus()
		end
	end
end

function AvatarTypeSwitch.init(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), UtilsModule (copy), FFlagAXBlockMakeupEquipR6 (copy), AvatarScreen (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	p1.r6Ref = RoactModule.createRef()
	p1.r15Ref = RoactModule.createRef()
	p1.sizeBinding, p1.updateSizeBinding = RoactModule.createBinding(UDim2.fromScale(1, 1))
	
	function p1.absoluteSizeChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		p1.updateSizeBinding(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
	end
	
	function p1.toggleAvatarType(p2)
		-- upvalues: p1 (copy), ConstantsModule (upval), UtilsModule (upval), FFlagAXBlockMakeupEquipR6 (upval), AvatarScreen (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		local SendAnalyticsFunction: (any, any) -> () = p1.props.sendAnalytics
		local Analytics = p1.props.analytics
		local SetAvatarTypeFunction: (any) -> () = p1.props.setAvatarType
		local R15 = if p1.props.avatarType == ConstantsModule.AvatarType.R6 then ConstantsModule.AvatarType.R15 else ConstantsModule.AvatarType.R6
		local HasWrapLayer = UtilsModule.hasWrapLayer(p1.props.currentCharacter)
		local HasMakeup = if FFlagAXBlockMakeupEquipR6 then UtilsModule.hasMakeup(p1.props.equippedAssets) else nil
		
		if R15 == ConstantsModule.AvatarType.R6 and (HasWrapLayer or HasMakeup) then
			p1.props.navigation.navigate(AvatarScreen.LayeredClothingR6SwitchPrompt, {
				onOverlayClosed = p1:makeOnOverlayClosed(if FFlagAXMigrateAXToGlobalAutofocus then nil else p2)
			})
			
			return
		else
			SetAvatarTypeFunction(R15)
			SendAnalyticsFunction(Analytics.toggleAvatarType, R15)
		end
	end
end

function AvatarTypeSwitch.didMount(p1)
	p1:resizeTextLabels()
end

function AvatarTypeSwitch.renderWithProviders(p1, p2, p3, Callback, p4)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle29 (copy), SpringAnimatedItem (copy), SpringOptions (copy), ComponentAssetsCircle25 (copy), Focusable (copy), CursorKind (copy), FitFrameOnAxis (copy), RoactFitComponents (copy)
	local Theme = p3.Theme
	local _Font = p3.Font
	
	return RoactModule.createElement(ImageSetLabel, {
		Size = p1.sizeBinding,
		Image = ComponentAssetsCircle29,
		ImageColor3 = Theme.BackgroundUIDefault.Color,
		ImageTransparency = Theme.BackgroundUIDefault.Transparency,
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(14, 13, 15, 15),
		LayoutOrder = p1.props.LayoutOrder,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		AnimatedFrame = RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
			regularProps = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 1, 0)
			},
			animatedValues = {
				positionX = if p1.props.avatarType == ConstantsModule.AvatarType.R15 then 0.5 else 0
			},
			mapValuesToProps = function(p5)
				return { Position = UDim2.new(p5.positionX, 0, 0, 0) }
			end,
			springOptions = SpringOptions
		}, {
			SwitchImage = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Image = ComponentAssetsCircle25,
				ImageColor3 = Theme.UIEmphasis.Color,
				ImageTransparency = Theme.UIEmphasis.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 11, 13, 13)
			})
		}),
		SwitchButton = RoactModule.createElement(Focusable.ImageButton, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[RoactModule.Event.Activated] = function()
				-- upvalues: p1 (copy), p4 (copy)
				p1.toggleAvatarType(p4)
			end,
			SelectionImageObject = Callback(CursorKind.Toggle)
		}),
		LabelsContainer = RoactModule.createElement(FitFrameOnAxis, {
			axis = FitFrameOnAxis.Axis.Both,
			margin = RoactFitComponents.Rect.square(3),
			contentPadding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			BackgroundTransparency = 1,
			ZIndex = 2,
			[RoactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
		}, {
			R6Label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = _Font.Body.Font,
				Text = p2.r6Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextSize = _Font.CaptionHeader.RelativeSize * _Font.BaseSize,
				TextColor3 = if p1.props.avatarType == ConstantsModule.AvatarType.R6 then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
				LayoutOrder = 1,
				[RoactModule.Ref] = p1.r6Ref
			}),
			R15Label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Font = _Font.Body.Font,
				Text = p2.r15Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextSize = _Font.CaptionHeader.RelativeSize * _Font.BaseSize,
				TextColor3 = if p1.props.avatarType == ConstantsModule.AvatarType.R15 then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
				LayoutOrder = 2,
				[RoactModule.Ref] = p1.r15Ref
			})
		})
	})
end

function AvatarTypeSwitch.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy)
	return WithLocalizationFunction({
		r6Text = "Feature.Avatar.Label.R6",
		r15Text = "Feature.Avatar.Label.R15"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), WithSelectionCursorProviderFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), RoactGamepadModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: WithSelectionCursorProviderFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (upval), p2 (copy), RoactGamepadModule (upval)
			return WithSelectionCursorProviderFunction(function(p4)
				-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (upval), p2 (upval), p3 (copy), RoactGamepadModule (upval)
				return if FFlagAXMigrateAXToGlobalAutofocus then p1:renderWithProviders(p2, p3, p4) else RoactGamepadModule.withFocusController(function(p5)
					-- upvalues: p1 (upval), p2 (upval), p3 (upval), p4 (copy)
					return p1:renderWithProviders(p2, p3, p4, p5)
				end)
			end)
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return {
		equippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
		currentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	}
end, function(Callback)
	-- upvalues: SetAvatarTypeModule (copy), SendAnalyticsModule (copy)
	return {
		setAvatarType = function(p1)
			-- upvalues: Callback (copy), SetAvatarTypeModule (upval)
			Callback(SetAvatarTypeModule(p1))
		end,
		sendAnalytics = function(p1, p2)
			-- upvalues: Callback (copy), SendAnalyticsModule (upval)
			Callback(SendAnalyticsModule(p1, p2))
		end
	}
end)((WithNavigationFunction(RoactServices.connect({ analytics = AnalyticsModule })(AvatarTypeSwitch), nil)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)