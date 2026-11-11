local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local UserInputService = game:GetService("UserInputService")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ScreenSizeSelector = require(ChallengeDialog.Common.Utils).screenSizeSelector
local GetMiddleContentWidthFunction = require(ChallengeDialog.Common.Utils).getMiddleContentWidth
local GetAdjustedTitleToScreenStringFunction = require(ChallengeDialog.Common.Utils).getAdjustedTitleToScreenString
local DEFAULTPADDING = require(ChallengeDialog.Common.Constants).DEFAULT_PADDING
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal

return function(p1)
	-- upvalues: UseSelectorFunction (copy), ScreenSizeSelector (copy), GetMiddleContentWidthFunction (copy), UserInputService (copy), WithStyleFunction (copy), GetAdjustedTitleToScreenStringFunction (copy), ReactModule (copy), FullPageModal (copy), DEFAULTPADDING (copy)
	local UseSelectorResult = UseSelectorFunction(ScreenSizeSelector)
	local MiddleContentWidth = GetMiddleContentWidthFunction(UseSelectorResult.X)
	local Y = UserInputService.StatusBarSize.Y
	local ButtonConfig = p1.buttonConfig
	local MakeBodyFragmentFunction = p1.makeBodyFragment
	local FooterContent = p1.footerContent
	local NoHideCloseButton = not p1.hideCloseButton
	local Title = p1.title
	
	return WithStyleFunction(function(p2)
		-- upvalues: GetAdjustedTitleToScreenStringFunction (upval), Title (copy), MiddleContentWidth (copy), ReactModule (upval), FullPageModal (upval), UseSelectorResult (copy), ButtonConfig (copy), NoHideCloseButton (copy), p1 (copy), Y (copy), FooterContent (copy), DEFAULTPADDING (upval), MakeBodyFragmentFunction (copy)
		return ReactModule.createElement(FullPageModal, {
			title = GetAdjustedTitleToScreenStringFunction(Title, MiddleContentWidth, p2),
			screenSize = UseSelectorResult,
			buttonStackProps = ButtonConfig,
			onCloseClicked = NoHideCloseButton and p1.closeModal,
			distanceFromTop = Y,
			footerContent = FooterContent
		}, {
			Middle = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				ContentPadding = ReactModule.createElement("UIPadding", {
					PaddingBottom = ButtonConfig and UDim.new(0, DEFAULTPADDING),
					PaddingTop = UDim.new(0, DEFAULTPADDING)
				}),
				ListLayout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, DEFAULTPADDING),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				BodyFragment = MakeBodyFragmentFunction(MiddleContentWidth)
			})
		})
	end)
end