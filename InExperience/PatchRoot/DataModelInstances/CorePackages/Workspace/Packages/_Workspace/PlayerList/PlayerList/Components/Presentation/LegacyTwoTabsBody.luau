local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local View = FoundationModule.View
local Theme = FoundationModule.Enums.Theme
local LocalizationService = game:GetService("LocalizationService")
local InExperienceLocalesModule = require(Parent1.InExperienceLocales)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local UseLegacyVisibilityMirrorModule = require(Parent.Hooks.useLegacyVisibilityMirror)
local LeaderboardTabsModule = require(Parent.Components.Presentation.LeaderboardTabs)
local PlatformLeaderboardViewModule = require(Parent.Components.Presentation.PlatformLeaderboardView)
local ConstantsModule = require(Parent.Common.Constants)
local FFlagPlayerListFixPlatformLeaderboardSizingModule = require(Parent.Flags.FFlagPlayerListFixPlatformLeaderboardSizing)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local FFlagPlayerListTwoTabsOnLegacyPerformanceModule = require(Parent.Flags.FFlagPlayerListTwoTabsOnLegacyPerformance)
local FFlagPlatformLeaderboardsExposure3EnabledModule = require(Parent.Flags.FFlagPlatformLeaderboardsExposure3Enabled)

return ReactModule.memo(function(p1) --[[ Line: 41 | Named "LegacyTwoTabsBody" ]]
	-- upvalues: ReactModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy), FFlagPlayerListTwoTabsOnLegacyPerformanceModule (copy), UseLegacyVisibilityMirrorModule (copy), SignalsReactModule (copy), FFlagPlayerListFixPlatformLeaderboardSizingModule (copy), ConstantsModule (copy), View (copy), PlatformLeaderboardViewModule (copy), LeaderboardTabsModule (copy), FFlagPlatformLeaderboardsExposure3EnabledModule (copy), LocalizationProvider (copy), FoundationProvider (copy), Theme (copy)
	local Server, Server2 = ReactModule.useState("server")
	local UseMemoResult = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
		return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	end, {}) else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: Server2 (copy)
		Server2("server")
	end, {})
	local IsVisible = if FFlagPlayerListTwoTabsOnLegacyPerformanceModule then p1.isVisible else SignalsReactModule.useSignalState((UseLegacyVisibilityMirrorModule(p1.isVisible)))
	local IsServer: boolean = Server == "server" or not IsVisible
	local NoPlatformBodyHeight = p1.platformBodyHeight == nil
	local Frame = nil
	
	if IsServer then
		Frame = if NoPlatformBodyHeight then ReactModule.createElement("Frame", {
			Name = "LegacyTwoTabsServerBody",
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, { ServerBody = p1.serverBody }) else p1.serverBody
	else
		local Friends: string = if Server == "friends" then "Friends" else "Global"
		local PlatformBodyHeight = p1.platformBodyHeight
		
		if FFlagPlayerListFixPlatformLeaderboardSizingModule and PlatformBodyHeight ~= nil then
			PlatformBodyHeight = math.max(PlatformBodyHeight, ConstantsModule.PLATFORM_BODY_MIN_HEIGHT)
		end
		Frame = ReactModule.createElement("Frame", {
			Name = "LegacyTwoTabsPlatformBody",
			LayoutOrder = 3,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = if PlatformBodyHeight then UDim2.new(1, 0, 0, PlatformBodyHeight) else UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p1.backgroundColor,
			BackgroundTransparency = p1.backgroundTransparency
		}, {
			FlexRoot = ReactModule.createElement(View, { tag = "col", Size = UDim2.fromScale(1, 1) }, {
				PlatformLeaderboardView = ReactModule.createElement(PlatformLeaderboardViewModule, {
					layoutOrder = 1,
					tab = Friends,
					legacyPanelBackgroundColor = p1.backgroundColor,
					legacyPanelBackgroundTransparency = p1.backgroundTransparency
				})
			})
		})
	end
	local config = {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = if NoPlatformBodyHeight then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, 0)
	}
	
	if not NoPlatformBodyHeight then
		config.AutomaticSize = Enum.AutomaticSize.Y
	end
	local Frame1 = ReactModule.createElement("Frame", config, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		TabsRow = ReactModule.createElement("Frame", {
			Name = "LegacyTwoTabsTabsRow",
			LayoutOrder = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundColor3 = p1.backgroundColor,
			BackgroundTransparency = p1.backgroundTransparency
		}, {
			LeaderboardTabs = ReactModule.createElement(LeaderboardTabsModule, {
				activeTabId = Server,
				onActivated = Server2,
				onPlatformTabsUnavailable = UseResult,
				isVisible = if FFlagPlatformLeaderboardsExposure3EnabledModule then p1.isVisible else nil
			})
		}),
		TitleBar = if IsServer then p1.titleBar else nil,
		Body = Frame
	})
	
	if FFlagPlayerListLocalizeGameTextModule then
		Frame1 = ReactModule.createElement(LocalizationProvider, { localization = UseMemoResult }, { Column = Frame1 })
	end
	return ReactModule.createElement(FoundationProvider, { theme = Theme.Dark }, { Column = Frame1 })
end)