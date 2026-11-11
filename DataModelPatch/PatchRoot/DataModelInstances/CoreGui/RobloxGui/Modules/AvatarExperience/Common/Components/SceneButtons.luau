local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SpringAnimatedItem = require(CorePackages.Packages.UIBlox).Utility.SpringAnimatedItem
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectTopBarHeightModule = require(Modules.LuaApp.Components.TopBar.Utils.selectTopBarHeight)
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local NamedRefsContextModule = require(Modules.AvatarExperience.Common.Context.NamedRefsContext)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local FullViewEntryButtonModule = require(Modules.AvatarExperience.Common.Components.FullViewEntryButton)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local _Vector2 = Vector2.new(8, 8)
local _Vector2_1 = Vector2.new(36, 36)
local config = { dampingRatio = 0.6, frequency = 4.25 }
local config1 = { dampingRatio = 1, frequency = 3.5 }

local function mapValuesToProps(p1)
	return { Size = UDim2.new(1, 0, 0, p1.height) }
end

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function _()
	-- upvalues: UseRouteNameFunction (copy), ReactModule (copy), NamedRefsContextModule (copy)
	return ReactModule.useContext(NamedRefsContextModule)[UseRouteNameFunction() .. "TopPanel"]
end

local function useButtonHeight(IsUIFullView, SceneHeight)
	-- upvalues: UseRouteNameFunction (copy), ReactModule (copy), NamedRefsContextModule (copy), UsePropertyFunction (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), GetUseSelectorDeepEqualsFunction (copy), DeviceOrientationMode (copy), _Vector2_1 (copy), _Vector2 (copy)
	local Size = UsePropertyFunction(ReactModule.useContext(NamedRefsContextModule)[UseRouteNameFunction() .. "TopPanel"], "Size") or UDim2.fromScale(0, 0)
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation, GetUseSelectorDeepEqualsFunction()) == DeviceOrientationMode.Portrait
	local NewY = SceneHeight
	
	if IsUIFullView and IsUseSelectorResultMatch then
		NewY += _Vector2_1.Y + _Vector2.Y + 14 + Size.Y.Offset
	end
	return NewY
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), SelectTopBarHeightModule (copy), GetUseSelectorDeepEqualsFunction (copy), selectDeviceOrientation (copy), DeviceOrientationMode (copy), useButtonHeight (copy), config1 (copy), config (copy), ReactModule (copy), SpringAnimatedItem (copy), mapValuesToProps (copy), FullViewEntryButtonModule (copy)
	local IsUIFullView = p1.isUIFullView or false
	local SceneHeight = p1.sceneHeight or 0
	local IsSceneFullView = p1.isSceneFullView
	local ChangeViewFunction = p1.changeViewFunction
	local ZIndex = p1.ZIndex
	local UseSelectorResult = UseSelectorFunction(SelectTopBarHeightModule, GetUseSelectorDeepEqualsFunction())
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation, GetUseSelectorDeepEqualsFunction()) == DeviceOrientationMode.Portrait
	local UseButtonHeightResult = useButtonHeight(IsUIFullView, SceneHeight)
	local Offset = 0
	local SpringOptions = nil
	
	if IsUIFullView then
		SpringOptions = config
	else
		SpringOptions = config1
		Offset = 11
	end
	return ReactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, IsUseSelectorResultMatch and UseSelectorResult or 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = ZIndex,
			Visible = ChangeViewFunction ~= nil and (IsUseSelectorResultMatch or IsSceneFullView)
		},
		animatedValues = { height = UseButtonHeightResult },
		mapValuesToProps = mapValuesToProps,
		springOptions = SpringOptions
	}, {
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, 0, 1, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 14)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset)
			}),
			FullViewEntryButton = ReactModule.createElement(FullViewEntryButtonModule, {
				LayoutOrder = 2,
				isUIFullView = p1.isUIFullView,
				isSceneFullView = p1.isSceneFullView,
				changeViewFunction = p1.changeViewFunction
			})
		})
	})
end