local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DividerWithTextModule = require(AuthCommon.Components.DividerWithText)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ThirdPartyUserService (copy), UseLocalizationFunction (copy), View (copy), Text (copy), Image (copy), DividerWithTextModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ThirdPartyUserService (upval)
		if p1.onActivated then
			p1.onActivated()
		end
		if ThirdPartyUserService then
			ThirdPartyUserService:ShowAccountPicker()
		end
	end, { p1.onActivated })
	local UseLocalizationResult = UseLocalizationFunction({
		dividerText = p1.dividerTextKey,
		labelText = p1.labelTextKey
	})
	local Selection = {
		Selectable = not p1.isDisabled,
		NextSelectionUp = p1.nextSelectionUp
	}
	
	if p1.labelTextKey then
		local Scale: number = UseTokensResult.Config.UI.Scale
		local ContentInverseDefault: string = if p1.isDisabled then "content-inverse-default" else "content-emphasis"
		
		return ReactModule.createElement(View, {
			tag = "auto-xy",
			LayoutOrder = p1.layoutOrder,
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10 * Scale)
			}
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-default",
				Text = UseLocalizationResult.labelText
			}),
			SwitchAccountButton = ReactModule.createElement(View, {
				LayoutOrder = 2,
				testId = "--auth-platform-account-switch-button",
				tag = "row align-y-center gap-small auto-x radius-medium bg-over-media-0",
				Size = UDim2.fromOffset(0, UseTokensResult.Size.Size_1200),
				padding = Vector2.new(13 * Scale, 0),
				ref = p1.buttonRef,
				selection = Selection,
				isDisabled = p1.isDisabled,
				onActivated = UseResult
			}, {
				Image = ReactModule.createElement(Image, {
					LayoutOrder = 1,
					Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png",
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600),
					tag = ContentInverseDefault
				}),
				TextWrapper = ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy padding-right-xsmall" }, {
					Text = ReactModule.createElement(Text, {
						Text = p1.thirdPartyUserName,
						tag = "auto-xy text-label-large " .. ContentInverseDefault
					})
				})
			})
		})
	end
	local v1 = nil
	local v2 = nil
	if p1.isDisabled then
		v1 = "stroke-muted"
		v2 = "content-inverse-default"
	else
		v1 = "stroke-action-subtle"
		v2 = "content-default"
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Divider = ReactModule.createElement(DividerWithTextModule, {
			layoutOrder = 1,
			width = 0,
			height = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			size = UDim2.new(1, 0, 0, 0),
			font = UseTokensResult.Typography.CaptionSmall.Font,
			fontSize = UseTokensResult.Typography.CaptionSmall.FontSize,
			color3 = UseTokensResult.Color.Content.Muted.Color3,
			transparency = UseTokensResult.Color.Content.Muted.Transparency,
			text = if UseLocalizationResult then UseLocalizationResult.dividerText else "",
			padding = UseTokensResult.Size.Size_800
		}),
		SwitchAccountButton = ReactModule.createElement(View, {
			LayoutOrder = 2,
			testId = "--auth-platform-account-switch-button",
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200),
			tag = "row gap-medium align-y-center align-x-center radius-medium " .. v1,
			ref = p1.buttonRef,
			selection = Selection,
			isDisabled = p1.isDisabled,
			onActivated = UseResult
		}, {
			Image = ReactModule.createElement(Image, {
				LayoutOrder = 0,
				Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png",
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_400, UseTokensResult.Size.Size_400),
				tag = "align-x-center align-x-left align-y-center " .. v2
			}),
			Text = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = p1.thirdPartyUserName,
				tag = "auto-xy " .. v2
			})
		})
	})
end