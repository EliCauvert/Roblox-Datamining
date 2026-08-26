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

return function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), getAvatarSwitcherStoreModule (ref), signalsReactModule (ref), experienceAvatarSupportTypeModule (ref), useUnifiedEventListenerInExperience (ref), reactModule (ref), topBarModule (ref), foundationModule (ref), timeoutBanner (ref), outfitsGridWithMessageModule (ref), previewPanelModule (ref), fFlagAvatarSwitcherUiFixes (ref), guiService (ref), emptyStateModule (ref), singleItemLayoutModule (ref), verticalLayoutModule (ref), horizontalLayoutModule (ref), respawnDialogContainerModule (ref)
	local var1 = useTokens()
	local var2 = useSignalState(getAvatarSwitcherStoreModule)
	local var3 = useSignalState(var2.getIsEmpty)
	local var4 = signalsReactModule.useSignalState(var2.getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport
	useUnifiedEventListenerInExperience()
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		task.spawn(function()
			-- upvalues: var2 (copy)
			var2.fetchExperienceAvatarSupportType()
		end)
	end, {})
	local var5 = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 col gap-0" }, {
		TopBar = reactModule.createElement(topBarModule, { onClose = p1.toggleWindow }),
		TimeoutBanner = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 bg-surface-200" }, {
			Banner = reactModule.createElement(timeoutBanner, { shouldFetch = true, shouldNavigateOnClick = false })
		})
	})
	local var6 = reactModule.createElement(outfitsGridWithMessageModule)
	local var7 = reactModule.createElement(previewPanelModule, { compactLayout = p1.verticalLayout })
	
	return reactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var1.Color.OverMedia.OverMedia_0.Color3,
		BackgroundTransparency = if fFlagAvatarSwitcherUiFixes then var1.Color.OverMedia.OverMedia_0.Transparency * guiService.PreferredTransparency else var1.Color.OverMedia.OverMedia_0.Transparency
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
		Layout = if var3 then reactModule.createElement(emptyStateModule, { headerSlot = var5 }) elseif var4 then reactModule.createElement(singleItemLayoutModule, {
			headerSlot = var5,
			contentSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge col gap-medium" }, { OutfitsGrid = var6 })
		}, {}) elseif p1.verticalLayout then reactModule.createElement(verticalLayoutModule, {
			headerSlot = var5,
			topItemSlot = var7,
			bottomItemSlot = reactModule.createElement(foundationModule.View, {
				tag = "size-full-full padding-x-xlarge padding-top-xlarge"
			}, { OutfitsGrid = var6 })
		}) else reactModule.createElement(horizontalLayoutModule, {
			headerSlot = var5,
			leftItemSlot = reactModule.createElement(foundationModule.View, { tag = "size-full-full padding-x-xlarge" }, { OutfitsGrid = var6 }),
			rightItemSlot = var7
		}),
		RespawnDialogContainer = reactModule.createElement(respawnDialogContainerModule, {
			toggleWindow = p1.toggleWindow,
			getRespawnBehaviour = p1.getRespawnBehaviour,
			respawnBehaviorChangedEvent = p1.respawnBehaviorChangedEvent
		})
	})
end