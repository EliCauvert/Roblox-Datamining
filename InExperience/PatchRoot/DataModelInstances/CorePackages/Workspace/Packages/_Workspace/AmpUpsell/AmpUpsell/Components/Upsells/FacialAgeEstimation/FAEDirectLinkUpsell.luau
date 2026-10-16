local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local ReactModule = require(Parent.React)
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick

return function(p1) --[[ Line: 30 | Named "FAEDirectLinkUpsell" ]]
	-- upvalues: UseScreenSizeFunction (copy), UseTokensFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthButtonClickFunction (copy), PartialPageModal (copy), ButtonType (copy), Images (copy), Text (copy)
	local WebLink = p1.webLink
	local OnCancelFunction = p1.onCancel
	local SessionId = p1.sessionId
	local EntryPointEventCtx = p1.entryPointEventCtx
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.ExternalLink.Title",
		bodyText = "Amp.FAEUpsell.Modal.ExternalLink.Text",
		startBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonStart",
		cancelBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonCancel"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 52 ]]
		-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnCancelFunction (copy)
		AuthButtonClickFunction(EntryPointEventCtx, "cancelFaeNonNative", SessionId)
		OnCancelFunction()
	end, { OnCancelFunction, SessionId, EntryPointEventCtx })
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.title,
		screenSize = UseScreenSizeResult,
		onCloseClicked = UseResult,
		buttonStackProps = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.cancelBtn
					}
				},
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						icon = Images["icons/navigation/externallink_medium"],
						onActivated = ReactModule.useCallback(function() --[[ Line: 47 ]]
							-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseRoactServiceResult (copy), WebLink (copy)
							AuthButtonClickFunction(EntryPointEventCtx, "startFaeNonNative", SessionId)
							UseRoactServiceResult:openURL(WebLink)
						end, {
							UseRoactServiceResult,
							WebLink,
							SessionId,
							EntryPointEventCtx
						}),
						text = UseLocalizationResult.startBtn
					}
				}
			}
		}
	}, {
		ViewFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			OuterPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXLarge)
			}),
			BodyText = ReactModule.createElement(Text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = UseLocalizationResult.bodyText
			})
		})
	})
end