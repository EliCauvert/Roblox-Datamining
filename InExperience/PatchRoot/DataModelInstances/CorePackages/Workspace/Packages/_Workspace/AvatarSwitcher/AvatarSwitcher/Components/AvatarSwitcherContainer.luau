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
local fFlagAvatarSwitcherUiFixes = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes
local timeoutBanner = require(parent.AvatarExperienceCommon).Components.TimeoutBanner

return function(p0)
	-- upvalues: useTokens (ref), useSignalState (ref), getAvatarSwitcherStoreModule (ref), signalsReactModule (ref), experienceAvatarSupportTypeModule (ref), useUnifiedEventListenerInExperience (ref), reactModule (ref), topBarModule (ref), foundationModule (ref), timeoutBanner (ref), outfitsGridWithMessageModule (ref), previewPanelModule (ref), fFlagAvatarSwitcherUiFixes (ref), guiService (ref), emptyStateModule (ref), singleItemLayoutModule (ref), verticalLayoutModule (ref), horizontalLayoutModule (ref), respawnDialogContainerModule (ref)
	local var15 = useTokens()
	local var16 = useSignalState(getAvatarSwitcherStoreModule)
	local var17 = useSignalState(var16.getIsEmpty)
	local var18 = signalsReactModule.useSignalState(var16.getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport
	useUnifiedEventListenerInExperience()
	reactModule.useEffect(function()
		-- upvalues: var16 (ref)
		task.spawn(function()
			-- upvalues: var16 (copy)
			var16.fetchExperienceAvatarSupportType()
		end)
	end, {})
	local var19 = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 col gap-0" }, {
		TopBar = reactModule.createElement(topBarModule, { onClose = p0.toggleWindow }),
		TimeoutBanner = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 bg-surface-200" }, {
			Banner = reactModule.createElement(timeoutBanner, { shouldFetch = true, shouldNavigateOnClick = false })
		})
	})
	local var20 = reactModule.createElement(outfitsGridWithMessageModule)
	local var21 = reactModule.createElement(previewPanelModule, { compactLayout = p0.verticalLayout })
	
	return reactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var15.Color.OverMedia.OverMedia_0.Color3,
		BackgroundTransparency = if fFlagAvatarSwitcherUiFixes then var15.Color.OverMedia.OverMedia_0.Transparency * guiService.PreferredTransparency else var15.Color.OverMedia.OverMedia_0.Transparency
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var15.Radius.Medium) }),
		Layout = if var17 then reactModule.createElement(emptyStateModule, { headerSlot = var19 }) elseif var18 then reactModule.createElement(singleItemLayoutModule, {
			headerSlot = var19,
			contentSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge col gap-medium" }, { OutfitsGrid = var20 })
		}, {}) elseif p0.verticalLayout then reactModule.createElement(verticalLayoutModule, {
			headerSlot = var19,
			topItemSlot = var21,
			bottomItemSlot = reactModule.createElement(foundationModule.View, {
				tag = "size-full-full padding-x-xlarge padding-top-xlarge"
			}, { OutfitsGrid = var20 })
		}) else reactModule.createElement(horizontalLayoutModule, {
			headerSlot = var19,
			leftItemSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge" }, { OutfitsGrid = var20 }),
			rightItemSlot = var21
		}),
		RespawnDialogContainer = reactModule.createElement(respawnDialogContainerModule, {
			toggleWindow = p0.toggleWindow,
			getRespawnBehaviour = p0.getRespawnBehaviour,
			respawnBehaviorChangedEvent = p0.respawnBehaviorChangedEvent
		})
	})
end