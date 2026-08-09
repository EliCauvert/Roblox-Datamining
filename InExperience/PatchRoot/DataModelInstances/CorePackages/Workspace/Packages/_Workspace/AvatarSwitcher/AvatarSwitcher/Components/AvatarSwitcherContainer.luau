local guiService = game:GetService("GuiService")
local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local useSignalState = signalsReactModule.useSignalState
local useUnifiedEventListenerInExperience = require(parent.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local emptyStateModule = require(avatarSwitcher.Components.EmptyState)
local verticalLayoutModule = require(avatarSwitcher.Components.VerticalLayout)
local horizontalLayoutModule = require(avatarSwitcher.Components.HorizontalLayout)
local singleItemLayoutModule = require(avatarSwitcher.Components.SingleItemLayout)
local topBarModule = require(avatarSwitcher.Components.TopBar)
local outfitsGridWithMessageModule = require(avatarSwitcher.Components.OutfitsGridWithMessage)
local previewPanelModule = require(avatarSwitcher.Components.PreviewPanel)
local respawnDialogContainerModule = require(avatarSwitcher.Components.Modals.RespawnDialogContainer)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAvatarSwitcherUiFixes = avatarExperienceFlagsModule.FFlagAvatarSwitcherUiFixes
local fFlagAXAvatarTimeoutFlowIE = avatarExperienceFlagsModule.FFlagAXAvatarTimeoutFlowIE
local timeoutBanner = avatarExperienceCommonModule.Components.TimeoutBanner

return function(p0) --[[ line: 43 | named "AvatarSwitcherContainer" ]]
	-- upvalues: useTokens (ref), useSignalState (ref), getAvatarSwitcherStoreModule (ref), signalsReactModule (ref), experienceAvatarSupportTypeModule (ref), useUnifiedEventListenerInExperience (ref), reactModule (ref), topBarModule (ref), fFlagAXAvatarTimeoutFlowIE (ref), foundationModule (ref), timeoutBanner (ref), outfitsGridWithMessageModule (ref), previewPanelModule (ref), fFlagAvatarSwitcherUiFixes (ref), guiService (ref), emptyStateModule (ref), singleItemLayoutModule (ref), verticalLayoutModule (ref), horizontalLayoutModule (ref), respawnDialogContainerModule (ref)
	local var17 = useTokens()
	local var18 = useSignalState(getAvatarSwitcherStoreModule)
	local var19 = useSignalState(var18.getIsEmpty)
	local var20 = signalsReactModule.useSignalState(var18.getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport
	useUnifiedEventListenerInExperience()
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var18 (ref)
		task.spawn(function() --[[ line: 53 ]]
			-- upvalues: var18 (copy)
			var18.fetchExperienceAvatarSupportType()
		end)
	end, {})
	local var21 = reactModule.createElement(topBarModule, { onClose = p0.toggleWindow })
	local var22 = if fFlagAXAvatarTimeoutFlowIE then reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 col gap-0" }, {
		TopBar = var21,
		TimeoutBanner = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 bg-surface-200" }, {
			Banner = reactModule.createElement(timeoutBanner, { shouldFetch = true, shouldNavigateOnClick = false })
		})
	}) else var21
	local var23 = reactModule.createElement(outfitsGridWithMessageModule)
	local var24 = reactModule.createElement(previewPanelModule, { compactLayout = p0.verticalLayout })
	
	return reactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var17.Color.OverMedia.OverMedia_0.Color3,
		BackgroundTransparency = if fFlagAvatarSwitcherUiFixes then var17.Color.OverMedia.OverMedia_0.Transparency * guiService.PreferredTransparency else var17.Color.OverMedia.OverMedia_0.Transparency
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var17.Radius.Medium) }),
		Layout = if var19 then reactModule.createElement(emptyStateModule, {
			headerSlot = if fFlagAXAvatarTimeoutFlowIE then var22 else var21
		}) elseif var20 then reactModule.createElement(singleItemLayoutModule, {
			headerHeight = if fFlagAXAvatarTimeoutFlowIE then nil else var17.Size.Size_1200,
			headerSlot = if fFlagAXAvatarTimeoutFlowIE then var22 else var21,
			contentSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge col gap-medium" }, { OutfitsGrid = var23 })
		}, {}) elseif p0.verticalLayout then reactModule.createElement(verticalLayoutModule, {
			headerHeight = if fFlagAXAvatarTimeoutFlowIE then nil else var17.Size.Size_1200,
			headerSlot = if fFlagAXAvatarTimeoutFlowIE then var22 else var21,
			topItemSlot = var24,
			bottomItemSlot = reactModule.createElement(foundationModule.View, {
				tag = "size-full-full padding-x-xlarge padding-top-xlarge"
			}, { OutfitsGrid = var23 })
		}) else reactModule.createElement(horizontalLayoutModule, {
			headerHeight = if fFlagAXAvatarTimeoutFlowIE then nil else var17.Size.Size_1200,
			headerSlot = if fFlagAXAvatarTimeoutFlowIE then var22 else var21,
			leftItemSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge" }, { OutfitsGrid = var23 }),
			rightItemSlot = var24
		}),
		RespawnDialogContainer = reactModule.createElement(respawnDialogContainerModule, {
			toggleWindow = p0.toggleWindow,
			getRespawnBehaviour = p0.getRespawnBehaviour,
			respawnBehaviorChangedEvent = p0.respawnBehaviorChangedEvent
		})
	})
end