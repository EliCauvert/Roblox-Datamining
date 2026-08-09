local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local dividerWithTextModule = require(authCommon.Components.DividerWithText)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 24 ]]
	-- upvalues: useTokens (ref), reactModule (ref), thirdPartyUserService (ref), useLocalization (ref), view (ref), dividerWithTextModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref), image (ref), text (ref)
	local var8, var9
	local var5 = useTokens()
	local var6 = reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: thirdPartyUserService (copy)
		if thirdPartyUserService then
			thirdPartyUserService:ShowAccountPicker()
		end
	end, {})
	local var7 = useLocalization({ dividerText = p0.dividerTextKey })
	local _ = nil
	local _ = nil
	
	if p0.isDisabled then
		var8 = "stroke-muted"
		var9 = "content-inverse-default"
	else
		var8 = "stroke-action-subtle"
		var9 = "content-default"
	end
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge align-x-center auto-xy size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Divider = reactModule.createElement(dividerWithTextModule, {
			layoutOrder = 1,
			width = 0,
			height = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			size = UDim2.new(1, 0, 0, 0),
			font = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.CaptionSmall.Font else var5.Semantic.Typography.Footer.Font,
			fontSize = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.CaptionSmall.FontSize else var5.Semantic.Typography.Footer.FontSize,
			color3 = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Muted else var5.Semantic.Color.Text.Muted).Color3,
			transparency = (if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Muted else var5.Semantic.Color.Text.Muted).Transparency,
			text = if var7 then var7.dividerText else "",
			padding = var5.Size.Size_800
		}),
		SwitchAccountButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var5.Size.Size_1200),
			tag = "row gap-medium align-y-center align-x-center radius-medium " .. var8,
			selection = { Selectable = not p0.isDisabled },
			isDisabled = p0.isDisabled,
			onActivated = var6
		}, {
			Image = reactModule.createElement(image, {
				LayoutOrder = 0,
				Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png",
				Size = UDim2.fromOffset(if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_400 else var5.Semantic.Icon.Size.Small, if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_400 else var5.Semantic.Icon.Size.Small),
				tag = "align-x-center align-x-left align-y-center " .. var9
			}),
			Text = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p0.thirdPartyUserName,
				tag = "auto-xy " .. var9
			})
		})
	})
end