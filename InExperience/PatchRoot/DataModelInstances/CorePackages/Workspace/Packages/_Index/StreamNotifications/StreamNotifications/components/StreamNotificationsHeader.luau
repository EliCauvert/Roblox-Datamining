local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local UserInputService = game:GetService("UserInputService")
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local NotificationHelper = require(Parent.NotificationsCommon).NotificationHelper
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local StreamNotificationDropdownExperimentationModule = require(StreamNotifications.StreamNotificationDropdownExperimentation)
local StreamNotificationSettingsExperimentationModule = require(StreamNotifications.StreamNotificationSettingsExperimentation)
local StreamNotificationSettingsActivationModule = require(StreamNotifications.StreamNotificationSettingsActivation)
local FFlagStreamNotificationUXSettingsHeader = require(Parent.SharedFlags).FFlagStreamNotificationUXSettingsHeader

local function _(p1, p2: number): number
	return p1 - p2 * 2
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), NormalizeFontFaceFunction (copy), UserInputService (copy), UseLocalizationFunction (copy), ConstantsModule (copy), StreamNotificationDropdownExperimentationModule (copy), FFlagStreamNotificationUXSettingsHeader (copy), UseDispatchFunction (copy), StreamNotificationSettingsExperimentationModule (copy), StreamNotificationSettingsActivationModule (copy), ReactModule (copy), IconButton (copy), IconSize (copy), NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local UseStyleResultFont = UseStyleResult.Font
	local HeaderFont = if FoundationFontFaceMigration then nil else UseStyleResultFont.Header1.Font
	local NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.HeadingSmall.Font) else nil
	local FontSize = if FoundationFontFaceMigration then UseTokensResult.Typography.HeadingSmall.FontSize else UseStyleResultFont.BaseSize * UseStyleResultFont.Header1.RelativeSize
	local Y = if UserInputService.StatusBarSize and p1.isSmallScreen then UserInputService.StatusBarSize.Y else 0
	local UseLocalizationResult = UseLocalizationFunction({ headerText = ConstantsModule.Text.HeaderKey })
	local DropdownEnabled = StreamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local SettingsGearEnabled = false
	
	local function OnActivated() end
	
	if FFlagStreamNotificationUXSettingsHeader then
		SettingsGearEnabled = StreamNotificationSettingsExperimentationModule.getSettingsGearEnabled()
		OnActivated = StreamNotificationSettingsActivationModule.createOnSettingsActivated(SettingsGearEnabled, DropdownEnabled, p1.displayStream, (UseDispatchFunction()))
	end
	if DropdownEnabled then
		local HeaderMinHeight = ConstantsModule.Dropdown.HeaderMinHeight
		local XOffset = HeaderMinHeight - ConstantsModule.DefaultPadding * 2
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, HeaderMinHeight)
		}, {
			HeaderText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = UseLocalizationResult and UseLocalizationResult.headerText,
				Font = HeaderFont,
				FontFace = NormalizeFontFaceResult,
				TextSize = FontSize,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, -(if SettingsGearEnabled then XOffset else 0), 1, 0)
			}),
			SettingsButton = if FFlagStreamNotificationUXSettingsHeader and SettingsGearEnabled then ReactModule.createElement(IconButton, {
				anchorPoint = Vector2.new(1, 0.5),
				iconSize = IconSize.Medium,
				icon = ConstantsModule.Modal.SettingsIcon,
				position = UDim2.new(1, 0, 0.5, 0),
				size = UDim2.fromOffset(XOffset, XOffset),
				onActivated = OnActivated
			}) else nil
		})
	else
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, ConstantsModule.Modal.HeaderHeight + Y)
		}, {
			HeaderFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ConstantsModule.Modal.HeaderHeight),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1)
			}, {
				CloseModal = ReactModule.createElement(IconButton, {
					layoutOrder = 1,
					anchorPoint = Vector2.new(0, 0),
					iconSize = IconSize.Medium,
					icon = if p1.isSmallScreen then ConstantsModule.Modal.BackIcon else ConstantsModule.Modal.CloseIcon,
					size = UDim2.new(0, ConstantsModule.Modal.HeaderHeight - ConstantsModule.Modal.Padding * 2, 0, ConstantsModule.Modal.HeaderHeight - ConstantsModule.Modal.Padding * 2),
					position = UDim2.fromOffset(ConstantsModule.Modal.Padding, ConstantsModule.Modal.Padding),
					onActivated = function()
						-- upvalues: p1 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval)
						p1.displayStream(false)
						NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeContent, {
							closeMethod = AnalyticsConstantsModule.CloseMethod.closeIcon
						})
					end
				}),
				HeaderText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = UseLocalizationResult and UseLocalizationResult.headerText,
					Font = HeaderFont,
					FontFace = NormalizeFontFaceResult,
					TextSize = FontSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 0, ConstantsModule.Modal.HeaderHeight)
				}),
				SettingsButton = if FFlagStreamNotificationUXSettingsHeader and SettingsGearEnabled then ReactModule.createElement(IconButton, {
					anchorPoint = Vector2.new(1, 0),
					iconSize = IconSize.Medium,
					icon = ConstantsModule.Modal.SettingsIcon,
					position = UDim2.new(1, -ConstantsModule.Modal.Padding, 0, ConstantsModule.Modal.Padding),
					size = UDim2.fromOffset(ConstantsModule.Modal.HeaderHeight - ConstantsModule.Modal.Padding * 2, ConstantsModule.Modal.HeaderHeight - ConstantsModule.Modal.Padding * 2),
					onActivated = OnActivated
				}) else nil
			})
		})
	end
end