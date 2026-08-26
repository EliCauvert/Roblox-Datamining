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

return function(p1)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), useTokens (ref), reactModule (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), outfitViewportUtilsModule (ref), fFlagAvatarSwitcherExpiredItemsWarning (ref), inventoryItemAvailability (ref), foundationModule (ref), fFlagAvatarSwitcherWarningLayoutFix (ref), avatarPreviewModule (ref), experienceAvatarSupportTypeModule (ref), switchAvatarButtonModule (ref), avatarCompatibilityWarningModule (ref)
	local var1 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var2 = signalsReactModule.useSignalState(var1.getSelectedOutfitId)
	local var3 = signalsReactModule.useSignalState(var1.getSelectedOutfitDetails)
	local var4 = signalsReactModule.useSignalState(var1.getExperienceAvatarSupportType)
	local var5 = signalsReactModule.useSignalState(var1.getExperienceAvatarType)
	local var6 = useTokens()
	local var7 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.toggleRespawnPrompt(true)
	end, {})
	local var8 = nil
	local _ = nil
	local var9 = nil
	
	if fFlagAvatarSwitcherAccurateAvatarWarning then
		local var10, var11 = reactModule.useState(false)
		var8 = var10
		local var12 = var11
		var9 = reactModule.useCallback(function(p2, p3)
			-- upvalues: var3 (ref), outfitViewportUtilsModule (copy), var12 (write)
			var12(outfitViewportUtilsModule.hasMissingAssetsInDescription(p3, if var3 and var3.assetIds then var3.assetIds else {}) or outfitViewportUtilsModule.hasMissingAccessoriesInHumanoid(p2, p3))
		end, { var3 })
		reactModule.useEffect(function()
			-- upvalues: var12 (write)
			var12(false)
		end, { var2 })
	end
	local var13 = if var5 == Enum.HumanoidRigType.R6 then Enum.HumanoidRigType.R6 elseif var3 then var3.rigType else nil
	local var14 = false
	
	if var3 ~= nil then
		local _ = true
		local rigType = var3.rigType
		var14 = rigType ~= var13 and ((if rigType ~= var13 then fFlagAvatarSwitcherAccurateAvatarWarning else nil) and var8)
	end
	local _ = nil
	local var15 = if fFlagAvatarSwitcherExpiredItemsWarning then if var14 then "Feature.AvatarSwitcher.Message.PartiallyUnsupported" elseif var3 and var3.availabilityStatus == inventoryItemAvailability.PartiallyAvailableWithExpiredSubitems then "Feature.AvatarSwitcher.Message.ExpiredItems" else nil else nil
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAvatarSwitcherWarningLayoutFix then "size-full-full padding-x-xlarge padding-y-medium col gap-small" else "size-full-full padding-x-xlarge padding-y-medium col"
	}, {
		Content = reactModule.createElement(foundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 1 }, {
			AvatarPreview = reactModule.createElement(avatarPreviewModule, {
				outfitId = var2,
				rigType = var13,
				imageScaleType = if p1.compactLayout then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
				showAvatarSupportWarning = var4 == experienceAvatarSupportTypeModule.UnknownSupport,
				showAvatarTypeCompatibilityWarning = if not fFlagAvatarSwitcherWarningLayoutFix then var14 else nil,
				messageBottomPadding = if p1.compactLayout then var6.Size.Size_800 + var6.Gap.Medium else var6.Gap.Medium,
				onAvatarPreviewLoaded = if fFlagAvatarSwitcherAccurateAvatarWarning then var9 else nil
			}),
			FloatingButtonContainer = not fFlagAvatarSwitcherWarningLayoutFix and (p1.compactLayout and reactModule.createElement(foundationModule.View, {
				tag = "auto-xy position-bottom-right anchor-bottom-right",
				LayoutOrder = 2
			}, {
				SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
				SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var7 })
			})),
			FloatingBottomContainer = fFlagAvatarSwitcherWarningLayoutFix and (p1.compactLayout and reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y position-bottom-left anchor-bottom-left row gap-small align-x-right align-y-bottom"
			}, {
				AvatarCompatibilityWarningContainer = (if fFlagAvatarSwitcherExpiredItemsWarning then var15 else var14) and reactModule.createElement(foundationModule.View, { tag = "grow auto-y", LayoutOrder = 1 }, {
					AvatarCompatibilityWarning = reactModule.createElement(avatarCompatibilityWarningModule, {
						message = if fFlagAvatarSwitcherExpiredItemsWarning then var15 else nil
					})
				}),
				FloatingButtonContainer = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy position-bottom-right anchor-bottom-right",
					LayoutOrder = 2
				}, {
					SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
					SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var7 })
				})
			}))
		}),
		AvatarCompatibilityWarning = fFlagAvatarSwitcherWarningLayoutFix and (not p1.compactLayout and ((if fFlagAvatarSwitcherExpiredItemsWarning then var15 else var14) and reactModule.createElement(avatarCompatibilityWarningModule, {
			LayoutOrder = 2,
			message = if fFlagAvatarSwitcherExpiredItemsWarning then var15 else nil
		}))),
		BottomButtonContainer = not p1.compactLayout and reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = if fFlagAvatarSwitcherWarningLayoutFix then 3 else 2
		}, {
			SwitchButton = reactModule.createElement(switchAvatarButtonModule, { onActivated = var7 })
		})
	})
end