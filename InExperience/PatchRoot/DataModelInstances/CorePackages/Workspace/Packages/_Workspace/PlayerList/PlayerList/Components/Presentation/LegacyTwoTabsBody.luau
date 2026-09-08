local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local view = foundationModule.View
local theme = foundationModule.Enums.Theme
local localizationService = game:GetService("LocalizationService")
local inExperienceLocalesModule = require(parent_1.InExperienceLocales)
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local useLegacyVisibilityMirrorModule = require(parent.Hooks.useLegacyVisibilityMirror)
local leaderboardTabsModule = require(parent.Components.Presentation.LeaderboardTabs)
local platformLeaderboardViewModule = require(parent.Components.Presentation.PlatformLeaderboardView)
local constantsModule = require(parent.Common.Constants)
local fFlagPlayerListFixPlatformLeaderboardSizingModule = require(parent.Flags.FFlagPlayerListFixPlatformLeaderboardSizing)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local fFlagPlayerListTwoTabsOnLegacyPerformanceModule = require(parent.Flags.FFlagPlayerListTwoTabsOnLegacyPerformance)

return reactModule.memo(function(value)
	-- upvalues: reactModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), inExperienceLocalesModule (ref), localizationService (ref), fFlagPlayerListTwoTabsOnLegacyPerformanceModule (ref), useLegacyVisibilityMirrorModule (ref), signalsReactModule (ref), fFlagPlayerListFixPlatformLeaderboardSizingModule (ref), constantsModule (ref), view (ref), platformLeaderboardViewModule (ref), leaderboardTabsModule (ref), localizationProvider (ref), foundationProvider (ref), theme (ref)
	local frame
	local server, server_1 = reactModule.useState("server")
	local var1 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {}) else nil
	local var2 = reactModule.useCallback(function()
		-- upvalues: server_1 (ref)
		server_1("server")
	end, {})
	local var3 = if server ~= "server" then not (if fFlagPlayerListTwoTabsOnLegacyPerformanceModule then value.isVisible else signalsReactModule.useSignalState(useLegacyVisibilityMirrorModule(value.isVisible))) else true
	local var4 = value.platformBodyHeight == nil
	local _ = nil
	
	if var3 then
		frame = if var4 then reactModule.createElement("Frame", {
			Name = "LegacyTwoTabsServerBody",
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, { ServerBody = value.serverBody }) else value.serverBody
	else
		local var5 = if server == "friends" then "Friends" else "Global"
		local platformBodyHeight = value.platformBodyHeight
		
		if fFlagPlayerListFixPlatformLeaderboardSizingModule and platformBodyHeight ~= nil then
			platformBodyHeight = math.max(platformBodyHeight, constantsModule.PLATFORM_BODY_MIN_HEIGHT)
		end
		frame = reactModule.createElement("Frame", {
			Name = "LegacyTwoTabsPlatformBody",
			LayoutOrder = 3,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = if platformBodyHeight then UDim2.new(1, 0, 0, platformBodyHeight) else UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = value.backgroundColor,
			BackgroundTransparency = value.backgroundTransparency
		}, {
			FlexRoot = reactModule.createElement(view, { tag = "col", Size = UDim2.fromScale(1, 1) }, {
				PlatformLeaderboardView = reactModule.createElement(platformLeaderboardViewModule, {
					layoutOrder = 1,
					tab = var5,
					legacyPanelBackgroundColor = value.backgroundColor,
					legacyPanelBackgroundTransparency = value.backgroundTransparency
				})
			})
		})
	end
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = value.layoutOrder,
		Size = if var4 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, 0)
	}
	
	if not var4 then
		t.AutomaticSize = Enum.AutomaticSize.Y
	end
	local frame_1 = reactModule.createElement("Frame", t, {
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
				onPlatformTabsUnavailable = var2
			})
		}),
		TitleBar = if var3 then value.titleBar else nil,
		Body = frame
	})
	
	if fFlagPlayerListLocalizeGameTextModule then
		frame_1 = reactModule.createElement(localizationProvider, { localization = var1 }, { Column = frame_1 })
	end
	return reactModule.createElement(foundationProvider, { theme = theme.Dark }, { Column = frame_1 })
end)