local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseNavigationFunction = require(VirtualEvents.Parent.Navigation).useNavigation
local UseSelectorFunction = require(VirtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local UrlBuilder = require(VirtualEvents.Parent.UrlBuilder).UrlBuilder
local SelectableTextLabelModule = require(script.Parent.SelectableTextLabel)
local _UDim = UDim.new(0, 24)
local _UDim1 = UDim.new(0, 8)
local _UDim2 = UDim.new(0, 2)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseNavigationFunction (copy), ReactModule (copy), UrlBuilder (copy), UseLocalizationFunction (copy), PartialPageModal (copy), _UDim (copy), StyledTextLabel (copy), _UDim2 (copy), _UDim1 (copy), SelectableTextLabelModule (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseNavigationResult = UseNavigationFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UrlBuilder (upval), p1 (copy)
		return UrlBuilder.virtualevents.appsflyer({ eventId = p1.virtualEventId })
	end, { p1.virtualEventId })
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.VirtualEvents.ShareModalTitle",
		body = "Feature.VirtualEvents.ShareModalBody",
		copyLink = "Feature.VirtualEvents.ShareModalLinkCopy",
		callToAction = "Feature.VirtualEvents.ShareModalCallToAction"
	})
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.title,
		screenSize = UseSelectorResult,
		contentPadding = _UDim,
		onCloseClicked = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy), p1 (copy)
			UseNavigationResult.goBack()
			
			if p1.onClose then
				p1.onClose()
			end
		end, { p1, UseNavigationResult })
	}, {
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = _UDim }),
			Padding = ReactModule.createElement("UIPadding", { PaddingTop = _UDim }),
			Body = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				fluidSizing = false,
				text = UseLocalizationResult.body,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextMuted,
				size = UDim2.new(1, 0, 0, 40)
			}),
			Deeplink = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = _UDim
				}),
				Field = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.8, 0) - UDim2.fromOffset(_UDim.Offset, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = UseStyleResult.Theme.UIMuted.Color
				}, {
					Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim2 }),
					Border = ReactModule.createElement("UIStroke", { Color = UseStyleResult.Theme.UIDefault.Color }),
					Padding = ReactModule.createElement("UIPadding", {
						PaddingTop = _UDim1,
						PaddingRight = _UDim1,
						PaddingBottom = _UDim1,
						PaddingLeft = _UDim1
					}),
					Label = ReactModule.createElement(SelectableTextLabelModule, {
						fontStyle = UseStyleResult.Font.Body,
						colorStyle = UseStyleResult.Theme.TextMuted,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = UseMemoResult
					})
				}),
				Action = ReactModule.createElement(Button, {
					layoutOrder = 2,
					buttonType = ButtonType.PrimarySystem,
					text = UseLocalizationResult.copyLink,
					size = UDim2.new(0.2, 0, 0, 32),
					onActivated = ReactModule.useCallback(function()
						-- upvalues: p1 (copy), UseMemoResult (copy)
						if p1.onCopy then
							p1.onCopy(UseMemoResult)
						end
					end, { UseMemoResult, p1.onCopy })
				})
			})
		})
	})
end