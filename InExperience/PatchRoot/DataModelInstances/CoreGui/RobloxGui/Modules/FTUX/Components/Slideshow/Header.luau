local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local parent = script.Parent.Parent.Parent
local FTUXConstantsModule = require(parent.Resources.FTUXConstants)
local _ = require(parent.Enums.PlatformEnum)

return function(p0)
	-- upvalues: useStyle (ref), FTUXConstantsModule (ref), withLocalization (ref), reactModule (ref), UIBloxModule (ref)
	local var4 = useStyle()
	local theme = var4.Theme
	local font = var4.Font
	local panelConstants = FTUXConstantsModule[p0.platform].PanelConstants
	local color = theme.BackgroundContrast.Color
	local HEADER_HEIGHT_RATIO = panelConstants.HEADER_HEIGHT_RATIO
	local var5 = panelConstants.CONTENT_PADDING / panelConstants.SLIDESHOW_FRAME_WIDTH
	local var6 = 1 - 2 * var5
	
	return withLocalization({ headerText = "CoreScripts.VRFTUX.Heading.Header" })(function(p1)
		-- upvalues: reactModule (copy), color (ref), HEADER_HEIGHT_RATIO (ref), var6 (ref), var5 (ref), UIBloxModule (copy), font (ref), theme (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			LayoutOrder = 1,
			BackgroundColor3 = color,
			Size = UDim2.new(1, 0, HEADER_HEIGHT_RATIO, 0)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.26, 0) }),
			HeaderFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				Box = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(var6, 0, 1, 0),
					Position = UDim2.new(var5, 0, 0, 0)
				}, {
					HeaderText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						fluidSizing = true,
						text = p1.headerText,
						fontStyle = font.Header1,
						colorStyle = theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Left,
						size = UDim2.new(1, 0, 1, 0),
						automaticSize = Enum.AutomaticSize.XY
					})
				})
			})
		})
	end)
end