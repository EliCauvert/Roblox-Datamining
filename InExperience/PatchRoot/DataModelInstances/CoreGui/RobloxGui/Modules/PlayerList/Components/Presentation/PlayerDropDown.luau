local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local otterModule = require(corePackagesService.Packages.Otter)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
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
local fFlagPlayerListReduceRerendersModule = require(parent_1.Flags.FFlagPlayerListReduceRerenders)
local unblockPlayerModule = require(parent_1.Thunks.UnblockPlayer)
local requestFriendshipModule = require(parent_1.Thunks.RequestFriendship)
local setPlayerIsBlockedModule = require(parent_1.Actions.SetPlayerIsBlocked)
local playerDropDown = roactModule.PureComponent:extend("PlayerDropDown")
local fFlagStandardizeSafetyIcon = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local fFlagAllowDisplayingFoundationIconsForDropdownModule = require(parent_1.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
playerDropDown.validateProps = tModule.strictInterface({
	positionY = tModule.number,
	minPositionBoundY = tModule.number,
	maxPositionBoundY = tModule.number,
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
	subjectToChinaPolicies = tModule.boolean,
	closeDropDown = tModule.callback,
	blockPlayerSuccess = tModule.callback,
	unblockPlayer = tModule.callback,
	requestFriendship = tModule.callback
})

function playerDropDown.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref)
	p0.innerFrameRef = roactModule.createRef()
	p0.motorOptions = { dampingRatio = 1, frequency = 4 }
	p0.motor = otterModule.createSingleMotor(1)
	p0.motor:onStep(function(p1)
		-- upvalues: p0 (ref)
		local current = p0.innerFrameRef.current
		
		if current then
			if p1 == 1 then
				current.Visible = false
			else
				current.Visible = true
			end
			current.Position = UDim2.new(p1, 0, 0, 0)
		end
	end)
	p0.dropDownPosition = 0
end

function playerDropDown.createFriendButton(p2, p3)
	-- upvalues: roactModule (ref), friendDropDownButtonModule (ref)
	return roactModule.createElement(friendDropDownButtonModule, {
		layoutOrder = 1,
		contentVisible = true,
		playerRelationship = p3,
		selectedPlayer = p2.props.selectedPlayer,
		dropDownOpen = p2.props.isVisible,
		requestFriendship = p2.props.requestFriendship
	})
end

function playerDropDown.createBlockButton(p4, p5)
	-- upvalues: robloxTranslatorModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), onBlockButtonActivatedModule (ref)
	local selectedPlayer = p4.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		text = if p5.isBlocked then robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock") else robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block"),
		icon = images["icons/actions/block"],
		onActivated = function()
			-- upvalues: p5 (ref), p4 (ref), selectedPlayer (ref), onBlockButtonActivatedModule (copy)
			if p5.isBlocked then
				p4.props.unblockPlayer(selectedPlayer)
				
				return
			end
			onBlockButtonActivatedModule(selectedPlayer, nil, p4.__componentName, {
				onBlockingSuccess = function()
					-- upvalues: p4 (copy), selectedPlayer (copy)
					p4.props.blockPlayerSuccess(selectedPlayer)
				end
			})
		end
	})
end

function playerDropDown.createReportButton(p6)
	-- upvalues: fFlagStandardizeSafetyIcon (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), isNewInGameMenuEnabledModule (ref), robloxGui (ref)
	local selectedPlayer = p6.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 5,
		lastButton = true,
		forceShowOptions = false,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Report"),
		icon = if fFlagStandardizeSafetyIcon and fFlagAllowDisplayingFoundationIconsForDropdownModule then "Flag" else images["icons/actions/feedback"],
		onActivated = function()
			-- upvalues: isNewInGameMenuEnabledModule (copy), robloxGui (copy), selectedPlayer (ref), p6 (ref)
			if isNewInGameMenuEnabledModule() then
				require(robloxGui.Modules.InGameMenuInit).openReportDialog(selectedPlayer, p6.__componentName)
				
				return
			end
			require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(selectedPlayer, p6.__componentName)
			p6.props.closeDropDown()
		end
	})
end

function playerDropDown.createInspectButton(p7)
	-- upvalues: images (ref), roactModule (ref), dropDownButtonModule (ref), robloxTranslatorModule (ref), localPlayer (ref), guiService (ref)
	local selectedPlayer = p7.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 3,
		forceShowOptions = false,
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = images["icons/actions/zoomIn"],
		lastButton = selectedPlayer == localPlayer,
		onActivated = function()
			-- upvalues: guiService (copy), selectedPlayer (ref), p7 (ref)
			guiService:InspectPlayerFromUserIdWithCtx(selectedPlayer.UserId, "leaderBoard")
			p7.props.closeDropDown()
		end
	})
end

function playerDropDown.render(p8)
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownPlayerHeaderModule (ref), localPlayer (ref)
	return withLayoutValues(function(p9)
		-- upvalues: p8 (ref), roactModule (copy), dropDownPlayerHeaderModule (copy), localPlayer (copy)
		local selectedPlayer = p8.props.selectedPlayer
		
		if not selectedPlayer or p8.props.isTenFootInterface then
			return nil
		end
		local t = {
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, p9.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = roactModule.createElement(dropDownPlayerHeaderModule, { player = p8.props.selectedPlayer })
		}
		local var27 = p9.DropDownButtonPadding + p9.DropDownHeaderSizeY
		local playerRelationship = p8.props.playerRelationship
		
		if selectedPlayer ~= localPlayer then
			if not playerRelationship.isBlocked then
				t.FriendButton = p8:createFriendButton(playerRelationship)
				var27 = var27 + p9.DropDownButtonPadding + p9.DropDownButtonSizeY
			end
			t.BlockButton = p8:createBlockButton(playerRelationship)
			var27 = var27 + p9.DropDownButtonPadding + p9.DropDownButtonSizeY
			t.ReportButton = p8:createReportButton()
			var27 = var27 + p9.DropDownButtonPadding + p9.DropDownButtonSizeY
		end
		if p8.props.inspectMenuEnabled then
			t.InspectButton = p8:createInspectButton()
			var27 = var27 + p9.DropDownButtonPadding + p9.DropDownButtonSizeY
		end
		var27 -= p9.DropDownButtonPadding
		local var28 = p8.dropDownPosition + (p9.DropDownHeaderBackgroundSize - p9.DropDownHeaderSizeY)
		
		if p8.props.maxPositionBoundY < var28 + var27 then
			var28 -= var28 + var27 - p8.props.maxPositionBoundY
		elseif var28 < p8.props.minPositionBoundY then
			var28 += p8.props.minPositionBoundY - var28
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p8.props.layoutOrder,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(0, 0, 0, var28),
			Size = UDim2.new(0, p9.PlayerDropDownSizeX + p9.PlayerDropDownOffset, 0, var27)
		}, {
			InnerFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, -p9.PlayerDropDownOffset, 1, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Ref] = p8.innerFrameRef
			}, t)
		})
	end)
end

function playerDropDown.getDropDownPosition(p10)
	return if p10.props.isVisible and p10.props.contentsVisible then 0 else 1
end

function playerDropDown.didMount(p11)
	-- upvalues: otterModule (ref)
	local dropDownPosition = p11:getDropDownPosition()
	p11.motor:start()
	p11.motor:setGoal(otterModule.spring(dropDownPosition, p11.motorOptions))
end

function playerDropDown.willUpdate(p12, p13, _)
	p12.dropDownPosition = p13.positionY
end

function playerDropDown.didUpdate(p14, p15, _)
	-- upvalues: otterModule (ref)
	if p15.selectedPlayer ~= p14.props.selectedPlayer then
		p14.motor:setGoal(otterModule.instant(1))
		p14.motor:step(0)
	end
	p14.motor:setGoal(otterModule.spring(p14:getDropDownPosition(), p14.motorOptions))
end

function playerDropDown.willUnmount(p16)
	p16.motor:destroy()
end

local function mapStateToProps(p17)
	local selectedPlayer = p17.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = selectedPlayer,
		isVisible = p17.playerDropDown.isVisible and p17.displayOptions.isVisible,
		playerRelationship = selectedPlayer and p17.playerRelationship[selectedPlayer.UserId],
		inspectMenuEnabled = p17.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p17.displayOptions.isTenFootInterface,
		subjectToChinaPolicies = p17.displayOptions.subjectToChinaPolicies
	}
end

local function mapDispatchToProps(p18)
	-- upvalues: closePlayerDropDownModule (ref), setPlayerIsBlockedModule (ref), unblockPlayerModule (ref), requestFriendshipModule (ref)
	return {
		closeDropDown = function()
			-- upvalues: p18 (ref), closePlayerDropDownModule (copy)
			return p18(closePlayerDropDownModule())
		end,
		blockPlayerSuccess = function(p19)
			-- upvalues: p18 (ref), setPlayerIsBlockedModule (copy)
			p18(setPlayerIsBlockedModule(p19, true))
		end,
		unblockPlayer = function(p20)
			-- upvalues: p18 (ref), unblockPlayerModule (copy)
			return p18(unblockPlayerModule(p20))
		end,
		requestFriendship = function(p21, _)
			-- upvalues: p18 (ref), requestFriendshipModule (copy)
			return p18(requestFriendshipModule(p21))
		end
	}
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(playerDropDown)) else roactRoduxModule.UNSTABLE_connect2(mapStateToProps, mapDispatchToProps)(playerDropDown)