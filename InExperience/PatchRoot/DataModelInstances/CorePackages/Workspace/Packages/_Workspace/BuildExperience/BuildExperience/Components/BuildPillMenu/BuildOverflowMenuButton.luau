local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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

return function(p0) --[[ line: 67 | named "BuildOverflowMenuButton" ]]
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var14 = useScaledValue(buildOverflowMenuWidth)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(false)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.target.universeId, p0.target.placeId) else nil
	local var23 = if var22 ~= nil then nil else var22.onShare
	local var24 = useSharePublishedExperience(p0.target.universeId)
	local var25, var26 = reactModule.useState(nil)
	local var27 = p0.onOpenCreatorCreditPage ~= nil
	local var28 = if p0.isDisabled ~= true then p0.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p0.target.universeId == nil and var27)) else true
	local var29 = p0.hasPublishedTurn == true
	local var30 = reactModule.useMemo(function() --[[ line: 95 ]]
		-- upvalues: p0 (ref), var29 (ref)
		return if p0.target.universeId == nil then nil else {
			universeId = p0.target.universeId,
			placeId = p0.target.placeId,
			sessionId = p0.target.sessionId,
			isNewGameTarget = p0.target.isNewGameTarget,
			hasPublishedTurn = var29,
			hasPublishedVersion = p0.hasPublishedVersion == true
		}
	end, {
		p0.target.universeId, p0.target.placeId, p0.target.sessionId,
		p0.target.isNewGameTarget, var29, p0.hasPublishedVersion
	})
	local var31 = p0.store.useItems(var30)
	local var32 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p0.onOpenCreatorCreditPage })
	local var33 = reactModule.useCallback(function() --[[ line: 168 ]]
		-- upvalues: var16 (ref), var20 (ref)
		var16(false)
		var20(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var15 and not var28,
			items = reactModule.useMemo(function() --[[ line: 123 ]]
				-- upvalues: var28 (ref), var30 (ref), var31 (ref), var21 (ref), var27 (ref), var32 (ref)
				if var28 then
					return {}
				end
				local t = {}
				
				if var30 ~= nil then
					for i, v in var31 do
						local t_1 = { items = {} }
						
						for i_1, v_1 in v.items do
							table.insert(t_1.items, {
								id = v_1.id,
								text = if v_1.getText ~= nil then v_1.text else v_1.getText(var30),
								icon = v_1.icon,
								isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var30),
								ref = if v_1.id == "share" then var21 else nil
							})
						end
						table.insert(t, t_1)
					end
				end
				if var27 then
					table.insert(t, { items = { var32.item } })
				end
				return t
			end, {
				var28,
				var31,
				var30,
				var27,
				var32
			}),
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = var33,
			onActivated = reactModule.useCallback(function(p1) --[[ line: 174 ]]
				-- upvalues: var27 (ref), var32 (ref), var16 (ref), var30 (ref), var31 (ref), p0 (ref), releaseAnyFocusModule (copy), var18 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var23 (ref), var24 (ref), var26 (ref), var20 (ref), leaveExperienceModule (copy)
				if var27 and var32 ~= nil and p1 == var32.item.id then
					var32.activate()
					var16(false)
					
					return
				elseif var30 == nil then return end
				for i, v in var31 do
					for i_1, v_1 in v.items do
						if v_1.id == p1 then
							local var36 = if v_1.onActivated then v_1.onActivated(var30) else nil
							
							if var36 ~= nil then
								if var36.type == "openPage" then
									if p0.onAction then
										p0.onAction(var36)
									end
								elseif var36.type == "openInvitePicker" then
									if p0.onAction then
										p0.onAction(var36)
									end
								elseif var36.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var18(true)
								elseif var36.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var23 ~= nil then
										var23()
									elseif var36.placeId ~= nil then
										var24(var36.placeId)
									end
								elseif var36.type == "confirmFriendsShare" then
									var26(var36.placeId)
								elseif var36.type == "showPrivateShareTooltip" then
									var20(function(p2) --[[ line: 213 ]]
										return not p2
									end)
									
									return
								elseif var36.type == "leaveExperience" then
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
				var31, var30, p0.onAction, var23, var24, var27, var32
			}),
			LayoutOrder = p0.layoutOrder,
			width = UDim.new(0, var14)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p0.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var28,
			onActivated = reactModule.useCallback(function() --[[ line: 155 ]]
				-- upvalues: var28 (ref), var20 (ref), var16 (ref), p0 (ref)
				if var28 then return end
				var20(false)
				var16(function(p3) --[[ line: 160 ]]
					return not p3
				end)
				
				if p0.onActivated then
					p0.onActivated()
				end
			end, { var28, p0.onActivated })
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var22 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var22.activeDialog,
			hasShareError = var22.hasShareError,
			onCancel = var22.onCancelDialog,
			onConfirmFriends = var22.onConfirmFriends,
			onConfirmPlaytesters = var22.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var25 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function() --[[ line: 253 ]]
				-- upvalues: var26 (ref)
				var26(nil)
			end, {}),
			onShare = reactModule.useCallback(function() --[[ line: 245 ]]
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
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var33 else nil
		}),
		VersionHistory = if var17 and p0.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p0.target.placeId,
			onClose = reactModule.useCallback(function() --[[ line: 240 ]]
				-- upvalues: var18 (ref)
				var18(false)
			end, {})
		}) else nil
	})
end