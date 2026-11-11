local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local GetMenuItemsFromConfigsModule = require(AbuseReportMenu.MenuConfigs.getMenuItemsFromConfigs)
local GetMenuItemSizingsModule = require(AbuseReportMenu.Utility.getMenuItemSizings)
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ReportPlayerMenuItemConfigListModule = require(AbuseReportMenu.MenuConfigs.Players.ReportPlayerMenuItemConfigList)
local ReportPersonUIStateReducerModule = require(AbuseReportMenu.Reducers.reportPersonUIStateReducer)
local HandlePreselectedPlayerModule = require(AbuseReportMenu.Utility.handlePreselectedPlayer)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local _ = require(RobloxGui.Modules.VoiceChat.VoiceUsersByProximity)
local Constants = require(CorePackages.Workspace.Packages.VoiceChatCore).Constants
local PlayerMenuActions = ConstantsModule.PlayerMenuActions
local PreselectedPlayerReportBugfix = game:DefineFastFlag("PreselectedPlayerReportBugfix", false)

local function alphabeticalSort(A, B): boolean
	return A.Name:lower() < B.Name:lower()
end

return function(p1)
	-- upvalues: GetMenuItemSizingsModule (copy), ReactModule (copy), ReportPersonUIStateReducerModule (copy), ConstantsModule (copy), PreselectedPlayerReportBugfix (copy), Default (copy), Constants (copy), HandlePreselectedPlayerModule (copy), PlayerMenuActions (copy), alphabeticalSort (copy), Players (copy), CryoModule (copy), GetMenuItemsFromConfigsModule (copy), ReportPlayerMenuItemConfigListModule (copy)
	local MenuItemSizingsModule = GetMenuItemSizingsModule()
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ReportPersonUIStateReducerModule, ConstantsModule.InitPersonUIState)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), PreselectedPlayerReportBugfix (upval), Default (upval), Constants (upval), HandlePreselectedPlayerModule (upval), UseReducerResult2 (copy), PlayerMenuActions (upval)
		if p1.utilityProps.isReportTabVisible ~= true then return end
		p1.utilityProps.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.SwitchToPersonInitialSelections
		})
		
		if not PreselectedPlayerReportBugfix or Default:UserVoiceEnabled() and Default:GetVoiceJoinProgress() ~= Constants.VOICE_JOIN_PROGRESS.Suspended then
			Default:asyncInit():andThen(function()
				-- upvalues: p1 (upval), HandlePreselectedPlayerModule (upval), UseReducerResult2 (upval), PlayerMenuActions (upval)
				if p1.utilityProps.preselectedPlayer then
					HandlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, true, UseReducerResult2, p1.utilityProps.analyticsDispatch)
				end
				UseReducerResult2({ enabled = true, type = PlayerMenuActions.SetVoiceEnabled })
			end):catch(function()
				-- upvalues: p1 (upval), HandlePreselectedPlayerModule (upval), UseReducerResult2 (upval)
				if p1.utilityProps.preselectedPlayer then
					HandlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, false, UseReducerResult2, p1.utilityProps.analyticsDispatch)
				end
			end)
			
			return
		end
		if p1.utilityProps.preselectedPlayer then
			HandlePreselectedPlayerModule(p1.utilityProps.preselectedPlayer, false, UseReducerResult2, p1.utilityProps.analyticsDispatch)
		end
		UseReducerResult2({
			enabled = false,
			type = PlayerMenuActions.SetVoiceEnabled
		})
	end, { p1.utilityProps.isReportTabVisible })
	ReactModule.useEffect(function()
		-- upvalues: UseReducerResult (copy), ConstantsModule (upval), Default (upval), alphabeticalSort (upval), Players (upval), CryoModule (upval), UseReducerResult2 (copy), PlayerMenuActions (upval)
		local List = {}
		
		if UseReducerResult.methodOfAbuse == ConstantsModule.AbuseMethods.VoiceChat then
			for _, value in pairs((Default:getRecentUsersInteractionData())) do
				table.insert(List, value.player)
			end
			table.sort(List, alphabeticalSort)
		elseif UseReducerResult.methodOfAbuse == ConstantsModule.AbuseMethods.TextChat or UseReducerResult.methodOfAbuse == ConstantsModule.AbuseMethods.Other or UseReducerResult.methodOfAbuse == ConstantsModule.AbuseMethods.Avatar or UseReducerResult.methodOfAbuse == nil then
			List = Players:GetPlayers()
			table.sort(List, alphabeticalSort)
		end
		local Flag = false
		local Flag1 = false
		UseReducerResult2({
			type = PlayerMenuActions.UpdatePlayerNameMap,
			playerObjects = CryoModule.List.filter(List, function(Player: Player): boolean
				-- upvalues: UseReducerResult (upval), Flag (ref), Flag1 (ref), Players (upval)
				if UseReducerResult.preselectedPlayer and Player.UserId == UseReducerResult.preselectedPlayer.UserId then
					Flag = true
				end
				if UseReducerResult.allegedAbuser and Player.UserId == UseReducerResult.allegedAbuserId then
					Flag1 = true
				end
				return Player ~= Players.LocalPlayer and Player.UserId > 0
			end)
		})
		
		if UseReducerResult.preselectedPlayer and Flag then
			UseReducerResult2({
				type = ConstantsModule.PlayerMenuActions.UpdateAbuser,
				abuseId = UseReducerResult.preselectedPlayer.UserId,
				abuser = UseReducerResult.preselectedPlayer
			})
			UseReducerResult2({
				player = nil,
				type = ConstantsModule.PlayerMenuActions.SetPreselectedPlayer
			})
		elseif not Flag1 then
			UseReducerResult2({
				abuseId = nil,
				abuser = nil,
				type = ConstantsModule.PlayerMenuActions.UpdateAbuser
			})
		end
	end, {
		UseReducerResult.methodOfAbuse,
		UseReducerResult.isVoiceEnabled,
		p1.utilityProps.isReportTabVisible,
		UseReducerResult.preselectedPlayer
	})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		MenuItems = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, (CryoModule.Dictionary.join({
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MenuItemSizingsModule.ItemPadding)
			})
		}, (GetMenuItemsFromConfigsModule(UseReducerResult, UseReducerResult2, p1.utilityProps, ReportPlayerMenuItemConfigListModule, p1.isSmallPortraitViewport)))))
	})
end