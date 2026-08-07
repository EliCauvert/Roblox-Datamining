local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local otterModule = require(corePackagesService.Packages.Otter)
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local useLayoutValues = playerListModule.Common.useLayoutValues
local parent = script.Parent.Parent
local withLayoutValues = require(parent.Connection.LayoutValues).WithLayoutValues
local dropDownButtonModule = require(script.Parent.DropDownButton)
local dropDownPlayerHeaderModule = require(script.Parent.DropDownPlayerHeader)
local friendDropDownButtonModule = require(script.Parent.FriendDropDownButton)
local localPlayer = playersService.LocalPlayer
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local onBlockButtonActivatedModule = require(robloxGui.Modules.Settings.onBlockButtonActivated)
local images = UIBloxModule.App.ImageSet.Images
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local parent_1 = parent.Parent
local closePlayerDropDownModule = require(parent_1.Actions.ClosePlayerDropDown)
local setPlayerListVisibilityModule = require(parent_1.Actions.SetPlayerListVisibility)
local fFlagPlayerListReduceRerendersModule = require(parent_1.Flags.FFlagPlayerListReduceRerenders)
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local unblockPlayerModule = require(parent_1.Thunks.UnblockPlayer)
local requestFriendshipModule = require(parent_1.Thunks.RequestFriendship)
local setPlayerIsBlockedModule = require(parent_1.Actions.SetPlayerIsBlocked)
local playerDropDown = roactModule.PureComponent:extend("PlayerDropDown")
local fFlagStandardizeSafetyIcon = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local fFlagAllowDisplayingFoundationIconsForDropdownModule = require(parent_1.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
playerDropDown.validateProps = tModule.strictInterface({
	contentsVisible = tModule.boolean,
	selectedPlayer = tModule.optional(tModule.instanceIsA("Player")),
	isVisible = tModule.boolean,
	playerRelationship = tModule.optional(tModule.strictInterface({
		isBlocked = tModule.boolean,
		friendStatus = tModule.enum(Enum.FriendStatus),
		isFollowing = tModule.boolean,
		isFollower = tModule.boolean
	})),
	inspectMenuEnabled = tModule.boolean,
	isTenFootInterface = tModule.boolean,
	isUsingGamepad = tModule.optional(tModule.boolean),
	subjectToChinaPolicies = tModule.boolean,
	preferredTransparency = tModule.number,
	closeDropDown = tModule.callback,
	blockPlayerSuccess = tModule.callback,
	unblockPlayer = tModule.callback,
	requestFriendship = tModule.callback,
	setPlayerListVisibility = tModule.callback,
	focusGuiObject = tModule.optional(tModule.callback),
	focusedGuiObject = tModule.optional(tModule.instanceIsA("GuiObject")),
	layoutValues = tModule.optional(tModule.table)
})
local t = { dampingRatio = 1, frequency = 4 }

function playerDropDown.init(p0) --[[ line: 90 ]]
	-- upvalues: reactModule (ref), roactModule (ref), otterModule (ref)
	p0.state = { allVisible = false, contentVisible = false }
	p0.buttonsContainerRef = reactModule.createRef()
	local var32, var33 = roactModule.createBinding(1)
	p0.containerScale = var32
	p0.updateContainerScale = var33
	p0.containerScaleMotor = otterModule.createSingleMotor(0)
	p0.containerScaleMotor:onStep(function(p1) --[[ line: 100 ]]
		-- upvalues: p0 (ref)
		p0.updateContainerScale(p1)
	end)
	local var34, var35 = roactModule.createBinding(1)
	p0.transparency = var34
	p0.updateTransparency = var35
	p0.transparencyMotor = otterModule.createSingleMotor(0)
	p0.transparencyMotor:onStep(function(p2) --[[ line: 106 ]]
		-- upvalues: p0 (ref)
		p0.updateTransparency(p2)
		
		if p2 < 0.5 and p0.props.isVisible and p0.props.contentsVisible then
			p0:setState({ contentVisible = true })
		else
			p0:setState({ contentVisible = false })
		end
		p0:setState({ allVisible = p2 < 1 })
	end)
	local var36, var37 = roactModule.createBinding(1)
	p0.buttonTransparency = var36
	p0.updateButtonTransparency = var37
	p0.buttonTransparencyMotor = otterModule.createSingleMotor(0)
	p0.buttonTransparencyMotor:onStep(function(p3) --[[ line: 124 ]]
		-- upvalues: p0 (ref)
		p0.updateButtonTransparency(p3)
	end)
end

function playerDropDown.createFriendButton(p4, p5) --[[ line: 129 ]]
	-- upvalues: roactModule (ref), friendDropDownButtonModule (ref)
	return roactModule.createElement(friendDropDownButtonModule, {
		layoutOrder = 1,
		playerRelationship = p5,
		selectedPlayer = p4.props.selectedPlayer,
		dropDownOpen = p4.props.isVisible,
		requestFriendship = p4.props.requestFriendship,
		contentVisible = p4.state.contentVisible,
		isUsingGamepad = p4.props.isUsingGamepad
	})
end

function playerDropDown.createBlockButton(p6, p7) --[[ line: 142 ]]
	-- upvalues: robloxTranslatorModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), onBlockButtonActivatedModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local selectedPlayer = p6.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		contentVisible = p6.state.contentVisible,
		buttonTransparency = p6.buttonTransparency,
		text = if p7.isBlocked then robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock") else robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block"),
		icon = images["icons/actions/block"],
		onActivated = function() --[[ line: 156 ]]
			-- upvalues: p7 (ref), p6 (ref), selectedPlayer (ref), onBlockButtonActivatedModule (copy), fFlagAddNewPlayerListMobileFocusNav (copy)
			if p7.isBlocked then
				p6.props.unblockPlayer(selectedPlayer)
				
				return
			end
			onBlockButtonActivatedModule(selectedPlayer, nil, p6.__componentName, {
				onBlockingSuccess = function() --[[ line: 161 ]]
					-- upvalues: p6 (copy), selectedPlayer (copy)
					p6.props.blockPlayerSuccess(selectedPlayer)
				end,
				onBlockingModalClose = if fFlagAddNewPlayerListMobileFocusNav then function() --[[ line: 165 ]]
					-- upvalues: p6 (copy)
					if p6.props.isUsingGamepad then
						p6.props.focusGuiObject(p6.buttonsContainerRef.current)
					end
				end else nil
			})
		end
	})
end

function playerDropDown.createReportButton(p8) --[[ line: 177 ]]
	-- upvalues: fFlagStandardizeSafetyIcon (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), isNewInGameMenuEnabledModule (ref), robloxGui (ref)
	local selectedPlayer = p8.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 5,
		lastButton = true,
		forceShowOptions = false,
		contentVisible = p8.state.contentVisible,
		buttonTransparency = p8.buttonTransparency,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Report"),
		icon = if fFlagStandardizeSafetyIcon and fFlagAllowDisplayingFoundationIconsForDropdownModule then "Flag" else images["icons/actions/feedback"],
		onActivated = function() --[[ line: 192 ]]
			-- upvalues: isNewInGameMenuEnabledModule (copy), robloxGui (copy), selectedPlayer (ref), p8 (ref)
			if isNewInGameMenuEnabledModule() then
				require(robloxGui.Modules.InGameMenuInit).openReportDialog(selectedPlayer, p8.__componentName)
				
				return
			end
			require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(selectedPlayer, p8.__componentName)
			p8.props.closeDropDown()
		end
	})
end

function playerDropDown.createInspectButton(p9) --[[ line: 206 ]]
	-- upvalues: images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), localPlayer (ref), guiService (ref)
	local selectedPlayer = p9.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 3,
		forceShowOptions = false,
		contentVisible = p9.state.contentVisible,
		buttonTransparency = p9.buttonTransparency,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = images["icons/actions/zoomIn"],
		lastButton = selectedPlayer == localPlayer,
		onActivated = function() --[[ line: 218 ]]
			-- upvalues: guiService (copy), selectedPlayer (ref), p9 (ref)
			guiService:InspectPlayerFromUserIdWithCtx(selectedPlayer.UserId, "leaderBoard")
			p9.props.closeDropDown()
			p9.props.setPlayerListVisibility(false)
		end
	})
end

function playerDropDown.render(p10) --[[ line: 226 ]]
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownPlayerHeaderModule (ref), localPlayer (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	return withLayoutValues(function(_) --[[ line: 227 ]]
		-- upvalues: p10 (ref), roactModule (copy), dropDownPlayerHeaderModule (copy), localPlayer (copy), fFlagAddNewPlayerListMobileFocusNav (copy)
		layoutValues = p10.props.layoutValues
		local selectedPlayer = p10.props.selectedPlayer
		
		if not selectedPlayer or p10.props.isTenFootInterface then
			return nil
		end
		local t = {
			UIScale = roactModule.createElement("UIScale", { Scale = p10.containerScale }),
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, layoutValues.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = roactModule.createElement(dropDownPlayerHeaderModule, {
				player = p10.props.selectedPlayer,
				contentVisible = p10.state.contentVisible,
				transparency = p10.transparency
			})
		}
		local var39 = 4 * layoutValues.DropDownButtonSizeY + layoutValues.DropDownHeaderSizeY
		local var40 = layoutValues.DropDownButtonPadding + layoutValues.DropDownHeaderSizeY
		local playerRelationship = p10.props.playerRelationship
		
		if selectedPlayer ~= localPlayer then
			if not playerRelationship.isBlocked then
				t.FriendButton = p10:createFriendButton(playerRelationship)
				var40 = var40 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
			end
			t.BlockButton = p10:createBlockButton(playerRelationship)
			var40 = var40 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
			t.ReportButton = p10:createReportButton()
			var40 = var40 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
		end
		if p10.props.inspectMenuEnabled then
			t.InspectButton = p10:createInspectButton()
			var40 = var40 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
		end
		return roactModule.createElement("ImageButton", {
			LayoutOrder = p10.props.layoutOrder,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Selectable = false,
			Modal = false,
			Visible = p10.state.allVisible,
			AutoButtonColor = false,
			Active = p10.props.isVisible,
			Image = "",
			SelectionGroup = if fFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			[roactModule.Event.Activated] = p10.props.closeDropDown,
			[roactModule.Ref] = p10.imageButtonRef
		}, {
			Container = roactModule.createElement("Frame", {
				LayoutOrder = p10.props.layoutOrder,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, -var39 / 2),
				Size = UDim2.new(0, layoutValues.PlayerDropDownSizeXMobile, 0, var40 - layoutValues.DropDownButtonPadding),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Ref] = if fFlagAddNewPlayerListMobileFocusNav then p10.buttonsContainerRef else nil
			}, t)
		})
	end)
end

function playerDropDown.getScale(p11) --[[ line: 310 ]]
	return if p11.props.isVisible and p11.props.contentsVisible then 1 else 1.25
end

function playerDropDown.getTransparency(p12) --[[ line: 317 ]]
	return if p12.props.isVisible and p12.props.contentsVisible then 0 else 1
end

function playerDropDown.getButtonTransparency(p13) --[[ line: 324 ]]
	return if p13.props.isVisible and p13.props.contentsVisible then p13.props.preferredTransparency * 0.3 else 1
end

function playerDropDown.didUpdate(p14, _, p15) --[[ line: 331 ]]
	-- upvalues: otterModule (ref), t (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	p14.containerScaleMotor:setGoal(otterModule.spring(p14:getScale(), t))
	p14.transparencyMotor:setGoal(otterModule.spring(p14:getTransparency(), t))
	p14.buttonTransparencyMotor:setGoal(otterModule.spring(p14:getButtonTransparency(), t))
	
	if fFlagAddNewPlayerListMobileFocusNav and p14.props.isUsingGamepad and (p15.contentVisible ~= p14.state.contentVisible or not p14.props.focusedGuiObject) and (p14.state.contentVisible and p14.buttonsContainerRef.current) then
		p14.props.focusGuiObject(p14.buttonsContainerRef.current)
		
		if not fFlagAddNewPlayerListMobileFocusNav then
			p14.buttonsContainerRef.current.SelectionGroup = true
			p14.buttonsContainerRef.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			p14.buttonsContainerRef.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			p14.buttonsContainerRef.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			p14.buttonsContainerRef.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		end
	end
end

function playerDropDown.didMount(_) --[[ line: 352 ]] end

function playerDropDown.willUnmount(p16) --[[ line: 354 ]]
	p16.transparencyMotor:destroy()
	p16.containerScaleMotor:destroy()
	p16.buttonTransparencyMotor:destroy()
	p16.transparencyMotor = nil
	p16.containerScaleMotor = nil
	p16.buttonTransparencyMotor = nil
end

local function mapStateToProps(p17) --[[ line: 364 ]]
	-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref)
	local selectedPlayer = p17.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = selectedPlayer,
		isVisible = p17.playerDropDown.isVisible and p17.displayOptions.isVisible,
		playerRelationship = selectedPlayer and p17.playerRelationship[selectedPlayer.UserId],
		inspectMenuEnabled = p17.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p17.displayOptions.isTenFootInterface,
		isUsingGamepad = if fFlagAddNewPlayerListMobileFocusNav then p17.displayOptions.isUsingGamepad else nil,
		subjectToChinaPolicies = p17.displayOptions.subjectToChinaPolicies,
		preferredTransparency = p17.settings.preferredTransparency
	}
end

local function mapDispatchToProps(p18) --[[ line: 381 ]]
	-- upvalues: closePlayerDropDownModule (ref), setPlayerListVisibilityModule (ref), setPlayerIsBlockedModule (ref), unblockPlayerModule (ref), requestFriendshipModule (ref)
	return {
		closeDropDown = function() --[[ line: 383 ]]
			-- upvalues: p18 (ref), closePlayerDropDownModule (copy)
			return p18(closePlayerDropDownModule())
		end,
		setPlayerListVisibility = function(value) --[[ line: 387 ]]
			-- upvalues: p18 (ref), setPlayerListVisibilityModule (copy)
			return p18(setPlayerListVisibilityModule(value))
		end,
		blockPlayerSuccess = function(p19) --[[ line: 391 ]]
			-- upvalues: p18 (ref), setPlayerIsBlockedModule (copy)
			p18(setPlayerIsBlockedModule(p19, true))
		end,
		unblockPlayer = function(p20) --[[ line: 395 ]]
			-- upvalues: p18 (ref), unblockPlayerModule (copy)
			return p18(unblockPlayerModule(p20))
		end,
		requestFriendship = function(p21, _) --[[ line: 399 ]]
			-- upvalues: p18 (ref), requestFriendshipModule (copy)
			return p18(requestFriendshipModule(p21))
		end
	}
end

local function PlayerDropDownWrapper(p22) --[[ line: 405 ]]
	-- upvalues: useLayoutValues (ref), reactFocusNavigationModule (ref), roactModule (ref), playerDropDown (ref), cryoModule (ref)
	return roactModule.createElement(playerDropDown, cryoModule.Dictionary.join(p22, {
		focusGuiObject = reactFocusNavigationModule.useFocusGuiObject(),
		focusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject(),
		layoutValues = useLayoutValues()
	}))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)) else roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)