local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local IconsActionsReset = UIBloxModule.App.ImageSet.Images["icons/actions/reset"]
local _UDim = UDim.new(0, 10)

local function ResetButtonDefault(p1)
	-- upvalues: UseStyleFunction (copy), RoactModule (copy), ConstantsModule (copy), ImageSetButton (copy), IconsActionsReset (copy)
	local Theme = UseStyleFunction().Theme
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -ConstantsModule.RightMargin, 0, -9),
		Size = UDim2.fromOffset(34, 34),
		Visible = not p1.lastInputIsGamepad
	}, {
		Button = RoactModule.createElement(ImageSetButton, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 1),
			Image = IconsActionsReset,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			[RoactModule.Event.Activated] = p1.onActivated
		})
	})
end

local function ResetButtonVR(p1)
	-- upvalues: UseStyleFunction (copy), RoactModule (copy), ConstantsModule (copy), _UDim (copy), ImageSetButton (copy), IconsActionsReset (copy)
	local Theme = UseStyleFunction().Theme
	
	return RoactModule.createElement("Frame", {
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(1, -ConstantsModule.VerticalList.Width / 2, 0, 0),
		Size = UDim2.fromOffset(ConstantsModule.Tile.MoreIconSize, ConstantsModule.Tile.MoreIconSize),
		Visible = not p1.lastInputIsGamepad,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Button = RoactModule.createElement(ImageSetButton, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 1),
			Image = IconsActionsReset,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			[RoactModule.Event.Activated] = p1.onActivated
		})
	})
end

local ResetButton = RoactModule.PureComponent:extend("ResetButton")
ResetButton.validateProps = TModule.strictInterface({
	lastInputIsGamepad = TModule.boolean,
	isDragging = TModule.boolean,
	navigation = TModule.table,
	analytics = TModule.table,
	sendAnalytics = TModule.callback
})
ResetButton.defaultProps = { lastInputIsGamepad = false, isDragging = false }

function ResetButton.init(p1)
	-- upvalues: AvatarScreen (copy)
	function p1.openResetConfirmation()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		if not p1.props.isDragging then
			p1.props.sendAnalytics(p1.props.analytics.avatarRefineLayersResetTap)
			p1.props.navigation.navigate(AvatarScreen.ResetLayeredItemsSortPrompt)
			
			return
		end
	end
end

function ResetButton.render(p1)
	-- upvalues: IsVRAppBuildFunction (copy), RoactModule (copy), ResetButtonVR (copy), ResetButtonDefault (copy)
	return if IsVRAppBuildFunction() then RoactModule.createElement(ResetButtonVR, {
		onActivated = p1.openResetConfirmation,
		lastInputIsGamepad = p1.props.lastInputIsGamepad
	}) else RoactModule.createElement(ResetButtonDefault, {
		onActivated = p1.openResetConfirmation,
		lastInputIsGamepad = p1.props.lastInputIsGamepad
	})
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SendRefinementAnalyticsModule (copy)
	return {
		sendAnalytics = function(p1)
			-- upvalues: Callback (copy), SendRefinementAnalyticsModule (upval)
			Callback(SendRefinementAnalyticsModule(p1))
		end
	}
end)((RoactServices.connect({ analytics = AnalyticsModule })((WithNavigationFunction(ResetButton, nil))))))