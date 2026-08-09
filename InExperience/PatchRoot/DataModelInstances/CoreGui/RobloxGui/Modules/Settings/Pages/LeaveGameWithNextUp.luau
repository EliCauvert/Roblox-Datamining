local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local robloxGui = coreGuiService.RobloxGui
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local constantsModule = require(robloxGui.Modules.InGameMenu.Resources.Constants)
local view = require(corePackagesService.Packages.Foundation).View
local baseComponentModule = require(script.BaseComponent)
local nextUpComponentModule = require(script.NextUpComponent)
local leaveButtonsContainerModule = require(script.LeaveButtonsContainer)
local useNextUpSortModule = require(script.useNextUpSort)
local nextUpShadowTrafficPercent = game:DefineFastInt("NextUpShadowTrafficPercent", 0)
local fFlagEnableInGameExitModalNextUpUi = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableInGameExitModalNextUpUi
local fFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local fFlagInGameExitModalFixModalPaddingModule = require(script.Flags.FFlagInGameExitModalFixModalPadding)

if fFlagEnableInGameExitModalNextUpUi then
	local leaveGamePage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	leaveGamePage.TabHeader = nil
	leaveGamePage.Page.Name = "LeaveGamePage"
	leaveGamePage.ShouldShowBottomBar = false
	leaveGamePage.ShouldShowHubBar = false
	leaveGamePage.ShrinkwrapPageViewClipper = true
	leaveGamePage.DisableTopPadding = true
	leaveGamePage.MaintainVerticalSize = true
	leaveGamePage.Page.Size = UDim2.fromScale(1, 0)
	leaveGamePage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	function leaveGamePage.GetSize(p0) --[[ line: 58 ]]
		local absoluteSize = p0.Page.AbsoluteSize
		
		return Vector2.new(math.ceil(absoluteSize.X), math.max(math.ceil(absoluteSize.Y), 350))
	end
	
	local function onDontLeave(p1) --[[ line: 65 ]]
		-- upvalues: leaveGamePage (ref), rbxAnalyticsService (ref), constantsModule (ref)
		if leaveGamePage.HubRef then
			leaveGamePage.HubRef:PopMenu(p1, true)
		end
		rbxAnalyticsService:SendEventDeferred(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, {
			confirmed = constantsModule.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = constantsModule.AnalyticsLeaveGameSource,
			playsessionid = rbxAnalyticsService:GetPlaySessionId()
		})
	end
	
	local var16 = if require(robloxGui.Modules.TenFootInterface):IsEnabled() then 300 else 200
	reactRobloxModule.createRoot(leaveGamePage.Page):render(reactModule.createElement(baseComponentModule, nil, {
		leaveGameWithNextUp = reactModule.createElement(function() --[[ line: 86 | named "LeaveGameWithNextUpComponent" ]]
			-- upvalues: reactModule (ref), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (ref), useNextUpSortModule (ref), leaveGamePage (ref), baseComponentModule (ref), view (ref), fFlagInGameExitModalFixModalPaddingModule (ref), leaveButtonsContainerModule (ref), onDontLeave (ref), var16 (ref), nextUpComponentModule (ref)
			local var17, var18 = reactModule.useState(false)
			local var19 = if fFlagEnableInGameExitModalNextUpUiRequestCacheModule then useNextUpSortModule() else nil
			reactModule.useEffect(function() --[[ line: 90 ]]
				-- upvalues: leaveGamePage (copy), var18 (ref)
				local t = {}
				table.insert(t, leaveGamePage.Displayed.Event:connect(function() --[[ line: 94 ]]
					-- upvalues: var18 (copy)
					var18(true)
				end))
				table.insert(t, leaveGamePage.Hidden.Event:connect(function() --[[ line: 101 ]]
					-- upvalues: var18 (copy)
					var18(false)
				end))
				
				return function() --[[ line: 106 ]]
					-- upvalues: t (ref)
					for i, v in t do
						v:Disconnect()
					end
				end
			end, {})
			
			return if var17 then reactModule.createElement(baseComponentModule, nil, {
				mainContainer = reactModule.createElement(view, {
					tag = if fFlagInGameExitModalFixModalPaddingModule then "size-full-0 auto-y padding-large col gap-xxlarge" else "size-full-0 auto-y padding-large col gap-large"
				}, {
					LeaveButtonsContainer = reactModule.createElement(leaveButtonsContainerModule, { onDontLeave = onDontLeave, buttonSize = var16 }),
					nextUpComponent = reactModule.createElement(nextUpComponentModule, {
						tilePairWidth = var16,
						nextUpSort = if fFlagEnableInGameExitModalNextUpUiRequestCacheModule then var19 else nil
					})
				})
			}) else reactModule.None
		end)
	}))
	
	return leaveGamePage
end
local localPlayer = playersService.LocalPlayer

if (if localPlayer then localPlayer.UserId else 99) % 100 < nextUpShadowTrafficPercent then
	reactRobloxModule.createRoot(Instance.new("ScreenGui")):render(reactModule.createElement(baseComponentModule, nil, {
		nextUpShadowTraffic = reactModule.createElement(function() --[[ line: 34 ]]
			-- upvalues: useNextUpSortModule (ref)
			useNextUpSortModule()
			
			return nil
		end)
	}))
end
return require(script.Parent.LeaveGame)