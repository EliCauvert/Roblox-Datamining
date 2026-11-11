local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseSelectorFunction = require(VirtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(VirtualEvents.Parent.Navigation).useNavigation
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local _UDim = UDim.new(0, 24)
local _UDim1 = UDim.new(0, 12)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), ReactModule (copy), PartialPageModal (copy), ButtonType (copy), _UDim (copy), _UDim1 (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.VirtualEvents.EnableNotificationsModalTitle",
		body = "Feature.VirtualEvents.EnableNotificationsModalBody",
		notNow = "Feature.VirtualEvents.NotNowButton",
		getNotified = "Feature.VirtualEvents.GetNotifiedButton"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseNavigationResult (copy)
		if p1.onClose then
			p1.onClose()
		end
		UseNavigationResult.goBack()
	end, { p1.onClose, UseNavigationResult })
	
	return ReactModule.createElement(PartialPageModal, {
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		title = UseLocalizationResult.title,
		screenSize = UseSelectorResult,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.notNow
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: p1 (copy), UseResult (copy)
							if p1.onConfirm then
								p1.onConfirm()
							end
							UseResult()
						end, { p1.onConfirm, UseResult }),
						text = UseLocalizationResult.getNotified
					}
				}
			}
		},
		contentPadding = _UDim,
		onCloseClicked = UseResult
	}, {
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = _UDim1
			}),
			Padding = ReactModule.createElement("UIPadding", { PaddingTop = _UDim1 + _UDim1, PaddingBottom = _UDim1 }),
			Body = ReactModule.createElement(StyledTextLabel, {
				fluidSizing = false,
				text = UseLocalizationResult.body,
				textXAlignment = Enum.TextXAlignment.Center,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextMuted,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end