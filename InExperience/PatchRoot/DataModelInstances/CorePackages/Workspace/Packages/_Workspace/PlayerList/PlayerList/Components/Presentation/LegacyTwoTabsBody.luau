local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local view = foundationModule.View
local theme = foundationModule.Enums.Theme
local useLegacyVisibilityMirrorModule = require(parent.Hooks.useLegacyVisibilityMirror)
local leaderboardTabsModule = require(parent.Components.Presentation.LeaderboardTabs)
local platformLeaderboardViewModule = require(parent.Components.Presentation.PlatformLeaderboardView)

return reactModule.memo(function(value) --[[ line: 32 | named "LegacyTwoTabsBody" ]]
	-- upvalues: reactModule (ref), useLegacyVisibilityMirrorModule (ref), signalsReactModule (ref), view (ref), platformLeaderboardViewModule (ref), foundationProvider (ref), theme (ref), leaderboardTabsModule (ref)
	local server, server_1 = reactModule.useState("server")
	local var8 = reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: server_1 (ref)
		server_1("server")
	end, {})
	local var9 = if server ~= "server" then not signalsReactModule.useSignalState(useLegacyVisibilityMirrorModule(value.isVisible)) else true
	local var10 = value.platformBodyHeight == nil
	local var11 = if var9 then if var10 then reactModule.createElement("Frame", {
		Name = "LegacyTwoTabsServerBody",
		LayoutOrder = 3,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, { ServerBody = value.serverBody }) else value.serverBody else reactModule.createElement("Frame", {
		Name = "LegacyTwoTabsPlatformBody",
		LayoutOrder = 3,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = if value.platformBodyHeight then UDim2.new(1, 0, 0, value.platformBodyHeight) else UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = value.backgroundColor,
		BackgroundTransparency = value.backgroundTransparency
	}, {
		FlexRoot = reactModule.createElement(view, { tag = "col", Size = UDim2.fromScale(1, 1) }, {
			PlatformLeaderboardView = reactModule.createElement(platformLeaderboardViewModule, {
				layoutOrder = 1,
				tab = if server == "friends" then "Friends" else "Global",
				legacyPanelBackgroundColor = value.backgroundColor,
				legacyPanelBackgroundTransparency = value.backgroundTransparency
			})
		})
	})
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = value.layoutOrder,
		Size = if var10 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, 0)
	}
	
	if not var10 then
		t.AutomaticSize = Enum.AutomaticSize.Y
	end
	return reactModule.createElement(foundationProvider, { theme = theme.Dark }, {
		Column = reactModule.createElement("Frame", t, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			TabsRow = reactModule.createElement("Frame", {
				Name = "LegacyTwoTabsTabsRow",
				LayoutOrder = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundColor3 = value.backgroundColor,
				BackgroundTransparency = value.backgroundTransparency
			}, {
				LeaderboardTabs = reactModule.createElement(leaderboardTabsModule, {
					activeTabId = server,
					onActivated = server_1,
					onPlatformTabsUnavailable = var8
				})
			}),
			TitleBar = if var9 then value.titleBar else nil,
			Body = var11
		})
	})
end)