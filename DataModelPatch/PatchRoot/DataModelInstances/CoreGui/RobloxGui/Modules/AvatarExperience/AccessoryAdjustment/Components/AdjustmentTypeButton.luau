local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics)
local _ = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local SetAdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable

return function(Frame)
	-- upvalues: UseStyleFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseDispatchFunction (copy), ReactModule (copy), Focusable (copy), SendRefinementAnalyticsModule (copy), SetAdjustmentTypeModule (copy), ImageSetLabel (copy), IconSize (copy), Images (copy)
	local Theme = UseStyleFunction().Theme
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local Color = Theme.BackgroundUIDefault.Color
	local Transparency = Theme.BackgroundUIDefault.Transparency
	
	if Frame.isSelected then
		Color = Theme.UIDefault.Color
		Transparency = Theme.UIDefault.Transparency
	end
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(Focusable.ImageButton, {
		Size = UDim2.fromScale(0.3333333333333333, 1),
		BackgroundColor3 = Color,
		BackgroundTransparency = Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.buttonRef,
		NextSelectionLeft = Frame.NextSelectionLeft,
		NextSelectionRight = Frame.NextSelectionRight,
		NextSelectionUp = Frame.NextSelectionUp,
		[ReactModule.Event.Activated] = function()
			-- upvalues: UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), Frame (copy), SetAdjustmentTypeModule (upval)
			UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineAccessoryAdjustTap(Frame.adjustmentType)))
			UseDispatchResult(SetAdjustmentTypeModule(Frame.adjustmentType))
		end
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Image = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
			Image = Images[Frame.iconName],
			ImageColor3 = Theme.IconDefault.Color,
			ImageTransparency = Theme.IconDefault.Transparency
		})
	})
end