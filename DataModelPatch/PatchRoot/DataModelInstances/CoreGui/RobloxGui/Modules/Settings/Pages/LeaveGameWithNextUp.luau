local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local ConstantsModule = require(RobloxGui.Modules.InGameMenu.Resources.Constants)
local View = require(CorePackages.Packages.Foundation).View
local BaseComponentModule = require(script.BaseComponent)
local NextUpComponentModule = require(script.NextUpComponent)
local LeaveButtonsContainerModule = require(script.LeaveButtonsContainer)
local UseNextUpSortModule = require(script.useNextUpSort)
local NextUpShadowTrafficPercent = game:DefineFastInt("NextUpShadowTrafficPercent", 0)
local FFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local FFlagInGameExitModalFixModalPaddingModule = require(script.Flags.FFlagInGameExitModalFixModalPadding)

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableInGameExitModalNextUpUi then
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.TabHeader = nil
	NewPage.Page.Name = "LeaveGamePage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	NewPage.ShrinkwrapPageViewClipper = true
	NewPage.DisableTopPadding = true
	NewPage.MaintainVerticalSize = true
	NewPage.Page.Size = UDim2.fromScale(1, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	function NewPage.GetSize(p1): Vector2
		local AbsoluteSize = p1.Page.AbsoluteSize
		
		return Vector2.new(math.ceil(AbsoluteSize.X), (math.max(math.ceil(AbsoluteSize.Y), 350)))
	end
	
	local function onDontLeave(p1)
		-- upvalues: NewPage (copy), RbxAnalyticsService (copy), ConstantsModule (copy)
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(p1, true)
		end
		RbxAnalyticsService:SendEventDeferred(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, {
			confirmed = ConstantsModule.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = ConstantsModule.AnalyticsLeaveGameSource,
			playsessionid = RbxAnalyticsService:GetPlaySessionId()
		})
	end
	
	local ButtonSize: number = if require(RobloxGui.Modules.TenFootInterface):IsEnabled() then 300 else 200
	ReactRobloxModule.createRoot(NewPage.Page):render(ReactModule.createElement(BaseComponentModule, nil, {
		leaveGameWithNextUp = ReactModule.createElement(function()
			-- upvalues: ReactModule (copy), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), UseNextUpSortModule (copy), NewPage (copy), BaseComponentModule (copy), View (copy), FFlagInGameExitModalFixModalPaddingModule (copy), LeaveButtonsContainerModule (copy), onDontLeave (copy), ButtonSize (copy), NextUpComponentModule (copy)
			local UseStateResult, UseStateResult2 = ReactModule.useState(false)
			local UseNextUpSortModuleResult = if FFlagEnableInGameExitModalNextUpUiRequestCacheModule then UseNextUpSortModule() else nil
			ReactModule.useEffect(function()
				-- upvalues: NewPage (upval), UseStateResult2 (copy)
				local EventConnections = {}
				table.insert(EventConnections, NewPage.Displayed.Event:connect(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(true)
				end))
				table.insert(EventConnections, NewPage.Hidden.Event:connect(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end))
				
				return function()
					-- upvalues: EventConnections (copy)
					for _, eventConnection in EventConnections do
						eventConnection:Disconnect()
					end
				end
			end, {})
			
			return if UseStateResult then ReactModule.createElement(BaseComponentModule, nil, {
				mainContainer = ReactModule.createElement(View, {
					tag = if FFlagInGameExitModalFixModalPaddingModule then "size-full-0 auto-y padding-large col gap-xxlarge" else "size-full-0 auto-y padding-large col gap-large"
				}, {
					LeaveButtonsContainer = ReactModule.createElement(LeaveButtonsContainerModule, { onDontLeave = onDontLeave, buttonSize = ButtonSize }),
					nextUpComponent = ReactModule.createElement(NextUpComponentModule, {
						tilePairWidth = ButtonSize,
						nextUpSort = if FFlagEnableInGameExitModalNextUpUiRequestCacheModule then UseNextUpSortModuleResult else nil
					})
				})
			}) else ReactModule.None
		end)
	}))
	
	return NewPage
else
	local LocalPlayer = Players.LocalPlayer
	
	if (LocalPlayer and LocalPlayer.UserId or 99) % 100 < NextUpShadowTrafficPercent then
		ReactRobloxModule.createRoot(Instance.new("ScreenGui")):render(ReactModule.createElement(BaseComponentModule, nil, {
			nextUpShadowTraffic = ReactModule.createElement(function()
				-- upvalues: UseNextUpSortModule (copy)
				UseNextUpSortModule()
				
				return nil
			end)
		}))
	end
	return require(script.Parent.LeaveGame)
end