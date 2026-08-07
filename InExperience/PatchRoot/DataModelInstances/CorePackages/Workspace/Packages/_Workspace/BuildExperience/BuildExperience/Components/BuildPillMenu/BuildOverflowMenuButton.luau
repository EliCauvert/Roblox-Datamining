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

return function(p0) --[[ line: 66 | named "BuildOverflowMenuButton" ]]
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref)
	local var13 = useScaledValue(buildOverflowMenuWidth)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(nil)
	local var21 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.target.universeId, p0.target.placeId) else nil
	local var22 = if var21 ~= nil then nil else var21.onShare
	local var23 = useSharePublishedExperience(p0.target.universeId)
	local var24, var25 = reactModule.useState(nil)
	local var26 = p0.onOpenCreatorCreditPage ~= nil
	local var27 = if p0.isDisabled ~= true then p0.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p0.target.universeId == nil and var26)) else true
	local var28 = p0.hasPublishedTurn == true
	local var29 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: p0 (ref), var28 (ref)
		return if p0.target.universeId == nil then nil else {
			universeId = p0.target.universeId,
			placeId = p0.target.placeId,
			sessionId = p0.target.sessionId,
			isNewGameTarget = p0.target.isNewGameTarget,
			hasPublishedTurn = var28,
			hasPublishedVersion = p0.hasPublishedVersion == true
		}
	end, {
		p0.target.universeId, p0.target.placeId, p0.target.sessionId,
		p0.target.isNewGameTarget, var28, p0.hasPublishedVersion
	})
	local var30 = p0.store.useItems(var29)
	local var31 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p0.onOpenCreatorCreditPage })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var14 and not var27,
			items = reactModule.useMemo(function() --[[ line: 122 ]]
				-- upvalues: var27 (ref), var29 (ref), var30 (ref), var20 (ref), var26 (ref), var31 (ref)
				if var27 then
					return {}
				end
				local t = {}
				
				if var29 ~= nil then
					for i, v in var30 do
						local t_1 = { items = {} }
						
						for i_1, v_1 in v.items do
							table.insert(t_1.items, {
								id = v_1.id,
								text = if v_1.getText ~= nil then v_1.text else v_1.getText(var29),
								icon = v_1.icon,
								isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var29),
								ref = if v_1.id == "share" then var20 else nil
							})
						end
						table.insert(t, t_1)
					end
				end
				if var26 then
					table.insert(t, { items = { var31.item } })
				end
				return t
			end, {
				var27,
				var30,
				var29,
				var26,
				var31
			}),
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = reactModule.useCallback(function() --[[ line: 167 ]]
				-- upvalues: var15 (ref), var19 (ref)
				var15(false)
				var19(false)
			end, {}),
			onActivated = reactModule.useCallback(function(p1) --[[ line: 173 ]]
				-- upvalues: var26 (ref), var31 (ref), var15 (ref), var29 (ref), var30 (ref), p0 (ref), releaseAnyFocusModule (copy), var17 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var22 (ref), var23 (ref), var25 (ref), var19 (ref), leaveExperienceModule (copy)
				if var26 and var31 ~= nil and p1 == var31.item.id then
					var31.activate()
					var15(false)
					
					return
				elseif var29 == nil then return end
				for i, v in var30 do
					for i_1, v_1 in v.items do
						if v_1.id == p1 then
							local var34 = if v_1.onActivated then v_1.onActivated(var29) else nil
							
							if var34 ~= nil then
								if var34.type == "openPage" then
									if p0.onAction then
										p0.onAction(var34)
									end
								elseif var34.type == "openInvitePicker" then
									if p0.onAction then
										p0.onAction(var34)
									end
								elseif var34.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var17(true)
								elseif var34.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var22 ~= nil then
										var22()
									elseif var34.placeId ~= nil then
										var23(var34.placeId)
									end
								elseif var34.type == "confirmFriendsShare" then
									var25(var34.placeId)
								elseif var34.type == "showPrivateShareTooltip" then
									var19(function(p2) --[[ line: 212 ]]
										return not p2
									end)
									
									return
								elseif var34.type == "leaveExperience" then
									var15(false)
									leaveExperienceModule()
									
									return
								end
							end
							var15(false)
							
							return
						end
					end
				end
			end, {
				var30, var29, p0.onAction, var22, var23, var26, var31
			}),
			LayoutOrder = p0.layoutOrder,
			width = UDim.new(0, var13)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p0.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var27,
			onActivated = reactModule.useCallback(function() --[[ line: 154 ]]
				-- upvalues: var27 (ref), var19 (ref), var15 (ref), p0 (ref)
				if var27 then return end
				var19(false)
				var15(function(p3) --[[ line: 159 ]]
					return not p3
				end)
				
				if p0.onActivated then
					p0.onActivated()
				end
			end, { var27, p0.onActivated })
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var21 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var21.activeDialog,
			hasShareError = var21.hasShareError,
			onCancel = var21.onCancelDialog,
			onConfirmFriends = var21.onConfirmFriends,
			onConfirmPlaytesters = var21.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var24 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function() --[[ line: 252 ]]
				-- upvalues: var25 (ref)
				var25(nil)
			end, {}),
			onShare = reactModule.useCallback(function() --[[ line: 244 ]]
				-- upvalues: var24 (ref), var25 (ref), var23 (ref)
				var25(nil)
				
				if var24 ~= nil then
					var23(var24)
				end
			end, { var24, var23 })
		}),
		PrivateShareTooltip = reactModule.createElement(privateShareTooltipModule, { anchorRef = var20, isOpen = var14 and var18 }),
		VersionHistory = if var16 and p0.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p0.target.placeId,
			onClose = reactModule.useCallback(function() --[[ line: 239 ]]
				-- upvalues: var17 (ref)
				var17(false)
			end, {})
		}) else nil
	})
end