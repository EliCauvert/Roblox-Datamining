local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Parent = script.Parent.Parent.Parent
local FTUXConstantsModule = require(Parent.Resources.FTUXConstants)
local _ = require(Parent.Enums.PlatformEnum)

return function(p1) --[[ Line: 18 | Named "Header" ]]
	-- upvalues: UseStyleFunction (copy), FTUXConstantsModule (copy), WithLocalizationFunction (copy), ReactModule (copy), UIBloxModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local PanelConstants = FTUXConstantsModule[p1.platform].PanelConstants
	local Color = Theme.BackgroundContrast.Color
	local HEADERHEIGHTRATIO = PanelConstants.HEADER_HEIGHT_RATIO
	local CONTENTPADDINGRatio = PanelConstants.CONTENT_PADDING / PanelConstants.SLIDESHOW_FRAME_WIDTH
	local XScale = 1 - 2 * CONTENTPADDINGRatio
	
	return WithLocalizationFunction({ headerText = "CoreScripts.VRFTUX.Heading.Header" })(function(p2) --[[ Line: 33 ]]
		-- upvalues: ReactModule (upval), Color (copy), HEADERHEIGHTRATIO (copy), XScale (copy), CONTENTPADDINGRatio (copy), UIBloxModule (upval), UseStyleResultFont (copy), Theme (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			LayoutOrder = 1,
			BackgroundColor3 = Color,
			Size = UDim2.new(1, 0, HEADERHEIGHTRATIO, 0)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.26, 0) }),
			HeaderFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				Box = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(XScale, 0, 1, 0),
					Position = UDim2.new(CONTENTPADDINGRatio, 0, 0, 0)
				}, {
					HeaderText = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						fluidSizing = true,
						text = p2.headerText,
						fontStyle = UseStyleResultFont.Header1,
						colorStyle = Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Left,
						size = UDim2.new(1, 0, 1, 0),
						automaticSize = Enum.AutomaticSize.XY
					})
				})
			})
		})
	end)
end