local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLayoutValues = playerListModule.Common.useLayoutValues
local useStyle = UIBloxModule.Core.Style.useStyle
local playerEntryContainerModule = require(parent.Components.Container.PlayerEntryContainer)
local teamEntryContainerModule = require(parent.Components.Container.TeamEntryContainer)
local fFlagReplacePlayerIconRoduxWithSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook
local playerIconInfoStore = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore

return reactModule.memo(function(p0) --[[ line: 61 | named "TeamListView" ]]
	-- upvalues: useLayoutValues (ref), useStyle (ref), reactModule (ref), teamEntryContainerModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), playerEntryContainerModule (ref), fFlagPlayerListUseFocusNavHook (ref)
	local var6 = useLayoutValues()
	local var7 = useStyle()
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p0.isDirectionalPreferred then UDim.new(0, var6.EntryPadding) else nil
		})
	}
	
	if p0.showTeamEntry then
		t.TeamEntry = reactModule.createElement(teamEntryContainerModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, var6.TeamEntrySizeY),
			teamData = p0.teamData,
			entrySizeX = p0.entrySizeX,
			isSmallTouchDevice = p0.isSmallTouchDevice,
			isDirectionalPreferred = p0.isDirectionalPreferred
		})
	end
	if p0.teamPlayersCount > 0 then
		local var9 = 0
		
		if p0.isSmallTouchDevice then
			t.BottomDiv = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.8,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				LayoutOrder = p0.teamPlayersCount * 2
			})
		end
		p0.teamData.players.iterateData(function(p1, p2) --[[ line: 100 ]]
			-- upvalues: var9 (write), fFlagReplacePlayerIconRoduxWithSignal (copy), playerIconInfoStore (copy), p0 (ref), t (ref), reactModule (copy), playerEntryContainerModule (copy), var6 (ref), fFlagPlayerListUseFocusNavHook (copy), var7 (ref)
			var9 += 1
			local var10 = if fFlagReplacePlayerIconRoduxWithSignal then playerIconInfoStore.getPlayerIconInfoReactive(p1.UserId)(false) else p0.playerIconInfos[p2]
			local var11 = p0.playerRelationships[p2]
			
			if not var10 or not var11 then return end
			t["PlayerEntry_" .. tostring(p2)] = reactModule.createElement(playerEntryContainerModule, {
				titlePlayerEntry = false,
				size = UDim2.new(1, var6.EntryXOffset, 0, var6.PlayerEntrySizeY),
				player = p1,
				entrySizeX = p0.entrySizeX,
				playerIconInfo = var10,
				playerRelationship = var11,
				setDropDownPlayerDimensionY = p0.setDropDownPlayerDimensionY,
				firstPlayerRef = p0.firstPlayerRef,
				prevFocusedEntry = p0.prevFocusedEntry,
				destroyedFocusedPlayerId = p0.destroyedFocusedPlayerId,
				registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then p0.registerPlayerInstance else nil,
				unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then p0.unregisterPlayerInstance else nil,
				setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p0.setSelectedPlayerId else nil
			})
			
			if p0.isSmallTouchDevice then
				t["TopDiv_" .. var9] = reactModule.createElement("Frame", {
					BackgroundTransparency = 0.8,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					LayoutOrder = (var9 - 1) * 2
				})
			end
			if var9 < p0.teamPlayersCount and not p0.isSmallTouchDevice and not p0.isDirectionalPreferred then
				t["Divider_" .. var9] = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = var7.Theme.Divider.Transparency,
					BackgroundColor3 = var7.Theme.Divider.Color,
					LayoutOrder = var9 * 2
				})
			end
		end, false)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, t)
end)