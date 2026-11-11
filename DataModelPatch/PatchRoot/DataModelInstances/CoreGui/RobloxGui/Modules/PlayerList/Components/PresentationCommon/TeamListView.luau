local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local PlayerEntryContainerModule = require(Parent.Components.Container.PlayerEntryContainer)
local TeamEntryContainerModule = require(Parent.Components.Container.TeamEntryContainer)
local FFlagReplacePlayerIconRoduxWithSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local FFlagPlayerListUseFocusNavHook = PlayerListModule.Flags.FFlagPlayerListUseFocusNavHook
local PlayerIconInfoStore = require(CorePackages.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore

return ReactModule.memo(function(p1)
	-- upvalues: UseLayoutValuesFunction (copy), UseStyleFunction (copy), ReactModule (copy), TeamEntryContainerModule (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), PlayerEntryContainerModule (copy), FFlagPlayerListUseFocusNavHook (copy)
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local Frames = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p1.isDirectionalPreferred then UDim.new(0, UseLayoutValuesResult.EntryPadding) else nil
		})
	}
	
	if p1.showTeamEntry then
		Frames.TeamEntry = ReactModule.createElement(TeamEntryContainerModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, UseLayoutValuesResult.TeamEntrySizeY),
			teamData = p1.teamData,
			entrySizeX = p1.entrySizeX,
			isSmallTouchDevice = p1.isSmallTouchDevice,
			isDirectionalPreferred = p1.isDirectionalPreferred
		})
	end
	if p1.teamPlayersCount > 0 then
		local Count = 0
		
		if p1.isSmallTouchDevice then
			Frames.BottomDiv = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.8,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				LayoutOrder = p1.teamPlayersCount * 2
			})
		end
		p1.teamData.players.iterateData(function(Player: Player, p2)
			-- upvalues: Count (ref), FFlagReplacePlayerIconRoduxWithSignal (upval), PlayerIconInfoStore (upval), p1 (copy), Frames (copy), ReactModule (upval), PlayerEntryContainerModule (upval), UseLayoutValuesResult (copy), FFlagPlayerListUseFocusNavHook (upval), UseStyleResult (copy)
			Count += 1
			local PlayerIconInfo = if FFlagReplacePlayerIconRoduxWithSignal then PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false) else p1.playerIconInfos[p2]
			local PlayerRelationship = p1.playerRelationships[p2]
			
			if not PlayerIconInfo or not PlayerRelationship then return end
			Frames["PlayerEntry_" .. tostring(p2)] = ReactModule.createElement(PlayerEntryContainerModule, {
				titlePlayerEntry = false,
				size = UDim2.new(1, UseLayoutValuesResult.EntryXOffset, 0, UseLayoutValuesResult.PlayerEntrySizeY),
				player = Player,
				entrySizeX = p1.entrySizeX,
				playerIconInfo = PlayerIconInfo,
				playerRelationship = PlayerRelationship,
				setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
				firstPlayerRef = p1.firstPlayerRef,
				prevFocusedEntry = p1.prevFocusedEntry,
				destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
				registerPlayerInstance = if FFlagPlayerListUseFocusNavHook then p1.registerPlayerInstance else nil,
				unregisterPlayerInstance = if FFlagPlayerListUseFocusNavHook then p1.unregisterPlayerInstance else nil,
				setSelectedPlayerId = if FFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil
			})
			
			if p1.isSmallTouchDevice then
				Frames["TopDiv_" .. Count] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 0.8,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					LayoutOrder = (Count - 1) * 2
				})
			end
			if Count < p1.teamPlayersCount and not p1.isSmallTouchDevice and not p1.isDirectionalPreferred then
				Frames["Divider_" .. Count] = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
					BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
					LayoutOrder = Count * 2
				})
			end
		end, false)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, Frames)
end)