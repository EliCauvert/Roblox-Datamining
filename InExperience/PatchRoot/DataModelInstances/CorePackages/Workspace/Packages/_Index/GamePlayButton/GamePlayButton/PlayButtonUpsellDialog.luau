local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
local playButtonUpsellBodyModule = require(gamePlayButton.PlayButtonUpsellBody)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLinking = require(parent.RoactServiceTags).AppLinking
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local extractAndStyleRichTextLinks = require(parent.DiscoveryUtils).extractAndStyleRichTextLinks
local fFlagEnablePlayButtonWizardVPCPrologueModule = require(gamePlayButton.Flags.FFlagEnablePlayButtonWizardVPCPrologue)

return function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), useRoactService (ref), appLinking (ref), reactModule (ref), extractAndStyleRichTextLinks (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), dialog (ref), dialogSize (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (ref), playButtonUpsellBodyModule (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useDispatch()
	local var3 = useRoactService(appLinking)
	local var4 = reactModule.useMemo(function()
		-- upvalues: extractAndStyleRichTextLinks (copy), p1 (ref)
		local var5, var6 = extractAndStyleRichTextLinks(p1.bodyText)
		
		return {
			link = if #var5 > 0 then var5[1] else nil,
			styledText = var6
		}
	end, { p1.bodyText })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = false,
		size = dialogSize.Medium,
		onClose = p1.onCloseModal
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p1.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyText = if fFlagEnablePlayButtonWizardVPCPrologueModule then reactModule.createElement(playButtonUpsellBodyModule, { bodyText = p1.bodyText, onCloseModal = p1.onCloseModal }) else reactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = var4.styledText,
				TextSize = var1.Typography.BodyLarge.FontSize,
				Font = var1.Typography.BodyLarge.Font,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextColor3 = var1.Color.Content.Emphasis.Color3,
				Active = var4.link ~= nil,
				Selectable = var4.link ~= nil,
				[reactModule.Event.Activated] = if var4.link then reactModule.useCallback(function()
					-- upvalues: var4 (ref), p1 (ref), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy), var3 (ref), closeCentralOverlay (copy)
					if var4.link then
						p1.onCloseModal()
						var2(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, {
							continueFunc = function()
								-- upvalues: var3 (copy), var4 (copy), var2 (copy), closeCentralOverlay (copy)
								var3:openURL(var4.link)
								var2(closeCentralOverlay())
							end
						}))
						
						return
					end
				end, { p1.onCloseModal, var4.link, var2, var3 }) else nil
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p1.cancelButtonText,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancelButtonClick
				},
				{
					text = p1.actionButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onActionButtonClick
				}
			}
		})
	})
end