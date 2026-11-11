local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local StateLayerMode = FoundationModule.Enums.StateLayerMode
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ConstantsModule = require(PeopleReactView.Constants)
local GetFFlagFixPeoplePageCardTooltipFunction = require(Parent.PeopleService).getService("Flags").GetFFlagFixPeoplePageCardTooltip

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetFFlagFixPeoplePageCardTooltipFunction (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), View (copy), StateLayerMode (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local _UDim2 = UDim2.fromScale(1.75, 0)
	
	if GetFFlagFixPeoplePageCardTooltipFunction() then
		local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
		_UDim2 = ReactModule.useMemo(function(): UDim2
			-- upvalues: IsUseDeviceOrientationResultMatch (copy)
			return if IsUseDeviceOrientationResultMatch then UDim2.fromScale(1, 0) else UDim2.fromScale(1.75, 0)
		end, { IsUseDeviceOrientationResultMatch })
	end
	local UseLocalizationResult = UseLocalizationFunction({
		title = ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.BUY_WHAT_THEYRE_WEARING,
		description = ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_AVATAR_TO_CHECKOUT_ITEMS,
		secondaryDescription = ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_USERNAME_TO_VIEW_PROFILE,
		ok = ConstantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.OK
	})
	
	return ReactModule.createElement(View, {
		tag = "auto-y radius-medium",
		ZIndex = 2,
		backgroundStyle = UseTokensResult.Inverse.Surface.Surface_0,
		Position = UDim2.new(1, UseTokensResult.Size.Size_300, 0, 0),
		Size = _UDim2,
		stateLayer = { mode = StateLayerMode.Inverse }
	}, {
		Content = ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-medium padding-medium" }, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-large content-inverse-emphasis text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = UseLocalizationResult.title
			}),
			Description = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap",
				LayoutOrder = 2,
				Text = UseLocalizationResult.description
			}),
			SecondaryDescription = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap",
				LayoutOrder = 3,
				Text = UseLocalizationResult.secondaryDescription
			}),
			Action = ReactModule.createElement(Button, {
				LayoutOrder = 4,
				text = UseLocalizationResult.ok,
				size = InputSize.Medium,
				width = UDim.new(1, 0),
				variant = ButtonVariant.Emphasis,
				onActivated = p1.action
			})
		}),
		Arrow = ReactModule.createElement(View, {
			tag = "size-200 radius-xsmall",
			Rotation = 45,
			backgroundStyle = UseTokensResult.Inverse.Surface.Surface_0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, 1, 0.5, 0),
			stateLayer = { mode = StateLayerMode.Inverse }
		})
	})
end