local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useDesignTokens = require(corePackagesService.Workspace.Packages.Style).useDesignTokens
local useStyle = UIBloxModule.Core.Style.useStyle
local globalSettingsModule = require(modules.Shell.GlobalSettings)
local localizedStringsModule = require(modules.Shell.LocalizedStrings)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useNavigation = require(corePackagesService.Workspace.Packages.Navigation).useNavigation
local controllerHintModule = require(modules.Shell.Components.Overscan.ControllerHint)
local edgesModule = require(script.Parent.Edges)

return function(p1)
	-- upvalues: useNavigation (ref), useLocalization (ref), useDesignTokens (ref), useStyle (ref), reactModule (ref), globalSettingsModule (ref), localizedStringsModule (ref), controllerHintModule (ref), buttonStack (ref), buttonType (ref), edgesModule (ref)
	local onUnmount = p1.onUnmount or useNavigation().goBack
	local var1 = useLocalization({
		accept = "CommonUI.Controls.Action.Accept",
		cancel = "CommonUI.Controls.Action.Cancel"
	})
	local var2 = useDesignTokens(function(p2)
		return {
			buttonHeight = p2.Size.Size_1200,
			marginBetween = p2.Size.Size_300
		}
	end)
	local var3 = useStyle()
	local var4 = reactModule.useRef(nil)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p1.BackgroundTransparency,
		BackgroundColor3 = Color3.new(0.011764705882, 0.011764705882, 0.011764705882)
	}, {
		reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 1,
			Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0.011764705882, 0.011764705882, 0.011764705882),
			Visible = p1.ImageVisible
		}),
		Title = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 230, 0, 205),
			Font = globalSettingsModule.LightFont,
			FontSize = globalSettingsModule.HeaderSize,
			TextColor3 = globalSettingsModule.WhiteTextColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = localizedStringsModule:LocStringUA("Xbox.Old.ScreenSizeWord")
		}),
		Prompt = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 230, 0, 243),
			Font = globalSettingsModule.RegularFont,
			FontSize = globalSettingsModule.ButtonSize,
			TextColor3 = globalSettingsModule.WhiteTextColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = localizedStringsModule:LocStringUA("Xbox.Old.ResizeScreenPrompt")
		}),
		Controller = reactModule.createElement(controllerHintModule),
		Actions = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(0.4, 0),
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -201)
		}, {
			reactModule.createElement(buttonStack, {
				buttonHeight = var2.buttonHeight,
				marginBetween = var2.marginBetween,
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							text = var1.cancel,
							fontStyle = var3.Font.Header1,
							onActivated = onUnmount
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							text = var1.accept,
							fontStyle = var3.Font.Header1,
							onActivated = function()
								-- upvalues: var4 (ref)
								if var4.current then
									var4.current.onAccept()
								end
							end
						}
					}
				}
			})
		}),
		EdgeSelector = reactModule.createElement(edgesModule, { onSetEdges = onUnmount, ref = var4 })
	})
end