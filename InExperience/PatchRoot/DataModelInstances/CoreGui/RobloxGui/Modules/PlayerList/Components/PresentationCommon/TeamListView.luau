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

return reactModule.memo(function(p1)
	-- upvalues: useLayoutValues (ref), useStyle (ref), reactModule (ref), teamEntryContainerModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), playerEntryContainerModule (ref), fFlagPlayerListUseFocusNavHook (ref)
	local var1 = useLayoutValues()
	local var2 = useStyle()
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p1.isDirectionalPreferred then UDim.new(0, var1.EntryPadding) else nil
		})
	}
	
	if p1.showTeamEntry then
		t.TeamEntry = reactModule.createElement(teamEntryContainerModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, var1.TeamEntrySizeY),
			teamData = p1.teamData,
			entrySizeX = p1.entrySizeX,
			isSmallTouchDevice = p1.isSmallTouchDevice,
			isDirectionalPreferred = p1.isDirectionalPreferred
		})
	end
	if p1.teamPlayersCount > 0 then
		local var3 = 0
		
		if p1.isSmallTouchDevice then
			t.BottomDiv = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.8,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				LayoutOrder = p1.teamPlayersCount * 2
			})
		end
		p1.teamData.players.iterateData(function(p2, p3)
			-- upvalues: var3 (write), fFlagReplacePlayerIconRoduxWithSignal (copy), playerIconInfoStore (copy), p1 (ref), t (ref), reactModule (copy), playerEntryContainerModule (copy), var1 (ref), fFlagPlayerListUseFocusNavHook (copy), var2 (ref)
			var3 += 1
			local var4 = if fFlagReplacePlayerIconRoduxWithSignal then playerIconInfoStore.getPlayerIconInfoReactive(p2.UserId)(false) else p1.playerIconInfos[p3]
			local var5 = p1.playerRelationships[p3]
			
			if not var4 or not var5 then return end
			t["PlayerEntry_" .. tostring(p3)] = reactModule.createElement(playerEntryContainerModule, {
				titlePlayerEntry = false,
				size = UDim2.new(1, var1.EntryXOffset, 0, var1.PlayerEntrySizeY),
				player = p2,
				entrySizeX = p1.entrySizeX,
				playerIconInfo = var4,
				playerRelationship = var5,
				setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
				firstPlayerRef = p1.firstPlayerRef,
				prevFocusedEntry = p1.prevFocusedEntry,
				destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
				registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then p1.registerPlayerInstance else nil,
				unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then p1.unregisterPlayerInstance else nil,
				setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil
			})
			
			if p1.isSmallTouchDevice then
				t["TopDiv_" .. var9] = reactModule.createElement("Frame", {
					BackgroundTransparency = 0.8,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					LayoutOrder = (var3 - 1) * 2
				})
			end
			if var3 < p1.teamPlayersCount and not p1.isSmallTouchDevice and not p1.isDirectionalPreferred then
				t["Divider_" .. var9] = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = var2.Theme.Divider.Transparency,
					BackgroundColor3 = var2.Theme.Divider.Color,
					LayoutOrder = var3 * 2
				})
			end
		end, false)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, t)
end)