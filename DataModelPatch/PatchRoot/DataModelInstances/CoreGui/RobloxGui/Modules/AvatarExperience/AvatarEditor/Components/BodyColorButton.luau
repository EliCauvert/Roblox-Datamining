local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local SetBodyColor3Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SelectRangeIdForSelectedBodyPartsModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts)
local SelectButtonColor3Module = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectButtonColor3)
local SelectButtonSliderValueModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue)
local SelectDefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local BodyColorButton = RoactModule.PureComponent:extend("BodyColorButton")
local IconsActionsSelectOn = UIBloxModule.App.ImageSet.Images["icons/actions/selectOn"]
BodyColorButton.validateProps = TModule.strictInterface({
	rangeId = TModule.optional(TModule.string),
	userId = TModule.optional(TModule.string),
	sliderValue = TModule.number,
	isBodyColorButtonSelected = TModule.boolean,
	buttonColor3 = TModule.Color3,
	sendAnalytics = TModule.callback,
	setBodyColor3 = TModule.callback,
	analytics = TModule.table,
	disabled = TModule.optional(TModule.boolean)
})

function BodyColorButton.onActivated(p1)
	p1.props.setBodyColor3(p1.props.buttonColor3, p1.props.rangeId, p1.props.sliderValue, p1.props.analytics)
end

function BodyColorButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), IconsActionsSelectOn (copy), WithSelectionCursorProviderFunction (copy), Focusable (copy), CursorKind (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), ImageSetLabel (upval), IconsActionsSelectOn (upval), WithSelectionCursorProviderFunction (upval), Focusable (upval), CursorKind (upval)
		local Theme = p2.Theme
		local Frame = if p1.props.isBodyColorButtonSelected then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0.8, 0, 0.8, 0),
			BackgroundTransparency = Theme.Overlay.Transparency,
			BackgroundColor3 = Theme.Overlay.Color
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			Checkmark = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 30, 0, 30),
				Image = IconsActionsSelectOn,
				ImageColor3 = Theme.ContextualPrimaryContent.Color,
				ImageTransparency = Theme.ContextualPrimaryContent.Transparency
			})
		}) else nil
		local ButtonColor3 = p1.props.buttonColor3
		assert(ButtonColor3 ~= nil, "backgroundColor3 is nil")
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: RoactModule (upval), Focusable (upval), ButtonColor3 (copy), CursorKind (upval), p1 (upval), Frame (ref), Theme (copy)
			return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				TextButton = RoactModule.createElement(Focusable.TextButton, {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 0,
					BackgroundColor3 = ButtonColor3,
					Text = "",
					BorderSizePixel = 0,
					AutoButtonColor = false,
					ZIndex = 2,
					SelectionImageObject = Callback(CursorKind.SkinToneCircle),
					[RoactModule.Event.Activated] = if p1.props.disabled then nil else function(_)
						-- upvalues: p1 (upval)
						p1:onActivated()
					end
				}, {
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
					EquippedFrame = Frame
				}),
				Border = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 1,
					Size = UDim2.new(1, 2, 1, 2),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency
				}, {
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
				})
			})
		end)
	end)
end

return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: SelectDefaultTryOnBodyColorsToggledModule (copy), SelectButtonColor3Module (copy), SelectRangeIdForSelectedBodyPartsModule (copy), UtilsModule (copy), SelectButtonSliderValueModule (copy)
	local SelectDefaultTryOnBodyColorsToggledModuleResult = SelectDefaultTryOnBodyColorsToggledModule(p1)
	
	return {
		sliderValue = SelectButtonSliderValueModule(p1.AvatarExperience, p2.rangeId),
		buttonColor3 = SelectButtonColor3Module(p1.AvatarExperience, p2.rangeId),
		isBodyColorButtonSelected = SelectRangeIdForSelectedBodyPartsModule(p1) == p2.rangeId and not SelectDefaultTryOnBodyColorsToggledModuleResult,
		userId = UtilsModule.getUserId(p1),
		disabled = SelectDefaultTryOnBodyColorsToggledModuleResult
	}
end, function(Callback)
	-- upvalues: SendAnalyticsModule (copy), SetBodyColor3Module (copy)
	return {
		sendAnalytics = function(p1, p2)
			-- upvalues: Callback (copy), SendAnalyticsModule (upval)
			Callback(SendAnalyticsModule(p1, p2))
		end,
		setBodyColor3 = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), SetBodyColor3Module (upval)
			Callback(SetBodyColor3Module(p1, p2, p3, p4))
		end
	}
end)((RoactServices.connect({ analytics = AnalyticsModule })(BodyColorButton))))