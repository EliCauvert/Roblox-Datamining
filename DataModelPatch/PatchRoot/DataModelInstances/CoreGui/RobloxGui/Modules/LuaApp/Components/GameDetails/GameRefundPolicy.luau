local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OpenRefundPolicyLearnMorePageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.OpenRefundPolicyLearnMorePage)
local CheckAndFormatPossibleLinkFunction = require(CorePackages.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), CheckAndFormatPossibleLinkFunction (copy), ReactModule (copy), OpenRefundPolicyLearnMorePageModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local BodyLarge = UseTokensResult.Typography.BodyLarge
	local Muted = UseTokensResult.Color.Content.Muted
	local LinkColor3 = UseTokensResult.Color.Content.Link.Color3
	local _Font, Font2 = CheckAndFormatPossibleLinkFunction(p1.refundPolicy.policyText, nil, nil, `<font color="{string.format("rgb(%d, %d, %d)", math.round(LinkColor3.R * 255), math.round(LinkColor3.G * 255), (math.round(LinkColor3.B * 255)))}"><b>`, "</b></font>")
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = if p1.paddingTop then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.paddingTop) }) else nil,
		RefundPolicy = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Text = Font2,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = BodyLarge.Font,
			TextSize = BodyLarge.FontSize,
			TextColor3 = Muted.Color3,
			TextTransparency = Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			RichText = _Font,
			[ReactModule.Event.Activated] = ReactModule.useCallback(function(_)
				-- upvalues: UseDispatchResult (copy), OpenRefundPolicyLearnMorePageModule (upval), p1 (copy)
				UseDispatchResult(OpenRefundPolicyLearnMorePageModule(p1.refundPolicy.learnMoreUrl))
			end, { p1.refundPolicy.learnMoreUrl })
		})
	})
end