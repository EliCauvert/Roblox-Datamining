local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local NormalizeFontFaceFunction = require(CorePackages.Packages.Foundation).Utility.normalizeFontFace
local FontFaceConsoleOverscan = game:DefineFastFlag("FontFaceConsoleOverscan", false)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GlobalSettingsModule = require(Modules.Shell.GlobalSettings)
local LocalizedStringsModule = require(Modules.Shell.LocalizedStrings)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local ControllerHintModule = require(Modules.Shell.Components.Overscan.ControllerHint)
local EdgesModule = require(script.Parent.Edges)

return function(Frame)
	-- upvalues: UseNavigationFunction (copy), UseLocalizationFunction (copy), UseDesignTokensFunction (copy), UseStyleFunction (copy), ReactModule (copy), FontFaceConsoleOverscan (copy), GlobalSettingsModule (copy), NormalizeFontFaceFunction (copy), LocalizedStringsModule (copy), ControllerHintModule (copy), ButtonStack (copy), ButtonType (copy), EdgesModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local OnUnmount = Frame.onUnmount or UseNavigationResult.goBack
	local UseLocalizationResult = UseLocalizationFunction({
		accept = "CommonUI.Controls.Action.Accept",
		cancel = "CommonUI.Controls.Action.Cancel"
	})
	local UseDesignTokensResult = UseDesignTokensFunction(function(p1)
		return {
			buttonHeight = p1.Size.Size_1200,
			marginBetween = p1.Size.Size_300
		}
	end)
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = Frame.BackgroundTransparency,
		BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941)
	}, {
		ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 1,
			Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941),
			Visible = Frame.ImageVisible
		}),
		Title = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 230, 0, 205),
			Font = if FontFaceConsoleOverscan then nil else GlobalSettingsModule.LightFont,
			FontFace = if FontFaceConsoleOverscan then NormalizeFontFaceFunction(GlobalSettingsModule.LightFont) else nil,
			FontSize = GlobalSettingsModule.HeaderSize,
			TextColor3 = GlobalSettingsModule.WhiteTextColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = LocalizedStringsModule:LocStringUA("Xbox.Old.ScreenSizeWord")
		}),
		Prompt = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 230, 0, 243),
			Font = if FontFaceConsoleOverscan then nil else GlobalSettingsModule.RegularFont,
			FontFace = if FontFaceConsoleOverscan then NormalizeFontFaceFunction(GlobalSettingsModule.RegularFont) else nil,
			FontSize = GlobalSettingsModule.ButtonSize,
			TextColor3 = GlobalSettingsModule.WhiteTextColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = LocalizedStringsModule:LocStringUA("Xbox.Old.ResizeScreenPrompt")
		}),
		Controller = ReactModule.createElement(ControllerHintModule),
		Actions = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(0.4, 0),
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -201)
		}, {
			ReactModule.createElement(ButtonStack, {
				buttonHeight = UseDesignTokensResult.buttonHeight,
				marginBetween = UseDesignTokensResult.marginBetween,
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							text = UseLocalizationResult.cancel,
							fontStyle = UseStyleResult.Font.Header1,
							onActivated = OnUnmount
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							text = UseLocalizationResult.accept,
							fontStyle = UseStyleResult.Font.Header1,
							onActivated = function()
								-- upvalues: UseRefResult (copy)
								if UseRefResult.current then
									UseRefResult.current.onAccept()
								end
							end
						}
					}
				}
			})
		}),
		EdgeSelector = ReactModule.createElement(EdgesModule, { onSetEdges = OnUnmount, ref = UseRefResult })
	})
end