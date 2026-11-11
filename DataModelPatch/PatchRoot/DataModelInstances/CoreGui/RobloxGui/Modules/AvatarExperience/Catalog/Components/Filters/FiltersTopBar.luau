local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local Platform = game:GetService("UserInputService"):GetPlatform()
local IsPlatformMatch: boolean = Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local Y: number = if IsPlatformMatch then 0.5 else 0

return function(Gui)
	-- upvalues: UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UtilsModule (copy), UseNavigationFunction (copy), ReactModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), Focusable (copy), Y (copy), ImageSetLabel (copy), IconsNavigationClose (copy)
	return ReactModule.createElement("Frame", {
		Active = true,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, (UseSelectorFunction(UtilsModule.getTopBarHeightAvatarScene, GetUseSelectorDeepEqualsFunction())))
	}, {
		TouchFriendlyNavigationButton = ReactModule.createElement(Focusable.TextButton, {
			AnchorPoint = Vector2.new(0, Y),
			Position = UDim2.new(0, 15, Y, (UseSelectorFunction(function(p1)
				return p1.TopBar.statusBarHeight
			end, GetUseSelectorDeepEqualsFunction()))),
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: Gui (copy)
				Gui.closePeekViewSignal:fire()
			end, { UseNavigationFunction(), Gui.closePeekViewSignal }),
			ref = Gui.buttonRef,
			NextSelectionLeft = Gui.NextSelectionLeft,
			NextSelectionRight = Gui.NextSelectionRight,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset)
		}, {
			CloseButton = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = IconsNavigationClose,
				ImageColor3 = Color3.new(1, 1, 1)
			})
		})
	})
end