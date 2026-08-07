local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local parent = verifiedBadges.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(verifiedBadges.constants)
local uDim = UDim.new(0, 24)
local uDim_1 = UDim.new(0, 12)

local function selectScreenSize(p0) --[[ line: 20 ]]
	return p0.ScreenSize
end

return function(p1) --[[ line: 24 | named "AboutVerifiedBadgeModal" ]]
	-- upvalues: UIBloxModule (ref), useSelector (ref), selectScreenSize (ref), useLocalization (ref), reactModule (ref), uDim (ref), uDim_1 (ref), constantsModule (ref)
	local var7 = UIBloxModule.Core.Style.useStyle()
	local var8 = useLocalization({
		titleText = "Feature.ProfileBadges.VerifiedBadgeInfoTitle",
		bodyText = "Feature.ProfileBadges.VerifiedBadgeInfo",
		learnMoreText = "Feature.ProfileBadges.VerifiedBadgeInfoLink"
	})
	
	return reactModule.createElement(UIBloxModule.App.Dialog.Modal.PartialPageModal, {
		title = var8.titleText,
		screenSize = useSelector(selectScreenSize),
		buttonStackProps = {
			buttons = {
				{
					buttonType = UIBloxModule.App.Button.Enum.ButtonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 40 ]]
							-- upvalues: p1 (ref)
							if p1.onConfirm then
								p1.onConfirm()
							end
						end, { p1 }),
						text = var8.learnMoreText
					}
				}
			}
		},
		contentPadding = uDim,
		onCloseClicked = reactModule.useCallback(function() --[[ line: 34 ]]
			-- upvalues: p1 (ref)
			if p1.onClose then
				p1.onClose()
			end
		end, { p1 })
	}, {
		Wrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = uDim_1
			}),
			Padding = reactModule.createElement("UIPadding", { PaddingTop = uDim_1, PaddingBottom = uDim_1 }),
			Icon = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				layoutOrder = 1,
				fluidSizing = false,
				text = constantsModule.VERIFIED_EMOJI,
				fontStyle = var7.Font.Title,
				colorStyle = var7.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Body = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				layoutOrder = 2,
				fluidSizing = false,
				text = var8.bodyText,
				fontStyle = var7.Font.Body,
				colorStyle = var7.Theme.TextMuted,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end