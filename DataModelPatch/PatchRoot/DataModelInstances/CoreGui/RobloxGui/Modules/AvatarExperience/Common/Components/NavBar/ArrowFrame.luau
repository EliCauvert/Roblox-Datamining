local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local ArrowNavModule = require(Modules.AvatarExperience.Common.Components.NavBar.ArrowNav)
local ArrowNavV2 = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.ArrowNavV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local FFlagAXMoveCatalogFilterToL1Navigation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation
local IconsActionsCycleLeft = Images["icons/actions/cycleLeft"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]

return ReactModule.memo(function(p1)
	-- upvalues: FFlagAXMoveCatalogFilterToL1Navigation (copy), UseTokensFunction (copy), ReactModule (copy), ArrowNavV2 (copy), ArrowNavModule (copy), IconsActionsCycleLeft (copy), ConstantsModule (copy), IconsActionsCycleRight (copy)
	local ZIndex = p1.ZIndex or 1
	local NoIsVisibleRight = p1.isVisibleRight == nil or (p1.isVisibleRight or true)
	local NoIsVisibleLeft = p1.isVisibleLeft == nil or (p1.isVisibleLeft or true)
	local DefaultUseProps = p1.defaultUseProps
	local OnPressHoldInputBegan = p1.onPressHoldInputBegan
	local OnPressHoldInputEnded = p1.onPressHoldInputEnded
	local SupportFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then p1.supportFilterButton else nil
	local IsFilterButtonVisible = if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then p1.isFilterButtonVisible else nil
	local UseTokensResult = if FFlagAXMoveCatalogFilterToL1Navigation then UseTokensFunction() else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = ZIndex,
		[ReactModule.Event.MouseEnter] = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		[ReactModule.Event.MouseLeave] = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}, {
		ArrowLeft = ReactModule.createElement(if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then ArrowNavV2 else ArrowNavModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then 0 else -6, 0.5, 0),
			Image = if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then nil else IconsActionsCycleLeft,
			Visible = UseStateResult and NoIsVisibleLeft,
			navDirection = ConstantsModule.NavigationDirection.IS_LEFT,
			defaultUseProps = DefaultUseProps,
			onPressHoldInputBegan = OnPressHoldInputBegan,
			onPressHoldInputEnded = OnPressHoldInputEnded,
			tokens = if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then UseTokensResult else nil
		}),
		ArrowRight = ReactModule.createElement(if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then ArrowNavV2 else ArrowNavModule, {
			AnchorPoint = Vector2.new(if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then 1 else 0, 0.5),
			Position = UDim2.new(1, if FFlagAXMoveCatalogFilterToL1Navigation and IsFilterButtonVisible then -(p1.filterButtonWidth or 0) else -30, 0.5, 0),
			Image = if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then nil else IconsActionsCycleRight,
			Visible = UseStateResult and NoIsVisibleRight,
			navDirection = ConstantsModule.NavigationDirection.IS_RIGHT,
			defaultUseProps = DefaultUseProps,
			onPressHoldInputBegan = OnPressHoldInputBegan,
			onPressHoldInputEnded = OnPressHoldInputEnded,
			tokens = if FFlagAXMoveCatalogFilterToL1Navigation and SupportFilterButton then UseTokensResult else nil
		})
	})
end)