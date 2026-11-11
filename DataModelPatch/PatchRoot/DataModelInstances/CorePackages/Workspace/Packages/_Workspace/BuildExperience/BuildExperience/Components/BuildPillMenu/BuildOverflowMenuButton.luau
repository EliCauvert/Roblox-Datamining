local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ArchiveGameDialogModule = require(script.Parent.ArchiveGameDialog)
local VersionHistoryContainerModule = require(BuildExperience.Components.VersionHistory.VersionHistoryContainer)
local LeaveExperienceModule = require(BuildExperience.utils.leaveExperience)
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local ReleaseAnyFocusModule = require(BuildExperience.utils.releaseAnyFocus)
local SharePublishedExperienceFunction = require(BuildExperience.utils.sharePublishedExperience).sharePublishedExperience
local UseArchiveGameFlowModule = require(BuildExperience.utils.useArchiveGameFlow)
local BuildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

return function(p1)
	-- upvalues: UseScaledValueFunction (copy), BuildOverflowMenuWidth (copy), ReactModule (copy), UseArchiveGameFlowModule (copy), ReleaseAnyFocusModule (copy), SharePublishedExperienceFunction (copy), LeaveExperienceModule (copy), ArchiveGameDialogModule (copy), VersionHistoryContainerModule (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy)
	local UseScaledValueResult = UseScaledValueFunction(BuildOverflowMenuWidth)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseArchiveGameFlowModuleResult = UseArchiveGameFlowModule()
	local IsIsDisabled: boolean = p1.isDisabled == true or p1.target.universeId == nil
	local IsHasPublishedTurn = p1.hasPublishedTurn == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), IsHasPublishedTurn (copy)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = IsHasPublishedTurn
		}
	end, {
		p1.target.universeId,
		p1.target.placeId,
		p1.target.isNewGameTarget,
		IsHasPublishedTurn
	})
	local UseItemsResult = p1.store.useItems(UseMemoResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseArchiveGameFlowModuleResult (copy), p1 (copy)
		UseArchiveGameFlowModuleResult.confirm()
		
		if p1.onClose then
			p1.onClose()
		end
	end, { UseArchiveGameFlowModuleResult.confirm, p1.onClose })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Menu = ReactModule.createElement(Menu, {
			isOpen = UseStateResult and not IsIsDisabled,
			items = ReactModule.useMemo(function()
				-- upvalues: IsIsDisabled (copy), UseMemoResult (copy), UseItemsResult (copy)
				if IsIsDisabled or UseMemoResult == nil then
					return {}
				end
				local List = {}
				
				for _, value in UseItemsResult do
					local config = { items = {} }
					
					for _, item in value.items do
						table.insert(config.items, {
							id = item.id,
							text = item.text,
							icon = item.icon,
							isDisabled = if item.isDisabled == nil then nil else item.isDisabled(UseMemoResult)
						})
					end
					table.insert(List, config)
				end
				return List
			end, { IsIsDisabled, UseItemsResult, UseMemoResult }),
			side = PopoverSide.Bottom,
			align = PopoverAlign.End,
			onPressedOutside = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			onActivated = ReactModule.useCallback(function(Id)
				-- upvalues: UseMemoResult (copy), UseItemsResult (copy), UseArchiveGameFlowModuleResult (copy), p1 (copy), ReleaseAnyFocusModule (upval), UseStateResult2_1 (copy), SharePublishedExperienceFunction (upval), UseStateResult2 (copy), LeaveExperienceModule (upval)
				if UseMemoResult == nil then return end
				for _, value in UseItemsResult do
					for _, item in value.items do
						if item.id == Id then
							local OnActivatedResult = if item.onActivated then item.onActivated(UseMemoResult) else nil
							
							if OnActivatedResult ~= nil then
								if OnActivatedResult.type == "archive" then
									UseArchiveGameFlowModuleResult.requestArchive(UseMemoResult.universeId)
								elseif OnActivatedResult.type == "openPage" then
									if p1.onAction then
										p1.onAction(OnActivatedResult)
									end
								elseif OnActivatedResult.type == "openVersionHistory" then
									ReleaseAnyFocusModule()
									UseStateResult2_1(true)
								elseif OnActivatedResult.type == "share" then
									SharePublishedExperienceFunction(OnActivatedResult.placeId)
								elseif OnActivatedResult.type == "leaveExperience" then
									UseStateResult2(false)
									LeaveExperienceModule()
									break
								end
							end
							UseStateResult2(false)
							break
						end
					end
				end
			end, {
				UseItemsResult,
				UseMemoResult,
				p1.onAction,
				UseArchiveGameFlowModuleResult.requestArchive,
				p1.target.universeId
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, UseScaledValueResult)
		}, ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = ButtonVariant.Utility,
			size = InputSize.Medium,
			isDisabled = IsIsDisabled,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: IsIsDisabled (copy), UseStateResult2 (copy), p1 (copy)
				if IsIsDisabled then return end
				UseStateResult2(function(p2): boolean
					return not p2
				end)
				
				if p1.onActivated then
					p1.onActivated()
				end
			end, { IsIsDisabled, p1.onActivated })
		})),
		ArchiveDialog = if UseArchiveGameFlowModuleResult.isOpen then ReactModule.createElement(ArchiveGameDialogModule, {
			isOpen = true,
			onArchive = UseResult1,
			onCancel = UseArchiveGameFlowModuleResult.cancel
		}) else nil,
		VersionHistory = if UseStateResult1 and p1.target.placeId ~= nil then ReactModule.createElement(VersionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p1.target.placeId,
			onClose = UseResult
		}) else nil
	})
end