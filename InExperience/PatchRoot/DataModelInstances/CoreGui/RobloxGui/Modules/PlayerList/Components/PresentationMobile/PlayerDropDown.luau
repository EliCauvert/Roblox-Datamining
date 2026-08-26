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

function playerDropDown.init(p1)
	-- upvalues: reactModule (ref), roactModule (ref), otterModule (ref)
	p1.state = { allVisible = false, contentVisible = false }
	p1.buttonsContainerRef = reactModule.createRef()
	local var1, var2 = roactModule.createBinding(1)
	p1.containerScale = var1
	p1.updateContainerScale = var2
	p1.containerScaleMotor = otterModule.createSingleMotor(0)
	p1.containerScaleMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateContainerScale(p2)
	end)
	local var3, var4 = roactModule.createBinding(1)
	p1.transparency = var3
	p1.updateTransparency = var4
	p1.transparencyMotor = otterModule.createSingleMotor(0)
	p1.transparencyMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateTransparency(p2)
		
		if p2 < 0.5 and p1.props.isVisible and p1.props.contentsVisible then
			p1:setState({ contentVisible = true })
		else
			p1:setState({ contentVisible = false })
		end
		p1:setState({ allVisible = p2 < 1 })
	end)
	local var5, var6 = roactModule.createBinding(1)
	p1.buttonTransparency = var5
	p1.updateButtonTransparency = var6
	p1.buttonTransparencyMotor = otterModule.createSingleMotor(0)
	p1.buttonTransparencyMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateButtonTransparency(p2)
	end)
end

function playerDropDown.createFriendButton(p1, p2)
	-- upvalues: roactModule (ref), friendDropDownButtonModule (ref)
	return roactModule.createElement(friendDropDownButtonModule, {
		layoutOrder = 1,
		playerRelationship = p2,
		selectedPlayer = p1.props.selectedPlayer,
		dropDownOpen = p1.props.isVisible,
		requestFriendship = p1.props.requestFriendship,
		contentVisible = p1.state.contentVisible,
		isUsingGamepad = p1.props.isUsingGamepad
	})
end

function playerDropDown.createBlockButton(p1, p2)
	-- upvalues: robloxTranslatorModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), onBlockButtonActivatedModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local selectedPlayer = p1.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = if p2.isBlocked then robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock") else robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block"),
		icon = images["icons/actions/block"],
		onActivated = function()
			-- upvalues: p2 (ref), p1 (ref), selectedPlayer (ref), onBlockButtonActivatedModule (copy), fFlagAddNewPlayerListMobileFocusNav (copy)
			if p2.isBlocked then
				p1.props.unblockPlayer(selectedPlayer)
				
				return
			end
			onBlockButtonActivatedModule(selectedPlayer, nil, p1.__componentName, {
				onBlockingSuccess = function()
					-- upvalues: p1 (copy), selectedPlayer (copy)
					p1.props.blockPlayerSuccess(selectedPlayer)
				end,
				onBlockingModalClose = if fFlagAddNewPlayerListMobileFocusNav then function()
					-- upvalues: p1 (copy)
					if p1.props.isUsingGamepad then
						p1.props.focusGuiObject(p1.buttonsContainerRef.current)
					end
				end else nil
			})
		end
	})
end

function playerDropDown.createReportButton(p1)
	-- upvalues: fFlagStandardizeSafetyIcon (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), isNewInGameMenuEnabledModule (ref), robloxGui (ref)
	local selectedPlayer = p1.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 5,
		lastButton = true,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Report"),
		icon = if fFlagStandardizeSafetyIcon and fFlagAllowDisplayingFoundationIconsForDropdownModule then "Flag" else images["icons/actions/feedback"],
		onActivated = function()
			-- upvalues: isNewInGameMenuEnabledModule (copy), robloxGui (copy), selectedPlayer (ref), p1 (ref)
			if isNewInGameMenuEnabledModule() then
				require(robloxGui.Modules.InGameMenuInit).openReportDialog(selectedPlayer, p1.__componentName)
				
				return
			end
			require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(selectedPlayer, p1.__componentName)
			p1.props.closeDropDown()
		end
	})
end

function playerDropDown.createInspectButton(p1)
	-- upvalues: images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), localPlayer (ref), guiService (ref)
	local selectedPlayer = p1.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 3,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = images["icons/actions/zoomIn"],
		lastButton = selectedPlayer == localPlayer,
		onActivated = function()
			-- upvalues: guiService (copy), selectedPlayer (ref), p1 (ref)
			guiService:InspectPlayerFromUserIdWithCtx(selectedPlayer.UserId, "leaderBoard")
			p1.props.closeDropDown()
			p1.props.setPlayerListVisibility(false)
		end
	})
end

function playerDropDown.render(p1)
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownPlayerHeaderModule (ref), localPlayer (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	return withLayoutValues(function(_)
		-- upvalues: p1 (ref), roactModule (copy), dropDownPlayerHeaderModule (copy), localPlayer (copy), fFlagAddNewPlayerListMobileFocusNav (copy)
		layoutValues = p1.props.layoutValues
		local selectedPlayer = p1.props.selectedPlayer
		
		if not selectedPlayer or p1.props.isTenFootInterface then
			return nil
		end
		local t = {
			UIScale = roactModule.createElement("UIScale", { Scale = p1.containerScale }),
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, layoutValues.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = roactModule.createElement(dropDownPlayerHeaderModule, {
				player = p1.props.selectedPlayer,
				contentVisible = p1.state.contentVisible,
				transparency = p1.transparency
			})
		}
		local var1 = 4 * layoutValues.DropDownButtonSizeY + layoutValues.DropDownHeaderSizeY
		local var2 = layoutValues.DropDownButtonPadding + layoutValues.DropDownHeaderSizeY
		local playerRelationship = p1.props.playerRelationship
		
		if selectedPlayer ~= localPlayer then
			if not playerRelationship.isBlocked then
				t.FriendButton = p1:createFriendButton(playerRelationship)
				var2 = var2 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
			end
			t.BlockButton = p1:createBlockButton(playerRelationship)
			var2 = var2 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
			t.ReportButton = p1:createReportButton()
			var2 = var2 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
		end
		if p1.props.inspectMenuEnabled then
			t.InspectButton = p1:createInspectButton()
			var2 = var2 + layoutValues.DropDownButtonPadding + layoutValues.DropDownButtonSizeY
		end
		return roactModule.createElement("ImageButton", {
			LayoutOrder = p1.props.layoutOrder,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Selectable = false,
			Modal = false,
			Visible = p1.state.allVisible,
			AutoButtonColor = false,
			Active = p1.props.isVisible,
			Image = "",
			SelectionGroup = if fFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			[roactModule.Event.Activated] = p1.props.closeDropDown,
			[roactModule.Ref] = p1.imageButtonRef
		}, {
			Container = roactModule.createElement("Frame", {
				LayoutOrder = p1.props.layoutOrder,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, -var1 / 2),
				Size = UDim2.new(0, layoutValues.PlayerDropDownSizeXMobile, 0, var2 - layoutValues.DropDownButtonPadding),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Ref] = if fFlagAddNewPlayerListMobileFocusNav then p1.buttonsContainerRef else nil
			}, t)
		})
	end)
end

function playerDropDown.getScale(p1)
	return if p1.props.isVisible and p1.props.contentsVisible then 1 else 1.25
end

function playerDropDown.getTransparency(p1)
	return if p1.props.isVisible and p1.props.contentsVisible then 0 else 1
end

function playerDropDown.getButtonTransparency(p1)
	return if p1.props.isVisible and p1.props.contentsVisible then p1.props.preferredTransparency * 0.3 else 1
end

function playerDropDown.didUpdate(p1, _, p2)
	-- upvalues: otterModule (ref), t (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	p1.containerScaleMotor:setGoal(otterModule.spring(p1:getScale(), t))
	p1.transparencyMotor:setGoal(otterModule.spring(p1:getTransparency(), t))
	p1.buttonTransparencyMotor:setGoal(otterModule.spring(p1:getButtonTransparency(), t))
	
	if fFlagAddNewPlayerListMobileFocusNav and p1.props.isUsingGamepad and (p2.contentVisible ~= p1.state.contentVisible or not p1.props.focusedGuiObject) and (p1.state.contentVisible and p1.buttonsContainerRef.current) then
		p1.props.focusGuiObject(p1.buttonsContainerRef.current)
		
		if not fFlagAddNewPlayerListMobileFocusNav then
			p1.buttonsContainerRef.current.SelectionGroup = true
			p1.buttonsContainerRef.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		end
	end
end

function playerDropDown.didMount(_) end

function playerDropDown.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.containerScaleMotor:destroy()
	p1.buttonTransparencyMotor:destroy()
	p1.transparencyMotor = nil
	p1.containerScaleMotor = nil
	p1.buttonTransparencyMotor = nil
end

local function mapStateToProps(p1)
	-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref)
	local selectedPlayer = p1.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = selectedPlayer,
		isVisible = p1.playerDropDown.isVisible and p1.displayOptions.isVisible,
		playerRelationship = selectedPlayer and p1.playerRelationship[selectedPlayer.UserId],
		inspectMenuEnabled = p1.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p1.displayOptions.isTenFootInterface,
		isUsingGamepad = if fFlagAddNewPlayerListMobileFocusNav then p1.displayOptions.isUsingGamepad else nil,
		subjectToChinaPolicies = p1.displayOptions.subjectToChinaPolicies,
		preferredTransparency = p1.settings.preferredTransparency
	}
end

local function mapDispatchToProps(p1)
	-- upvalues: closePlayerDropDownModule (ref), setPlayerListVisibilityModule (ref), setPlayerIsBlockedModule (ref), unblockPlayerModule (ref), requestFriendshipModule (ref)
	return {
		closeDropDown = function()
			-- upvalues: p1 (ref), closePlayerDropDownModule (copy)
			return p1(closePlayerDropDownModule())
		end,
		setPlayerListVisibility = function(value)
			-- upvalues: p1 (ref), setPlayerListVisibilityModule (copy)
			return p1(setPlayerListVisibilityModule(value))
		end,
		blockPlayerSuccess = function(p2)
			-- upvalues: p1 (ref), setPlayerIsBlockedModule (copy)
			p1(setPlayerIsBlockedModule(p2, true))
		end,
		unblockPlayer = function(p2)
			-- upvalues: p1 (ref), unblockPlayerModule (copy)
			return p1(unblockPlayerModule(p2))
		end,
		requestFriendship = function(p2, _)
			-- upvalues: p1 (ref), requestFriendshipModule (copy)
			return p1(requestFriendshipModule(p2))
		end
	}
end

local function PlayerDropDownWrapper(p1)
	-- upvalues: useLayoutValues (ref), reactFocusNavigationModule (ref), roactModule (ref), playerDropDown (ref), cryoModule (ref)
	return roactModule.createElement(playerDropDown, cryoModule.Dictionary.join(p1, {
		focusGuiObject = reactFocusNavigationModule.useFocusGuiObject(),
		focusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject(),
		layoutValues = useLayoutValues()
	}))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)) else roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)