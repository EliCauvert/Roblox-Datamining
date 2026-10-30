local GuiService = game:GetService("GuiService")
local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SignalsReactModule = require(Parent.SignalsReact)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseUnifiedEventListenerInExperienceFunction = require(Parent.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local EmptyStateModule = require(AvatarSwitcher.Components.EmptyState)
local VerticalLayoutModule = require(AvatarSwitcher.Components.VerticalLayout)
local HorizontalLayoutModule = require(AvatarSwitcher.Components.HorizontalLayout)
local SingleItemLayoutModule = require(AvatarSwitcher.Components.SingleItemLayout)
local TopBarModule = require(AvatarSwitcher.Components.TopBar)
local OutfitsGridWithMessageModule = require(AvatarSwitcher.Components.OutfitsGridWithMessage)
local PreviewPanelModule = require(AvatarSwitcher.Components.PreviewPanel)
local RespawnDialogContainerModule = require(AvatarSwitcher.Components.Modals.RespawnDialogContainer)
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local ExperienceAvatarSupportTypeModule = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAvatarSwitcherUiFixes = AvatarExperienceFlagsModule.FFlagAvatarSwitcherUiFixes
local FFlagAXTimeoutAcknowledgementGating = AvatarExperienceFlagsModule.FFlagAXTimeoutAcknowledgementGating
local TimeoutBanner = AvatarExperienceCommonModule.Components.TimeoutBanner

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), GetAvatarSwitcherStoreModule (copy), SignalsReactModule (copy), ExperienceAvatarSupportTypeModule (copy), UseUnifiedEventListenerInExperienceFunction (copy), FFlagAXTimeoutAcknowledgementGating (copy), AvatarExperienceCommonModule (copy), ReactModule (copy), TopBarModule (copy), FoundationModule (copy), TimeoutBanner (copy), OutfitsGridWithMessageModule (copy), PreviewPanelModule (copy), FFlagAvatarSwitcherUiFixes (copy), GuiService (copy), EmptyStateModule (copy), SingleItemLayoutModule (copy), VerticalLayoutModule (copy), HorizontalLayoutModule (copy), RespawnDialogContainerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getIsEmpty)
	local IsUseSignalStateResultMatch = SignalsReactModule.useSignalState(UseSignalStateResult.getExperienceAvatarSupportType) == ExperienceAvatarSupportTypeModule.NoSupport
	UseUnifiedEventListenerInExperienceFunction()
	
	if FFlagAXTimeoutAcknowledgementGating then
		AvatarExperienceCommonModule.Hooks.useAvatarChangeAcknowledgementPrompt(true)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy)
		task.spawn(function()
			-- upvalues: UseSignalStateResult (upval)
			UseSignalStateResult.fetchExperienceAvatarSupportType()
		end)
	end, {})
	local Element = ReactModule.createElement(FoundationModule.View, { tag = "auto-y size-full-0 col gap-0" }, {
		TopBar = ReactModule.createElement(TopBarModule, { onClose = p1.toggleWindow }),
		TimeoutBanner = ReactModule.createElement(FoundationModule.View, { tag = "auto-y size-full-0 bg-surface-200" }, {
			Banner = ReactModule.createElement(TimeoutBanner, { shouldFetch = true, shouldNavigateOnClick = false })
		})
	})
	local Element1 = ReactModule.createElement(OutfitsGridWithMessageModule)
	local Element2 = ReactModule.createElement(PreviewPanelModule, { compactLayout = p1.verticalLayout })
	
	return (ReactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
		BackgroundTransparency = if FFlagAvatarSwitcherUiFixes then UseTokensResult.Color.OverMedia.OverMedia_0.Transparency * GuiService.PreferredTransparency else UseTokensResult.Color.OverMedia.OverMedia_0.Transparency
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		Layout = if UseSignalStateResult1 then ReactModule.createElement(EmptyStateModule, { headerSlot = Element }) elseif IsUseSignalStateResultMatch then ReactModule.createElement(SingleItemLayoutModule, {
			headerSlot = Element,
			contentSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full padding-x-xlarge col gap-medium" }, { OutfitsGrid = Element1 })
		}, {}) elseif p1.verticalLayout then ReactModule.createElement(VerticalLayoutModule, {
			headerSlot = Element,
			topItemSlot = Element2,
			bottomItemSlot = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-full padding-x-xlarge padding-top-xlarge"
			}, { OutfitsGrid = Element1 })
		}) else ReactModule.createElement(HorizontalLayoutModule, {
			headerSlot = Element,
			leftItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full padding-x-xlarge" }, { OutfitsGrid = Element1 }),
			rightItemSlot = Element2
		}),
		RespawnDialogContainer = ReactModule.createElement(RespawnDialogContainerModule, {
			toggleWindow = p1.toggleWindow,
			getRespawnBehaviour = p1.getRespawnBehaviour,
			respawnBehaviorChangedEvent = p1.respawnBehaviorChangedEvent
		})
	}))
end