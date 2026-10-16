local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SignalsReactModule = require(Parent.SignalsReact)
local InventoryItemAvailability = require(Parent.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local SwitchAvatarButtonModule = require(AvatarSwitcher.Components.SwitchAvatarButton)
local AvatarPreviewModule = require(AvatarSwitcher.Components.AvatarPreview)
local AvatarCompatibilityWarningModule = require(AvatarSwitcher.Components.AvatarCompatibilityWarning)
local OutfitViewportUtilsModule = require(AvatarSwitcher.Components.OutfitViewport.OutfitViewportUtils)
local ExperienceAvatarSupportTypeModule = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local FFlagAvatarSwitcherAccurateAvatarWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local FFlagAvatarSwitcherWarningLayoutFix = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix
local FFlagAvatarSwitcherExpiredItemsWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning

return function(p1) --[[ Line: 33 | Named "PreviewPanel" ]]
	-- upvalues: SignalsReactModule (copy), GetAvatarSwitcherStoreModule (copy), UseTokensFunction (copy), ReactModule (copy), FFlagAvatarSwitcherAccurateAvatarWarning (copy), OutfitViewportUtilsModule (copy), FFlagAvatarSwitcherExpiredItemsWarning (copy), InventoryItemAvailability (copy), FoundationModule (copy), FFlagAvatarSwitcherWarningLayoutFix (copy), AvatarPreviewModule (copy), ExperienceAvatarSupportTypeModule (copy), SwitchAvatarButtonModule (copy), AvatarCompatibilityWarningModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getSelectedOutfitId)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseSignalStateResult.getSelectedOutfitDetails)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseSignalStateResult.getExperienceAvatarSupportType)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseSignalStateResult.getExperienceAvatarType)
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 41 ]]
		-- upvalues: UseSignalStateResult (copy)
		UseSignalStateResult.toggleRespawnPrompt(true)
	end, {})
	local v1 = nil
	local UseStateResult2 = nil
	local UseResult1 = nil
	
	if FFlagAvatarSwitcherAccurateAvatarWarning then
		v1, UseStateResult2 = ReactModule.useState(false)
		UseResult1 = ReactModule.useCallback(function(p2, p3) --[[ Line: 48 ]]
			-- upvalues: UseSignalStateResult2 (copy), OutfitViewportUtilsModule (upval), UseStateResult2 (ref)
			local HasMissingAccessoriesInHumanoid = OutfitViewportUtilsModule.hasMissingAccessoriesInHumanoid(p2, p3)
			UseStateResult2(OutfitViewportUtilsModule.hasMissingAssetsInDescription(p3, if UseSignalStateResult2 and UseSignalStateResult2.assetIds then UseSignalStateResult2.assetIds else {}) or HasMissingAccessoriesInHumanoid)
		end, { UseSignalStateResult2 })
		ReactModule.useEffect(function() --[[ Line: 60 ]]
			-- upvalues: UseStateResult2 (ref)
			UseStateResult2(false)
		end, { UseSignalStateResult1 })
	end
	local R6 = if UseSignalStateResult4 == Enum.HumanoidRigType.R6 then Enum.HumanoidRigType.R6 elseif UseSignalStateResult2 then UseSignalStateResult2.rigType else nil
	local IsNotRigTypeMatch = UseSignalStateResult2 ~= nil and (UseSignalStateResult2.rigType ~= R6 or FFlagAvatarSwitcherAccurateAvatarWarning and v1)
	local FeatureAvatarSwitcherMessagePartiallyUnsupported = nil
	
	if FFlagAvatarSwitcherExpiredItemsWarning then
		local IsAvailabilityStatusMatch: boolean = UseSignalStateResult2 and UseSignalStateResult2.availabilityStatus == InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems
		FeatureAvatarSwitcherMessagePartiallyUnsupported = if IsNotRigTypeMatch then "Feature.AvatarSwitcher.Message.PartiallyUnsupported" elseif IsAvailabilityStatusMatch then "Feature.AvatarSwitcher.Message.ExpiredItems" else nil
	end
	return (ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAvatarSwitcherWarningLayoutFix then "size-full-full padding-x-xlarge padding-y-medium col gap-small" else "size-full-full padding-x-xlarge padding-y-medium col"
	}, {
		Content = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 1 }, {
			AvatarPreview = ReactModule.createElement(AvatarPreviewModule, {
				outfitId = UseSignalStateResult1,
				rigType = R6,
				imageScaleType = if p1.compactLayout then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
				showAvatarSupportWarning = UseSignalStateResult3 == ExperienceAvatarSupportTypeModule.UnknownSupport,
				showAvatarTypeCompatibilityWarning = if FFlagAvatarSwitcherWarningLayoutFix then nil else IsNotRigTypeMatch,
				messageBottomPadding = if p1.compactLayout then UseTokensResult.Size.Size_800 + UseTokensResult.Gap.Medium else UseTokensResult.Gap.Medium,
				onAvatarPreviewLoaded = if FFlagAvatarSwitcherAccurateAvatarWarning then UseResult1 else nil
			}),
			FloatingButtonContainer = not FFlagAvatarSwitcherWarningLayoutFix and (p1.compactLayout and ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy position-bottom-right anchor-bottom-right",
				LayoutOrder = 2
			}, {
				SizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
				SwitchButton = ReactModule.createElement(SwitchAvatarButtonModule, { onActivated = UseResult })
			})),
			FloatingBottomContainer = FFlagAvatarSwitcherWarningLayoutFix and (p1.compactLayout and ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y position-bottom-left anchor-bottom-left row gap-small align-x-right align-y-bottom"
			}, {
				AvatarCompatibilityWarningContainer = (if FFlagAvatarSwitcherExpiredItemsWarning then FeatureAvatarSwitcherMessagePartiallyUnsupported else IsNotRigTypeMatch) and ReactModule.createElement(FoundationModule.View, { tag = "grow auto-y", LayoutOrder = 1 }, {
					AvatarCompatibilityWarning = ReactModule.createElement(AvatarCompatibilityWarningModule, {
						message = if FFlagAvatarSwitcherExpiredItemsWarning then FeatureAvatarSwitcherMessagePartiallyUnsupported else nil
					})
				}),
				FloatingButtonContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy position-bottom-right anchor-bottom-right",
					LayoutOrder = 2
				}, {
					SizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(100, 0) }),
					SwitchButton = ReactModule.createElement(SwitchAvatarButtonModule, { onActivated = UseResult })
				})
			}))
		}),
		AvatarCompatibilityWarning = FFlagAvatarSwitcherWarningLayoutFix and (not p1.compactLayout and ((if FFlagAvatarSwitcherExpiredItemsWarning then FeatureAvatarSwitcherMessagePartiallyUnsupported else IsNotRigTypeMatch) and ReactModule.createElement(AvatarCompatibilityWarningModule, {
			LayoutOrder = 2,
			message = if FFlagAvatarSwitcherExpiredItemsWarning then FeatureAvatarSwitcherMessagePartiallyUnsupported else nil
		}))),
		BottomButtonContainer = not p1.compactLayout and ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = if FFlagAvatarSwitcherWarningLayoutFix then 3 else 2
		}, {
			SwitchButton = ReactModule.createElement(SwitchAvatarButtonModule, { onActivated = UseResult })
		})
	}))
end