local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui").RobloxGui
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local getMenuItemsFromConfigsModule = require(abuseReportMenu.MenuConfigs.getMenuItemsFromConfigs)
local getMenuItemSizingsModule = require(abuseReportMenu.Utility.getMenuItemSizings)
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportPlayerMenuItemConfigListModule = require(abuseReportMenu.MenuConfigs.Players.ReportPlayerMenuItemConfigList)
local reportPersonUIStateReducerModule = require(abuseReportMenu.Reducers.reportPersonUIStateReducer)
local handlePreselectedPlayerModule = require(abuseReportMenu.Utility.handlePreselectedPlayer)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local _ = require(robloxGui.Modules.VoiceChat.VoiceUsersByProximity)
local constants = require(corePackagesService.Workspace.Packages.VoiceChatCore).Constants
local playerMenuActions = constantsModule.PlayerMenuActions
local preselectedPlayerReportBugfix = game:DefineFastFlag("PreselectedPlayerReportBugfix", false)

local function alphabeticalSort(x, p0) --[[ line: 31 ]]
	return x.Name:lower() < p0.Name:lower()
end

return function(p1) --[[ line: 35 | named "ReportPersonMenuItemsContainer" ]]
	-- upvalues: getMenuItemSizingsModule (ref), reactModule (ref), reportPersonUIStateReducerModule (ref), constantsModule (ref), preselectedPlayerReportBugfix (ref), default (ref), constants (ref), handlePreselectedPlayerModule (ref), playerMenuActions (ref), alphabeticalSort (ref), playersService (ref), cryoModule (ref), getMenuItemsFromConfigsModule (ref), reportPlayerMenuItemConfigListModule (ref)
	local var13 = getMenuItemSizingsModule()
	local var14, var15 = reactModule.useReducer(reportPersonUIStateReducerModule, constantsModule.InitPersonUIState)
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p1 (ref), constantsModule (copy), preselectedPlayerReportBugfix (copy), default (copy), constants (copy), handlePreselectedPlayerModule (copy), var15 (ref), playerMenuActions (copy)
		if p1.utilityProps.isReportTabVisible ~= true then return end
		p1.utilityProps.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SwitchToPersonInitialSelections
		})
		
		if not preselectedPlayerReportBugfix or default:UserVoiceEnabled() and default:GetVoiceJoinProgress() ~= constants.VOICE_JOIN_PROGRESS.Suspended then
			default:asyncInit():andThen(function() --[[ line: 67 ]]
				-- upvalues: p1 (copy), handlePreselectedPlayerModule (copy), var15 (copy), playerMenuActions (copy)
				if p1.utilityProps.preselectedPlayer then
					handlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, true, var15, p1.utilityProps.analyticsDispatch)
				end
				var15({ enabled = true, type = playerMenuActions.SetVoiceEnabled })
			end):catch(function() --[[ line: 81 ]]
				-- upvalues: p1 (copy), handlePreselectedPlayerModule (copy), var15 (copy)
				if p1.utilityProps.preselectedPlayer then
					handlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, false, var15, p1.utilityProps.analyticsDispatch)
				end
			end)
			
			return
		elseif p1.utilityProps.preselectedPlayer then
			handlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, false, var15, p1.utilityProps.analyticsDispatch)
		end
		var15({
			enabled = false,
			type = playerMenuActions.SetVoiceEnabled
		})
	end, { p1.utilityProps.isReportTabVisible })
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: var14 (ref), constantsModule (copy), default (copy), alphabeticalSort (copy), playersService (copy), cryoModule (copy), var15 (ref), playerMenuActions (copy)
		local t = {}
		
		if var14.methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then
			for i, v in pairs(default:getRecentUsersInteractionData()) do
				table.insert(t, v.player)
			end
			table.sort(t, alphabeticalSort)
		elseif var14.methodOfAbuse == constantsModule.AbuseMethods.TextChat or var14.methodOfAbuse == constantsModule.AbuseMethods.Other or (var14.methodOfAbuse == constantsModule.AbuseMethods.Avatar or var14.methodOfAbuse == nil) then
			t = playersService:GetPlayers()
			table.sort(t, alphabeticalSort)
		end
		local var17 = false
		local var18 = false
		var15({
			type = playerMenuActions.UpdatePlayerNameMap,
			playerObjects = cryoModule.List.filter(t, function(p2) --[[ line: 175 ]]
				-- upvalues: var14 (copy), var17 (write), var18 (write), playersService (copy)
				if var14.preselectedPlayer and p2.UserId == var14.preselectedPlayer.UserId then
					var17 = true
				end
				if var14.allegedAbuser and p2.UserId == var14.allegedAbuserId then
					var18 = true
				end
				return p2 ~= playersService.LocalPlayer and p2.UserId > 0
			end)
		})
		var15({
			abuseId = nil,
			abuser = nil,
			type = constantsModule.PlayerMenuActions.UpdateAbuser
		})
	end, {
		var14.methodOfAbuse,
		var14.isVoiceEnabled,
		p1.utilityProps.isReportTabVisible,
		var14.preselectedPlayer
	})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		MenuItems = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, cryoModule.Dictionary.join({
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var13.ItemPadding)
			})
		}, getMenuItemsFromConfigsModule(var14, var15, p1.utilityProps, reportPlayerMenuItemConfigListModule, p1.isSmallPortraitViewport)))
	})
end