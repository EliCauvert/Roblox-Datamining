local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableAddAuthMethodPageFoundationalizeHeader = SharedFlagsModule.FFlagEnableAddAuthMethodPageFoundationalizeHeader
local FFlagEnableAddAuthMethodPageFoundationalizeParagraph = SharedFlagsModule.FFlagEnableAddAuthMethodPageFoundationalizeParagraph
local UseLargerHeaderTextOnMultipageSignup = game:DefineFastFlag("UseLargerHeaderTextOnMultipageSignup", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), FFlagEnableAddAuthMethodPageFoundationalizeHeader (copy), FFlagEnableAddAuthMethodPageFoundationalizeParagraph (copy), UseLargerHeaderTextOnMultipageSignup (copy), ReactModule (copy), Text (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AuthenticationStylingLayer }, function(p2)
		-- upvalues: AppBtidLayers (upval)
		local v1 = p2[AppBtidLayers.AuthenticationStylingLayer] or {}
		
		return {
			shouldUseFoundationHeaderText = v1.shouldUseFoundationHeaderText,
			shouldUseFoundationParagraphText = v1.shouldUseFoundationParagraphText
		}
	end)
	local ShouldUseFoundationHeaderText = FFlagEnableAddAuthMethodPageFoundationalizeHeader and UseBrowserTrackerExperimentResult.shouldUseFoundationHeaderText
	local ShouldUseFoundationParagraphText = FFlagEnableAddAuthMethodPageFoundationalizeParagraph and UseBrowserTrackerExperimentResult.shouldUseFoundationParagraphText
	local Header1 = if UseLargerHeaderTextOnMultipageSignup then UseStyleResult.Font.Header1 else UseStyleResult.Font.Header2
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}),
		TitleText = if ShouldUseFoundationHeaderText then ReactModule.createElement(Text, {
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.titleText,
			TextXAlignment = Enum.TextXAlignment.Left,
			fontStyle = if UseLargerHeaderTextOnMultipageSignup then UseTokensResult.Typography.HeadingMedium else UseTokensResult.Typography.HeadingSmall
		}) else ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.titleText,
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
			TextSize = UseStyleResult.Font.BaseSize * Header1.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Header1.Font
		}),
		HelpText = if ShouldUseFoundationParagraphText then ReactModule.createElement(Text, {
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.helpText,
			TextXAlignment = Enum.TextXAlignment.Left,
			fontStyle = UseTokensResult.Typography.BodyMedium
		}) else ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.helpText,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = UseStyleResult.Font.CaptionBody.Font
		})
	})
end