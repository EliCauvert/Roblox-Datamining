local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local BadgeModule = require(Foundation.Components.Badge)
local IconModule = require(Foundation.Components.Icon)
local _ = require(Foundation.Enums.IconSize)
local ImageModule = require(Foundation.Components.Image)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local _ = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Enums.StatusIndicatorVariant)
local _ = require(Foundation.Components.Types)
local GetIconScaleModule = require(Foundation.Utility.getIconScale)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local Uiblox = require(Parent.BuilderIcons).Migration.uiblox

return {
	resolve = function(IconName, IconName1, IconName2, p1)
		local Config = if IconName2 == nil then if typeof(IconName) == "string" then { iconName = IconName } else IconName elseif typeof(IconName2) == "string" then { iconName = IconName2 } else {
			iconName = IconName2.name,
			iconVariant = IconName2.variant
		}
		
		if p1 ~= nil then
			return Config, {
				type = "StatusIndicator",
				variant = p1.variant,
				shape = p1.shape,
				value = p1.value,
				max = p1.max
			}
		elseif typeof(IconName1) == "string" then
			return Config, { iconName = IconName1 }
		else
			return Config, IconName1
		end
	end,
	TabItemAccessory = function(Frame: Frame)
		-- upvalues: ReactModule (copy), BadgeModule (copy), StatusIndicatorModule (copy), IsBuilderOrMigratedIconFunction (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), GetIconScaleModule (copy), ImageModule (copy)
		local Accessory = Frame.accessory
		
		if Accessory.type == "Badge" then
			return ReactModule.createElement(BadgeModule, {
				text = Accessory.text,
				icon = Accessory.icon,
				variant = Accessory.variant,
				LayoutOrder = Frame.LayoutOrder,
				testId = Frame.testId
			})
		elseif Accessory.type == "StatusIndicator" then
			return ReactModule.createElement(StatusIndicatorModule, if Accessory.value then {
				value = Accessory.value,
				variant = Accessory.variant,
				max = Accessory.max,
				LayoutOrder = Frame.LayoutOrder,
				testId = Frame.testId
			} else {
				variant = Accessory.variant,
				shape = Accessory.shape,
				LayoutOrder = Frame.LayoutOrder,
				testId = Frame.testId
			})
		elseif IsBuilderOrMigratedIconFunction(Accessory.iconName) then
			return ReactModule.createElement(IconModule, {
				name = if IsMigratedFunction(Accessory.iconName) then Uiblox[Accessory.iconName].name else Accessory.iconName,
				variant = if IsMigratedFunction(Accessory.iconName) then Uiblox[Accessory.iconName].variant else Accessory.iconVariant,
				size = Frame.iconSize,
				style = Frame.contentStyle,
				LayoutOrder = Frame.LayoutOrder,
				testId = Frame.testId
			})
		else
			local IconScaleModule, IconScaleModule2 = GetIconScaleModule(Accessory.iconName, Frame.iconSize)
			
			return if IconScaleModule then ReactModule.createElement(ImageModule, {
				Image = Accessory.iconName,
				Size = UDim2.fromOffset(IconScaleModule.X, IconScaleModule.Y),
				imageStyle = Frame.contentStyle,
				scale = IconScaleModule2,
				LayoutOrder = Frame.LayoutOrder,
				testId = Frame.testId
			}) else nil
		end
	end
}