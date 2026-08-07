local parent = script:FindFirstAncestor("AmpUpsell").Parent
local reactModule = require(parent.React)
local appLinking = require(parent.RoactServiceTags).AppLinking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick

return function(p0) --[[ line: 30 | named "FAEDirectLinkUpsell" ]]
	-- upvalues: useScreenSize (ref), useTokens (ref), useRoactService (ref), appLinking (ref), useLocalization (ref), reactModule (ref), authButtonClick (ref), partialPageModal (ref), buttonType (ref), images (ref), text (ref)
	local webLink = p0.webLink
	local onCancel = p0.onCancel
	local sessionId = p0.sessionId
	local entryPointEventCtx = p0.entryPointEventCtx
	local var3 = useScreenSize()
	local var4 = useTokens()
	local var5 = useRoactService(appLinking)
	local var6 = useLocalization({
		title = "Amp.FAEUpsell.Modal.ExternalLink.Title",
		bodyText = "Amp.FAEUpsell.Modal.ExternalLink.Text",
		startBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonStart",
		cancelBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonCancel"
	})
	local var7 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onCancel (ref)
		authButtonClick(entryPointEventCtx, "cancelFaeNonNative", sessionId)
		onCancel()
	end, { onCancel, sessionId, entryPointEventCtx })
	
	return reactModule.createElement(partialPageModal, {
		title = var6.title,
		screenSize = var3,
		onCloseClicked = var7,
		buttonStackProps = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var7, text = var6.cancelBtn }
				},
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						icon = images["icons/navigation/externallink_medium"],
						onActivated = reactModule.useCallback(function() --[[ line: 47 ]]
							-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), var5 (ref), webLink (ref)
							authButtonClick(entryPointEventCtx, "startFaeNonNative", sessionId)
							var5:openURL(webLink)
						end, { var5, webLink, sessionId, entryPointEventCtx }),
						text = var6.startBtn
					}
				}
			}
		}
	}, {
		ViewFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			OuterPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var4.Padding.XXLarge),
				PaddingBottom = UDim.new(0, var4.Padding.XXLarge)
			}),
			BodyText = reactModule.createElement(text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = var6.bodyText
			})
		})
	})
end