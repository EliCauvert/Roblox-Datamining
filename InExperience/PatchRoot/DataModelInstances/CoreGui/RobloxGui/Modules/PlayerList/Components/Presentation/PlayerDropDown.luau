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

function playerDropDown.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	p1.innerFrameRef = roactModule.createRef()
	p1.motorOptions = { dampingRatio = 1, frequency = 4 }
	p1.motor = otterModule.createSingleMotor(1)
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (ref)
		local current = p1.innerFrameRef.current
		
		if current then
			if p2 == 1 then
				current.Visible = false
			else
				current.Visible = true
			end
			current.Position = UDim2.new(p2, 0, 0, 0)
		end
	end)
	p1.dropDownPosition = 0
end

function playerDropDown.createFriendButton(p1, p2)
	-- upvalues: roactModule (ref), friendDropDownButtonModule (ref)
	return roactModule.createElement(friendDropDownButtonModule, {
		layoutOrder = 1,
		contentVisible = true,
		playerRelationship = p2,
		selectedPlayer = p1.props.selectedPlayer,
		dropDownOpen = p1.props.isVisible,
		requestFriendship = p1.props.requestFriendship
	})
end

function playerDropDown.createBlockButton(p1, p2)
	-- upvalues: robloxTranslatorModule (ref), images (ref), roactModule (ref), dropDownButtonModule (ref), onBlockButtonActivatedModule (ref)
	local selectedPlayer = p1.props.selectedPlayer
	
	return roactModule.createElement(dropDownButtonModule, {
		layoutOrder = 4,
		lastButton = false,
		forceShowOptions = false,
		text = if p2.isBlocked then robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.UnBlock") else robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Block"),
		icon = images["icons/actions/block"],
		onActivated = function()
			-- upvalues: p2 (ref), p1 (ref), selectedPlayer (ref), onBlockButtonActivatedModule (copy)
			if p2.isBlocked then
				p1.props.unblockPlayer(selectedPlayer)
				
				return
			end
			onBlockButtonActivatedModule(selectedPlayer, nil, p1.__componentName, {
				onBlockingSuccess = function()
					-- upvalues: p1 (copy), selectedPlayer (copy)
					p1.props.blockPlayerSuccess(selectedPlayer)
				end
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
		text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Examine"),
		icon = images["icons/actions/zoomIn"],
		lastButton = selectedPlayer == localPlayer,
		onActivated = function()
			-- upvalues: guiService (copy), selectedPlayer (ref), p1 (ref)
			guiService:InspectPlayerFromUserIdWithCtx(selectedPlayer.UserId, "leaderBoard")
			p1.props.closeDropDown()
		end
	})
end

function playerDropDown.render(p1)
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownPlayerHeaderModule (ref), localPlayer (ref)
	return withLayoutValues(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), dropDownPlayerHeaderModule (copy), localPlayer (copy)
		local selectedPlayer = p1.props.selectedPlayer
		
		if not selectedPlayer or p1.props.isTenFootInterface then
			return nil
		end
		local t = {
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, p2.DropDownButtonPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerHeader = roactModule.createElement(dropDownPlayerHeaderModule, { player = p1.props.selectedPlayer })
		}
		local var1 = p2.DropDownButtonPadding + p2.DropDownHeaderSizeY
		local playerRelationship = p1.props.playerRelationship
		
		if selectedPlayer ~= localPlayer then
			if not playerRelationship.isBlocked then
				t.FriendButton = p1:createFriendButton(playerRelationship)
				var1 = var1 + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
			end
			t.BlockButton = p1:createBlockButton(playerRelationship)
			var1 = var1 + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
			t.ReportButton = p1:createReportButton()
			var1 = var1 + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
		end
		if p1.props.inspectMenuEnabled then
			t.InspectButton = p1:createInspectButton()
			var1 = var1 + p2.DropDownButtonPadding + p2.DropDownButtonSizeY
		end
		var1 -= p2.DropDownButtonPadding
		local var2 = p1.dropDownPosition + (p2.DropDownHeaderBackgroundSize - p2.DropDownHeaderSizeY)
		
		if p1.props.maxPositionBoundY < var2 + var1 then
			var2 -= var2 + var1 - p1.props.maxPositionBoundY
		elseif var2 < p1.props.minPositionBoundY then
			var2 += p1.props.minPositionBoundY - var2
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p1.props.layoutOrder,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(0, 0, 0, var2),
			Size = UDim2.new(0, p2.PlayerDropDownSizeX + p2.PlayerDropDownOffset, 0, var1)
		}, {
			InnerFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, -p2.PlayerDropDownOffset, 1, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Ref] = p1.innerFrameRef
			}, t)
		})
	end)
end

function playerDropDown.getDropDownPosition(p1)
	return if p1.props.isVisible and p1.props.contentsVisible then 0 else 1
end

function playerDropDown.didMount(p1)
	-- upvalues: otterModule (ref)
	local dropDownPosition = p1:getDropDownPosition()
	p1.motor:start()
	p1.motor:setGoal(otterModule.spring(dropDownPosition, p1.motorOptions))
end

function playerDropDown.willUpdate(p1, p2, _)
	p1.dropDownPosition = p2.positionY
end

function playerDropDown.didUpdate(p1, p2, _)
	-- upvalues: otterModule (ref)
	if p2.selectedPlayer ~= p1.props.selectedPlayer then
		p1.motor:setGoal(otterModule.instant(1))
		p1.motor:step(0)
	end
	p1.motor:setGoal(otterModule.spring(p1:getDropDownPosition(), p1.motorOptions))
end

function playerDropDown.willUnmount(p1)
	p1.motor:destroy()
end

local function mapStateToProps(p1)
	local selectedPlayer = p1.playerDropDown.selectedPlayer
	
	return {
		selectedPlayer = selectedPlayer,
		isVisible = p1.playerDropDown.isVisible and p1.displayOptions.isVisible,
		playerRelationship = selectedPlayer and p1.playerRelationship[selectedPlayer.UserId],
		inspectMenuEnabled = p1.displayOptions.inspectMenuEnabled,
		isTenFootInterface = p1.displayOptions.isTenFootInterface,
		subjectToChinaPolicies = p1.displayOptions.subjectToChinaPolicies
	}
end

local function mapDispatchToProps(p1)
	-- upvalues: closePlayerDropDownModule (ref), setPlayerIsBlockedModule (ref), unblockPlayerModule (ref), requestFriendshipModule (ref)
	return {
		closeDropDown = function()
			-- upvalues: p1 (ref), closePlayerDropDownModule (copy)
			return p1(closePlayerDropDownModule())
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

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(playerDropDown)) else roactRoduxModule.UNSTABLE_connect2(mapStateToProps, mapDispatchToProps)(playerDropDown)