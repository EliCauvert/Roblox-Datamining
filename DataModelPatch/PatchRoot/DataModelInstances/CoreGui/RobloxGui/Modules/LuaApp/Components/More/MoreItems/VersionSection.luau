local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local StyledTextLabel = require(CorePackages.Packages.UIBlox).App.Text.StyledTextLabel
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RobloxClientChannel = RunService:GetRobloxClientChannel()
local CoreScriptVersion = RunService:GetCoreScriptVersion()
local Formatted = string.format("%s (%.6s)", RunService:GetRobloxVersion(), RunService.ClientGitHash)

return function(_)
	-- upvalues: UseLocalizationFunction (copy), Formatted (ref), RobloxClientChannel (copy), CoreScriptVersion (copy), UseDesignTokensFunction (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		buildVersionText = {
			"CommonUI.Features.Label.VersionWithNumber",
			versionNumber = Formatted
		},
		clientChannelText = {
			"CommonUI.Features.Label.ChannelWithChannelName",
			channelName = RobloxClientChannel
		},
		coreScriptVersionText = {
			"CommonUI.Features.Label.ClientCoreScriptVersion",
			clientCoreScriptVersion = CoreScriptVersion
		}
	})
	local UseDesignTokensResult = UseDesignTokensFunction(function(p1)
		return {
			bodyTextFont = p1.Typography.BodyLarge,
			bodyTextColor = p1.Color.Content.Default
		}
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		BuildVersionText = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = UseLocalizationResult.buildVersionText,
			fontStyle = UseDesignTokensResult.bodyTextFont,
			colorStyle = UseDesignTokensResult.bodyTextColor
		}),
		ClientCSVersionText = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			text = UseLocalizationResult.coreScriptVersionText,
			fontStyle = UseDesignTokensResult.bodyTextFont,
			colorStyle = UseDesignTokensResult.bodyTextColor
		}),
		ClientChannelText = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 3,
			text = UseLocalizationResult.clientChannelText,
			fontStyle = UseDesignTokensResult.bodyTextFont,
			colorStyle = UseDesignTokensResult.bodyTextColor
		})
	})
end