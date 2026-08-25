local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagBuildLocalization = require(parent.SharedFlags).FFlagBuildLocalization
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local privateShareTooltipModule = require(buildExperience.Components.ShareAudience.PrivateShareTooltip)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local useSharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local useCreatorCreditMenuItem = require(script.Parent.useCreatorCreditMenuItem).useCreatorCreditMenuItem
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local useScaledValue = foundationModule.Hooks.useScaledValue
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local releaseAnyFocusModule = require(buildExperience.utils.releaseAnyFocus)
local buildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

local function _(p0, p1)
	return if p0.getText == nil then p0.text else p0.getText(p1)
end

return function(p2)
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var15 = useScaledValue(buildOverflowMenuWidth)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useRef(nil)
	local var23 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p2.target.universeId, p2.target.placeId) else nil
	local var24 = if var23 ~= nil then nil else var23.onShare
	local var25 = useSharePublishedExperience(p2.target.universeId)
	local var26, var27 = reactModule.useState(nil)
	local var28 = p2.onOpenCreatorCreditPage ~= nil
	local var29 = if p2.isDisabled ~= true then p2.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p2.target.universeId == nil and var28)) else true
	local var30 = p2.hasPublishedTurn == true
	local var31 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var30 (ref)
		return if p2.target.universeId == nil then nil else {
			universeId = p2.target.universeId,
			placeId = p2.target.placeId,
			sessionId = p2.target.sessionId,
			isNewGameTarget = p2.target.isNewGameTarget,
			hasPublishedTurn = var30,
			hasPublishedVersion = p2.hasPublishedVersion == true
		}
	end, {
		p2.target.universeId, p2.target.placeId, p2.target.sessionId,
		p2.target.isNewGameTarget, var30, p2.hasPublishedVersion
	})
	local var32 = p2.store.useItems(var31)
	local var33 = if fFlagBuildLocalization then {} else nil
	
	if fFlagBuildLocalization and var31 ~= nil then
		for i, v in var32 do
			for i_1, v_1 in v.items do
				var33[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var31)
			end
		end
	end
	local var34 = if fFlagBuildLocalization then useLocalization(var33) else nil
	local var35 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p2.onOpenCreatorCreditPage })
	
	local function _(p3)
		-- upvalues: fFlagBuildLocalization (copy), var34 (ref), var31 (ref)
		return if fFlagBuildLocalization then var34[p3.id] elseif p3.getText == nil then p3.text else p3.getText(var31)
	end
	
	local function buildMenuItems()
		-- upvalues: var29 (ref), var31 (ref), var32 (ref), fFlagBuildLocalization (copy), var34 (ref), var22 (ref), var28 (ref), var35 (ref)
		local t = {}
		
		if not var29 then
			if var31 ~= nil then
				for i, v in var32 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = if fFlagBuildLocalization then var34[v_1.id] elseif v_1.getText ~= nil then v_1.text else v_1.getText(var31),
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var31),
							ref = if v_1.id == "share" then var22 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var28 then
				table.insert(t, { items = { var35.item } })
			end
		end
		return t
	end
	
	local var37 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var21 (ref)
		var17(false)
		var21(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var16 and not var29,
			items = if fFlagBuildLocalization then buildMenuItems() else reactModule.useMemo(buildMenuItems, {
				var29,
				var32,
				var31,
				var28,
				var35
			}),
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var37,
			onActivated = reactModule.useCallback(function(p4)
				-- upvalues: var28 (ref), var35 (ref), var17 (ref), var31 (ref), var32 (ref), p2 (ref), releaseAnyFocusModule (copy), var19 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var24 (ref), var25 (ref), var27 (ref), var21 (ref), leaveExperienceModule (copy)
				if var28 and var35 ~= nil and p4 == var35.item.id then
					var35.activate()
					var17(false)
					
					return
				elseif var31 == nil then return end
				for i, v in var32 do
					for i_1, v_1 in v.items do
						if v_1.id == p4 then
							local var40 = if v_1.onActivated then v_1.onActivated(var31) else nil
							
							if var40 ~= nil then
								if var40.type == "openPage" then
									if p2.onAction then
										p2.onAction(var40)
									end
								elseif var40.type == "openInvitePicker" then
									if p2.onAction then
										p2.onAction(var40)
									end
								elseif var40.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var19(true)
								elseif var40.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var24 ~= nil then
										var24()
									elseif var40.placeId ~= nil then
										var25(var40.placeId)
									end
								elseif var40.type == "confirmFriendsShare" then
									var27(var40.placeId)
								elseif var40.type == "showPrivateShareTooltip" then
									var21(function(p5)
										return not p5
									end)
									
									return
								elseif var40.type == "leaveExperience" then
									var17(false)
									leaveExperienceModule()
									
									return
								end
							end
							var17(false)
							
							return
						end
					end
				end
			end, {
				var32, var31, p2.onAction, var24, var25, var28, var35
			}),
			LayoutOrder = p2.layoutOrder,
			width = UDim.new(0, var15)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p2.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var29,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var29 (ref), var21 (ref), var17 (ref), p2 (ref)
				if var29 then return end
				var21(false)
				var17(function(p6)
					return not p6
				end)
				
				if p2.onActivated then
					p2.onActivated()
				end
			end, { var29, p2.onActivated })
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var23 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var23.activeDialog,
			hasShareError = var23.hasShareError,
			onCancel = var23.onCancelDialog,
			onConfirmFriends = var23.onConfirmFriends,
			onConfirmPlaytesters = var23.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var26 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var27 (ref)
				var27(nil)
			end, {}),
			onShare = reactModule.useCallback(function()
				-- upvalues: var26 (ref), var27 (ref), var25 (ref)
				var27(nil)
				
				if var26 ~= nil then
					var25(var26)
				end
			end, { var26, var25 })
		}),
		PrivateShareTooltip = reactModule.createElement(privateShareTooltipModule, {
			anchorRef = var22,
			isOpen = var16 and var20,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var37 else nil
		}),
		VersionHistory = if var18 and p2.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p2.target.placeId,
			onClose = reactModule.useCallback(function()
				-- upvalues: var19 (ref)
				var19(false)
			end, {})
		}) else nil
	})
end