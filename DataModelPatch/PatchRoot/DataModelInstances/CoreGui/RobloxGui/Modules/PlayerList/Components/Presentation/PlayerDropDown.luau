local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
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
local FFlagPlayerListReduceRerendersModule = require(Parent1.Flags.FFlagPlayerListReduceRerenders)
local UnblockPlayerModule = require(Parent1.Thunks.UnblockPlayer)
local RequestFriendshipModule = require(Parent1.Thunks.RequestFriendship)
local SetPlayerIsBlockedModule = require(Parent1.Actions.SetPlayerIsBlocked)
local PlayerDropDown = RoactModule.PureComponent:extend("PlayerDropDown")
local FFlagStandardizeSafetyIcon = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local FFlagAllowDisplayingFoundationIconsForDropdownModule = require(Parent1.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
PlayerDropDown.validateProps = TModule.strictInterface({
	positionY = TModule.number,
	minPositionBoundY = TModule.number,
	maxPositionBoundY = TModule.number,
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
	subjectToChinaPolicies = TModule.boolean,
	closeDropDown = TModule.callback,
	blockPlayerSuccess = TModule.callback,
	unblockPlayer = TModule.callback,
	requestFriendship = TModule.callback
})

function PlayerDropDown.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.innerFrameRef = RoactModule.createRef()
	p1.motorOptions = { dampingRatio = 1, frequency = 4 }
	p1.motor = OtterModule.createSingleMotor(1)
	p1.motor:onStep(function(XScale)
		-- upvalues: p1 (copy)
		local Current = p1.innerFrameRef.current
		
		if Current then
			if XScale == 1 then
				Current.Visible = false
			else
				Current.Visible = true
			end
			Current.Position = UDim2.new(XScale, 0, 0, 0)
		end
	end)
	p1.dropDownPosition = 0
end

function PlayerDropDown.createFriendButton(p1, PlayerRelationship)
	-- upvalues: RoactModule (copy), FriendDropDownButtonModule (copy)
	return RoactModule.createElement(FriendDropDownButtonModule, {
		layoutOrder = 1,
		contentVisible = true,
		playerRelationship = PlayerRelationship,
		selectedPlayer = p1.props.selectedPlayer,
		dropDownOpen = p1.props.isVisible,
		requestFriendship = p1.props.requestFriendship
	})
end

function PlayerDropDown.createBlockButton(p1, PlayerRelationship)
	-- upvalues: RobloxTranslatorModule (copy), Images (copy), RoactModule (copy), DropDownButtonModule (copy), OnBlockButtonActivatedModule (copy)
	local SelectedPlayer = p1.props.selectedPlayer
	local InGamePlayerDropDownBlock = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block")
	local InGamePlayerDropDownUnBlock = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock")
	
	return RoactModule.createElement(DropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		text = PlayerRelationship.isBlocked and InGamePlayerDropDownUnBlock or InGamePlayerDropDownBlock,
		icon = Images["icons/actions/block"],
		onActivated = function()
			-- upvalues: PlayerRelationship (copy), p1 (copy), SelectedPlayer (copy), OnBlockButtonActivatedModule (upval)
			if PlayerRelationship.isBlocked then
				p1.props.unblockPlayer(SelectedPlayer)
				
				return
			else
				OnBlockButtonActivatedModule(SelectedPlayer, nil, p1.__componentName, {
					onBlockingSuccess = function()
						-- upvalues: p1 (upval), SelectedPlayer (upval)
						p1.props.blockPlayerSuccess(SelectedPlayer)
					end
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
		text = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = Images["icons/actions/zoomIn"],
		lastButton = SelectedPlayer == LocalPlayer,
		onActivated = function()
			-- upvalues: GuiService (upval), SelectedPlayer (copy), p1 (copy)
			GuiService:InspectPlayerFromUserIdWithCtx(SelectedPlayer.UserId, "leaderBoard")
			p1.props.closeDropDown()
		end
	})
end

function PlayerDropDown.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), RoactModule (copy), DropDownPlayerHeaderModule (copy), LocalPlayer (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), DropDownPlayerHeaderModule (upval), LocalPlayer (upval)
		local SelectedPlayer = p1.props.selectedPlayer
		
		if not SelectedPlayer or p1.props.isTenFootInterface then
			return nil
		end
		local config = {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, p2.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = RoactModule.createElement(DropDownPlayerHeaderModule, { player = p1.props.selectedPlayer })
		}
		local NewDropDownButtonPadding = p2.DropDownButtonPadding + p2.DropDownHeaderSizeY
		local PlayerRelationship = p1.props.playerRelationship
		
		if SelectedPlayer ~= LocalPlayer then
			if not PlayerRelationship.isBlocked then
				config.FriendButton = p1:createFriendButton(PlayerRelationship)
				NewDropDownButtonPadding = NewDropDownButtonPadding + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
			end
			config.BlockButton = p1:createBlockButton(PlayerRelationship)
			local NewNewDropDownButtonPadding = NewDropDownButtonPadding + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
			config.ReportButton = p1:createReportButton()
			NewDropDownButtonPadding = NewNewDropDownButtonPadding + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
		end
		if p1.props.inspectMenuEnabled then
			config.InspectButton = p1:createInspectButton()
			NewDropDownButtonPadding = NewDropDownButtonPadding + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
		end
		local YOffset = NewDropDownButtonPadding - p2.DropDownButtonPadding
		local NewDropDownPosition = p1.dropDownPosition + (p2.DropDownHeaderBackgroundSize - p2.DropDownHeaderSizeY)
		
		if p1.props.maxPositionBoundY < NewDropDownPosition + YOffset then
			NewDropDownPosition -= NewDropDownPosition + YOffset - p1.props.maxPositionBoundY
		elseif NewDropDownPosition < p1.props.minPositionBoundY then
			NewDropDownPosition += p1.props.minPositionBoundY - NewDropDownPosition
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p1.props.layoutOrder,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(0, 0, 0, NewDropDownPosition),
			Size = UDim2.new(0, p2.PlayerDropDownSizeX + p2.PlayerDropDownOffset, 0, YOffset)
		}, {
			InnerFrame = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, -p2.PlayerDropDownOffset, 1, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[RoactModule.Ref] = p1.innerFrameRef
			}, config)
		})
	end)
end

function PlayerDropDown.getDropDownPosition(p1): number
	return if p1.props.isVisible and p1.props.contentsVisible then 0 else 1
end

function PlayerDropDown.didMount(p1)
	-- upvalues: OtterModule (copy)
	local DropDownPosition = p1:getDropDownPosition()
	p1.motor:start()
	p1.motor:setGoal(OtterModule.spring(DropDownPosition, p1.motorOptions))
end

function PlayerDropDown.willUpdate(p1, p2, _)
	p1.dropDownPosition = p2.positionY
end

function PlayerDropDown.didUpdate(p1, p2, _)
	-- upvalues: OtterModule (copy)
	if p2.selectedPlayer ~= p1.props.selectedPlayer then
		p1.motor:setGoal(OtterModule.instant(1))
		p1.motor:step(0)
	end
	p1.motor:setGoal(OtterModule.spring(p1:getDropDownPosition(), p1.motorOptions))
end

function PlayerDropDown.willUnmount(p1)
	p1.motor:destroy()
end

local function mapStateToProps(p1)
	local SelectedPlayer = p1.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = SelectedPlayer,
		isVisible = p1.playerDropDown.isVisible and p1.displayOptions.isVisible,
		playerRelationship = SelectedPlayer and p1.playerRelationship[SelectedPlayer.UserId],
		inspectMenuEnabled = p1.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p1.displayOptions.isTenFootInterface,
		subjectToChinaPolicies = p1.displayOptions.subjectToChinaPolicies
	}
end

local function mapDispatchToProps(Callback)
	-- upvalues: ClosePlayerDropDownModule (copy), SetPlayerIsBlockedModule (copy), UnblockPlayerModule (copy), RequestFriendshipModule (copy)
	return {
		closeDropDown = function()
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
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

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(PlayerDropDown)) else RoactRoduxModule.UNSTABLE_connect2(mapStateToProps, mapDispatchToProps)(PlayerDropDown)