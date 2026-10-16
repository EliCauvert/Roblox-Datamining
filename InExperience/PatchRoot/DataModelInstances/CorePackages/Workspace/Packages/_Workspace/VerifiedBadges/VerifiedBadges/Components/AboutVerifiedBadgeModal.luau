local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local Parent = VerifiedBadges.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(VerifiedBadges.constants)
local _UDim = UDim.new(0, 24)
local _UDim1 = UDim.new(0, 12)

local function selectScreenSize(p1) --[[ Line: 20 ]]
	return p1.ScreenSize
end

return function(p1) --[[ Line: 24 | Named "AboutVerifiedBadgeModal" ]]
	-- upvalues: UIBloxModule (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), ReactModule (copy), _UDim (copy), _UDim1 (copy), ConstantsModule (copy)
	local UseStyleResult = UIBloxModule.Core.Style.useStyle()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.ProfileBadges.VerifiedBadgeInfoTitle",
		bodyText = "Feature.ProfileBadges.VerifiedBadgeInfo",
		learnMoreText = "Feature.ProfileBadges.VerifiedBadgeInfoLink"
	})
	
	return ReactModule.createElement(UIBloxModule.App.Dialog.Modal.PartialPageModal, {
		title = UseLocalizationResult.titleText,
		screenSize = UseSelectorResult,
		buttonStackProps = {
			buttons = {
				{
					buttonType = UIBloxModule.App.Button.Enum.ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function() --[[ Line: 40 ]]
							-- upvalues: p1 (copy)
							if p1.onConfirm then
								p1.onConfirm()
							end
						end, { p1 }),
						text = UseLocalizationResult.learnMoreText
					}
				}
			}
		},
		contentPadding = _UDim,
		onCloseClicked = ReactModule.useCallback(function() --[[ Line: 34 ]]
			-- upvalues: p1 (copy)
			if p1.onClose then
				p1.onClose()
			end
		end, { p1 })
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
			Padding = ReactModule.createElement("UIPadding", { PaddingTop = _UDim1, PaddingBottom = _UDim1 }),
			Icon = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				layoutOrder = 1,
				fluidSizing = false,
				text = ConstantsModule.VERIFIED_EMOJI,
				fontStyle = UseStyleResult.Font.Title,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Body = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				layoutOrder = 2,
				fluidSizing = false,
				text = UseLocalizationResult.bodyText,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextMuted,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end