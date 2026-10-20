local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetScreenBottomInsetModule = require(Modules.LuaApp.getScreenBottomInset)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), UseStyleFunction (copy), GetScreenBottomInsetModule (copy), ReactModule (copy), PartialPageModal (copy), ButtonType (copy), ConstantsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		LearnMoreText = "Feature.LocaleRestriction.Label.LearnMore",
		TitleText = "Feature.LocaleRestriction.Title.RobloxUnavailable",
		BodyText = "Feature.LocaleRestriction.Description.RobloxUnavailable"
	})
	
	local function openBrowser()
		-- upvalues: AppPageModule (upval), UseLocalizationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
		local config = {
			detail = "https://en.help.roblox.com/hc/articles/360000313606",
			name = AppPageModule.GenericWebPage,
			extraProps = { title = UseLocalizationResult.TitleText }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownModule(config))
		end
	end
	
	local ScreenSize = p1.screenSize
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local GlobalGuiInset = p1.globalGuiInset
	GlobalGuiInset.bottom = GetScreenBottomInsetModule()
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
	}, {
		OverlayFrame = ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			ImageTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}, {
			Overlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, GlobalGuiInset.top),
				Size = UDim2.fromOffset(ScreenSize.X, ScreenSize.Y - GlobalGuiInset.top - GlobalGuiInset.bottom)
			}, {
				Content = ReactModule.createElement(PartialPageModal, {
					buttonHeight = 48,
					title = UseLocalizationResult.TitleText,
					screenSize = ScreenSize,
					buttonStackProps = {
						buttons = {
							{
								buttonType = ButtonType.PrimarySystem,
								props = {
									isDisabled = false,
									onActivated = openBrowser,
									text = UseLocalizationResult.LearnMoreText
								}
							}
						}
					}
				}, {
					Body = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 60),
						BackgroundColor3 = Theme.BackgroundUIDefault.Color
					}, {
						CustomInner = ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextScaled = true,
							Text = UseLocalizationResult.BodyText,
							TextColor3 = Theme.TextDefault.Color,
							TextXAlignment = Enum.TextXAlignment.Center,
							Font = UseStyleResultFont.Body.Font,
							Size = UDim2.new(1, 0, 1, 0)
						}, {
							UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
							})
						})
					})
				})
			})
		})
	})
end