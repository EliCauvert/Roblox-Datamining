local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local inventoryItemAvailability = require(parent.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local switchAvatarButtonModule = require(avatarSwitcher.Components.SwitchAvatarButton)
local avatarPreviewModule = require(avatarSwitcher.Components.AvatarPreview)
local avatarCompatibilityWarningModule = require(avatarSwitcher.Components.AvatarCompatibilityWarning)
local outfitViewportUtilsModule = require(avatarSwitcher.Components.OutfitViewport.OutfitViewportUtils)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local fFlagAvatarSwitcherWarningLayoutFix = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix
local fFlagAvatarSwitcherExpiredItemsWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning

return function(p0)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), useTokens (ref), reactModule (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), outfitViewportUtilsModule (ref), fFlagAvatarSwitcherExpiredItemsWarning (ref), inventoryItemAvailability (ref), foundationModule (ref), fFlagAvatarSwitcherWarningLayoutFix (ref), avatarPreviewModule (ref), experienceAvatarSupportTypeModule (ref), switchAvatarButtonModule (ref), avatarCompatibilityWarningModule (ref)
	local var10 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var11 = signalsReactModule.useSignalState(var10.getSelectedOutfitId)
	local var12 = signalsReactModule.useSignalState(var10.getSelectedOutfitDetails)
	local var13 = signalsReactModule.useSignalState(var10.getExperienceAvatarSupportType)
	local var14 = signalsReactModule.useSignalState(var10.getExperienceAvatarType)
	local var15 = useTokens()
	local var16 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10.toggleRespawnPrompt(true)
	end, {})
	local var17 = nil
	local _ = nil
	local var18 = nil
	
	if fFlagAvatarSwitcherAccurateAvatarWarning then
		local var19, var20 = reactModule.useState(false)
		var17 = var19
		local var21 = var20
		var18 = reactModule.useCallback(function(p1, p2)
			-- upvalues: var12 (ref), outfitViewportUtilsModule (copy), var21 (write)
			var21(outfitViewportUtilsModule.hasMissingAssetsInDescription(p2, if var12 and var12.assetIds then var12.assetIds else {}) or outfitViewportUtilsModule.hasMissingAccessoriesInHumanoid(p1, p2))
		end, { var12 })
		reactModule.useEffect(function()
			-- upvalues: var21 (write)
			var21(false)
		end, { var11 })
	end
	local var22 = if var14 == Enum.HumanoidRigType.R6 then Enum.HumanoidRigType.R6 elseif var12 then var12.rigType else nil
	local var17_1 = false
	
	if var12 ~= nil then
		local _ = true
		local rigType = var12.rigType
		var17_1 = rigType ~= var22 and ((if rigType ~= var22 then fFlagAvatarSwitcherAccurateAvatarWarning else nil) and var17)
	end
	local _ = nil
	local var24 = if fFlagAvatarSwitcherExpiredItemsWarning then if var17_1 then "Feature.AvatarSwitcher.Message.PartiallyUnsupported" elseif var12 and var12.availabilityStatus == inventoryItemAvailability.PartiallyAvailableWithExpiredSubitems then "Feature.AvatarSwitcher.Message.ExpiredItems" else nil else nil
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAvatarSwitcherWarningLayoutFix then "size-full-full padding-x-xlarge padding-y-medium col gap-small" else "size-full-full padding-x-xlarge padding-y-medium col"
	}, {
		Content = reactModule.createElement(foundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 1 }, {
			AvatarPreview = reactModule.createElement(avatarPreviewModule, {
				outfitId = var11,
				rigType = var22,
				imageScaleType = if p0.compactLayout then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
				showAvatarSupportWarning = var13 == experienceAvatarSupportTypeModule.UnknownSupport,
				showAvatarTypeCompatibilityWarning = if not fFlagAvatarSwitcherWarningLayoutFix then var17_1 else nil,
				messageBottomPadding = if p0.compactLayout then var15.Size.Size_800 + var15.Gap.Medium else var15.Gap.Medium,
				onAvatarPreviewLoaded = if fFlagAvatarSwitcherAccurateAvatarWarning then var18 else nil
			}),
			FloatingButtonContainer = not fFlagAvatarSwitcherWarningLayoutFix and (p0.compactLayout and reactModule.createElement(foundationModule.View, {
				tag = "auto-xy position-bottom-right anchor-bottom-right",
				LayoutOrder = 2
			}, {
				SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
				SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var16 })
			})),
			FloatingBottomContainer = fFlagAvatarSwitcherWarningLayoutFix and (p0.compactLayout and reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y position-bottom-left anchor-bottom-left row gap-small align-x-right align-y-bottom"
			}, {
				AvatarCompatibilityWarningContainer = (if fFlagAvatarSwitcherExpiredItemsWarning then var24 else var17_1) and reactModule.createElement(foundationModule.View, { tag = "grow auto-y", LayoutOrder = 1 }, {
					AvatarCompatibilityWarning = reactModule.createElement(avatarCompatibilityWarningModule, {
						message = if fFlagAvatarSwitcherExpiredItemsWarning then var24 else nil
					})
				}),
				FloatingButtonContainer = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy position-bottom-right anchor-bottom-right",
					LayoutOrder = 2
				}, {
					SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
					SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var16 })
				})
			}))
		}),
		AvatarCompatibilityWarning = fFlagAvatarSwitcherWarningLayoutFix and (not p0.compactLayout and ((if fFlagAvatarSwitcherExpiredItemsWarning then var24 else var17_1) and reactModule.createElement(avatarCompatibilityWarningModule, {
			LayoutOrder = 2,
			message = if fFlagAvatarSwitcherExpiredItemsWarning then var24 else nil
		}))),
		BottomButtonContainer = not p0.compactLayout and reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = if fFlagAvatarSwitcherWarningLayoutFix then 3 else 2
		}, {
			SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var16 })
		})
	})
end