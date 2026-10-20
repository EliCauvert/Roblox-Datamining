local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar.useBuyActionBarButtonProps)
local UseTimedOptionsFtuxFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useTimedOptionsFtux
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

function ActionBarWithRentalOption(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), UseTimedOptionsFtuxFunction (copy), ReactModule (copy), View (copy), Text (copy), IconButton (copy), IconSize (copy), FFlagAXMISEnableMultiShopping (copy), GetIconRichTextFunction (copy), IconName (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		buy = "Feature.Catalog.Action.Buy",
		rent = "Feature.Catalog.Action.Rent",
		rentalFtuxText = "Feature.Catalog.Title.RentalFtuxText"
	})
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	local Price = nil
	local Price1 = nil
	
	if p1.timedOptions then
		for _, timedOption in p1.timedOptions do
			if timedOption.days == 3 then
				Price = timedOption.price
			elseif timedOption.days == 0 then
				Price1 = timedOption.price
			end
		end
	end
	local UseTimedOptionsFtuxResult = UseTimedOptionsFtuxFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseTimedOptionsFtuxResult.shouldShow2OptionToolTipOnBuyActionBar())
	
	return ReactModule.createElement(View, { tag = "size-full-0", Size = UDim2.fromScale(1, 1) }, {
		Tooltip2OptionBanner = if UseStateResult then ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-xlarge padding-y-small bg-surface-300",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -UseTokensResult.Size.Size_1800)
		}, {
			Description = ReactModule.createElement(Text, {
				tag = "fill auto-y text-body-large text-align-x-left text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = UseLocalizationResult.rentalFtuxText
			}),
			DismissButton = ReactModule.createElement(IconButton, {
				icon = "icons/navigation/close",
				LayoutOrder = 2,
				size = IconSize.Small,
				onActivated = function()
					-- upvalues: UseTimedOptionsFtuxResult (copy), UseStateResult2 (copy)
					UseTimedOptionsFtuxResult.hide2OptionToolTipOnBuyActionBar()
					UseStateResult2(false)
				end
			})
		}) else nil,
		ActionBarFrame = ReactModule.createElement(View, {
			tag = "row padding-x-xlarge padding-top-large bg-surface-0 gap-medium",
			Size = UDim2.new(1, if FFlagEnableLeftNavOnConsole then UseSignalStateResult.right else 0, 0, UseTokensResult.Size.Size_1800 + (FFlagEnableLeftNavOnConsole and UseSignalStateResult.bottom or 0)),
			Position = UDim2.new(0, 0, 1, -UseTokensResult.Size.Size_1800),
			padding = if FFlagEnableLeftNavOnConsole then {
				right = UDim.new(0, UseSignalStateResult.right),
				bottom = UDim.new(0, UseSignalStateResult.bottom)
			} else nil
		}, {
			BuyButton = ReactModule.createElement(View, {
				tag = "col fill radius-medium bg-action-emphasis align-x-center align-y-center",
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
				onActivated = p1.buttonProps.onActivated
			}, {
				Label = ReactModule.createElement(Text, {
					RichText = true,
					tag = if FFlagAXMISEnableMultiShopping then "text-title-large content-action-emphasis auto-xy" else "text-heading-small content-action-emphasis auto-xy",
					Text = `{UseLocalizationResult.buy} {GetIconRichTextFunction(IconName.Robux)} {Price1 or ""}`
				})
			}),
			RentalButton = ReactModule.createElement(View, {
				tag = "col fill radius-medium bg-action-standard align-x-center align-y-center",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
				onActivated = p1.rentalButtonProps.onActivated
			}, {
				Label = ReactModule.createElement(Text, {
					RichText = true,
					tag = if FFlagAXMISEnableMultiShopping then "text-title-large content-default auto-xy" else "text-heading-small content-default auto-xy",
					Text = `{UseLocalizationResult.rent} {GetIconRichTextFunction(IconName.Robux)} {Price or ""}`
				})
			})
		})
	})
end

return ActionBarWithRentalOption