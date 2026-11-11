local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local FFlagEnableAddAuthMethodPageEmailSignup = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAddAuthMethodPageEmailSignup
local DisclaimerLinksModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Authentication.DisclaimerLinks)

return function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagEnableAddAuthMethodPageEmailSignup (copy), ReactModule (copy), DisclaimerLinksModule (copy)
	local Children = p1.children
	local ShowFooter = p1.showFooter
	local UseTokensResult = UseTokensFunction()
	local Size1400 = UseTokensResult.Size.Size_1400
	
	return if FFlagEnableAddAuthMethodPageEmailSignup and ShowFooter then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Page = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -Size1400)
		}, Children),
		Footer = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, Size1400)
		}, {
			FooterPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.Large)
			}),
			FooterLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Links = ReactModule.createElement(DisclaimerLinksModule, { fillDirection = Enum.FillDirection.Horizontal })
		})
	}) else ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, Children)
end