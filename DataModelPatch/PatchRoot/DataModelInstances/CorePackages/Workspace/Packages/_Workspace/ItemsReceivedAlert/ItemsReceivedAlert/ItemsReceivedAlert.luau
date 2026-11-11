local Parent = script:FindFirstAncestor("ItemsReceivedAlert").Parent
local ReactModule = require(Parent.React)
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseDefaultFocusBehaviorFunction (copy), UseDispatchFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), StyledTextLabel (copy), ButtonType (copy), InteractiveAlert (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return {
			thumbnailContainerTransparency = 0.92,
			listPadding = p2.Size.Size_400,
			thumbnailContainerRadius = p2.Size.Size_300,
			bodyTextFont = p2.Typography.BodyLarge,
			bodyTextColor = p2.Color.Content.Default,
			buttonStackSpacing = p2.Size.Size_300,
			buttonTextFont = p2.Typography.BodyLarge
		}
	end)
	local config = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = function()
				-- upvalues: p1 (copy), UseDispatchResult (copy)
				if p1.onPrimaryButtonActivated then
					p1.onPrimaryButtonActivated()
					
					return
				end
				if p1.closeCentralOverlayThunk then
					UseDispatchResult(p1.closeCentralOverlayThunk())
				end
			end,
			text = p1.primaryButtonText,
			buttonRef = UseDefaultFocusBehaviorResult,
			fontStyle = UseDesignTokensResult.buttonTextFont
		}
	}
	local Config = p1.secondaryButtonText and {
		buttonType = ButtonType.Secondary,
		props = {
			onActivated = function()
				-- upvalues: p1 (copy), UseDispatchResult (copy)
				if p1.onSecondaryButtonActivated then
					p1.onSecondaryButtonActivated()
					
					return
				end
				if p1.closeCentralOverlayThunk then
					UseDispatchResult(p1.closeCentralOverlayThunk())
				end
			end,
			text = p1.secondaryButtonText,
			fontStyle = UseDesignTokensResult.buttonTextFont
		}
	}
	
	return ReactModule.createElement(InteractiveAlert, {
		defaultChildRef = UseDefaultFocusBehaviorResult2,
		screenSize = UseScreenSizeResult,
		title = p1.titleText,
		middleContent = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), UseDesignTokensResult (copy), p1 (copy), StyledTextLabel (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, UseDesignTokensResult.listPadding)
				}),
				AvatarThumbnailContainer = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, p1.avatarThumbnailDisplayHeight),
					BackgroundTransparency = UseDesignTokensResult.thumbnailContainerTransparency,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				}, {
					UICorner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseDesignTokensResult.thumbnailContainerRadius)
					}),
					AvatarThumbnail = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						Image = p1.avatarThumbnail,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.fromScale(1, 1)
					})
				}),
				BodyText = if p1.bodyText then ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					richText = true,
					textWrapped = true,
					automaticSize = Enum.AutomaticSize.XY,
					fontStyle = UseDesignTokensResult.bodyTextFont,
					colorStyle = UseDesignTokensResult.bodyTextColor,
					text = p1.bodyText,
					textXAlignment = Enum.TextXAlignment.Center
				}) else nil
			})
		end, {
			p1.avatarThumbnail,
			p1.avatarThumbnailDisplayHeight,
			p1.bodyText,
			UseDesignTokensResult
		}),
		buttonStackInfo = {
			disableGamepadRefs = true,
			marginBetween = UseDesignTokensResult.buttonStackSpacing,
			buttons = if p1.secondaryButtonText then { Config, config } else { config }
		}
	})
end