local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Hooks.useLocalization)
local IconsNavigationPushRightSmall = Images["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small"
local _Vector2 = Vector2.new(14, 14)
local IconsActionsInfoSmall = Images["icons/actions/info_small"] or "LuaApp/icons/GameDetails/actions/info_small"
local _Vector2_1 = Vector2.new(18, 18)

local function v14(p1)
	return p1.ScreenSize
end

return (ReactModule.forwardRef(function(Label, Ref)
	-- upvalues: UseNavigationFunction (copy), UseSelectorFunction (copy), v14 (copy), UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UseLocalizationModule (copy), _Vector2 (copy), Focusable (copy), ReactModule (copy), AvatarScreen (copy), ImageSetLabel (copy), _Vector2_1 (copy), IconsActionsInfoSmall (copy), VerifiedBadgesModule (copy), IconsNavigationPushRightSmall (copy)
	local LayoutOrder = Label.LayoutOrder
	local InfoName = Label.infoName
	local InfoNameDetails = Label.infoNameDetails
	local InfoData = Label.infoData
	local OnActivate = Label.onActivate
	local HasVerifiedBadge = Label.hasVerifiedBadge
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(v14)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local UseLocalizationModuleResult = UseLocalizationModule({ name = InfoName })
	local Color = Theme.TextEmphasis.Color
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local v1 = -11 - _Vector2.X
	local HasRef = Ref ~= nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseSelectorResult (copy), InfoNameDetails (copy)
		UseNavigationResult.navigate(AvatarScreen.ItemInfoRowPrompt, {
			confirmButtonText = "CommonUI.Controls.Action.OK",
			screenSize = UseSelectorResult,
			message = InfoNameDetails
		})
	end, { UseNavigationResult, UseSelectorResult, InfoNameDetails })
	local UseResult1 = if InfoNameDetails then UseResult else nil
	
	return ReactModule.createElement(if HasRef then Focusable.ImageButton else "ImageButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, if Label.hideDivider then 52 else 53),
		[ReactModule.Event.Activated] = OnActivate,
		NextSelectionUp = Label.NextSelectionUp,
		NextSelectionDown = Label.NextSelectionDown,
		NextSelectionLeft = Label.NextSelectionLeft,
		NextSelectionRight = Label.NextSelectionRight,
		ref = Ref,
		SelectionImageObject = HasRef and UseSelectionCursorResult or nil
	}, {
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, if Label.hideDivider then 0 else -1)
		}, {
			InfoNameTextLabelContainer = (function()
				-- upvalues: ReactModule (upval), UseResult1 (copy), OnActivate (copy), UseStyleResultFont (copy), UseLocalizationModuleResult (copy), Theme (copy), ScaledBaseSize (copy), InfoNameDetails (copy), ImageSetLabel (upval), _Vector2_1 (upval), IconsActionsInfoSmall (upval), Color (copy)
				return ReactModule.createElement("ImageButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.5, 0, 1, 0),
					[ReactModule.Event.Activated] = if UseResult1 then UseResult1 else OnActivate
				}, {
					HorizontalLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					}),
					InfoNameTextLabel = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Font = UseStyleResultFont.Body.Font,
						AutomaticSize = Enum.AutomaticSize.X,
						Text = UseLocalizationModuleResult.name,
						TextColor3 = Theme.TextDefault.Color,
						TextSize = ScaledBaseSize,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					InfoIcon = InfoNameDetails and ReactModule.createElement(ImageSetLabel, {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, 0, 0.5, 0),
						Size = UDim2.fromOffset(_Vector2_1.X, _Vector2_1.Y),
						Image = IconsActionsInfoSmall,
						ImageColor3 = Color
					})
				})
			end)(),
			InfoDataWithEmoji = HasVerifiedBadge and ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				emoji = VerifiedBadgesModule.emoji.verified,
				font = if OnActivate then UseStyleResultFont.Header2.Font else UseStyleResultFont.Body.Font,
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.new(1, if OnActivate then v1 else 0, 0, 0),
				size = UDim2.new(0.5, 0, 1, 0),
				automaticSize = Enum.AutomaticSize.None,
				horizontalAlignment = Enum.HorizontalAlignment.Right,
				verticalAlignment = Enum.VerticalAlignment.Center
			}, {
				InfoDataTextLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Font = OnActivate and UseStyleResultFont.Header2.Font or UseStyleResultFont.Body.Font,
					Size = UDim2.new(0, 0, 1, 0),
					Text = UseLocalizationModuleResult.data or InfoData,
					TextColor3 = if OnActivate then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
					TextSize = ScaledBaseSize,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextScaled = Label.TextScaled,
					AutomaticSize = Enum.AutomaticSize.X,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			InfoDataTextLabel = not HasVerifiedBadge and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, if OnActivate then v1 else 0, 0, 0),
				Font = if OnActivate then UseStyleResultFont.Header2.Font else UseStyleResultFont.Body.Font,
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = UseLocalizationModuleResult.data or InfoData,
				TextColor3 = if OnActivate then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
				TextSize = ScaledBaseSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextScaled = Label.TextScaled,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Center
			}, {
				TextSizeConstraint = Label.TextScaled and ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledBaseSize })
			}),
			LinkIcon = OnActivate and ReactModule.createElement(ImageSetLabel, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y),
				Image = IconsNavigationPushRightSmall,
				ImageColor3 = Color
			})
		}),
		Divider = not Label.hideDivider and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, -1)
		})
	})
end))