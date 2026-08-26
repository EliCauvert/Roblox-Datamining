local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useDeviceOrientation = require(parent.RobloxAppHooks).useDeviceOrientation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local inputSize = foundationModule.Enums.InputSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local stateLayerMode = foundationModule.Enums.StateLayerMode
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local constantsModule = require(peopleReactView.Constants)
local getFFlagFixPeoplePageCardTooltip = peopleServiceModule.getService("Flags").GetFFlagFixPeoplePageCardTooltip

return function(p1)
	-- upvalues: useTokens (ref), getFFlagFixPeoplePageCardTooltip (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), reactModule (ref), useLocalization (ref), constantsModule (ref), view (ref), stateLayerMode (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local uDim2 = UDim2.fromScale(1.75, 0)
	
	if getFFlagFixPeoplePageCardTooltip() then
		local var2 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
		uDim2 = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return if var2 then UDim2.fromScale(1, 0) else UDim2.fromScale(1.75, 0)
		end, { var2 })
	end
	local var3 = useLocalization({
		title = constantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.BUY_WHAT_THEYRE_WEARING,
		description = constantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_AVATAR_TO_CHECKOUT_ITEMS,
		secondaryDescription = constantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_USERNAME_TO_VIEW_PROFILE,
		ok = constantsModule.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.OK
	})
	
	return reactModule.createElement(view, {
		tag = "auto-y radius-medium",
		ZIndex = 2,
		backgroundStyle = var1.Inverse.Surface.Surface_0,
		Position = UDim2.new(1, var1.Size.Size_300, 0, 0),
		Size = uDim2,
		stateLayer = { mode = stateLayerMode.Inverse }
	}, {
		Content = reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium padding-medium" }, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-title-large content-inverse-emphasis text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = var3.title
			}),
			Description = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap",
				LayoutOrder = 2,
				Text = var3.description
			}),
			SecondaryDescription = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap",
				LayoutOrder = 3,
				Text = var3.secondaryDescription
			}),
			Action = reactModule.createElement(button, {
				LayoutOrder = 4,
				text = var3.ok,
				size = inputSize.Medium,
				width = UDim.new(1, 0),
				variant = buttonVariant.Emphasis,
				onActivated = p1.action
			})
		}),
		Arrow = reactModule.createElement(view, {
			tag = "size-200 radius-xsmall",
			Rotation = 45,
			backgroundStyle = var1.Inverse.Surface.Surface_0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, 1, 0.5, 0),
			stateLayer = { mode = stateLayerMode.Inverse }
		})
	})
end