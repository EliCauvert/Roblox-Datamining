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

local function _(p0, p1) --[[ line: 72 | named "getSourceText" ]]
	return if p0.getText == nil then p0.text else p0.getText(p1)
end

return function(p2) --[[ line: 76 | named "BuildOverflowMenuButton" ]]
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var14 = useScaledValue(buildOverflowMenuWidth)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(false)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p2.target.universeId, p2.target.placeId) else nil
	local var23 = if var22 ~= nil then nil else var22.onShare
	local var24 = useSharePublishedExperience(p2.target.universeId)
	local var25, var26 = reactModule.useState(nil)
	local var27 = p2.onOpenCreatorCreditPage ~= nil
	local var28 = if p2.isDisabled ~= true then p2.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p2.target.universeId == nil and var27)) else true
	local var29 = p2.hasPublishedTurn == true
	local var30 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: p2 (ref), var29 (ref)
		return if p2.target.universeId == nil then nil else {
			universeId = p2.target.universeId,
			placeId = p2.target.placeId,
			sessionId = p2.target.sessionId,
			isNewGameTarget = p2.target.isNewGameTarget,
			hasPublishedTurn = var29,
			hasPublishedVersion = p2.hasPublishedVersion == true
		}
	end, {
		p2.target.universeId, p2.target.placeId, p2.target.sessionId,
		p2.target.isNewGameTarget, var29, p2.hasPublishedVersion
	})
	local var31 = p2.store.useItems(var30)
	local var32 = if fFlagBuildLocalization then {} else nil
	
	if fFlagBuildLocalization and var30 ~= nil then
		for i, v in var31 do
			for i_1, v_1 in v.items do
				var32[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var30)
			end
		end
	end
	local var33 = if fFlagBuildLocalization then useLocalization(var32) else nil
	local var34 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p2.onOpenCreatorCreditPage })
	
	local function _(p3) --[[ line: 141 | named "getItemText" ]]
		-- upvalues: fFlagBuildLocalization (copy), var33 (ref), var30 (ref)
		return if fFlagBuildLocalization then var33[p3.id] elseif p3.getText == nil then p3.text else p3.getText(var30)
	end
	
	local function buildMenuItems() --[[ line: 148 ]]
		-- upvalues: var28 (ref), var30 (ref), var31 (ref), fFlagBuildLocalization (copy), var33 (ref), var21 (ref), var27 (ref), var34 (ref)
		local t = {}
		
		if not var28 then
			if var30 ~= nil then
				for i, v in var31 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = if fFlagBuildLocalization then var33[v_1.id] elseif v_1.getText ~= nil then v_1.text else v_1.getText(var30),
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var30),
							ref = if v_1.id == "share" then var21 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var27 then
				table.insert(t, { items = { var34.item } })
			end
		end
		return t
	end
	
	local var36 = reactModule.useCallback(function() --[[ line: 199 ]]
		-- upvalues: var16 (ref), var20 (ref)
		var16(false)
		var20(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var15 and not var28,
			items = if fFlagBuildLocalization then buildMenuItems() else reactModule.useMemo(buildMenuItems, {
				var28,
				var31,
				var30,
				var27,
				var34
			}),
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = var36,
			onActivated = reactModule.useCallback(function(p4) --[[ line: 205 ]]
				-- upvalues: var27 (ref), var34 (ref), var16 (ref), var30 (ref), var31 (ref), p2 (ref), releaseAnyFocusModule (copy), var18 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var23 (ref), var24 (ref), var26 (ref), var20 (ref), leaveExperienceModule (copy)
				if var27 and var34 ~= nil and p4 == var34.item.id then
					var34.activate()
					var16(false)
					
					return
				elseif var30 == nil then return end
				for i, v in var31 do
					for i_1, v_1 in v.items do
						if v_1.id == p4 then
							local var39 = if v_1.onActivated then v_1.onActivated(var30) else nil
							
							if var39 ~= nil then
								if var39.type == "openPage" then
									if p2.onAction then
										p2.onAction(var39)
									end
								elseif var39.type == "openInvitePicker" then
									if p2.onAction then
										p2.onAction(var39)
									end
								elseif var39.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var18(true)
								elseif var39.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var23 ~= nil then
										var23()
									elseif var39.placeId ~= nil then
										var24(var39.placeId)
									end
								elseif var39.type == "confirmFriendsShare" then
									var26(var39.placeId)
								elseif var39.type == "showPrivateShareTooltip" then
									var20(function(p5) --[[ line: 244 ]]
										return not p5
									end)
									
									return
								elseif var39.type == "leaveExperience" then
									var16(false)
									leaveExperienceModule()
									
									return
								end
							end
							var16(false)
							
							return
						end
					end
				end
			end, {
				var31, var30, p2.onAction, var23, var24, var27, var34
			}),
			LayoutOrder = p2.layoutOrder,
			width = UDim.new(0, var14)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p2.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var28,
			onActivated = reactModule.useCallback(function() --[[ line: 186 ]]
				-- upvalues: var28 (ref), var20 (ref), var16 (ref), p2 (ref)
				if var28 then return end
				var20(false)
				var16(function(p6) --[[ line: 191 ]]
					return not p6
				end)
				
				if p2.onActivated then
					p2.onActivated()
				end
			end, { var28, p2.onActivated })
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var22 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var22.activeDialog,
			hasShareError = var22.hasShareError,
			onCancel = var22.onCancelDialog,
			onConfirmFriends = var22.onConfirmFriends,
			onConfirmPlaytesters = var22.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var25 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function() --[[ line: 284 ]]
				-- upvalues: var26 (ref)
				var26(nil)
			end, {}),
			onShare = reactModule.useCallback(function() --[[ line: 276 ]]
				-- upvalues: var25 (ref), var26 (ref), var24 (ref)
				var26(nil)
				
				if var25 ~= nil then
					var24(var25)
				end
			end, { var25, var24 })
		}),
		PrivateShareTooltip = reactModule.createElement(privateShareTooltipModule, {
			anchorRef = var21,
			isOpen = var15 and var19,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var36 else nil
		}),
		VersionHistory = if var17 and p2.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p2.target.placeId,
			onClose = reactModule.useCallback(function() --[[ line: 271 ]]
				-- upvalues: var18 (ref)
				var18(false)
			end, {})
		}) else nil
	})
end