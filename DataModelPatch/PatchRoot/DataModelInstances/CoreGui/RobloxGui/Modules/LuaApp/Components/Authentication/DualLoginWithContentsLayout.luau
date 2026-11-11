local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local DualLayoutBackButtonModule = require(Modules.LuaApp.Components.Authentication.DualLayoutBackButton)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

local function v14(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), AlignmentModule (copy), UseUiModeInfoFunction (copy), ReactModule (copy), UiMode (copy), DualLayoutBackButtonModule (copy), FitChildrenModule (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local Children = p1.children
	local ContentAlign = p1.ContentAlign or AlignmentModule.Top
	local Size1600: number = UseDesignTokensResult.Size.Size_1600
	local Size2000: number = UseDesignTokensResult.Size.Size_2000
	local NewFontSize = UseDesignTokensResult.FontSize.FontSize_900 + UseDesignTokensResult.Size.Size_800
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local config = {
		[AlignmentModule.Top] = {
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		},
		[AlignmentModule.Bottom] = {
			Position = UDim2.new(0.5, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 1)
		}
	}
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return ReactModule.createElement(ScrollView, {
		BorderSizePixel = 0,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			scrollBarVisibility = ScrollBarVisibility.None
		},
		Position = if FFlagEnableLeftNavOnConsole then UDim2.new(0, -UseSignalStateResult.left, 0, -UseSignalStateResult.top) else nil,
		Size = if FFlagEnableLeftNavOnConsole then UDim2.new(1, UseSignalStateResult.left + UseSignalStateResult.right, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else UDim2.new(1, 0, 1, 0),
		tag = if FFlagEnableLeftNavOnConsole and UseUiModeInfoResult.uiMode == UiMode.TenFoot then "bg-surface-0" else "bg-action-subtle"
	}, {
		ContentFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, Size1600, 0, Size2000),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -(2 * Size1600), 1, -(2 * Size2000)),
			AnchorPoint = Vector2.new(0, 0),
			ref = p1.buttonRef
		}, {
			{
				Title = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}, {
					BackButton = if UseUiModeInfoResult.uiMode == UiMode.VR then ReactModule.createElement(DualLayoutBackButtonModule, { navigateBack = p1.navigateBack }) else nil,
					TitleLabel = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = p1.localized.title,
						TextSize = UseDesignTokensResult.FontSize.FontSize_900,
						Font = UseStyleResultFont.Title.Font,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextColor3 = Theme.TextEmphasis.Color,
						Size = UDim2.new(1, 0, 1, 0)
					})
				}),
				AlignmentContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0, NewFontSize),
					Size = UDim2.new(1, 0, 1, -NewFontSize),
					AnchorPoint = Vector2.new(0.5, 0)
				}, {
					Content = ReactModule.createElement(FitChildrenModule.FitFrame, {
						BackgroundTransparency = 1,
						Position = config[ContentAlign].Position,
						Size = UDim2.new(1, 0, 1, 0),
						fitAxis = FitChildrenModule.FitAxis.Height,
						AnchorPoint = config[ContentAlign].AnchorPoint
					}, { Children })
				})
			}
		})
	})
end

return function(p1)
	-- upvalues: UseLocalizationModule (copy), ReactModule (copy), v14 (copy), CryoModule (copy)
	return ReactModule.createElement(v14, CryoModule.Dictionary.join({
		localized = UseLocalizationModule({ title = "Authentication.Login.Heading.LoginRoblox" })
	}, p1))
end