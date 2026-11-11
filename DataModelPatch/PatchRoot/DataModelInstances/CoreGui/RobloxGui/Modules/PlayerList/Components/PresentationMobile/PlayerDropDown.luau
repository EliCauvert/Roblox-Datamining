local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local Parent = script.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Connection.LayoutValues).WithLayoutValues
local DropDownButtonModule = require(script.Parent.DropDownButton)
local DropDownPlayerHeaderModule = require(script.Parent.DropDownPlayerHeader)
local FriendDropDownButtonModule = require(script.Parent.FriendDropDownButton)
local LocalPlayer = game:GetService("Players").LocalPlayer
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local OnBlockButtonActivatedModule = require(RobloxGui.Modules.Settings.onBlockButtonActivated)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local Parent1 = Parent.Parent
local ClosePlayerDropDownModule = require(Parent1.Actions.ClosePlayerDropDown)
local SetPlayerListVisibilityModule = require(Parent1.Actions.SetPlayerListVisibility)
local FFlagPlayerListReduceRerendersModule = require(Parent1.Flags.FFlagPlayerListReduceRerenders)
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local UnblockPlayerModule = require(Parent1.Thunks.UnblockPlayer)
local RequestFriendshipModule = require(Parent1.Thunks.RequestFriendship)
local SetPlayerIsBlockedModule = require(Parent1.Actions.SetPlayerIsBlocked)
local PlayerDropDown = RoactModule.PureComponent:extend("PlayerDropDown")
local FFlagStandardizeSafetyIcon = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local FFlagAllowDisplayingFoundationIconsForDropdownModule = require(Parent1.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
PlayerDropDown.validateProps = TModule.strictInterface({
	contentsVisible = TModule.boolean,
	selectedPlayer = TModule.optional(TModule.instanceIsA("Player")),
	isVisible = TModule.boolean,
	playerRelationship = TModule.optional(TModule.strictInterface({
		isBlocked = TModule.boolean,
		friendStatus = TModule.enum(Enum.FriendStatus),
		isFollowing = TModule.boolean,
		isFollower = TModule.boolean
	})),
	inspectMenuEnabled = TModule.boolean,
	isTenFootInterface = TModule.boolean,
	isUsingGamepad = TModule.optional(TModule.boolean),
	subjectToChinaPolicies = TModule.boolean,
	preferredTransparency = TModule.number,
	closeDropDown = TModule.callback,
	blockPlayerSuccess = TModule.callback,
	unblockPlayer = TModule.callback,
	requestFriendship = TModule.callback,
	setPlayerListVisibility = TModule.callback,
	focusGuiObject = TModule.optional(TModule.callback),
	focusedGuiObject = TModule.optional(TModule.instanceIsA("GuiObject")),
	layoutValues = TModule.optional(TModule.table)
})
local config = { dampingRatio = 1, frequency = 4 }

function PlayerDropDown.init(p1)
	-- upvalues: ReactModule (copy), RoactModule (copy), OtterModule (copy)
	p1.state = { allVisible = false, contentVisible = false }
	p1.buttonsContainerRef = ReactModule.createRef()
	p1.containerScale, p1.updateContainerScale = RoactModule.createBinding(1)
	p1.containerScaleMotor = OtterModule.createSingleMotor(0)
	p1.containerScaleMotor:onStep(function(p2)
		-- upvalues: p1 (copy)
		p1.updateContainerScale(p2)
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(0)
	p1.transparencyMotor:onStep(function(p2: number)
		-- upvalues: p1 (copy)
		p1.updateTransparency(p2)
		
		if p2 < 0.5 and p1.props.isVisible and p1.props.contentsVisible then
			p1:setState({ contentVisible = true })
		else
			p1:setState({ contentVisible = false })
		end
		p1:setState({ allVisible = p2 < 1 })
	end)
	p1.buttonTransparency, p1.updateButtonTransparency = RoactModule.createBinding(1)
	p1.buttonTransparencyMotor = OtterModule.createSingleMotor(0)
	p1.buttonTransparencyMotor:onStep(function(p2)
		-- upvalues: p1 (copy)
		p1.updateButtonTransparency(p2)
	end)
end

function PlayerDropDown.createFriendButton(p1, PlayerRelationship)
	-- upvalues: RoactModule (copy), FriendDropDownButtonModule (copy)
	return RoactModule.createElement(FriendDropDownButtonModule, {
		layoutOrder = 1,
		playerRelationship = PlayerRelationship,
		selectedPlayer = p1.props.selectedPlayer,
		dropDownOpen = p1.props.isVisible,
		requestFriendship = p1.props.requestFriendship,
		contentVisible = p1.state.contentVisible,
		isUsingGamepad = p1.props.isUsingGamepad
	})
end

function PlayerDropDown.createBlockButton(p1, PlayerRelationship)
	-- upvalues: RobloxTranslatorModule (copy), Images (copy), RoactModule (copy), DropDownButtonModule (copy), OnBlockButtonActivatedModule (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	local SelectedPlayer = p1.props.selectedPlayer
	local InGamePlayerDropDownBlock = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block")
	local InGamePlayerDropDownUnBlock = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock")
	
	return RoactModule.createElement(DropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = PlayerRelationship.isBlocked and InGamePlayerDropDownUnBlock or InGamePlayerDropDownBlock,
		icon = Images["icons/actions/block"],
		onActivated = function()
			-- upvalues: PlayerRelationship (copy), p1 (copy), SelectedPlayer (copy), OnBlockButtonActivatedModule (upval), FFlagAddNewPlayerListMobileFocusNav (upval)
			if PlayerRelationship.isBlocked then
				p1.props.unblockPlayer(SelectedPlayer)
				
				return
			else
				OnBlockButtonActivatedModule(SelectedPlayer, nil, p1.__componentName, {
					onBlockingSuccess = function()
						-- upvalues: p1 (upval), SelectedPlayer (upval)
						p1.props.blockPlayerSuccess(SelectedPlayer)
					end,
					onBlockingModalClose = if FFlagAddNewPlayerListMobileFocusNav then function()
						-- upvalues: p1 (upval)
						if p1.props.isUsingGamepad then
							p1.props.focusGuiObject(p1.buttonsContainerRef.current)
						end
					end else nil
				})
			end
		end
	})
end

function PlayerDropDown.createReportButton(p1)
	-- upvalues: FFlagStandardizeSafetyIcon (copy), FFlagAllowDisplayingFoundationIconsForDropdownModule (copy), Images (copy), RoactModule (copy), DropDownButtonModule (copy), RobloxTranslatorModule (copy), IsNewInGameMenuEnabledModule (copy), RobloxGui (copy)
	local SelectedPlayer = p1.props.selectedPlayer
	
	return RoactModule.createElement(DropDownButtonModule, {
		layoutOrder = 5,
		lastButton = true,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Report"),
		icon = if FFlagStandardizeSafetyIcon and FFlagAllowDisplayingFoundationIconsForDropdownModule then "Flag" else Images["icons/actions/feedback"],
		onActivated = function()
			-- upvalues: IsNewInGameMenuEnabledModule (upval), RobloxGui (upval), SelectedPlayer (copy), p1 (copy)
			if IsNewInGameMenuEnabledModule() then
				require(RobloxGui.Modules.InGameMenuInit).openReportDialog(SelectedPlayer, p1.__componentName)
				
				return
			else
				require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(SelectedPlayer, p1.__componentName)
				p1.props.closeDropDown()
			end
		end
	})
end

function PlayerDropDown.createInspectButton(p1)
	-- upvalues: Images (copy), RoactModule (copy), DropDownButtonModule (copy), RobloxTranslatorModule (copy), LocalPlayer (copy), GuiService (copy)
	local SelectedPlayer = p1.props.selectedPlayer
	
	return RoactModule.createElement(DropDownButtonModule, {
		layoutOrder = 3,
		forceShowOptions = false,
		contentVisible = p1.state.contentVisible,
		buttonTransparency = p1.buttonTransparency,
		text = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = Images["icons/actions/zoomIn"],
		lastButton = SelectedPlayer == LocalPlayer,
		onActivated = function()
			-- upvalues: GuiService (upval), SelectedPlayer (copy), p1 (copy)
			GuiService:InspectPlayerFromUserIdWithCtx(SelectedPlayer.UserId, "leaderBoard")
			p1.props.closeDropDown()
			p1.props.setPlayerListVisibility(false)
		end
	})
end

function PlayerDropDown.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), RoactModule (copy), DropDownPlayerHeaderModule (copy), LocalPlayer (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	return WithLayoutValuesFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), DropDownPlayerHeaderModule (upval), LocalPlayer (upval), FFlagAddNewPlayerListMobileFocusNav (upval)
		local LayoutValues = p1.props.layoutValues
		local SelectedPlayer = p1.props.selectedPlayer
		
		if not SelectedPlayer or p1.props.isTenFootInterface then
			return nil
		end
		local config = {
			UIScale = RoactModule.createElement("UIScale", { Scale = p1.containerScale }),
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, LayoutValues.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = RoactModule.createElement(DropDownPlayerHeaderModule, {
				player = p1.props.selectedPlayer,
				contentVisible = p1.state.contentVisible,
				transparency = p1.transparency
			})
		}
		local NewDropDownButtonSizeY = 4 * LayoutValues.DropDownButtonSizeY + LayoutValues.DropDownHeaderSizeY
		local NewDropDownButtonPadding = LayoutValues.DropDownButtonPadding + LayoutValues.DropDownHeaderSizeY
		local PlayerRelationship = p1.props.playerRelationship
		
		if SelectedPlayer ~= LocalPlayer then
			if not PlayerRelationship.isBlocked then
				config.FriendButton = p1:createFriendButton(PlayerRelationship)
				NewDropDownButtonPadding = NewDropDownButtonPadding + LayoutValues.DropDownButtonPadding + LayoutValues.DropDownButtonSizeY
			end
			config.BlockButton = p1:createBlockButton(PlayerRelationship)
			local NewNewDropDownButtonPadding = NewDropDownButtonPadding + LayoutValues.DropDownButtonPadding + LayoutValues.DropDownButtonSizeY
			config.ReportButton = p1:createReportButton()
			NewDropDownButtonPadding = NewNewDropDownButtonPadding + LayoutValues.DropDownButtonPadding + LayoutValues.DropDownButtonSizeY
		end
		if p1.props.inspectMenuEnabled then
			config.InspectButton = p1:createInspectButton()
			NewDropDownButtonPadding = NewDropDownButtonPadding + LayoutValues.DropDownButtonPadding + LayoutValues.DropDownButtonSizeY
		end
		return RoactModule.createElement("ImageButton", {
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
			SelectionGroup = if FFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			[RoactModule.Event.Activated] = p1.props.closeDropDown,
			[RoactModule.Ref] = p1.imageButtonRef
		}, {
			Container = RoactModule.createElement("Frame", {
				LayoutOrder = p1.props.layoutOrder,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, -NewDropDownButtonSizeY / 2),
				Size = UDim2.new(0, LayoutValues.PlayerDropDownSizeXMobile, 0, NewDropDownButtonPadding - LayoutValues.DropDownButtonPadding),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[RoactModule.Ref] = if FFlagAddNewPlayerListMobileFocusNav then p1.buttonsContainerRef else nil
			}, config)
		})
	end)
end

function PlayerDropDown.getScale(p1): number
	return if p1.props.isVisible and p1.props.contentsVisible then 1 else 1.25
end

function PlayerDropDown.getTransparency(p1): number
	return if p1.props.isVisible and p1.props.contentsVisible then 0 else 1
end

function PlayerDropDown.getButtonTransparency(p1)
	return if p1.props.isVisible and p1.props.contentsVisible then p1.props.preferredTransparency * 0.3 else 1
end

function PlayerDropDown.didUpdate(p1, _, p2)
	-- upvalues: OtterModule (copy), config (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	p1.containerScaleMotor:setGoal(OtterModule.spring(p1:getScale(), config))
	p1.transparencyMotor:setGoal(OtterModule.spring(p1:getTransparency(), config))
	p1.buttonTransparencyMotor:setGoal(OtterModule.spring(p1:getButtonTransparency(), config))
	
	if FFlagAddNewPlayerListMobileFocusNav and p1.props.isUsingGamepad and (p2.contentVisible ~= p1.state.contentVisible or not p1.props.focusedGuiObject) and p1.state.contentVisible and p1.buttonsContainerRef.current then
		p1.props.focusGuiObject(p1.buttonsContainerRef.current)
		
		if not FFlagAddNewPlayerListMobileFocusNav then
			p1.buttonsContainerRef.current.SelectionGroup = true
			p1.buttonsContainerRef.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			p1.buttonsContainerRef.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		end
	end
end

function PlayerDropDown:didMount() end

function PlayerDropDown.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.containerScaleMotor:destroy()
	p1.buttonTransparencyMotor:destroy()
	p1.transparencyMotor = nil
	p1.containerScaleMotor = nil
	p1.buttonTransparencyMotor = nil
end

local function mapStateToProps(p1)
	-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy)
	local SelectedPlayer = p1.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = SelectedPlayer,
		isVisible = p1.playerDropDown.isVisible and p1.displayOptions.isVisible,
		playerRelationship = SelectedPlayer and p1.playerRelationship[SelectedPlayer.UserId],
		inspectMenuEnabled = p1.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p1.displayOptions.isTenFootInterface,
		isUsingGamepad = if FFlagAddNewPlayerListMobileFocusNav then p1.displayOptions.isUsingGamepad else nil,
		subjectToChinaPolicies = p1.displayOptions.subjectToChinaPolicies,
		preferredTransparency = p1.settings.preferredTransparency
	}
end

local function mapDispatchToProps(Callback)
	-- upvalues: ClosePlayerDropDownModule (copy), SetPlayerListVisibilityModule (copy), SetPlayerIsBlockedModule (copy), UnblockPlayerModule (copy), RequestFriendshipModule (copy)
	return {
		closeDropDown = function()
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
		end,
		setPlayerListVisibility = function(p1)
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(p1))
		end,
		blockPlayerSuccess = function(p1)
			-- upvalues: Callback (copy), SetPlayerIsBlockedModule (upval)
			Callback(SetPlayerIsBlockedModule(p1, true))
		end,
		unblockPlayer = function(p1)
			-- upvalues: Callback (copy), UnblockPlayerModule (upval)
			return Callback(UnblockPlayerModule(p1))
		end,
		requestFriendship = function(p1, _)
			-- upvalues: Callback (copy), RequestFriendshipModule (upval)
			return Callback(RequestFriendshipModule(p1))
		end
	}
end

local function PlayerDropDownWrapper(p1)
	-- upvalues: UseLayoutValuesFunction (copy), ReactFocusNavigationModule (copy), RoactModule (copy), PlayerDropDown (copy), CryoModule (copy)
	return RoactModule.createElement(PlayerDropDown, CryoModule.Dictionary.join(p1, {
		focusGuiObject = ReactFocusNavigationModule.useFocusGuiObject(),
		focusedGuiObject = ReactFocusNavigationModule.useFocusedGuiObject(),
		layoutValues = UseLayoutValuesFunction()
	}))
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)) else RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDownWrapper)